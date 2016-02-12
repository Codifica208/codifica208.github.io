---
layout: post
title: iNGector.js
sub-title: Um módulo de injeção de dependência inspirado no AngularJS
author: luiggi-anguiano
images: ['/public/images/posts/sobre-o-blog.png']
tags: [injecaodependencia, nodejs, javascript, promises]
categories: [desenvolvimento, tecnologia]
---

Há um tempo atrás trabalhei num projeto com AngularJs, ainda na versão 1, e o que mais gostei no framework foi a sua injeção de dependência.
Simples, robusta e elegante, ela além de tornar o código incrívelmente testável também melhorava a organização e a divisão de responsabilidades do mesmo.

Após o anúncio das mudanças que viriam no Angular 2, voltei a utilizar um framework client-side baseado em modular pattern e Knockoutjs, que sempre atendeu muito bem verdade seja dita, mas os testes e a organização agora estavam em um nível inferior.

Meses depois comecei um projeto com Node.js no back-end e além dos tradicionais problemas com ninhos de callbacks e ausência de um bom ORM também estava passando por dificuldades principalmente para testar a aplicação.

Então comecei a procurar pela internet algum injetor de dependência que me ajudasse a resolver esse problema. Testei muitos pacotes do NPM, li sobre muitas implementações em blogs e no StackOverflow e cogitei ainda partir para um modelo de implementação que usasse AMDs. Como nenhuma das alternativas que encontrei era tão simples e funcional quanto a apresentada pelo Angular resolvi criar um injetor de dependência baseado no dele e chamei carinhosamente de i*NG*ector.

O módulo está disponível para download no [NPM](https://www.npmjs.com/package/ingector) e seu código fonte está no [GitHub](https://github.com/Codifica208/iNGector).

### Utilizando o componente

O injetor possui os seguintes métodos:

- **provide(name, dependencies, function)**: cria um fragmento de implementação
	Argumentos
	- name: chave de identificação do fragmento
	- dependencies: uma ou mais chaves de fragmentos necessários
	- function: a função que constroi e devolve o fragmento. Deve retornar uma Promise.

- **init([,dependency 1[, depdendency N]], function)**: define uma função a ser executada depois que todos os fragmentos forem resolvidos


### Utilizando no Web Client

Como o iNGector utiliza promises

Para utilizar o injetor no client-side basta fazer o download da ultima versão [aqui](https://github.com/Codifica208/iNGector/blob/master/dist/iNGector.js) e adicionar a tag script no seu html ANTES dos arquivos de implementação.

{% highlight html %}

<script type="text/javascript" src="[caminho_arquivo]/iNGector.js"></script>
<!-- Agora vem seus scripts de implementação que usam o iNGector -->
<script type="text/javascript" src="[caminho_arquivo]/[sua_implementacao].js"></script>
<script type="text/javascript" src="[caminho_arquivo]/[sua_outra_implementacao].js"></script>

{% endhighlight %}

O iNGector possui dois principais métodos: **provide** e **init**, que são similares aos *config* e *run* do injetor do Angular.

{% highlight javascript %}

{% endhighlight %}