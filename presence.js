import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm';

const SUPABASE_URL = 'https://xovdwvrawnymhpobxuzc.supabase.co';
const SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_UjNuZKeDQDgBzVNHqOh4Ww_O4ul5OI5';
const supabase = createClient(SUPABASE_URL, SUPABASE_PUBLISHABLE_KEY);

const statusElement = document.getElementById('presenceStatus');

function showStatus(message, state) {
  if (!statusElement) return;
  statusElement.hidden = false;
  statusElement.dataset.state = state;
  statusElement.textContent = message;
}

async function startPresence() {
  const { data: { user }, error } = await supabase.auth.getUser();
  if (error || !user) {
    showStatus('Entre para mostrar seu status', 'offline');
    return;
  }

  const channel = supabase.channel('maze-loop-online', {
    config: { presence: { key: user.id } }
  });

  const trackOnline = async () => {
    if (document.visibilityState === 'visible') {
      await channel.track({ user_id: user.id, online_at: new Date().toISOString() });
      showStatus('Você está online', 'online');
    } else {
      await channel.untrack();
      showStatus('Você está ausente', 'away');
    }
  };

  channel.subscribe(async state => {
    if (state === 'SUBSCRIBED') await trackOnline();
  });

  document.addEventListener('visibilitychange', trackOnline);
  window.addEventListener('pagehide', () => {
    channel.untrack();
    supabase.removeChannel(channel);
  }, { once: true });
}

startPresence().catch(error => {
  console.warn('Maze Loop: status online indisponível.', error);
  showStatus('Status indisponível', 'offline');
});