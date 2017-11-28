---
layout: post
title: Asp.net 5 Multiplataforma
sub-title: Asp.net 5 Multiplataforma
author: leonardo-lana
images: ['/public/images/posts/sobre-o-blog.png']
tags: [blog]
categories: [Asp.Net]
---

O asp.net 5 será multiplataforma, trazendo consigo o novo asp.net 5, que conterá a versão 6 do Asp.net MVC também conhecido como vNext.
Foi uma grande surpresa ver uma aplicação .NET rodando em Linux e OSX na Build 2015 (principal evento da Microsoft, onde uma das pessoas mais influentes da microsoft disse que a [Microsoft ama o linux](http://img.deusm.com/informationweek/2014/10/1316800/Microsoft_LOVES_Linux.jpg) o.O) este tema também foi abordado no Asp.Net Brasil Conference 2015 (evento que ocorreu em São Paulo dia 16/05).

### Bom, mas como isso foi possível?

Primeiro, o novo compilador Roslyn começou essa revolução.
Segundo, o novo ecossistema .Net, onde o .net framework "dividiu-se" em .NET FullFramewok e .NET Core  (núcleo Open Source). E é esse .Net Core que rodará nos Linux e OSX. 

### Mas o Visual Studio rodará no Linux?

Não, mas recentemente foi lançada um novo editor com o nome de [Visual Studio Code](https://code.visualstudio.com), que é uma versão muito mais parecida com o Atom ou Sublime do que com o próprio Visual Studio, pois o objetivo dele é ser apenas um editor, ou seja, um subset do próprio Visual Studio.
O VS Code é uma ferramenta multiplataforma baseada no [Electron Editor](http://electron.atom.io). Outros editores como o Atom também são baseados nele. Outra coisa, ele também utiliza o [OmniSharp](http://www.omnisharp.net) que é quem fornece os poderes de intelliSense ao VS Code e a outras editores como Atom, Sublime, Emacs e outros. Ele é um projeto Open Source e multiplataforma com o objetivo de fornecer a experiência .Net no editor de sua escolha.

### O VS Code faz scaffolding de templates?

Não. Para gerar o scaffolding de templates somente no Visual Studio (Windows) ou uma alternativa é o [Yeoman](http://yeoman.io). 

### Mas sem o Visual Studio, quais são as minhas alternativas de ferramentas para desenvolvimento web?

Como dito anteriormente você poderá utilizar as seguintes alternativas?

1. [Yeoman](http://yeoman.io). O objetivo dele é te dar um kickstart em novos projetos, ou seja, ele é basicamente um gerador de templates nas mais diversas tecnologias web, como o próprio Asp.net vNext, Node Js, Ruby entre outras. 
2. [Grunt](http://gruntjs.com). Ele te fornece um sistema de Build, para você poder construir, rodar e testar o seu projeto. Te fornecendo também um Task Runner, ou seja, possibilitando automatizar algumas tarefas como minificação de arquivos, compilação, testes unitários, linting (análise de código) e etc.
3. [Bower](http://bower.io). Este é um gerenciador de pacotes usados para resolver/gerenciar dependências de bibliotecas para o seu projeto web.

#### Mas por quê eu usaria o VS Code, Yeoman, Grunt, Bower ou outras ferramentas?

Essa pergunta pode ser respondida em outros posts, mas na minha opinião poder utilizar as nossas próprias ferramentas de desenvolvimento independentemente da tecnologia e da plataforma é um grande ganho para a comunidade .Net e Web.

E se você não conhece o VS Code, Yeoman e todas essas ferramentas que mencionamos. O meu conselho é que vocês experimentem eles e levem essa nova experiência para o seu ambiente de trabalho, para a sua faculdade e para qualquer outro ambiente de desenvolvimento.

Até o próximo post. 