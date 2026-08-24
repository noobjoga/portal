<script>
  // Busca o IP do visitante
  fetch('https://api.ipify.org?format=json')
    .then(response => response.json())
    .then(data => {
      const meuIP = "177.8.55.154"; // Cole o seu IP real aqui (veja no meuip.com.br)
      
      // Se NÃO for o seu IP, carrega a Monetag
      if (data.ip !== meuIP) {
        const script = document.createElement('script');
        script.src = "https://quge5.com/88/tag.min.js";
        script.setAttribute("data-zone", "272964");
        script.async = true;
        script.setAttribute("data-cfasync", "false");
        document.head.appendChild(script);
      } else {
        console.log("Anúncios ocultados para o IP do desenvolvedor.");
      }
    });
</script>