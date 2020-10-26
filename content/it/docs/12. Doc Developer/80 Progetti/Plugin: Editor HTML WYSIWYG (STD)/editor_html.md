# Plugin Editor HTML WYSIWYG (STD)

---

<http://wiki.idempiere.org/en/JPiere_WYSIWYG_Editor>

---

## Descrizione

```
- Editor WYSIWYG può modificare contenuti Web.
- È possibile utilizzare CKEditor in tutti i campi testo.
- È possibile selezionare un percorso che caricare e visualizzare un file immagine.
- È possibile modificare i contenuti Web multilingua
```

[![EditorHTML2.png](http://192.168.178.102/images/thumb/e/ee/EditorHTML2.png/499px-EditorHTML2.png)](http://192.168.178.102/index.php/File:EditorHTML2.png)

---

## Installazione

```
1) Installare il plugin .jar dalla console di Felix
2) Colleghiamo il processo “WYSIWYG Editor” alla Tab di nostro interesse. Per fare questo basta andare in Window/Tab &Filed. (Ad esempio vogliamo collegare il processo nella “Information Gadget”, 
   andiamo nella Tab Information Gadget e premiamo nella “Toolbar Button” in basso a destra.
```

[![EditorHTML3.png](http://192.168.178.102/images/thumb/8/80/EditorHTML3.png/700px-EditorHTML3.png)](http://192.168.178.102/index.php/File:EditorHTML3.png)

Fatto ciò andremo a collegare il processo “WYSIWYG Editor”.

**ATTENZIONE**!! Il campo “Component Name” è molto importante. Esso ci permette di specificare il nome del campo presente nella Window dentro il quale verrà generato il codice html. Nel nostro esempio inseriremo il nome “HTML” (campo testuale presente nella Maschera Information Gadget)

[![EditorHTML4.png](http://192.168.178.102/images/thumb/e/e1/EditorHTML4.png/700px-EditorHTML4.png)](http://192.168.178.102/index.php/File:EditorHTML4.png)

Bene, adesso il nostro processo è collegato e potremo iniziare ad utilizzare il nostro editor HTML. Premendo nel Processo in alto a dx entreremo nel nostro “Generatore di codice HTML”. Dopo aver salvato, visualizzeremo il codice generato nel campo HTML (vedi immagine seguente)

[![EditorHTML5.png](http://192.168.178.102/images/thumb/3/35/EditorHTML5.png/700px-EditorHTML5.png)](http://192.168.178.102/index.php/File:EditorHTML5.png)

---

## Selezionare un percorso di file immagine

È possibile selezionare un percorso che caricare e visualizza un file immagine.

[![EditorHTML6.png](http://192.168.178.102/images/thumb/1/1d/EditorHTML6.png/574px-EditorHTML6.png)](http://192.168.178.102/index.php/File:EditorHTML6.png)

Andare nel “System Configurator” e andare nel “PIERE_CKEDITOR_IMAGE_PATH” . In Configurure Value specificare il percorso delle immagini. Possiamo specificare più percorsi, basta inserire un “;” tra un percorso e l’altro. (Se ad esempio vogliamo visualizzare il percorso “images/prova”, questo significa che le foto saranno situate all'interno di /opt/repos/idempiere-ita/org.adempiere.ui.zk/images/prova)

---

## Multilingua

Con questo editor è possibile visualizzare i contenuti web corrispondenti al login lingua.