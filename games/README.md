# Jogos do AGORA

Cada jogo deve ficar em sua própria pasta dentro de `games/` e ter um arquivo `index.html` que funcione sozinho no navegador.

## Como adicionar um jogo

1. Crie uma pasta, por exemplo `games/meu-jogo/`.
2. Coloque nela o `index.html` e os arquivos locais de que o jogo precisa (CSS, JavaScript, imagens e sons).
3. Adicione uma entrada em `games/catalog.json`:

```json
{
  "id": "meu-jogo",
  "title": "Nome do jogo",
  "description": "O que a pessoa vai aprender ou praticar.",
  "category": "Ciências · Iniciante",
  "icon": "🔬",
  "path": "/games/meu-jogo/index.html",
  "author": "AGORA",
  "license": "Original AGORA"
}
```

4. Teste em celular e computador antes de publicar.

## Regras para os jogos

- Priorizar HTML, CSS e JavaScript que funcionem no navegador, sem exigir cadastro.
- Cada jogo deve ser independente e não pode depender de dados privados de quem está jogando.
- Não inserir anúncios, rastreadores ou chamadas externas sem uma decisão explícita do projeto.
- Não pedir nome real, e-mail, localização ou outros dados pessoais dentro dos jogos.
- Usar controles acessíveis, instruções claras e layouts que funcionem em telas pequenas.
- Dar feedback que explique o raciocínio, não apenas dizer se a resposta está certa.
- Jogos criados com ajuda do AGORA devem ter conteúdo, arte e código originais ou com licenças compatíveis.
- Para projetos de terceiros, verificar a licença do código, das imagens, dos sons, das fontes e dos textos separadamente. Registrar créditos e avisos exigidos.
- Não copiar jogos apenas porque estão disponíveis gratuitamente na internet. Gratuito não significa livre para republicar.

## Integração

O aplicativo lê `catalog.json` e abre cada jogo em um iframe isolado. Essa separação reduz o risco de um jogo quebrar a navegação ou acessar o armazenamento do aplicativo. Não remover o atributo `sandbox` sem revisar a segurança.
