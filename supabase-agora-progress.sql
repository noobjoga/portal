-- AGORA: progresso de aprendizagem opcional e isolado dos dados antigos do Maze Loop.
-- Execute este arquivo no Supabase > SQL Editor para ativar a sincronização entre aparelhos.
-- Este script cria somente uma tabela nova. Não altera nem apaga tabelas, contas, fotos ou dados existentes.

create table if not exists public.learning_progress (
  user_id uuid not null references auth.users(id) on delete cascade,
  item_id text not null,
  item_type text not null check (item_type in ('lesson','game','book')),
  completed_at timestamptz not null default now(),
  primary key (user_id, item_id)
);

create index if not exists learning_progress_user_completed
  on public.learning_progress (user_id, completed_at desc);

alter table public.learning_progress enable row level security;
grant select, insert, update, delete on public.learning_progress to authenticated;

drop policy if exists "AGORA users read own learning progress" on public.learning_progress;
create policy "AGORA users read own learning progress"
  on public.learning_progress for select to authenticated
  using (auth.uid() = user_id);

drop policy if exists "AGORA users add own learning progress" on public.learning_progress;
create policy "AGORA users add own learning progress"
  on public.learning_progress for insert to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "AGORA users update own learning progress" on public.learning_progress;
create policy "AGORA users update own learning progress"
  on public.learning_progress for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "AGORA users delete own learning progress" on public.learning_progress;
create policy "AGORA users delete own learning progress"
  on public.learning_progress for delete to authenticated
  using (auth.uid() = user_id);
