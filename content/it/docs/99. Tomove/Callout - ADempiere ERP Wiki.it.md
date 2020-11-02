---
title: "Sicurezza"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10001
pre: "<b></b>"
---


# Callout

### Da ADempiere ERP Wiki

⇐ Sommario | ** Callout ** | Codice callout ⇒

## Contents

```
1 Cos'è un callout?
2 Come creare un callout
2.1 Passaggi per creare un callout
2.2 Cosa è disponibile all'interno di Callout
2.3 Come ottenere il valore esistente
2.4 Come modificare il valore
2.5 Vedi anche
2.6 Callout in spagnolo
3 Vedi anche
```
## Cos'è un callout?

Callout è un meccanismo di codifica per modificare il file
contenuto di un campo di visualizzazione in una finestra. Questo
il campo di visualizzazione deve essere allegato a una colonna in
Tabella AD. Puoi scrivere la tua logica in Java
Classi (in questo caso è necessario riavviare il server) oppure si utilizza un richiamo script JSR223.

Nella finestra Tabella e colonna, nella scheda Colonna, troverai il campo Callout che chiamerà il file
Callout class ogni volta che il campo viene sottoposto ad attività di input. Callout può modificare i valori di altri campi
nella stessa finestra nell'ambito o in uso in quel momento.

Un Callout è un metodo java che viene eseguito quando il campo in una scheda della finestra di ADempiere viene attivato
e sull'attività di cambiamento. Una classe Callout (che estende CalloutEngine) raggrupperà tali metodi in un unico
file, di solito sotto un nome di documento, ad esempio CalloutOrder.java. Un Callout è definito in Tabella e colonna
finestra, sotto una scheda di colonna, dove è possibile specificare un elenco di metodi completi (separati da ";").

# Come creare un callout

## Passaggi per creare un callout

Per scrivere un callout devi fare le seguenti cose:

1. Scrivi la funzione callout


```
package org.adempiere.callout;
import java.util.Properties;
import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.util.AdempiereSystemError;
import org.compiere.util.Env;
public class SimpleCallout extends CalloutEngine {
public String test(Properties ctx, int windowNo, GridTab mTab, GridField mField,
Object value) throws AdempiereSystemError {
// First get value
Price = ((BigDecimal)mTab.getValue("Price"));
// esegui alcuni calcoli
BigDecimal Total = Qty.multiply(Price);
// Reimposta il valore nel campo della colonna
mTab.setValue("Total", Total);
return "this is a return string";
}
}
```
Il nome completo del metodo è org.adempiere.callout.SimpleCallout.test ti servirà in
il prossimo passo.

2. Accedi come amministratore di sistema e apri la finestra "Tabella e colonna". Vai alla tabella e
colonna a cui si desidera aggiungere il callout digitando il nome completo del metodo qualificato nel campo "Callout"
campo. (Puoi aggiungere più di un callout se li separi con ";")
3. Crea un file jar con le tue classi di callout e rinominalo in customization.jar. Copia questo
customization.jar nella cartella Adempiere / lib dell'installazione di ADempiere e riesegui il file
RUN_setup.bat / sh. Riavvia il server ADempiere e installa il nuovo client (o riavvia il client con
Java WebStart).
4. Testare il callout navigando nel campo in cui è stato aggiunto il callout e modificarne il valore.

## Cosa è disponibile all'interno di Callout

