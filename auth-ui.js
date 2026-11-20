import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm';

const SUPABASE_URL = 'https://xovdwvrawnymhpobxuzc.supabase.co';
const SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_UjNuZKeDQDgBzVNHqOh4Ww_O4ul5OI5';
const supabase = createClient(SUPABASE_URL, SUPABASE_PUBLISHABLE_KEY);

function renderAccount(user) {
  const accountLink = document.getElementById('topAccount');
  const accountNav = document.getElementById('accountNav');
  const avatar = document.getElementById('avatarMini');
  const signupPrompt = document.querySelector('.signup-prompt');
  const modePill = document.getElementById('modePill');

  if (user) {
    const label = user.email ? user.email.split('@')[0] : 'Minha conta';
    if (accountLink) {
      accountLink.href = 'meu-perfil.html';
      accountLink.textContent = 'Meu perfil';
    }
    if (accountNav) {
      const navText = accountNav.querySelector('.nav-text');
      if (navText) navText.textContent = 'Meu perfil';
    }
    if (avatar) avatar.textContent = (label.trim()[0] || 'M').toUpperCase();
    if (signupPrompt) signupPrompt.hidden = true;
    if (modePill) modePill.textContent = 'Conta conectada';
  } else {
    if (accountLink) {
      accountLink.href = 'cadastro.html';
      accountLink.textContent = 'Entrar / Criar conta';
    }
    if (accountNav) {
      const navText = accountNav.querySelector('.nav-text');
      if (navText) navText.textContent = 'Entrar / criar conta';
    }
    if (avatar) avatar.textContent = 'V';
    if (signupPrompt) signupPrompt.hidden = false;
    if (modePill) modePill.textContent = 'Modo demonstração';
  }
}

async function syncSession() {
  const { data, error } = await supabase.auth.getSession();
  if (error) console.warn('Maze Loop: não foi possível verificar a sessão.', error);
  renderAccount(data?.session?.user || null);
}

syncSession();
supabase.auth.onAuthStateChange((_event, session) => {
  renderAccount(session?.user || null);
});
