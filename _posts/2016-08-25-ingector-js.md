---
layout: post
title: iNGector.js
sub-title: Um módulo de injeção de dependência inspirado no AngularJS
author: luiggi-anguiano
images: []
tags: [injecaodependencia, nodejs, javascript, promises]
categories: [desenvolvimento, tecnologia]
---

O iNGector foi criado com um único objetivo: trazer a simplicidade e elegância do injetor de dependência do AngularJS para toda implementação JavaScript. Hoje vamos ver como utilizá-lo no **Web-Client**.

#### Promises

A única dependência do iNGector é a utilização de Promises, portanto, será necessário adicionar uma biblioteca extra para dar suporte aos navegadores mais antigos. Nós recomendamos utilizar a [A+ PromiseJS](https://www.promisejs.org/).

#### Adicionando o iNGector na sua aplicação web

Para utilizá-lo basta fazer o download da última versão [aqui](https://github.com/Codifica208/iNGector/blob/master/dist/iNGector.js) e adicionar a tag script no seu html ANTES dos seus scripts.

{% highlight html %}

<!-- A+ PromiseJS (caso queira suportar navegadores mais antigos) -->
<script type="text/javascript" src="[caminho_arquivos]/promises.js"></script>

<!-- iNGector -->
<script type="text/javascript" src="[caminho_arquivos]/iNGector.js"></script>

<!-- Seus scripts -->
<script type="text/javascript" src="[caminho_arquivos]/[seu_script].js"></script>
<script type="text/javascript" src="[caminho_arquivos]/[seu_outro_script].js"></script>

{% endhighlight %}

Uma vez adicionado à página, a variável global **di** estará disponível.

#### Registrando componentes

Para registrar um componente basta fazer o seguinte:

{% highlight javascript %}

di.provide('meu-componente', function (){
    return Promise.resolve({
        exibirMensagem: function(mensagem) {
            alert(mensagem);
        }
    });
});

{% endhighlight %}

O método **provide** recebe pelo menos dois argumentos, sendo o primeiro o nome do componente e o último a função construtora do componente. A função deve retornar uma Promise e o resultado desta é que deve ser o seu componente.

Além disso, é possível requisitar outros componentes como dependência:

{% highlight javascript %}

di.provide('meu-OUTRO-componente', 'meu-componente', function (meuComponente){
    return Promise.resolve({
        digaAlo: function() {
            meuComponente.exibirMensagem("ALÔ");
        }
    });
});

{% endhighlight %}

Você pode requisitar quantos componentes quiser, basta declarar os nomes deles entre o primeiro e o último parâmetro. Eles serão entregues à função construtora na mesma ordem em que foram requisitados.

#### Registrando funções de inicialização

O injetor também permite que você registre funções de inicialização. Estas são executadas depois que todos os componentes são ordenados e resolvidos.

As funções de inicialização não tem nome e também podem requisitar componentes como dependência:

{% highlight javascript %}

di.init('meu-componente', function (meuComponente){
    meuComponente.exibirMensagem("Olá mundo!");
});

{% endhighlight %}

#### Inicializando o iNGector

Uma vez que todos os componentes e funções de inicialização foram registrados, basta chamarmos o método **start**:

{% highlight javascript %}

di.start();

{% endhighlight %}

Uma vez que o método **start** e chamado, o injetor:

- Ordena os componentes de acordo com as dependências necessárias
- Executa as funções construtoras
- Executa as funções de inicialização

*Este método deve ser chamado apenas uma vez por execução de página!*

#### O método RESOLVE

Este método retorna um componente registrado e processado. Embora não seja aconselhável que você mantenha implementações dentro e fora do ambiente do injetor, se você precisar debugar ou inspecionar um componente poderá usar este método.

{% highlight javascript %}

var componente = di.resolve('meu-componente');

{% endhighlight %}

----------

Em breve publicarei outro post mostrando como utilizar o iNGector num servidor Nodejs.

Ele está disponível para download no [NPM](https://www.npmjs.com/package/ingector) e seu código fonte está no [GitHub](https://github.com/Codifica208/iNGector).
Maiores detalhes e uma abordagem mais avançada você encontra no [README](https://github.com/Codifica208/iNGector) do projeto.