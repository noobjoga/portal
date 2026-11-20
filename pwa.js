if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker.register('/app-sw.js').catch(error => {
      console.warn('Maze Loop: não foi possível preparar o modo instalável.', error);
    });
  });
}

let installPrompt = null;

function isInstalledApp() {
  return window.matchMedia('(display-mode: standalone)').matches ||
    window.matchMedia('(display-mode: fullscreen)').matches ||
    window.navigator.standalone === true;
}

function hideInstallButtons() {
  document.querySelectorAll('.install-app').forEach(button => {
    button.hidden = true;
  });
}

if (isInstalledApp()) hideInstallButtons();

window.addEventListener('beforeinstallprompt', event => {
  event.preventDefault();
  if (isInstalledApp()) {
    hideInstallButtons();
    return;
  }
  installPrompt = event;
  document.querySelectorAll('.install-app').forEach(button => {
    button.hidden = false;
  });
});

window.addEventListener('appinstalled', () => {
  installPrompt = null;
  document.querySelectorAll('.install-app').forEach(button => {
    button.hidden = true;
  });
});

document.addEventListener('click', async event => {
  const button = event.target.closest('.install-app');
  if (!button) return;

  if (!installPrompt) {
    alert('Se estiver no iPhone/iPad: abra o menu Compartilhar do navegador e escolha “Adicionar à Tela de Início”. No computador ou Android, procure “Instalar Maze Loop” no menu do navegador.');
    return;
  }

  installPrompt.prompt();
  await installPrompt.userChoice;
  installPrompt = null;
  document.querySelectorAll('.install-app').forEach(item => {
    item.hidden = true;
  });
});