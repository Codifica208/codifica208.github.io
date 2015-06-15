---
layout: post
title: VS Code e o Asp.NET 5 multiplataforma
sub-title: Desenvolver uma aplicação Asp.NET no MAC e hospedar num servidor Linux?
author: leonardo-lana
images: ['/public/images/posts/vscode-e-o-aspnet-5-multiplataforma.png']
tags: [dotnet, aspnet, visualstudiocode, microsoft, opensource, multiplataforma]
categories: [novidades]
---

Não é de hoje que a Microsoft vem dando demonstrações de que deseja expandir suas tecnologias a outros sistemas operacionais.

![Satya Nadella, CEO (20/10/2014)](/public/images/posts/vscode-e-o-aspnet-5-multiplataforma-satya-nadella.png)

E no último Asp.NET Brasil Conference, evento que ocorreu em São Paulo no dia 16/05/2015, não foi diferente. O MVP [Victor Cavalcante](https://mvp.microsoft.com/pt-br/MVP/Victor%20Cavalcante-4030594) apresentou uma aplicação Asp.NET MVC rodando nos sistemas operacionais Linux e OSX.

Graças ao compilador [Roslyn](https://github.com/dotnet/roslyn) e à extração do núcleo do .NET Framework, o novo e aberto [.NET Core](https://github.com/dotnet/core), poderemos executar  aplicações .NET em qualquer um desses sistemas operacionais sem tantas limitações.

###Mas... e o Visual Studio?

Infelizmente, não há nada além de rumores de que a Microsoft criará versões da IDE para os outros sistemas operacionais.

Em contrapartida, ela lançou recentemente o novo [Visual Studio Code](https://code.visualstudio.com/), editor gratuito e multiplataforma.
Baseado no [Electron Shell](http://electron.atom.io/), o Code, como é chamado, se parece muito mais com os famosos [Sublime](http://www.sublimetext.com/) e [Atom](https://atom.io/) do que com o próprio Visual Studio. Possui uma interface gráfica de integração com repositórios Git e utiliza o [OmniSharp](http://www.omnisharp.net/) como provedor de Intellisense. Não possui scaffolding de templates, porém podemos utilizar aplicações como o [Yeoman](http://yeoman.io/) para contornar esse déficit.
 
\*\*\*

Ainda é cedo para afirmarmos alguma coisa, exceto que: desenvolver em .NET tendo a liberdade de usar seu ambiente de trabalho favorito é um grande ganho para toda a comunidade.

Até o próximo post.
