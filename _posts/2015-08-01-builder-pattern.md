---
layout: post
title: Builder Pattern
sub-title: Entendendo e tirando proveito do padrão
author: eduardo-silva
tags: [padroes, dotnet, csharp]
categories: [desenvolvimento]
---

O [Builder Pattern](https://en.wikipedia.org/wiki/Builder_pattern) é um dos padrões criacionais descritos pelo grupo Gang of Four no excelente [Design Patterns: Elements of Reusable Object-Oriented Software](https://en.wikipedia.org/wiki/Design_Patterns), tendo como um dos seus principais objetivos particionar as operações de criação de um objeto.

Elaborado para evitar a construção de milhares de construtores cobrindo todo um universo de combinações possíveis, ele se baseia na existência de um objeto builder (construtor) que recebe os diversos parâmetros de inicialização através de métodos. Estes incrementam o estado inicial do objeto futuro e, ao final do processo, retornam o mesmo devidamente configurado.

Algumas implementações utilizam esse conceito para entregar o que chamamos de [Interface Fluente](https://en.wikipedia.org/wiki/Fluent_interface). Para isso, fazem com que os métodos de parametrização retornem a própria instância do builder, permitindo assim concatenar os mesmos e melhorar a leitura do código.

Para se ter uma ideia do seu potencial, vamos pegar como exemplo a construção condicional de instruções SQL:

{% highlight csharp %}

var criterias = new List<string>();
var builder = new StringBuilder();
builder.AppendLine("SELECT ");
builder.AppendLine("    DepartmentId,  ");
builder.AppendLine("    Name,  ");
builder.AppendLine("    GroupName  ");
builder.AppendLine("FROM  ");
builder.AppendLine(" [HumanResources].[Department]");

if (id.HasValue)
    criterias.Add(String.Format(" DepartmentId = {0}", id));

if (!String.IsNullOrWhiteSpace(name))
    criterias.Add(String.Format(" Name LIKE '%{0}%'", name));

if (!String.IsNullOrWhiteSpace(groupName))
    criterias.Add(String.Format(" GroupName LIKE '%{0}%'", groupName));

if (criterias.Any())
{
    builder.AppendLine(" WHERE ");
    builder.AppendLine(String.Join(" AND ", criterias));
}

{% endhighlight %}

*(se alguma vez você já concatenou strings desta maneira sabe o quanto esse tipo de código pode ser frágil e de difícil manutenção)*

Ao escrever desta maneira estamos sujeitos a problemas básicos de instruções SQL, como falta de vírgulas, erro em keywords, etc. Já no exemplo abaixo, removemos a sintaxe SQL e continuamos com a capacidade de adicionar comportamento dinamicamente (e ainda temos como resultado um código mais limpo e coeso):

{% highlight csharp %}

var builder = new SelectBuilder();
builder.Column("DepartmentId")
       .Column("Name")
       .Column("GroupName")
       .Table("[HumanResources].[Department]");

if (id.HasValue)
    builder.Criteria("DepartmentId", ComparerType.Equals, id);

if (!String.IsNullOrWhiteSpace(name))
    builder.Criteria("Name", ComparerType.Like, name);

if (!String.IsNullOrWhiteSpace(groupName))


{% endhighlight %}

Se você já está familiarizado com algum framework ORM, sabe que a sua sintaxe tem uma grande semelhança com o exemplo acima. Vejamos uma implementação com [Entity Framework](https://en.wikipedia.org/wiki/Entity_Framework):

{% highlight csharp %}

using (var context = new DataContext())
{
    var query = context.Departments.AsQueryable();

    if (id.HasValue)
        query = query.Where(d => d.Id == id);

    if (!String.IsNullOrWhiteSpace(name))
        query = query.Where(d => d.Name.Contains(name));

    if (!String.IsNullOrWhiteSpace(groupName))
        query = query.Where(d => d.GroupName.Contains(groupName));

    var result = query.Select(d => new { d.Id, d.Name, d.GroupName }).ToArray();
}

{% endhighlight %}

Além do mais, linguagens que suportam [Extension Methods](https://en.wikipedia.org/wiki/Extension_method), por exemplo [C#](https://en.wikipedia.org/wiki/C_Sharp_%28programming_language%29), permitem que adicionemos métodos customizados sobrecarregando nosso builder. Seguindo com o Entity Framework, imagine um cenário onde os códigos dos departamentos da área administrativa estão no intervalo de 9 a 12. Todo procedimento relacionado a esses departamentos necessitaria seguir o modelo abaixo:

{% highlight csharp %}

using (var context = new DataContext())
{
    var result = context.Departments.Where(d => d.Id >= 9 && d.Id <= 12).ToArray();
    //... realiza alguma operação com esses departamentos
}

{% endhighlight %}

Este tipo de consulta é ruim principalmente por dois motivos:

1. **Leitura**: outro programador não familiarizado com esses parâmetros não faz ideia do que significa o intervalo de 9 a 12.

2. **Reutilização**: toda vez que for necessário manipular os departamentos administrativos você vai precisar replicar esta implementação.

Utilizando os Extension Methods podemos encapsular esta consulta e disponibilizá-la dentro de qualquer coleção do tipo *IQueryable\<Department\>* :

{% highlight csharp %}

public static class Extensions
{
    public static IQueryable<Department> Administratives(this IQueryable<Department> departments)
    {
        return departments.Where(d => d.Id >= 9 && d.Id <= 12);
    }
}

{% endhighlight %}

E então:

{% highlight csharp %}

using (var context = new DataContext())
{
    var result = context.Departments
                        .AsQueryable()
                        .Administratives()
                        .ToArray();
    //... realiza alguma operação com esses departamentos
}

{% endhighlight %}

Desta maneira temos um código muito mais seguro e legível, e nos livramos dos dois problemas mencionados. Qualquer programador sabe que está lidando com os departamentos administrativos e não só temos um reaproveitamento da consulta como podemos adicionar outro departamento ao grupo incrementando a mesma num único lugar.

Como nosso método parte de um *IQueryable\<Department\>* e devolve outro *IQueryable\<Department\>* suplementado, podemos estender nosso builder e concatenar as operações:

{% highlight csharp %}

public static class Extensions
{
    public static IQueryable<Department> Administratives(this IQueryable<Department> departments)
    {
        return departments.Where(d => d.Id >= 9 && d.Id <= 12);
    }

    public static IQueryable<Department> IsActive(this IQueryable<Department> departments)
    {
        return departments.Where(d => d.IsActive == true);
    }
}

{% endhighlight %}

{% highlight csharp %}

using (var context = new DataContext())
{
    var result = context.Departments
                        .AsQueryable()
                        .Administratives()
                        .IsActive()
                        .ToArray();

    //... realiza alguma operação com esses departamentos
}

{% endhighlight %}

Por ser bastante utilizado pela comunidade, nos deparamos com esse padrão com muita frequência no nosso dia-a-dia. Sabendo explorar seu potencial, podemos criar diversas extensões e outros códigos baseados nele.
