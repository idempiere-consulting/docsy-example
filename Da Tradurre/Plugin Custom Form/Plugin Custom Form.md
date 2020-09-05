# Plugin Custom Form

---

## link esterni

---

## Riferimenti

---

- link pubblico  :
- link idempiere italia  :
- link jar  :
- versione idempiere  : idempiere 4.1
- versione zk supportata :

## Descrizione Plugin

---

Questo plug-in permette di avere una gestione di multi-finestre o di un unico frame all'interno di una special form

## Funzionalità supportate

---

## Installazione Plugin

---

Installare nella console felix il jar reperibile su [idempiere-download](https://bitbucket.org/consulnet/idempiere-download)

## Parametrizzazione Plugin

---

Per ogni tipo di gestione di più special form con determinate  varianti (es. split di 4 finestre /split di 2finiestre ...etc...) viene  creata un'apposita classe java di controllo, dove viene ad esempio  specificato in modo hardcoded la divisione di 'N' colonne del layout  della special form.
 Nel caso di questo plug-in, attualmente alla versione iniziale, sono state create 2 classi java specifiche:

1. ***it.idIta.idempiere.LIT_CustomForm.webui.form.WFCtrl_1***: classe di gestione controllo per UN SOLO frame all'interno della special form specifica
2. ***it.idIta.idempiere.LIT_CustomForm.webui.form.WFCtrl_4***: classe di gestione controllo per SOLO 4 elementi (window, frame, zul...etc...) all'interno della special form specifica

Nel 2pack(System) creato nel plug-in, ci sono i dati delle 2 form  create per default. Assicurarsi, a livello System, che esistano

[![CustomForm 1.png](http://192.168.178.102/images/e/e2/CustomForm_1.png)](http://192.168.178.102/index.php/File:CustomForm_1.png)


 Sempre nella cartella del repository, ci sono 2 file 2packClient, con dei dati di esempio, da installare in sequenza:

1. **1__2PackClient_DashboardContent.zip** ---> dato di esempio  per apertura di una window nel pannellino presente sulla special form  (visibile solo nella Form Split_4)
    [![CustomForm 2.png](http://192.168.178.102/images/thumb/4/4f/CustomForm_2.png/1400px-CustomForm_2.png)](http://192.168.178.102/index.php/File:CustomForm_2.png)
    IMPORTANTE: ogni dashboard content specificato, non deve avere il segno di spunta su **"Show in Dashboard"** e **"Show on Login"**  ....questo è l'unico modo per farlo visualizzare correttamente nella  special form e NON REPLICARE L'OGGETTO sulla dashBoard o nel pannello a  sinistra dei preferiti
    

Fondamentale impostare un'altezza di Default della window (altrimenti  la window non verrà visualizzata correttamente nella Form Split_4)

[![FormCustom1.png](http://192.168.178.102/images/e/e4/FormCustom1.png)](http://192.168.178.102/index.php/File:FormCustom1.png)

1. **2__2PackClient_FormCustom_example.zip** ---> dati di esempio per la gestione per una o delle multi-finestre sulla special form
    [![CustomForm 3.png](http://192.168.178.102/images/9/9c/CustomForm_3.png)](http://192.168.178.102/index.php/File:CustomForm_3.png)
    In questa window, viene specificata a livello di testata quale form si  vuole prendere in considerazione (in questo caso quella per la  multi-finestre a 4...) e a livello di righe, vengono specificati cosa  far visualizzare: la maggioranza sono dei collegamenti a siti web,  mentre uno fa riferimento ad una dashboardContent; nel caso specifico,  il codice java dà PRIORITÀ al campo **"Dashboard Content"** se valorizzato, altrimenti prende i dati del campo **"URL"**

## Istruzioni Plugin

---

## Documentazione Tecnica Plugin

---

### Modifiche all'AD

#### Tables / Windows esistenti

#### Nuove Tables /Windows

LIT_AD_IForm

## Funzionalità Future

---

## Errori e bug

----