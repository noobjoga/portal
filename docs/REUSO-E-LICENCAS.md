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
