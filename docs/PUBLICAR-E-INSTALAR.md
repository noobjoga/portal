# Publicar e instalar o AGORA

## Publicar uma versão de teste na Vercel

1. Entre em https://vercel.com/dashboard com a conta que você já usa.
2. Clique em **Add New → Project**.
3. Importe o repositório **noobjoga/agora** do GitHub.
4. Como é um site estático em HTML, CSS e JavaScript, não precisa configurar framework nem comando de build. Deixe o diretório raiz como `./`.
5. Clique em **Deploy**.
6. Ao terminar, a Vercel fornece um endereço de teste `*.vercel.app`. Abra esse endereço no celular e teste a navegação, os livros e o jogo.

A integração Git da Vercel pode publicar automaticamente novos commits feitos na branch de produção. Consulte https://vercel.com/docs/git/vercel-for-github.

## Instalar no celular

A instalação depende de abrir a versão publicada por HTTPS.

- **Android (Chrome):** abra o endereço do AGORA, toque no menu ⋮ e escolha **Instalar app** ou **Adicionar à tela inicial** (o texto pode variar).
- **iPhone (Safari):** abra o endereço, toque em Compartilhar e escolha **Adicionar à Tela de Início**.

A instalação cria um atalho com aparência de aplicativo. A experiência offline depende dos recursos que já estiverem armazenados em cache.

## Domínio mazeloop.com

Não conecte nem remova o domínio do projeto antigo durante a primeira publicação. Primeiro publique o AGORA em seu endereço de teste `vercel.app` e confira no celular.

Depois, para usar `mazeloop.com`, será necessário mover o domínio do projeto antigo para o projeto AGORA nas configurações da Vercel e conferir os registros DNS. A documentação oficial explica a configuração: https://vercel.com/docs/domains/set-up-custom-domain.

## Importante

- A branch `backup-mazeloop-2026-11-26` preserva o código antigo.
- O arquivo `index-namoro-old.html` foi guardado nessa branch como cópia da antiga página inicial de namoro. O arquivo `index-old.html` já existente é uma página antiga do Maze Clip; não foi sobrescrito.
- O backup do banco Supabase e dos arquivos de fotos ainda precisa ser feito antes de qualquer alteração ou exclusão desses dados.
- Ainda é necessário testar a versão publicada em navegadores e aparelhos reais antes de divulgar amplamente.
