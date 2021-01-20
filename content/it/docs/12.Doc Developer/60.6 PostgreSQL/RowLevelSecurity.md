---
title: "Row Level Security"

---

# Row Level Security
In questa sezione parliamo di come implementare la sicurezza a livello riga, quindi più granulare, in PostgreSQL.

Concetti base:
* database: dobbiamo spiegarlo :-) ?
* utente (user): è colui che si autentica per l'accesso al database, paragonabile agli utenti shell Linux, ogni utente autenticato avrà accesso solo a ciò che crea lui più ciò che altri utenti gli permettono di fare sui propri oggetti (tramite il comando GRANT)
* ruolo (role): è paragonabile ai gruppi shell Linux, o possiamo vederlo in modo aziendale, il dirigente può accedere al PC della sala riunioni mentre i segretari no. Un utente può far parte di uno o più ruoli, in questo modo è facile modificare le autorizzazioni di accesso.
* schema (schema): è paragonabile al concetto delle directory in un file system, è uno "spazio dei nomi" e tutto ciò che vi sta dentro (sotto) ne "eredita" i permessi.
(a dirla tutta ruolo ed utente in PostgreSQL sono praticamente la stessa cosa)
Il modo classico per separare gli utenti in un database è creare più schemi, uno per ognuno degli utenti, tramite questa procedura, invece, lo schema è unico ma ci saranno delle REGOLE di accesso ai record.

## Procedura
- Loggandoci come postgres creiamo gli utenti necessari, ne facciamo 2 a scopo illustrativo, con i due ruoli e lo schema comune:

`psql -U postgres postgres`

`CREATE USER user1 LOGIN;`  
`CREATE USER user2 LOGIN;`  
 (il login è per debug, useremo psql per testare il funzionamento)

-   ruoli:
`CREATE ROLE role1 NOINHERIT;`
`CREATE ROLE role2 NOINHERIT;`
( INHERIT  fa in modo di ereditare i permessi di chi usa il comando, NOHINERIT quindi il contrario)

- associamo i ruoli agli utenti (è come se definissimo il loro incarico e quindi limiti e obblighi)
`GRANT role1 TO user1;`
`GRANT role2 TO user2;`

- creiamo lo schema:
`CREATE SCHEMA namespace;`
(questo sarà il "contenitore" di tutti gli oggetti del database nel quale è definito)
ora facciamo in modo che entrambi gli utenti (ruoli) usino lo stesso contenitore
- Diamo accesso a questo contenitore per i due ruoli/utenti, senza questo gli utenti non vedrebbero neppure gli oggeti al suo interno:
`GRANT ALL ON SCHEMA namespace TO role1,role2;`
- Definiamo l'ordine di ricerca/uso dei namespace:
`ALTER ROLE role1 SET search_path TO namespace, pg_catalog`
`ALTER ROLE role2 SET search_path TO namespace, pg_catalog`

- Ora creiamo una tabella di esempio su cui lavoreremo:
 `CREATE TABLE tabella_condivisa (
  campo1 VARCHAR(20),
  campo2 VARCHAR(20) DEFAULT current_user);`
- inseriamo un paio di righe:
 `INSERT INTO tabella_condivisa VALUES ('prima riga'),('seconda'),('terza');`
- permettiamo ad entrambi gli utenti di accedere alla tabella:
 `GRANT ALL ON tabella_condivisa TO role1,role2;`

- cambiamo utente/ruolo ed inseriamo ancora:
`SET ROLE role1;`
`INSERT INTO tabella_condivisa VALUES ('prima riga uno'),('seconda uno'),('terza uno');`

- cambiamo utente/ruolo di nuovo  ed inseriamo ancora:
`SET ROLE NONE;`
`SET ROLE role2;`
`INSERT INTO tabella_condivisa VALUES ('prima riga due'),('seconda due'),('terza due');`

Bene, il setup iniziale è pronto: due utenti diversi che accedono alla stessa tabella in cui possono scrivere entrambi ma, allo stato attuale, entrambi accedono a TUTTA la tabella quindi anche ai record dell'atro utente.

Ora creeremo una regola che permetterà solo a chi ha creato il record di leggerla, nel nostro esempio la condizione da soddisfare è assegnare la regola di visibilità all'utente corrispomdente al campo2 della tabella_condivisa:
- abilitiamo la RowLevelSecurity sulla tabella (dall'utente che l'ha creata, cioè postgres):
 `ALTER TABLE tabella_condivisa ENABLE ROW LEVEL SECURITY`
