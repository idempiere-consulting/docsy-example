# Plugin: Information Gadget(STD)

---

## Information Gadget

Riferimenti

- link pubblico  :<http://wiki.idempiere.org/en/Plugin:_Information_Gadget>
- link repos fork  :
- link jar  :/opt/repos/idempiere-download/plugin-standard/Information Gadget + Editor HTML/
- versione idempiere  : idempiere 3.1
- versione zk supportata : da verificare

---

## Descrizione

```
- Information Gadget può visualizzare le informazioni sulla dashboard gadget dalla Home
- Informazioni Gadget ha un titolo e il contenuto. il contenuto può crollare.
- Informazioni gadget può fare di paging e può limitare il numero di record in grado di visualizzare.
- Informazioni in grado di distinguere le informazioni per categoria Gadget. E le informazioni in grado di visualizzare per ogni categoria Informazioni Gadget.
- È possibile impostare la data e l'ora del pubblico delle informazioni.
- È possibile allegare dei file per le informazioni.
```

[![InformationGadget.png](http://192.168.178.102/images/thumb/6/68/InformationGadget.png/634px-InformationGadget.png)](http://192.168.178.102/index.php/File:InformationGadget.png)

---

## Installazione

```
1) Installare il file .jar dalla Console di Felix
2) è necesserio registrare una Categoria Gadget quindi andare nella maschera “Information Gadget Category” e creare una nuova categoria
```

[![InformationGadget0.png](http://192.168.178.102/images/thumb/2/27/InformationGadget0.png/700px-InformationGadget0.png)](http://192.168.178.102/index.php/File:InformationGadget0.png)

```
- Comment/ Help: Quando non ci sono informazioni da visualizzare, il campo Comment/ Help viene invece visualizzato.
- Max Redords Query: se si imposta 0 a questo campo, Informazioni gadget mostra tutti i dati.
- Page Size: Il numero di informazioni di visualizzazione per una pagina.
```

####  È necessario impostare JP_InfoGadgetCategory_ID in Dashboard Content

Per visualizzare le informazioni nella nostra Home dobbiamo impostare  la Gadget Category ID Gadget URI File Path campo nella Dashboard  Content window

[![InformationGadget1.png](http://192.168.178.102/images/thumb/9/9e/InformationGadget1.png/700px-InformationGadget1.png)](http://192.168.178.102/index.php/File:InformationGadget1.png)

Si prega di impostare il campo “Gadget URI” a  "JP_InfoGadgetCategory_ID=1234567" Il numero deve essere uguale a quello  del SearchKey dell’Information Gadget Category

#### Creare contenuti informazioni

Dopo aver preparato il tutto adesso possiamo creare vari contenuti informativi nella Information Gadget　

[![InformationGadget2.png](http://192.168.178.102/images/thumb/3/33/InformationGadget2.png/700px-InformationGadget2.png)](http://192.168.178.102/index.php/File:InformationGadget2.png)

```
Name: Titolo delle informazioni.
Date: Titolo display
HTML: Contenuto delle informazioni. È possibile utilizzare tag HTML.
Date From: Public start Date and Time.
Date To: Public stop Date and Time
Publication Status: Se si seleziona l'opzione "Released", i contenuti di informazione sono pubblicati.
```

## Modifica di HTML con Editor WYSIWYG

<http://wiki.idempiere.org/en/JPiere_WYSIWYG_Editor>

```
- iDempiere ha un editor WYSIWYG per modificare il contenuto del campo HTML. 
- Dobbiamo caricare nella nostra console di Felix il plugin dell’Editor.
- Bene, adesso abbiamo un processo nella Information Gadget (attenzione, prima dobbiamo collegarlo alla nostra Toolbar Button, vediamo di seguito come)
```

[![EditorHTML.png](http://192.168.178.102/images/thumb/0/01/EditorHTML.png/700px-EditorHTML.png)](http://192.168.178.102/index.php/File:EditorHTML.png)

```
- per collegare il processo nella nostra Information Gadget  basta andare in Window/ Tab e Toolbar Button e collegare il Processo “WYSIWYG Editor”
```

[![EditorHTML1.png](http://192.168.178.102/images/thumb/3/34/EditorHTML1.png/700px-EditorHTML1.png)](http://192.168.178.102/index.php/File:EditorHTML1.png)

Adesso possiamo generare il nostro file HTML