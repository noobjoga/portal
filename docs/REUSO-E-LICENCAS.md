# Projetos e bibliotecas para o AGORA

Esta é uma triagem inicial de referências. "Gratuito" não significa automaticamente que podemos copiar, hospedar ou modificar. Antes de incorporar qualquer projeto, verificar a licença do repositório e também as licenças dos recursos incluídos (arte, sons, fontes, textos, vídeos e dependências).

## Candidatos interessantes

| Projeto | O que oferece | Licença / cuidado | Decisão inicial |
|---|---|---|---|
| [OpenGames](https://opengames-dev.github.io/source.html) | Jogos pequenos com código legível: labirinto, memória, snake, whac-a-mole, flap e blocos. | O projeto informa que código, desenhos e sons sintetizados estão sob MIT. Preservar o aviso de licença e conferir os arquivos antes de copiar. | Boa referência para estudar e adaptar jogos simples. Alguns podem ganhar objetivos pedagógicos próprios. |
| [Edukiz](https://github.com/timmalich/edukiz) | Coleção de jogos educativos em HTML/JS, feita com Vue 3 e Vite, com suporte offline/PWA. | Repositório identificado com MIT. Conferir imagens, fontes, dependências e avisos de cada recurso antes de importar. | Forte referência para jogos educativos e experiência infantil. Avaliar jogos específicos antes de incorporar. |
| [H5P](https://h5p.org/) | Tecnologia para criar atividades interativas, apresentações, quizzes e outros conteúdos HTML5. | A tecnologia H5P informa licença MIT. Cada conteúdo criado ou compartilhado pode ter direitos e licenças próprios. A integração completa pode exigir uma instalação/infraestrutura compatível. | Avaliar numa etapa posterior para atividades interativas, não é necessário para a primeira versão. |
| [Phaser](https://github.com/phaserjs/phaser) | Framework JavaScript para jogos HTML5 2D em Canvas/WebGL, desktop e celular. | Repositório com licença MIT. Jogos e assets de terceiros continuam com suas próprias licenças. | Ferramenta recomendada quando os jogos próprios ficarem mais elaborados; não é necessária para jogos HTML simples. |

## Projeto que não devemos incorporar sem autorização diferente

- [KingsMath Web Games](https://github.com/kingsmath/web-games): contém muitos jogos de matemática e lógica, mas o repositório informa licença **CC BY-NC 4.0 (Atribuição–NãoComercial)**. Isso restringe uso comercial. Como o AGORA pode crescer ou adotar algum modelo de receita no futuro, não copiar nem hospedar esses jogos na plataforma. Podemos estudar as ideias gerais dos desafios, sem copiar código, textos ou arte protegidos.

## Regras de incorporação

1. Preferir jogos criados pela própria equipe do AGORA.
2. Para terceiros, verificar a licença no próprio repositório e registrar URL, autor, versão/commit, licença e atribuições exigidas.
3. Verificar separadamente arte, áudio, fontes, textos, imagens e bibliotecas externas.
4. Não remover créditos ou avisos de copyright.
5. Não incorporar jogos com licença não comercial se houver possibilidade de monetização futura.
6. Não copiar livros protegidos; apontar para acervos legais ou usar obras com direitos verificados para o Brasil.
7. Quando a licença for ambígua, não publicar até esclarecer.

## Primeira decisão técnica

A biblioteca de jogos do AGORA usa um catálogo em `games/catalog.json`. Cada jogo é uma pasta independente com seu próprio `index.html`. Isso permite criar jogos pequenos em HTML/CSS/JavaScript e adicioná-los sem reconstruir a navegação do aplicativo.

O primeiro jogo da biblioteca, **Desafio das sequências**, foi criado especificamente para o AGORA e não depende de uma biblioteca externa.

## Referências de jogos incorporáveis pesquisadas em novembro de 2026

| Fonte | O que encontramos | Como usar no AGORA |
|---|---|---|
| [OpenGames](https://opengames-dev.github.io/) e [código-fonte](https://github.com/opengames-dev/opengames-dev.github.io) | Seis jogos de navegador (labirinto, Snake, memória, Whac-A-Mole, Flap e Blocks). O projeto declara que código, desenhos originais e sons sintetizados são MIT. | Candidato forte para copiar os arquivos para o próprio repositório AGORA, preservando o arquivo de licença e os créditos dos autores. São jogos casuais; para virar aprendizagem, podemos adicionar curiosidades, missões e explicações próprias sem retirar a autoria. |
| [Edukiz](https://github.com/timmalich/edukiz) | Coleção de jogos educativos em Vue 3/Vite, com licença MIT e PWA. Inclui memória, letras/palavras, matemática e leitura de texto. A documentação informa que o áudio disponível é atualmente em alemão. | Referência útil e possível fonte para adaptar jogos específicos. Exige build e revisão de imagens, áudio, dependências e tradução antes de entrar no AGORA. |
| [Scratch — incorporar projetos](https://mitscratch.freshdesk.com/pt-BR/support/solutions/articles/4000156765-como-posso-incorporar-um-projeto-do-scratch-em-outro-website-) | O Scratch permite incorporar um projeto em outra página usando iframe. | Serve para projetos específicos de criadores, com o crédito visível e as permissões/condições do projeto verificadas. O jogo continua hospedado no Scratch, não dentro do repositório AGORA. |
| [H5P](https://h5p.org/) | Conteúdos interativos responsivos: memória, arrastar e soltar, quizzes, vídeos interativos e outros formatos. | Boa ferramenta para atividades interativas. Para uso real, H5P recomenda auto-hospedagem ou H5P.com; H5P.org é para testes, não hospedagem de produção. A instalação própria exige infraestrutura compatível. |
| [Phaser](https://phaser.io/) | Framework open source para criar jogos HTML5 em Canvas/WebGL que funcionam em navegadores desktop e mobile. | Ferramenta para desenvolver jogos próprios mais elaborados. Não é um catálogo de jogos prontos. Conferir separadamente a licença de qualquer arte, música ou código de terceiros. |

### Regra de incorporação e autoria

Crédito não substitui autorização. Antes de publicar um jogo de outra pessoa, confirmar que a licença permite copiar, modificar e hospedar o jogo (e seus assets) no AGORA. Quando permitido, mostrar autor, projeto de origem e licença no cartão ou na tela do jogo e manter o arquivo de licença original no repositório. Se só for permitido incorporar por iframe, deixar claro que o conteúdo é hospedado no serviço externo. Não contornar bloqueios de iframe nem retirar anúncios, marcas ou atribuições.

### Jogos originais já adicionados ao AGORA

- **Memória Selvagem** — jogo da memória com animais e curiosidades.
- **Missão Espacial** — arcade de nave com controles por teclado e toque.
- **Detetives da Natureza** — puzzle de cadeias alimentares.
- **Desafio das sequências** — desafio de lógica numérica.

Os quatro jogos estão em pastas independentes dentro de `games/`, são originais do AGORA e podem ser abertos dentro do aplicativo. A página inicial passou a exibir os jogos em primeiro plano.
