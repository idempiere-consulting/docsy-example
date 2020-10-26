# Plugin: DP GroupView

---

## Riferimenti

- link pubblico  :
- link idempeire italia  :
- link jar  :
- versione idempiere  : idempiere 4.1 - 5.1
- versione zk supportata : zk8

---

## Prerequisiti per l'installazione

---

## Descrizione Plugin

La funzionalità di questo plug-in è quello di raggruppare in più sezioni le infoWindow
 [![DPGroupView 1.png](http://192.168.178.102/images/thumb/c/c2/DPGroupView_1.png/1080px-DPGroupView_1.png)](http://192.168.178.102/index.php/File:DPGroupView_1.png)
 Il raggruppamento avviene a livello System, tramite ad un nuovo campo aggiunto alla maschera "Info Window"[![DPGroupView 2.png](http://192.168.178.102/images/thumb/9/91/DPGroupView_2.png/1080px-DPGroupView_2.png)](http://192.168.178.102/index.php/File:DPGroupView_2.png)

---

## Funzionalità supportate

---

## Installazione Plugin

Installare nella console felix il jar reperibile su [idempiere-download](https://bitbucket.org/consulnet/idempiere-download)

**Nome plug-in:** *it.idIta.impl.LIT_DPGroupView.jar*

---

## Parametrizzazione Plugin

Essendo un fragment plug-in, bisogna per prima cosa assicurarsi che  il fragment sia legato al web client di zk; quindi una volta installato,  sempre da console Felix, fare *refreshPackage* del plug-in **org.adempiere.ui.zk** . RICORDARE!!
 Essendo un fragment plug-in, bisogna anche fare il pack-in manuale, a livello System, del *2Pack_1.0.0_SYSTEM.zip* presente su idempiere-download.

1. Il 

   2Pack_1.0.0_SYSTEM.zip

    crea il nuovo campo sulla tabella AD_InfoWindow 

   - ***LIT_GroupDashboard***: nome colonna di tipo "List"

2. Il 2pack crea una Reference List per il campo su menzionato, dove  c'è l'elenco dei raggruppamenti per le infoWindow; in base alle  necessità si può aggiornarla/modificarla a livello System

A livello System **ricordarsi** di andare sulla maschera "Info  Window" e raggruppare le infoWindow interessate in base al campo  LIT_GroupDashboard (Group Dashboard)

---

## Istruzioni Plugin

Per avere dei casi prova, nella cartella idempiere-download ci sono  due 2Pack_Client che sono di esempio; basta fare un pack-in a livello  Client dei seguenti file

1. DPGroupView_2PackCLIENT__1.zip
2. DPGroupView_2PackCLIENT__2.zip

Questi pack-in aggiungo dati di esempio sulle maschere

- ***"Dashboard Content"*** [![DPGroupView 3.png](http://192.168.178.102/images/thumb/d/d0/DPGroupView_3.png/1080px-DPGroupView_3.png)](http://192.168.178.102/index.php/File:DPGroupView_3.png)



- ***"Dashboard Preference"***[![DPGroupView 4.png](http://192.168.178.102/images/thumb/a/a2/DPGroupView_4.png/1080px-DPGroupView_4.png)](http://192.168.178.102/index.php/File:DPGroupView_4.png)

---

## Documentazione Tecnica Plugin

---

## Modifiche all'AD

```
-----------
| nomeSup |
-----------------------------
| nome | tipo | descrizione | 
-----------------------------
```

### Tables / Windows esistenti

### Nuove Tables /Windows

---

## Funzionalità Future

---

## Errori e bug 

---