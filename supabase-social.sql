-- Maze Loop: estrutura inicial das conexões sociais
-- Execute este arquivo no Supabase > SQL Editor.
-- Não apaga nem altera as tabelas existentes de perfil.

create extension if not exists pgcrypto;

-- 1) Solicitações de amizade: independentes das curtidas amorosas.
create table if not exists public.friend_requests (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references public.profiles(id) on delete cascade,
  receiver_id uuid not null references public.profiles(id) on delete cascade,
  status text not null default 'pending' check (status in ('pending','accepted','declined','cancelled')),
  created_at timestamptz not null default now(),
  responded_at timestamptz,
  constraint friend_requests_not_self check (sender_id <> receiver_id)
);

create unique index if not exists friend_requests_one_pending_pair
on public.friend_requests (sender_id, receiver_id)
where status = 'pending';
create index if not exists friend_requests_receiver_status
on public.friend_requests (receiver_id, status, created_at desc);
create index if not exists friend_requests_sender_status
on public.friend_requests (sender_id, status, created_at desc);

alter table public.friend_requests enable row level security;
grant select, insert on public.friend_requests to authenticated;
grant update (status, responded_at) on public.friend_requests to authenticated;

drop policy if exists "Users can view their own friend requests" on public.friend_requests;
create policy "Users can view their own friend requests"
on public.friend_requests for select to authenticated
using (auth.uid() = sender_id or auth.uid() = receiver_id);

drop policy if exists "Users can send friend requests as themselves" on public.friend_requests;
create policy "Users can send friend requests as themselves"
on public.friend_requests for insert to authenticated
with check (auth.uid() = sender_id and sender_id <> receiver_id and status = 'pending');

drop policy if exists "Receivers can respond to friend requests" on public.friend_requests;
create policy "Receivers can respond to friend requests"
on public.friend_requests for update to authenticated
using (auth.uid() = receiver_id and status = 'pending')
with check (auth.uid() = receiver_id and status in ('accepted','declined'));

-- 2) Curtidas amorosas: tabela separada de amizade.
create table if not exists public.profile_likes (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references public.profiles(id) on delete cascade,
  receiver_id uuid not null references public.profiles(id) on delete cascade,
  created_at timestamptz not null default now(),
  constraint profile_likes_not_self check (sender_id <> receiver_id),
  constraint profile_likes_unique_pair unique (sender_id, receiver_id)
);

create index if not exists profile_likes_receiver
on public.profile_likes (receiver_id, created_at desc);

alter table public.profile_likes enable row level security;
grant select, insert, delete on public.profile_likes to authenticated;

drop policy if exists "Users can view likes they sent" on public.profile_likes;
create policy "Users can view likes they sent"
on public.profile_likes for select to authenticated
using (auth.uid() = sender_id);

drop policy if exists "Users can send likes as themselves" on public.profile_likes;
create policy "Users can send likes as themselves"
on public.profile_likes for insert to authenticated
with check (auth.uid() = sender_id and sender_id <> receiver_id);

drop policy if exists "Users can remove likes they sent" on public.profile_likes;
create policy "Users can remove likes they sent"
on public.profile_likes for delete to authenticated
using (auth.uid() = sender_id);

-- 3) Catálogo de presentes virtuais.
create table if not exists public.gift_catalog (
  id text primary key,
  name text not null,
  emoji text not null,
  description text not null default '',
  coin_price integer not null default 0 check (coin_price >= 0),
  active boolean not null default true,
  sort_order integer not null default 0
);

insert into public.gift_catalog (id, name, emoji, description, coin_price, sort_order)
values
  ('flower', 'Flor', '🌷', 'Um carinho simples', 0, 1),
  ('coffee', 'Café', '☕', 'Um convite para conversar', 0, 2),
  ('heart', 'Coração', '💖', 'Um gesto de carinho', 0, 3),
  ('star', 'Estrela', '⭐', 'Alguém chamou sua atenção', 10, 4),
  ('trophy', 'Troféu', '🏆', 'Um presente especial', 50, 5)
on conflict (id) do nothing;

alter table public.gift_catalog enable row level security;
grant select on public.gift_catalog to authenticated;

drop policy if exists "Authenticated users can view active gifts" on public.gift_catalog;
create policy "Authenticated users can view active gifts"
on public.gift_catalog for select to authenticated
using (active = true);

-- 4) Histórico de presentes enviados/recebidos.
create table if not exists public.profile_gifts (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references public.profiles(id) on delete cascade,
  receiver_id uuid not null references public.profiles(id) on delete cascade,
  gift_id text not null references public.gift_catalog(id),
  message text not null default '' check (char_length(message) <= 180),
  created_at timestamptz not null default now(),
  constraint profile_gifts_not_self check (sender_id <> receiver_id)
);

create index if not exists profile_gifts_receiver
on public.profile_gifts (receiver_id, created_at desc);
create index if not exists profile_gifts_sender
on public.profile_gifts (sender_id, created_at desc);

alter table public.profile_gifts enable row level security;
grant select, insert on public.profile_gifts to authenticated;

drop policy if exists "Users can view gifts they sent or received" on public.profile_gifts;
create policy "Users can view gifts they sent or received"
on public.profile_gifts for select to authenticated
using (auth.uid() = sender_id or auth.uid() = receiver_id);

drop policy if exists "Users can send gifts as themselves" on public.profile_gifts;
create policy "Users can send gifts as themselves"
on public.profile_gifts for insert to authenticated
with check (auth.uid() = sender_id and sender_id <> receiver_id and char_length(message) <= 180);

-- 5) Visitas ao perfil. O dono do perfil vê quem visitou; o visitante registra a própria visita.
create table if not exists public.profile_visits (
  id uuid primary key default gen_random_uuid(),
  visitor_id uuid not null references public.profiles(id) on delete cascade,
  profile_id uuid not null references public.profiles(id) on delete cascade,
  visited_at timestamptz not null default now(),
  constraint profile_visits_not_self check (visitor_id <> profile_id)
);

create index if not exists profile_visits_profile_date
on public.profile_visits (profile_id, visited_at desc);

alter table public.profile_visits enable row level security;
grant select, insert on public.profile_visits to authenticated;

drop policy if exists "Profile owners can see their visitors" on public.profile_visits;
create policy "Profile owners can see their visitors"
on public.profile_visits for select to authenticated
using (auth.uid() = profile_id);

drop policy if exists "Users can register their own profile visits" on public.profile_visits;
create policy "Users can register their own profile visits"
on public.profile_visits for insert to authenticated
with check (auth.uid() = visitor_id and visitor_id <> profile_id);

-- Observação de produto:
-- A consulta de quem curtiu seu perfil deve ser feita futuramente por uma função
-- segura que verifica o plano do usuário. Não liberamos SELECT das curtidas recebidas
-- diretamente, para não entregar o recurso premium a todos os planos.
-- A cobrança/compra de moedas e presentes pagos ainda não está ativada.
