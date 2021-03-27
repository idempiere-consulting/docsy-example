---
title: "Script Editor Tool"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10000
pre: "<b></b>"
---


# Script Editor Tool

### Da ADempiere ERP Wiki

⇐ Indice dei contenuti | Funzionalità | **Script Editor Tool** | Informazioni sulla spedizione ⇒

Il **Script Editor Tool** fornisce un modo per testare semplici script mentre l'applicazione è in esecuzione.

## Contenuto

```
1 Accesso
2 Restrizioni
3 Descrizione
3.1 Variabili di contesto
3.2 Variabili di evento
4 Vedi anche
5 Per gli sviluppatori
```
## Accesso

```
Icona:
Menu: Strumenti→Script
Taglio corto: nessuno
```
## Restrizioni

Per accedere allo Script Editor Tool, è necessario aver effettuato il login come amministratore.

Il tool è molto semplice in funzione.

Sono supportati solo gli script Beanshell & Groovy.

## Descrizione

Una volta effettuato il login come utente con diritti di amministratore, è possibile accedere allo Script Editor Tool attraverso il menu come descritto
sopra o anche da un menu a comparsa (clic destro del mouse) quando ci si trova in un campo Memo o in un campo di testo di una colonna denominata
"Script". Vedere la **_Finestra_Rule_**.

Lo Script Editor Tool si apre con una schermata simile a quella sottostante.


Nella parte inferiore dello schermo ci sono i pulsanti per convalidare ( ), eseguire ( ), annullare o confermare e una casella di testo che mostra la
valore della variabile "risultato" convertito in una stringa. Se lo script è stato aperto da un campo Memo, cliccando il pulsante di conferma
salverà le modifiche nel campo, altrimenti tutte le modifiche andranno perse.

```
Nota:
```
```
Bisogna ripeterlo. Se si apre lo script dal menu, le modifiche apportate saranno PERSE quando
si conferma o si esce dallo strumento. Non è prevista la possibilità di salvare gli script in un file. Per salvare lo script si ha
di utilizzare il tool da un campo Memo con il nome Script . Altrimenti, ricordarsi di copiare lo script
testo negli appunti prima di chiudere l'editor e incollare gli appunti in un luogo sicuro.
```
Nello sviluppo dello script si può accedere direttamente alle variabili di contesto sottostanti. È inoltre possibile utilizzare la classe Env per accedere alla classe
contesto del sistema. Per esempio:

```
importare org.compiere.util.Env;
risultato = Env.getContextAsInt(Env.getCtx(), "#AD_User_ID");
```
è lo stesso di

```
risultato = G_AD_User_ID;
```
Da un callout, è possibile utilizzare le variabili di contesto passate per accedere ad altri elementi del contesto nel modo seguente.

```
importare org.compiere.util.Env;
result = Env.getContext(A_Ctx, A_WindowNo, "WindowName");
```
### Variabili di contesto

Le variabili di contesto della finestra iniziano con un prefisso W_. (Si noti che queste da fare sembrano funzionare durante la modifica dello script).

Le variabili di contesto di login iniziano con il prefisso G_.


### Variabili evento

```
Nota:
```
```
Le variabili dell'evento sono disponibili per lo script solo durante il processo dell'evento. Non sarà possibile testarle
con l'editore.
```
Callout:

```
A_FinestraNo
A_Tab
A_Campo
A_Valore
A_VecchioValore
A_Ctx
```
Processo:

```
I parametri di processo per il processo iniziano con il prefisso P_, ad esempio P_Name. Se il parametro è un intervallo, allora il parametro
i parametri saranno P_Name1 e P_Name
A_Ctx il contesto
A_Trx la transazione
A_TrxName
A_Registrazione_ID
A_AD_Client_ID
A_AD_User_ID
A_AD_PInstanza_ID
A_Tabella_ID
```
Validatore di accesso:

```
A_Ctx
A_AD_Client_ID
A_AD_Org_ID
A_AD_Ruolo_ID
A_AD_User_ID
```
Validatore di modelli di tabelle e documenti:

```
A_Ctx
A_PO
A_Type
A_Evento
```
## Vedi anche

```
Callout
Script_Callout
Processo di script
Script ModelValidatorLogin
Script ModelValidator
Java Scripting (http://scripting.dev.java.net/)
```
## Per gli sviluppatori

Il software che visualizza questa finestra si trova in:

```
cliente/src
org.compiere.apps.BeanShellEditor.java
org.compiere.apps.GroovyEditor.java
org.compiere.apps.ScriptEditor.java
org.compiere.grid.ed.VMemo.java
```

Recuperato da "http://www.adempiere.com/Script_Editor_Tool".
Categorie: Funzionalità | Documentazione per l'utente | Indice | Documentazione

```
Questa pagina è stata modificata l'ultima volta il 22 dicembre 2010, alle 05:47.
Il contenuto è disponibile sotto la GNU Free Documentation License 1.2.
```