-  creiamo le regole necessarie:
 `CREATE POLICY role1_can_all ON tabella_condivisa TO role1 USING (campo2='user1');`
 `CREATE POLICY role2_can_all ON tabella_condivisa TO role2 USING (campo2='user2');`
- Ora l'utente vedrà solo le "sue" righe:
`SET ROLE role1;`
`SELECT * FROM tabella_condivisa;`
```
select * from tabella_condivisa ;
     campo1     | campo2 
----------------+--------
 prima riga uno | user1
 seconda uno    | user1
 terza uno      | user1
(3 righe)

```
`SET ROLE role2;`
`SELECT * FROM tabella_condivisa;`
```
select * from tabella_condivisa ;
     campo1     | campo2 
----------------+--------
 prima riga due | user2
 seconda due    | user2
 terza due      | user2
(3 righe)

```

Esempio link [Hugo-theme-learn](http://github.com/matcornic/hugo-theme-learn)
ESempio grassetto **fully designed for documentation**.



##  Esempio Paragrafo '##'


Esempio Elenco puntato

* [Automatic Search]({{%relref "basics/configuration/_index.md#activate-search" %}})
* [Multilingual mode]({{%relref "cont/i18n/_index.md" %}})
* **Unlimited menu levels**


Esempio Immagine
![test](/image/gatto.png)

![Screenshot](https://github.com/matcornic/hugo-theme-learn/raw/master/images/screenshot.png?width=40pc&classes=shadow)

```toml
[params]
  # Prefix URL to edit current page. Will display an "Edit this page" button on top right hand corner of every page.
  # Useful to give opportunity to people to create merge request for your doc.
  # See the config.toml file from this documentation site to have an example.
 with a variant one. Can be "red", "blue", "green".
  themeVariant = ""
  # Provide a list of custom css files to load relative from the `static/` folder in the site root.
  custom_css = ["css/foo.css", "css/bar.css"]
```





### Notice

Esempio note
{{% notice note %}}
Automatically published and hosted thanks to [Netlify](https://www.netlify.com/). Read more about [Automated HUGO deployments with Netlify](https://www.netlify.com/blog/2015/07/30/hosting-hugo-on-netlifyinsanely-fast-deploys/)
{{% /notice %}}

Esempio Tip
{{% notice tip %}}Learn theme works with a _page tree structure_ to organize content : All contents are pages, which belong to other pages. [read more about this]({{%relref "cont/pages/_index.md"%}}) 
{{% /notice %}}



Esempio Notice info
{{% notice info %}}
Your modification will be deployed automatically when merged.
{{% /notice %}}



Esempio Notice warning
{{% notice warning%}}
Your modification will be deployed automatically when merged.
{{% /notice %}}

### SiteParam

## Documentation website

Esempio evidenza + copy to clipboard  : `hugo -t hugo-theme-learn` 
`siteparam` shortcode is used to help you print values of site params. 

For instance, in this current site, the `editURL` variable is used in `config.toml`

```toml
[params]
  editURL = "https://github.com/matcornic/hugo-theme-learn/edit/master/exampleSite/content/"
```

Use the `siteparam` shortcode to display its value.

```
`editURL` Value : {{%/* siteparam "editURL" */%}}
```

is displayed as

`editURL` Value : {{% siteparam "editURL" %}}

### Mermaid 

---

title : "Mermaid"

description : "Generation of diagram and flowchart from text in a similar manner as markdown"
---

[Mermaid](https://mermaidjs.github.io/) is a library helping you to generate diagram and flowcharts from text, in a similar manner as Markdown.

Just insert your mermaid code in the `mermaid` shortcode and that's it.

## Flowchart example

	{{</*mermaid align="left"*/>}}
	graph LR;
		A[Hard edge] -->|Link text| B(Round edge)
		B --> C{Decision}
		C -->|One| D[Result one]
		C -->|Two| E[Result two]
	{{</* /mermaid */>}}

renders as

{{<mermaid align="left">}}
graph LR;
	A[Hard edge] -->|Link text| B(Round edge)
	B --> C{Decision}
	C -->|One| D[Result one]
	C -->|Two| E[Result two]
{{< /mermaid >}}

or you can use this alternative syntax:

<pre>
```mermaid
graph LR;
  A[Hard edge] -->|Link text| B(Round edge)
    B --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
```
</pre>


renders as

```mermaid
graph LR;
  A[Hard edge] -->|Link text| B(Round edge)
    B --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
```

## Sequence example

	{{</*mermaid*/>}}
	sequenceDiagram
	    participant Alice
	    participant Bob
	    Alice->>John: Hello John, how are you?
	    loop Healthcheck
	        John->John: Fight against hypochondria
	    end
	    Note right of John: Rational thoughts <br/>prevail...
	    John-->Alice: Great!
	    John->Bob: How about you?
	    Bob-->John: Jolly good!
	{{</* /mermaid */>}}

renders as

{{<mermaid>}}
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>John: Hello John, how are you?
    loop Healthcheck
        John->John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail...
    John-->Alice: Great!
    John->Bob: How about you?
    Bob-->John: Jolly good!
{{< /mermaid >}}

or you can use this alternative syntax:

<pre>
```mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>John: Hello John, how are you?
    loop Healthcheck
        John->John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail...
    John-->Alice: Great!
    John->Bob: How about you?
    Bob-->John: Jolly good!
```
</pre>


renders as

```mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>John: Hello John, how are you?
    loop Healthcheck
        John->John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail...
    John-->Alice: Great!
    John->Bob: How about you?
    Bob-->John: Jolly good!
```

## GANTT Example

	{{</*mermaid*/>}}
	gantt
	        dateFormat  YYYY-MM-DD
	        title Adding GANTT diagram functionality to mermaid
	        section A section
	        Completed task            :done,    des1, 2014-01-06,2014-01-08
	        Active task               :active,  des2, 2014-01-09, 3d
	        Future task               :         des3, after des2, 5d
	        Future task2               :         des4, after des3, 5d
	        section Critical tasks
	        Completed task in the critical line :crit, done, 2014-01-06,24h
	        Implement parser and jison          :crit, done, after des1, 2d
	        Create tests for parser             :crit, active, 3d
	        Future task in critical line        :crit, 5d
	        Create tests for renderer           :2d
	        Add to mermaid                      :1d
	{{</* /mermaid */>}}


renders as

{{<mermaid>}}
gantt
        dateFormat  YYYY-MM-DD
        title Adding GANTT diagram functionality to mermaid
        section A section
        Completed task            :done,    des1, 2014-01-06,2014-01-08
        Active task               :active,  des2, 2014-01-09, 3d
        Future task               :         des3, after des2, 5d
        Future task2               :         des4, after des3, 5d
        section Critical tasks
        Completed task in the critical line :crit, done, 2014-01-06,24h
        Implement parser and jison          :crit, done, after des1, 2d
        Create tests for parser             :crit, active, 3d
        Future task in critical line        :crit, 5d
        Create tests for renderer           :2d
        Add to mermaid                      :1d
{{</mermaid>}}

or you can use this alternative syntax:

<pre>
```mermaid
gantt
        dateFormat  YYYY-MM-DD
        title Adding GANTT diagram functionality to mermaid
        section A section
        Completed task            :done,    des1, 2014-01-06,2014-01-08
        Active task               :active,  des2, 2014-01-09, 3d
        Future task               :         des3, after des2, 5d
        Future task2               :         des4, after des3, 5d
        section Critical tasks
        Completed task in the critical line :crit, done, 2014-01-06,24h
        Implement parser and jison          :crit, done, after des1, 2d
        Create tests for parser             :crit, active, 3d
        Future task in critical line        :crit, 5d
        Create tests for renderer           :2d
        Add to mermaid                      :1d
```
</pre>


renders as

```mermaid
gantt
        dateFormat  YYYY-MM-DD
        title Adding GANTT diagram functionality to mermaid
        section A section
        Completed task            :done,    des1, 2014-01-06,2014-01-08
        Active task               :active,  des2, 2014-01-09, 3d
        Future task               :         des3, after des2, 5d
        Future task2               :         des4, after des3, 5d
        section Critical tasks
        Completed task in the critical line :crit, done, 2014-01-06,24h
        Implement parser and jison          :crit, done, after des1, 2d
        Create tests for parser             :crit, active, 3d
        Future task in critical line        :crit, 5d
        Create tests for renderer           :2d
        Add to mermaid                      :1d
```

### Class example

<pre>
```mermaid
classDiagram
  Class01 <|-- AveryLongClass : Cool
  Class03 *-- Class04
  Class05 o-- Class06
  Class07 .. Class08
  Class09 --> C2 : Where am i?
  Class09 --* C3
  Class09 --|> Class07
  Class07 : equals()
  Class07 : Object[] elementData
  Class01 : size()
  Class01 : int chimp
  Class01 : int gorilla
  Class08 <--> C2: Cool label
```
</pre>


renders as

```mermaid
classDiagram
  Class01 <|-- AveryLongClass : Cool
  Class03 *-- Class04
  Class05 o-- Class06
  Class07 .. Class08
  Class09 --> C2 : Where am i?
  Class09 --* C3
  Class09 --|> Class07
  Class07 : equals()
  Class07 : Object[] elementData
  Class01 : size()
  Class01 : int chimp
  Class01 : int gorilla
  Class08 <--> C2: Cool label
```

### Git example

<pre>
```mermaid
gitGraph:
options
{
  "nodeSpacing": 150,
  "nodeRadius": 10
}
end
  commit
  branch newbranch
  checkout newbranch
  commit
  commit
  checkout master
  commit
  commit
  merge newbranch
```
</pre>


renders as

```mermaid
gitGraph:
options
{
  "nodeSpacing": 150,
  "nodeRadius": 10
}
end
  commit
  branch newbranch
  checkout newbranch
  commit
  commit
  checkout master
  commit
  commit
  merge newbranch
```

### EXPAND

Esempio Parte visibile / Parte Nascosta
{{%expand "Parte Visible" %}}Parte Nascosta .{{% /expand%}}

### Button

A button is a just a clickable button with optional icon.

    {{%/* button href="https://getgrav.org/" */%}}Get Grav{{%/* /button */%}}
    {{%/* button href="https://getgrav.org/" icon="fas fa-download" */%}}Get Grav with icon{{%/* /button */%}}
    {{%/* button href="https://getgrav.org/" icon="fas fa-download" icon-position="right" */%}}Get Grav with icon right{{%/* /button */%}}

{{% button href="https://getgrav.org/" %}}Get Grav{{% /button %}}

{{% button href="https://getgrav.org/" icon="fas fa-download" %}}Get Grav with icon{{% /button %}}

{{% button href="https://getgrav.org/" icon="fas fa-download" icon-position="right" %}}Get Grav with icon right{{% /button %}}

### Attachment


The Attachments shortcode displays a list of files attached to a page.



#### Usage

The shortcurt lists files found in a **specific folder**.
Currently, it support two implementations for pages

1. If your page is a markdown file, attachements must be place in a **folder** named like your page and ending with **.files**.

   > * content
   >   * _index.md
   >   * page.files
   >     * attachment.pdf
   >   * page.md

2. If your page is a **folder**, attachements must be place in a nested **'files'** folder.

   > * content
   >   * _index.md
   >   * page
   >     * index.md
   >     * files
   >       * attachment.pdf

Be aware that if you use a multilingual website, you will need to have as many folders as languages.

That's all !

### Parameters

| Parameter | Default       | Description                                                  |
| :-------- | :------------ | :----------------------------------------------------------- |
| title     | "Attachments" | List's title                                                 |
| style     | ""            | Choose between "orange", "grey", "blue" and "green" for nice style |

| pattern | ".*" | A regular expressions, used to filter the attachments by file name. <br/><br/>The **pattern** parameter value must be [regular expressions](https://en.wikipedia.org/wiki/Regular_expression).

For example:

* To match a file suffix of 'jpg', use **.*jpg** (not *.jpg).
* To match file names ending in 'jpg' or 'png', use **.*(jpg|png)**

### Examples

#### List of attachments ending in pdf or mp4


##    {{%/*attachments title="Related files" pattern=".*(pdf|mp4)"/*/%}}

renders as


#### Colored styled box

 //   {{%/*attachments style="orange" /*/%}}

renders as

 {{/* attachments style="orange" */}}


    {{%/*attachments style="grey" /*/%}}

renders as 

{{/*% attachments style="grey" /%*/}}

    {{%/*attachments style="blue" /*/%}}

renders as

{{/*% attachments style="blue" /%*/}}
​    
    {{%/*attachments style="green" /*/%}}

renders as

{{/*% attachments style="green" /%*/}}