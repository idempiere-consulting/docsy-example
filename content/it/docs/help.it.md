---
title: "Help Hugo"
---


## Installazione e Comandi server

Hugo server -D   ( show also Draft Pages)


## Impostazione Pagina


```toml
[params]
title: "a"
linkTitle: ""
date : 2017-01-01
draft: true
weight: 10
tags : ["test","due"]
categories: ["cat"]
description: >
    Here's where your user finds out if your project is for them.
```





Esempio link [Hugo-theme-learn](http://github.com/matcornic/hugo-theme-learn)
ESempio grassetto **fully designed for documentation**.



##  Esempio Paragrafo '##'


Esempio Elenco puntato  usare asteriso '*' o '-'

* [Automatic Search]({{%relref "basics/configuration/_index.md#activate-search" %}})
* [Multilingual mode]({{%relref "cont/i18n/_index.md" %}})
* **Unlimited menu levels**


## Esempio Immagine


## Esempio Pulsante


A button is a just a clickable button with optional icon.

    {{%/* button href="https://getgrav.org/" */%}}Get Grav{{%/* /button */%}}
    {{%/* button href="https://getgrav.org/" icon="fas fa-download" */%}}Get Grav with icon{{%/* /button */%}}
    {{%/* button href="https://getgrav.org/" icon="fas fa-download" icon-position="right" */%}}Get Grav with icon right{{%/* /button */%}}

{{% button href="https://getgrav.org/" %}}Get Grav{{% /button %}}

{{% button href="https://getgrav.org/" icon="fas fa-download" %}}Get Grav with icon{{% /button %}}

{{% button href="https://getgrav.org/" icon="fas fa-download" icon-position="right" %}}Get Grav with icon right{{% /button %}}






{{% pageinfo %}}
This is a placeholder page. Replace it with your own content.
{{% /pageinfo %}}


- **bold**
Text can be **bold**, _italic_, or ~~strikethrough~~. [Links](https://gohugo.io) should be blue with no underlines (unless hovered over).

### Esempio Evidenza Laterale

> There should be no margin above this first sentence.
>
> Blockquotes should be a lighter gray with a border along the left side in the secondary color.





### Esempio Tabella

| What      | Follows         |
|-----------|-----------------|
| A table   | A header        |
| A table   | A header        |
| A table   | A header        |

----------------

There's a horizontal rule above and below this.

----------------

Here is an unordered list:

* Liverpool F.C.
* Chelsea F.C.
* Manchester United F.C.

And an ordered list:

1. Michael Brecker
2. Seamus Blake
3. Branford Marsalis

And an unordered task list:

- [x] Create a Hugo theme
- [x] Add task lists to it
- [ ] Take a vacation

And a "mixed" task list:

- [ ] Pack bags
- ?
- [ ] Travel!

And a nested list:

* [Jackson 5]({{%relref "basics/configuration/_index.md#activate-search" %}})
  * [Automatic Search]({{%relref "basics/configuration/_index.md#activate-search" %}})
  * [Tito]({{%relref "basics/configuration/_index.md#activate-search" %}})
  * [Jackie]({{%relref "1.systemadmin/_index.it.md#activate-search" %}})

  * Marlon
  * Jermaine
* TMNT
  * Leonardo
  * Michelangelo
  * Donatello
  * Raphael

Definition lists can be used with Markdown syntax. Definition headers are bold.

Name
: Godzilla

Born
: 1952

Birthplace
: Japan

Color
: Green


----------------

Tables should have bold headings and alternating shaded rows.

| Artist            | Album           | Year |
|-------------------|-----------------|------|
| Michael Jackson   | Thriller        | 1982 |
| Prince            | Purple Rain     | 1984 |
| Beastie Boys      | License to Ill  | 1986 |

If a table is too wide, it should scroll horizontally.

| Artist            | Album           | Year | Label       | Awards   | Songs     |
|-------------------|-----------------|------|-------------|----------|-----------|
| Michael Jackson   | Thriller        | 1982 | Epic Records | Grammy Award for Album of the Year, American Music Award for Favorite Pop/Rock Album, American Music Award for Favorite Soul/R&B Album, Brit Award for Best Selling Album, Grammy Award for Best Engineered Album, Non-Classical | Wanna Be Startin' Somethin', Baby Be Mine, The Girl Is Mine, Thriller, Beat It, Billie Jean, Human Nature, P.Y.T. (Pretty Young Thing), The Lady in My Life |
| Prince            | Purple Rain     | 1984 | Warner Brothers Records | Grammy Award for Best Score Soundtrack for Visual Media, American Music Award for Favorite Pop/Rock Album, American Music Award for Favorite Soul/R&B Album, Brit Award for Best Soundtrack/Cast Recording, Grammy Award for Best Rock Performance by a Duo or Group with Vocal | Let's Go Crazy, Take Me With U, The Beautiful Ones, Computer Blue, Darling Nikki, When Doves Cry, I Would Die 4 U, Baby I'm a Star, Purple Rain |
| Beastie Boys      | License to Ill  | 1986 | Mercury Records | noawardsbutthistablecelliswide | Rhymin & Stealin, The New Style, She's Crafty, Posse in Effect, Slow Ride, Girls, (You Gotta) Fight for Your Right, No Sleep Till Brooklyn, Paul Revere, Hold It Now, Hit It, Brass Monkey, Slow and Low, Time to Get Ill |

----------------

Code snippets like `var foo = "bar";` can be shown inline.

Also, `this should vertically align` ~~`with this`~~ ~~and this~~.

Code can also be shown in a block element.



```
Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.
```

Inline code inside table cells should still be distinguishable.

| Language    | Code               |
|-------------|--------------------|
| Javascript  | `var foo = "bar";` |
| Ruby        | `foo = "bar"{`      |

----------------

Small images should be shown at their actual size.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Picea_abies_shoot_with_buds%2C_Sogndal%2C_Norway.jpg/240px-Picea_abies_shoot_with_buds%2C_Sogndal%2C_Norway.jpg)

Large images should always scale down and fit in the content container.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Picea_abies_shoot_with_buds%2C_Sogndal%2C_Norway.jpg/1024px-Picea_abies_shoot_with_buds%2C_Sogndal%2C_Norway.jpg)

_The photo above of the Spruce Picea abies shoot with foliage buds: Bjørn Erik Pedersen, CC-BY-SA._


## Components

### Alerts

{{< alert >}}This is an alert.{{< /alert >}}
{{< alert title="Note" >}}This is an alert with a title.{{< /alert >}}
{{% alert title="Note" %}}This is an alert with a title and **Markdown**.{{% /alert %}}
{{< alert color="success" >}}This is a successful alert.{{< /alert >}}
{{< alert color="warning" >}}This is a warning.{{< /alert >}}
{{< alert color="warning" title="Warning" >}}This is a warning with a title.{{< /alert >}}