Puoi avere funzioni di callout con 5 parametri (come nell'esempio sopra) o 6 parametri. L'ultimo
parametro è il vecchio valore.

```
public String callout (Properties ctx, String method, int WindowNo,
GridTab mTab, GridField mField, Object value, Object oldValue);
```
WindowNo informerà il sistema a quale finestra si fa riferimento. Questo lo possiamo capire come quando il file
il callout accade, eravamo in una finestra. Quindi, quando il callout termina il suo lavoro, l'aggiornamento dei risultati lo farà
appaiono nella stessa finestra. MTab riguarda la scheda (che è collegata a un contesto di tabella e campo) che si trova in
messa a fuoco. Puoi passare il puntatore del mouse su qualsiasi parola e vedere i punti salienti. Se premi il tasto Ctrl
mentre ci passi sopra con il mouse e fai clic, potresti davvero accedere alla classe che gestisce gli oggetti.


## Come ottenere il valore esistente

Ciò è facilmente ottenibile come mostrato nell'esempio:

```
Qty = (BigDecimal)mTab.getValue("Qty");
Price = ((BigDecimal)mTab.getValue("Price"));
BigDecimal Total = Qty.multiply(Price);
```
Il pattern getValue sostanzialmente ottiene il valore dal campo Window nell'ambito.

## Come modificare il valore

SetValue inserirà quindi un nuovo valore nel campo Window. Il campo Totale cambia quando inserisci un file
nuovo valore in Qtà o Prezzo.
```
mTab.setValue("Total", Total);
```
## Vedi anche

```
Script_Callout
The old famous Callout.pdf (http://compiere.red1.org/Callout.zip) .
```
## Callout in spagnolo

Crea un semplice callout:

Di Victor Cappugi. Venezuela

1 °. Cos'è un callout. Un callout in adempiere non è altro che un modo per modificare i valori del file
campi nelle finestre mediante calcoli diretti o assegnazioni, ad esempio eseguendo la somma di
due campi. Si consiglia di non utilizzare Callout come metodi di convalida dei dati, poiché questo è
fa per il dizionario. Consiste in un metodo che viene eseguito in adempiere quando un campo di a
la finestra viene modificata

Come generare un callout.

1 deve essere scritto in Java con il tuo IDE preferito, la struttura Callout. Le parti di base saranno.

```
package org.adempiere.callout; // un pacchetto che può essere creato o includere il callout in org.compiere.model
import java.util.Properties;
import org.compiere.model.CalloutEngine; // nota che appartengono al pacchetto che può essere creato o che includono il callout in
import org.compiere.model.GridField; // org.compiere.model, si crea el callout en este
import org.compiere.model.GridTab; // pacchetto, queste importazioni non sono necessarie.
import org.compiere.util.AdempiereSystemError;
```

```
numero di callout (segnali)
public void metodo1 (Proprietà ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
{-------
------}
```
Funzionalità:

```
Utilizzare getValue () e setValue () per ottenere e impostare i valori dei campi
Esegui query SQL con la seguente struttura:
```
```
String sql= "Select pa.amount from "
+"c_paymentallocate pa where"
+"C_Invoice_ID=?"; // Il segno? verrà sostituito in seguito con una variabile
PreparedStatement pstmt = null; // Variabile di configurazione del recordset
ResultSet rs = null; // Registratore in cui verrà salvato il risultato
try // Tutto all'interno di un tentativo per rilevare possibili errori
{
pstmt = DB.prepareStatement(sql, null); // prepara l'esecuzione della query
pstmt.setInt(1, S_ResourceAssignment_ID);// Sostituisci il? dalla variabile. occhio se ce n'è più di uno è
// sequenziale, questo è il secondo? è 2 e così via
rs = pstmt.executeQuery(); // Esegue la query e la inserisce in rs
if (rs.next()) //next o registro
{
M_Product_ID = rs.getInt (1); // memorizza il primo campo in una variabile. È sequenziale
}
}
catch (SQLException e)
{
log.log(Level.SEVERE, "Tax", e); // invia l'errore al registro
}
```
```
Un altro modo per generare query SQL da Jose Prince. Venezuela: g l'errore
```
```
BigDecimal idResource = (BigDecimal) mTab.getValue(I_ProductPlanning.COLUMNNAME_ResourceForm_ID); // Qui viene estratto l'ID di una finestra
String sql = "SELECT porcEficiencia FROM ResourceForm WHERE ResourceForm_ID=?"; // La condizione nell'istruzione è l'ID precedentemente estratto
BigDecimal porcEficiencia = DB.getSQLValueBDEx(null, sql,idResource); // Questa riga esegue la query e le viene passata la variabile con l'ID
```
Installazione callout

1. Genera il file jar con il tuo pacchetto o classe (ricorda le dipendenze, fai le importazioni
corretto) </li>
2. il file .jar deve avere un nome: customization.jar </li>
3. posizionare il file customization.jar nella cartella lib di ALSO_HOME (server) </li>
4. Eseguire RUN_setup o RUN_Silentsetup </li>
5. Aprire il sistema come amministratore di sistema </li>
6. Vai a Tabella e colonna e trova la tabella e il campo in cui desideri inserire il callout (per
vai facilmente su Finestra, Scheda e Campo, trova la finestra, seleziona la scheda e il campo e con il
Fare clic con il tasto destro per ingrandire la tabella, questo ti permetterà di assicurarti che sia la finestra corretta) </li>
7. nel campo selezionato andare alla casella Callout e posizionare il percorso logico, ovvero
org.adempiere.callout.Calloutprb.test ad esempio se è stato creato un pacchetto chiamato adempiere.callout e
al suo interno ha una classe chiamata Calloutprb e un metodo chiamato test. </li>
8. Memorizza ed esegui il sistema come Utente, apri la finestra e prova a modificare il campo </li>, la variabile con l'ID

# Vedi anche


Callout Code che descrive in dettaglio ogni funzione e posizione di Callout

Estratto da "http://www.adempiere.com/Callout"
Categorie: Documentazione per sviluppatori | Caratteristiche | Frammenti di codice | Documentazione | Applicazione
Dizionario | Sommario

```
Questa pagina è stata modificata l'ultima volta il 17 gennaio 2011 alle 16:20.
Il contenuto è disponibile sotto GNU Free Documentation License 1.2.
```




