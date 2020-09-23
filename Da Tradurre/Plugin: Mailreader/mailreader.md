# Plugin: Mailreader

---

## link esterni

---

## Riferimenti

- link pubblico  : non applicabile
- link idempeire italia  : <https://bitbucket.org/consulnet/idempiere-ita-plugin>
- link jar  : /opt/repos/idempiere-italia-pugin/it.cnet.impl.mailReader/
- versione idempiere  : idempiere 3.1
- versione zk supportata : na

---

## Descrizione Plugin

---

## Funzionalità supportate

---

## Installazione Plugin

---

## Parametrizzazione Plugin

---

## Istruzioni Plugin

Le credenziali per accedere alla casella di posto sono cosi composti :

user = emailuser (esempio pinco@pallo.it )

password = emailuserpw

serverimap =
 [![Mailreader.png](http://192.168.178.102/images/8/83/Mailreader.png)](http://192.168.178.102/index.php/File:Mailreader.png)

## Documentazione Tecnica Plugin

LA TABELLA C_MAIL vienei sostituita dall AD_USERMAIL

È stata creata un classe java specifica per il processo di lettura mail: it.cnet.idempiere.mailReader.process.GetMail.java

## Modifiche all'AD

### Tables / Windows esistenti

```
 -----------
 | ad_user |
 ---------------------------------------------------
 | nome campo          | tipo  | Note              |
 ---------------------------------------------------
 | IsEmailReader       | Si/No |                   |
 ---------------------------------------------------
 | ServerIMAP          |       | DisplayLogic : yy |
 ---------------------------------------------------
 | IsEmailReaderPublic | Si/No | DisplayLogic : xx |
 ---------------------------------------------------
```



```
 ---------------
 | ad_UserMail |
 ---------------------------------------------------
 | nome campo          | tipo  | Note              |
 ---------------------------------------------------
 | Folder              |       |                   |
 ---------------------------------------------------
```

### Nuove Tables /Windows

---

## Funzionalità Future

### Cose da fare

Step 1 Il Processe deve essere eseguito a livello Visualizzazione in HTML

Step 2 Riuscire a leggere gli allegati

---

## Errori e bug 

---