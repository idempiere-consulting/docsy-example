---
title: "HowTo _ Promotions Setp V2"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10001
pre: "<b></b>"
--- 

# Impostazione delle promozioni


#### SCHEDA RIEPILOGATIVA DOCUMENTO

`` `
Tipo di documento: come fare
Titolo del documento: impostazione delle promozioni
Riepilogo del documento: questa è la guida HowTo di Adaxa per l'impostazione delle promozioni.
Nome file: HowTo _ Promotions Setp V2.odt
Creato il: mercoledì 16 maggio 2012
Creato da: office office
Ultima modifica: martedì 10 luglio 2012
Ultima modifica di: ufficio ufficio
`` `
**APPUNTI**

1. Si declina ogni responsabilità per eventuali perdite o danni (inclusi ma non limitati a danni derivanti da
    l'uso da parte del cliente del documento) subito da qualsiasi altra persona per qualsiasi motivo incluso ma
    non limitato alla negligenza da parte di ADAXA Pty Ltd (ADAXA).
2. Sebbene questo documento sia accurato al meglio delle nostre conoscenze e convinzioni, ADAXA non può garantire il
    completezza o accuratezza di qualsiasi descrizione o conclusione basata sulle informazioni fornite.
3. Le raccomandazioni contenute nel documento sono consultive e ADAXA non ha alcuna responsabilità per il
    gestione o funzionamento di eventuali raccomandazioni che possono essere implementate dal cliente.
4. Questo documento è concesso in licenza secondo i termini mostrati su [http://creativecommons.org/licenses/by-nc-”(http://creativecommons.org/licenses/by-nc-)
    nd / 3.0 / au / legalcode.


## Sommario

** 1. Introduzione alle promozioni **




** 1 Introduzione alle promozioni **

Il sistema Adempiere include funzionalità estese per gestire le promozioni di marketing.

I requisiti funzionali della capacità di promozione erano in gran parte derivati ​​da una pubblicazione IBM che
è accessibile a questo link.

[http://publib.boulder.ibm.com/infocenter/wchelp/v5r6m1/index.jsp?”(http://publib.boulder.ibm.com/infocenter/wchelp/v5r6m1/index.jsp?)
topic = / com.ibm.commerce.customizetools.doc / refs / rprcondmdl.htm

Lo scopo di questa guida HowTo è fornire "esempi concreti" di molti dei tipi di promozioni che possono essere definiti nel sistema.

La funzionalità Promozioni è molto potente e configurabile ed è, inevitabilmente, piuttosto complessa. Adaxar raccomanda che le nuove promozioni siano ben testate prima di essere rese accessibili in un sistema live.


** 2 gruppi di promozione **

## 2.1 La finestra del gruppo di promozione

`` `
Un gruppo di promozione è un gruppo di prodotti che verranno inclusi in qualche forma di valutazione per decidere se a
la promozione si applica a un acquisto. La valutazione potrebbe essere qualcosa del tipo "se l'ordine include prodotti da
questo elenco di prodotti con un valore dell'ordine> $ 100 offre uno sconto del 10% ".
`` `
### 2.1.1 Dati del gruppo di promozione ......................................... .................................................. ......

`` `
Il gruppo promozionale X avrà un elenco di prodotti con i valori A, B e C.
Il gruppo promozionale Y avrà un elenco di prodotti con i valori D, E e F.
`` `
### 2.1.2 Gruppo di promozione .......................................... .................................................. ..............

`` `
Seleziona la finestra "Gruppo promozione" dal menu principale.
`` `
`` `
Illustrazione 1: Finestra Gruppo promozione> scheda Gruppo promozione
`` `
### 2.1.3 Scheda Gruppo promozione ......................................... .................................................. .......

** 1. ** Inserisci il gruppo promozionale ** Nome ** e ** Descrizione **. Spuntare la casella di controllo ** Attivo ** per indicare il file
il gruppo promozionale è attivo. In questo caso il gruppo promozionale X e l'altro è per il gruppo promozionale Y. il gruppo promozionale conterrà 2 record; uno è per

`` `
Illustrazione 2: Finestra gruppo promozione> scheda Riga gruppo
`` `

`` `
Illustrazione 3: Finestra gruppo promozione> scheda Riga gruppo
`` `
### 2.1.4 Scheda Riga di gruppo ......................................... .................................................. .................

** 1. ** selezionati per il gruppo promozionale X sono "A, B, C" e il gruppo promozionale Y sono "D, E ed F". Seleziona un articolo promozionale dal menu a discesa ** Prodotto **. In questo caso gli articoli promozionali saranno

## 2.2 Scenari promozionali ............................................. .................................................. .........

Ci possono essere molti diversi tipi di scenari di promozione. Le sezioni seguenti esplorano alcuni dei
opzioni di promozione disponibili e mostra come sono impostate. Gli scenari mostrati sono solo esempi di differenti
tipi di promozioni e valori possono essere modificati secondo necessità


** 3 Promozione A **

## 3.1 Acquista <4 articoli del gruppo X, ottieni il 10% di sconto, acquista 4-6, ottieni il 20% di sconto, acquista> 6 e ottieni il 50% di sconto su tutti. 3. Promozione A

## acquista> 6 e ottieni il 50% di sconto su tutto.

Seleziona la finestra "Promozione" dal menu principale.

`` `
Illustrazione 4: Promozione A Finestra della promozione> scheda Promozione
`` `
** 2. ** Scheda Promozione
** 1. ** "Promozione 1" come nome della promozione **.
2. ** EnterEnter "Acquista 1-3 10%; 4-6 20%; 7 o più 50% "come la promozione ** Descrizione **.
** 3. ** Inserisci "1" come sequenza o ** Priorità relativa. **

`` `
Illustrazione 5: Promozione A: Finestra Promozione> scheda Condizione preliminare
`` `
### 3.1.1 Scheda Condizione preliminare ......................................... .................................................. .............

** 1. ** Spuntare la casella di controllo Attivo per indicare che la condizione preliminare è attiva.
** 2. ** Immettere "0" come sequenza.
** 3. ** Seleziona il Business Partner a cui è applicabile la promozione. (Campo facoltativo)
** 4. ** il gruppo di business partner da selezionare è "clienti standard". Selezionare il gruppo di business partner appropriato a cui è applicabile la promozione. In questo caso
** 5. ** Seleziona Listino prezzi come "Standard".
** 6. ** Seleziona Warehouse come "HQ Warehouse"
** 7. ** Inserisci il codice promozionale. (Campo facoltativo) Se viene inserito un codice promozionale per la promozione, allora
al momento dei saldi, l'utente dovrà inserire lo stesso codice promozionale che potrebbe avere prima di completare l'ordine di vendita.
** 8. ** campo solo / non modificabile. Il contatore di utilizzo determina il numero di volte in cui è stata applicata una promozione. È letto-
** 9. ** Immettere "0" come limite di utilizzo o limite di numero di volte. Se è stato inserito maggiore di zero nel file
Nel campo Limite di utilizzo, il sistema limiterà il numero di volte in cui una promozione può essere applicata a un ordine, a un cliente o in generale.
** 10. ** Immettere "05/01/2009 00:00" come data di inizio.


** 11. ** Immettere "12/31/2009 00:00" come data di fine o data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

`` `
Illustrazione 6: Finestra promozione A promozione> scheda Riga promozione
`` `
### 3.1.2 Scheda Riga promozione ......................................... .................................................. .........

** 1. ** Seleziona ** Gruppo promozione ** come "Gruppo promozionale X" inserito durante il gruppo promozione
impostare.
** 2. ** Inserisci "0" come ** Ammortamento minimo dell'ordine.
3. ** Spunta la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno
una riga ordine che corrisponde alla definizione della riga di promozione, ad es. gruppo promozionale X.

`` `
Illustrazione 7: Promozione A: Finestra Promozione> Scheda Distribuzione quantità
`` `
### 3.1.3 Tab Distribuzione quantità ......................................... ..................................................

Abbiamo 3 distribuzioni in base alla Promozione 1, ovvero 1 <= X <= 3, 4 <= X <= 6 e X> = 7. Quando si immettono le distribuzioni, è necessario iniziare con la distribuzione ** quantità ** più grande. In questo esempio, inserisci "7" come X> = 7, inserisci (^)
"4" come 4 <= X <= 6 e quindi immettere "1" come 1 <= X <= 3. Le distribuzioni i) sono i) "> =" e ii) "Max". ** Operazione ** e ii) ** Tipo di distribuzione ** per questi



- 2.1 La finestra del gruppo di promozione ............................................ ............................................. 2. Gruppi di promozione
   - 2.1.1 Dati del gruppo di promozione ........................................... .................................................. ....
   - 2.1.2 Gruppo di promozione ............................................ .................................................. ............
   - 2.1.3 Scheda Gruppo promozione ........................................... .................................................. .....
   - 2.1.4 Scheda Group Line ........................................... .................................................. ...............
- 2.2 Scenari di promozione .............................................. .................................................. ........
- 3.1 Acquista <4 articoli del gruppo X, ottieni il 10% di sconto, acquista 4-6, ottieni il 20% di sconto, acquista> 6 e ottieni il 50% di sconto su tutti. 3. Promozione A
   - 3.1.1 Scheda Condizione preliminare ........................................... .................................................. ...........
   - 3.1.2 Scheda Riga promozione ........................................... .................................................. .......
   - 3.1.3 Tab Distribuzione quantità ........................................... ................................................
   - 3.1.4 Scheda Ricompensa ............................................ .................................................. .................
- 4.1 Acquista 3 e ricevi 1 Gratuito................................................. .................................................. .. 4. Promozione B
   - 4.1.1 Scheda Promozione ............................................ .................................................. .............
   - 4.1.2 Scheda PreCondizioni ........................................... .................................................. .........
   - 4.1.3 Scheda Riga promozione ........................................... .................................................. .......
   - 4.1.4 Tab Distribuzione quantità ........................................... ................................................
   - 4.1.5 Scheda Ricompensa ............................................ .................................................. .................
- 5.1 Acquista 1X e 2Y per $ 129 .......................................... .................................................. ..... 5. Promozione C
   - 5.1.1 Scheda Promozione ............................................ .................................................. .............
   - 5.1.2 Scheda Condizione preliminare ........................................... .................................................. .........
   - 5.1.3 Scheda Riga promozione ........................................... .................................................. .......
   - 5.1.4 Tab Distribuzione quantità ........................................... ................................................
   - 5.1.5 Scheda Ricompensa ............................................ .................................................. .................
- 6.1 Spendi> $ 1000 Ottieni il 5% di sconto e 1X gratuitamente ..................................... ........................ 6. Promozione D
   - 6.1.1 Scheda Promozione ............................................ .................................................. .............
   - 6.1.2 Scheda Condizione preliminare ........................................... .................................................. .........
   - 6.1.3 Scheda Riga promozione ........................................... .................................................. .......
   - 6.1.4 Tab Distribuzione quantità ........................................... ................................................
   - 6.1.5 Scheda Ricompensa ............................................ .................................................. .................
- 7.1 Acquista 2X e 1Y, ricevi il 10% di X e Y gratuitamente .................................. ..................................... 7. Promozione E
   - 7.1.1 Scheda Promozione ............................................ .................................................. .............
   - 7.1.2 Scheda Condizione preliminare ........................................... .................................................. .........
   - 7.1.3 Scheda Riga promozione ........................................... .................................................. .......
   - 7.1.4 Tab Distribuzione quantità ........................................... ................................................
   - 7.1.5 Scheda Ricompensa ............................................ .................................................. .................
- 8.1 Acquista 3X per $ 20 ................................................. .................................................. ............ 8. Promozione F
   - 8.1.1 Scheda Promozione ............................................ .................................................. .............
   - 8.1.2 Scheda Condizione preliminare ........................................... .................................................. .........
   - 8.1.3 Scheda Riga promozione ........................................... .................................................. .......
   - 8.1.4 Tab Distribuzione quantità ........................................... ................................................
   - 8.1.5 Scheda Ricompensa ............................................ .................................................. .................
- 9.1 Acquista 1X e fino a 4Y al 50% ciascuno ...................................... .............................................. 9. Promozione G
   - 9.1.1 Scheda Promozione ............................................ .................................................. .............
   - 9.1.2 Scheda Condizione preliminare ........................................... .................................................. .........
   - 9.1.3 Scheda Riga promozione ........................................... .................................................. .......
   - 9.1.4 Tab Distribuzione quantità ........................................... ................................................
   - 9.1.5 Scheda Ricompensa ............................................ .................................................. .................
- 10.1 Acquista 1X e ricevi 1Y gratis .......................................... .................................................. ....... 10.Promozione H
   - 10.1.1 Scheda Promozione ............................................ .................................................. .............
   - 10.1.2 PresuppostiScheda ................................................. .................................................. ...
   - 10.1.3 Scheda Riga promozione ........................................... .................................................. .......
   - 10.1.4 Tab Distribuzione quantità ........................................... ................................................
   - 10.1.5 Scheda Ricompensa ............................................ .................................................. .................
- 11.1 Ottieni il 10% di sconto sulle prime 3 volte, il 20% sulle successive 3, il 30% di eventuali extra .............................. ..................... 11.Promozione I
   - 11.1.1 Scheda Promozione ............................................ .................................................. .............
   - 11.1.2 Scheda Condizione preliminare ........................................... .................................................. .........
   - 11.1.3 Scheda Riga promozione ........................................... .................................................. .......
   - 11.1.4 Tab Distribuzione quantità ........................................... ................................................
   - 11.1.5 Scheda Ricompensa ............................................ .................................................. .................
- 12.1 Spendi> $ 1000, ottieni il 15% di sconto su un massimo di 15 articoli di costo più basso ........................ 12.Promozione J
   - 12.1.1 Scheda Promozione ............................................ .................................................. .............
   - 12.1.2 Scheda Condizione preliminare ........................................... .................................................. .........
   - 12.1.3 Scheda Riga promozione ........................................... .................................................. .......
   - 12.1.4 Tab Distribuzione quantità ........................................... ................................................
   - 12.1.5 Scheda Ricompensa ............................................ .................................................. .................
- 13.1 Australia ............................................... .................................................. ....................... 13. Uffici e Contatti Adaxa
- 13.2 Nuova Zelanda .............................................. .................................................. ..................
- 13.3 Stati Uniti d'America ............................................ .................................................. .
- Illustrazione 8: Promozione A: Finestra Promozione> Scheda Ricompensa - Ricompensa
- Illustrazione 9: Promozione A: Finestra Promozione> Scheda Ricompensa - Ricompensa


`` `
Illustrazione 10: Promozione A: Finestra Promozione> Scheda Ricompensa - Ricompensa 3
`` `
### 3.1.4 Scheda Ricompensa .......................................... .................................................. ...................

Questa percentuale di sconto sull'impostazione del premio sugli articoli nella distribuzione che è stata inserita in precedenza. Quindi Ricompensa 1 (Vedi specifica quale distribuzione riceverà una ricompensa. In questo esempio, dobbiamo applicare una certa Figura (^)
7a) sconto sulla distribuzione 2 (che contiene 4-6 X) e ricompensa 3 (vedere dà il 50% sugli articoli nella distribuzione1 (che contiene 7 o più X), ricompensa 2 (vedere figura 7c) offre uno sconto del 10% sulla figura 7b) dà il 20% (^)
Distribuzione 3 (che contiene 1-3 X). Di seguito sono riportati i passaggi per impostare i premi come menzionato sopra.
Spunta la casella di controllo Attivo per indicare che la ricompensa è attiva.

** 1. ** Immettere il numero di sequenza per identificare la ricompensa.
** 2. ** Deseleziona la casella di controllo Per tutte le distribuzioni per indicare che questo premio non si applica a tutte le distribuzioni.
** 3. ** Seleziona la distribuzione promozionale appropriata a cui è collegata questa ricompensa.
** 4. ** Spunta la casella di controllo Stessa distribuzione per origine e destinazione per utilizzare la distribuzione di promozione selezionata per
    questa ricompensa.
** 5. ** Seleziona Tipo di premio come "Percentuale".
** 6. ** Inserisci l'importo da associare a un tipo di ricompensa.


** 7. ** Seleziona Addebita come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con addebito per indicare l'account in cui registrare.


** 4 Promozione B **

## 4.1 Acquista 3 e ricevi 1 gratis

`` `
Illustrazione 11: Promozione B: Finestra Promozione> scheda Promozione
`` `
### 4.1.1 Scheda Promozione .......................................... .................................................. ...............

** 1. ** Inserisci "Promozione 2" come nome della promozione **.
2. ** Inserisci "Acquista 3 volte e ricevi 1 gratis" come promozione ** Descrizione **.
** 3. ** Inserisci "2" come sequenza o ** Priorità relativa. **


`` `
Illustrazione 12: Promozione B: Finestra Promozione> scheda Condizione preliminare
`` `
### 4.1.2 Scheda Condizione preliminare ......................................... .................................................. ...........

** 1. ** Spunta la casella ** Attivo ** per indicare che la condizione preliminare è attiva.
** 2. ** Immettere "0" come ** sequenza **.
** 1. ** Seleziona il ** Business Partner ** a cui è applicabile la promozione. (Campo facoltativo)
** 2. ** il gruppo di business partner da selezionare è "clienti standard". Selezionare il ** gruppo di business partner ** appropriato a cui è applicabile la promozione. In questo caso
** 3. ** Seleziona ** Listino prezzi ** come "Standard".
** 4. ** Seleziona ** Magazzino ** come "Magazzino HQ"

** 5. ** quindi al momento dei saldi, l'utente dovrà inserire lo stesso codice promozionaleInserire il ** Codice promozionale **. (Campo facoltativo) Se viene inserito un codice promozionale per la promozione, che potrebbe avere prima (^)
completare l'ordine di vendita.

** 6. ** campo solo / non modificabile. ** Contatore utilizzo ** determina il numero di volte in cui è stata applicata una promozione. È letto-


** 7. ** Campo Limite di utilizzo, il sistema limiterà il numero di volte in cui una promozione può essere applicata a un ordine, a Immettere "0" come ** Limite di utilizzo ** o Numero di volte limite. Se è stato inserito maggiore di zero nel campo (^)
cliente o in generale.

** 8. ** Immettere "01/01/2009 00:00" come ** Data di inizio **.
** 9. ** Immettere "12/31/2010 00:00" come ** Data di fine ** o Data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

`` `
Illustrazione 13: Promozione B: Finestra Promozione> scheda Riga promozione
`` `
### 4.1.3 Scheda Riga promozione ......................................... .................................................. .........

** 1. ** configurazione. Seleziona ** Gruppo promozione ** come "Gruppo promozionale X" inserito durante il gruppo promozione
** 2. ** Inserisci "0" come ** Ammortamento minimo dell'ordine.
3. ** Spunta la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno
una riga ordine che corrisponde alla definizione della riga di promozione, ad es. gruppo promozionale X.


`` `
Illustrazione 14: Promozione B: Finestra Promozione> scheda Distribuzione quantità
`` `
### 4.1.4 Tab Distribuzione quantità ......................................... ..................................................

Abbiamo solo 1 distribuzione, cioè X = 3, secondo la Promozione 2.

** 1. ** Seleziona ** Linea promozionale ** come "Gruppo promozionale X".
** 2. ** Selezionare ** Operazione ** come "> =".
** 3. ** Inserisci "3" come ** Quantità **.
** 4. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 5. ** del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità. Selezionare ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente


`` `
Illustrazione 15: Promozione B: Finestra Promozione> scheda Ricompensa
`` `
### 4.1.5 Scheda Ricompensa .......................................... .................................................. ...................

In questo esempio, dobbiamo impostare questa ricompensa. dare l'articolo più economico in uno o più set di articoli gratuitamente. Di seguito sono riportati i passaggi per

** 1. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 2. ** Inserisci "10" come ** Numero sequenza ** per identificare la ricompensa.
** 3. ** Deseleziona la casella di controllo ** Per tutta la distribuzione ** per indicare che questo premio non si applica a tutti i
distribuzioni.
** 4. ** Seleziona la ** Distribuzione promozionale ** appropriata a cui è collegata questa ricompensa. In questo caso il file
Promuovere la distribuzione da selezionare è "Gruppo promozionale X".
** 5. ** Distribuzione per questo premio. Seleziona la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzare la promozione selezionata
** 6. ** Seleziona ** Tipo di ricompensa ** come "Percentuale".
** 7. ** Inserisci l '** importo ** da associare a un tipo di premio. In questo caso dobbiamo applicare uno sconto del 100% su
l'elemento più economico in esso, in altre parole, lo dà gratuitamente.


** 8. ** Specifica di distribuzione della quantità. Immettere "1" come ** Quantità **. Il sistema regalerà un articolo gratuito ed economico per ogni set definito in

** 9. ** il processo di sistema. Quando la condizione specificata in una particolare distribuzione è soddisfatta, la riga di distribuzione è Selezionare ** Ordinamento distribuzione ** come "Crescente". Il tipo di ordinamento selezionato per la ricompensa viene applicato a (^)
convalidato e conterrà una serie di determinati elementi. Allo stesso tempo, l'ordinamento della distribuzione selezionato verrà eseguito su ciascun set di elementi. Crescente indica che il sistema disporrà gli elementi (^)
iniziando a disporre gli articoli dal meno costoso al più costoso, mentre scendendo partendo dal più costoso al meno costoso. indica che il sistema lo farà

** 10. ** Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con
addebito per indicare l'account a cui inviare la posta.


** 5 Promozione C **

## 5.1 Acquista 1X e 2Y per $ 129

`` `
Illustrazione 16: Promozione C: Finestra Promozione> scheda Promozione
`` `
### 5.1.1 Scheda Promozione .......................................... .................................................. ...............

** 1. ** Inserisci "Promozione 3" come nome della promozione **.
2. ** Inserisci "Acquista 1X e 2 anni per $ 129" come promozione ** Descrizione **.
** 3. ** Inserisci "3" come sequenza o ** Priorità relativa. **


`` `
Illustrazione 17: Promozione C: Finestra Promozione> Scheda Condizione preliminare
`` `
### 5.1.2 Scheda Condizione preliminare ......................................... .................................................. ...........

** 1. ** Spunta la casella ** Attivo ** per indicare che la condizione preliminare è attiva.
** 2. ** Immettere "0" come ** sequenza **.
** 3. ** Seleziona il ** Business Partner ** a cui è applicabile la promozione. (Campo facoltativo)
** 4. ** il gruppo di business partner da selezionare è "clienti standard". Selezionare il ** gruppo di business partner ** appropriato a cui è applicabile la promozione. In questo caso
** 5. ** Seleziona ** Listino prezzi ** come "Standard".
** 6. ** Seleziona ** Magazzino ** come "Magazzino HQ"

** 7. ** quindi al momento dei saldi, l'utente dovrà inserire lo stesso codice promozionaleInserire il ** Codice promozionale **. (Campo facoltativo) Se viene inserito un codice promozionale per la promozione, che potrebbe avere prima (^)
completare l'ordine di vendita.

** 8. ** campo solo / non modificabile. ** Contatore di utilizzo ** determina il numero di volte in cui è stata applicata una promozione. È letto-


** 9. ** Campo Limite di utilizzo, il sistema limiterà il numero di volte in cui una promozione può essere applicata a un ordine, a Immettere "0" come ** Limite di utilizzo ** o Numero di volte limite. Se è stato inserito maggiore di zero nel campo (^)
cliente o in generale.

** 10. ** Immettere "01/01/2009 00:00" come ** Data di inizio **.
** 11. ** Inserisci "12/31/2009 00:00" come ** Data di fine ** o Data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

`` `
Illustrazione 18: Promozione C: Finestra Promozione> scheda Riga promozione
`` `
### 5.1.3 Scheda Riga di promozione ......................................... .................................................. .........

Abbiamo 2 linee di promozione, ciascuna corrispondente a un prodotto diverso da un gruppo promozionale diverso.

** 1. ** Seleziona ** Gruppo promozione ** come "Gruppo promozionale X" inserito durante il gruppo promozione
impostare.
** 2. ** Inserisci "0" come ** Ammortamento minimo dell'ordine.
3. ** una riga di ordine che corrisponde alla definizione della riga di promozione, ad es. Selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno il gruppo promozionale X.
** 4. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.
** 5. ** Fai clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova linea di promozione.
** 6. ** configurazione. Seleziona ** Gruppo promozione ** come "Gruppo promozionale Y" inserito durante il gruppo promozione
** 7. ** Inserisci "0" come ** Ammontare minimo dell'ordine **


** 8. ** una riga di ordine che corrisponde alla definizione della riga di promozione, ad es. Selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno il gruppo promozionale Y.
** 9. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.

`` `
Figura 16: Promozione 3: Finestra Promozione> scheda Distribuzione quantità
`` `
### 5.1.4 Distribuzione della quantità ** 10. ** Immettere "01/01/2009 00:00" come ** Data di inizio **.
** 11. ** Inserisci "12/31/2009 00:00" come ** Data di fine ** o Data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

`` `
Illustrazione 18: Promozione C: Finestra Promozione> scheda Riga promozione
`` `
### 5.1.3 Scheda Riga di promozione ......................................... .................................................. .........

Abbiamo 2 linee di promozione, ciascuna corrispondente a un prodotto diverso da un gruppo promozionale diverso.

** 1. ** Seleziona ** Gruppo promozione ** come "Gruppo promozionale X" inserito durante il gruppo promozione
impostare.
** 2. ** Inserisci "0" come ** Ammortamento minimo dell'ordine.
3. ** una riga di ordine che corrisponde alla definizione della riga di promozione, ad es. Selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno il gruppo promozionale X.
** 4. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.
** 5. ** Fai clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova linea di promozione.
** 6. ** configurazione. Seleziona ** Gruppo promozione ** come "Gruppo promozionale Y" inserito durante il gruppo promozione
** 7. ** Inserisci "0" come ** Ammontare minimo dell'ordine **


** 8. ** una riga di ordine che corrisponde alla definizione della riga di promozione, ad es. Selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno il gruppo promozionale Y.
** 9. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.

`` `
Figura 16: Promozione 3: Finestra Promozione> scheda Distribuzione quantità
`` `
### 5.1.4 Distribuzione della quantità

** 1. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 2. ** Inserisci "10" come ** Numero sequenza ** per identificare la ricompensa.
** 3. ** Seleziona la casella di controllo ** Per tutte le distribuzioni ** per indicare che questo premio si applica a tutte le distribuzioni prese
insieme.

** 4.Nota target: ** la casella di controllo e il sistema imposterà il menu a discesa ** Distribuzione promozione distribuzione target ** su disabilitato se il menu a discesa, ** Stessa distribuzione per origine e Per tutte le distribuzioni ** casella di controllo (^)
è stato spuntato.

** 5. ** Seleziona ** Tipo di premio ** come "Importo assoluto".
** 6. ** Inserisci l '** importo ** da associare a un tipo di ricompensa. In questo caso dobbiamo applicare un prezzo assoluto di
$ 129,00 sul set di articoli in tutte le distribuzioni.
** 7. ** Immettere "0" come ** Quantità **.


** 8. ** addebito per indicare l'account a cui inviare la posta. Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con


** 6 Promozione D **

## 6.1 Spendi> $ 1000 Ottieni il 5% di sconto e 1X gratuitamente

`` `
Illustrazione 20: Promozione D: Finestra Promozione> scheda Promozione
`` `
### 6.1.1 Scheda Promozione .......................................... .................................................. ...............

** 1. ** Inserisci "Promozione 4" come nome della promozione **.
2. ** Inserisci "Acquista per $ 1000 o più e ottieni il 5% di sconto e 1X gratis" come promozione ** Descrizione **.
** 3. ** Inserisci "4" come sequenza o ** Priorità relativa. **


`` `
Illustrazione 21: Promozione D: Finestra Promozione> Scheda Condizione preliminare
`` `
### 6.1.2 Condizione preliminare Scheda ................................................. .................................................. ...

** 1. ** Spunta la casella ** Attivo ** per indicare che la condizione preliminare è attiva.
** 2. ** Immettere "0" come ** sequenza **.
** 3. ** Seleziona il ** Business Partner ** a cui è applicabile la promozione. (Campo facoltativo)
** 4. ** il gruppo di business partner da selezionare è "clienti standard". Selezionare il ** gruppo di business partner ** appropriato a cui è applicabile la promozione. In questo caso
** 5. ** Seleziona ** Listino prezzi ** come "Standard".
** 6. ** Seleziona ** Magazzino ** come "Magazzino HQ".

** 7. ** quindi al momento dei saldi, l'utente dovrà inserire lo stesso codice promozionaleInserire il ** Codice promozionale **. (Campo facoltativo) Se viene inserito un codice promozionale per la promozione, che potrebbe avere prima (^)
completare l'ordine di vendita.

** 8. ** campo solo / non modificabile. ** Contatore di utilizzo ** determina il numero di volte in cui è stata applicata una promozione. È letto-


** 9. ** Campo Limite di utilizzo, il sistema limiterà il numero di volte in cui una promozione può essere applicata a un ordine, a Immettere "0" come ** Limite di utilizzo ** o Numero di volte limite. Se è stato inserito maggiore di zero nel campo (^)
cliente o in generale.

** 10. ** Immettere "01/01/2009 00:00" come ** Data di inizio **.
** 11. ** Inserisci "12/31/2009 00:00" come ** Data di fine ** o Data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

`` `
Illustrazione 22: Promozione D: Finestra Promozione> scheda Riga promozione
`` `
### 6.1.3 Scheda Riga promozione ......................................... .................................................. .........

** 1. ** configurazione. Seleziona ** Gruppo promozione ** come "Gruppo promozionale X" inserito durante il gruppo promozione
** 2. ** Inserisci "0" come ** Ammortamento minimo dell'ordine.
3. ** Deseleziona la casella di controllo ** Linea di promozione obbligatoria **.
** 4. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.
** 5. ** Fai clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova linea di promozione.
** 6. ** Immettere "1000,00" come ** Importo minimo dell'ordine **.
** 7. ** Selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno
una riga ordine che corrisponde alla definizione della riga di promozione, ovvero $ 1000,00.
** 8. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.


`` `
Illustrazione 23: Promozione D: Finestra Promozione> Scheda Distribuzione quantità
`` `
### 6.1.4 Tab Distribuzione quantità ......................................... ..................................................

Abbiamo 2 distribuzioni secondo la Promozione 4.

** 1. ** Immettere "10" come ** sequenza.
2. ** Seleziona ** Linea promozionale ** come "Gruppo promozionale X".
** 3. ** Selezionare ** Operazione ** come "> =".
** 4. ** Inserisci "1" come ** Quantità **.
** 5. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 6. ** Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità.
** 7. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.
** 8. ** Fare clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova distribuzione.
** 9. ** Immettere "20" come ** sequenza.
10. ** Seleziona ** Linea promozionale ** come "$ 1000,00".
** 11. ** Selezionare ** Operazione ** come "> =".
** 12. ** Immettere "0" come ** Quantità **.
** 13. ** Seleziona ** Tipo di distribuzione ** come "Max".
** 14. ** Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
del loro prezzo.
** 15. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.


`` `
Illustrazione 24: Promozione D: Finestra Promozione> Scheda Ricompensa - Ricompensa 1
`` `
### 6.1.5 Ricompensa Scheda ................................................. .................................................. ............

In questo esempio, dobbiamo dare il premio 1 (vedere la figura 22a) dà il 5% e il premio 2 (vedere lo sconto del 5% più 1X gratis per le persone che acquistano $ 1000 o più di articoli. Quindi la figura 22b) dà 1X gratis. Di seguito sono riportati i passaggi per (^)
impostare questi premi.

** 1. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 2. ** Inserisci "10" come ** Numero sequenza ** per identificare la ricompensa.
** 3. ** distribuzioni Deseleziona il file. ** Per tutte le distribuzioni ** casella di controllo per indicare che questo premio non si applica a tutti i
** 4. ** Seleziona la ** Distribuzione promozionale ** appropriata a cui è collegata questa ricompensa. In questo caso il file
La promozione della distribuzione da selezionare è "$ 1000,00".
** 5. ** Distribuzione per questo premio. Seleziona la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzare la promozione selezionata
** 6. ** Seleziona ** Tipo di ricompensa ** come "Percentuale".
** 7. ** l'insieme di elementi nella distribuzione. Inserisci l '** Importo ** da associare a un tipo di ricompensa. In questo caso dobbiamo applicare uno sconto del 5%


** 8. ** Inserisci "0" come ** Quantità **.
** 9. ** Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con
addebito per indicare l'account a cui inviare la posta.
** 10. ** Fai clic sul pulsante ** Salva ** per salvare i dettagli del premio.
** 11. ** Fai clic sul pulsante ** Nuovo ** Registra per aggiungere un altro nuovo premio.

`` `
Illustrazione 25: Promozione D: Finestra Promozione> Scheda Ricompensa - Ricompensa 2
`` `
** 12. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 13. ** Inserisci "20" come ** Numero sequenza ** per identificare la ricompensa.
** 14. ** Deseleziona la casella di controllo ** Per tutta la distribuzione ** per indicare che questo premio non si applica a tutti i
distribuzioni.
** 15. ** Promuovere la distribuzione Selezionare l'appropriato da selezionare è "$ 1000,00" ** Promuovere la distribuzione **. a cui è legata questa ricompensa. In questo caso il file
** 16. ** distribuzioni / la distribuzione target selezionata per questo premio. Deseleziona la casella di controllo ** stessa distribuzione per sorgente e target ** per utilizzarne un'altra
** 17. ** Seleziona ** Distribuzione target ** come "Gruppo promozionale X".


** 18. ** Seleziona ** Tipo di ricompensa ** come "Percentuale".
** 19. ** Inserisci l '** Importo ** da associare a un tipo di premio. In questo caso dobbiamo applicare uno sconto del 100% su
l'elemento più economico in esso, in altre parole, lo dà gratuitamente.
** 20. ** o più di elementi Immettere "1" come. **Quantità**. Il sistema regalerà un articolo gratuito ed economico per ogni ordine di $ 1000
** 21. ** Seleziona ** Ordinamento distribuzione ** come "Crescente". Viene applicato il tipo di ordinamento selezionato per la ricompensa

il processo di sistema. Quando la condizione specificata in una particolare distribuzione viene soddisfatta, la linea di distribuzione viene convalidata e conterrà un numero di determinati elementi. Allo stesso tempo, l'ordinamento di distribuzione selezionato (^)
accadrà su ogni set di articoli. Crescente indica che il sistema disporrà gli articoli partendo dal meno costoso al più costoso, mentre decrescente indica che il sistema (^)
organizzare gli articoli partendo dal più costoso al meno costoso.

** 22. ** Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con
addebito per indicare l'account a cui inviare la posta.
** 23. ** Fai clic sul pulsante ** Salva ** per salvare i dettagli del premio.


** 7 Promozione E **

## 7.1 Acquista 2X e 1Y, ricevi il 10% di X e Y gratuitamente

`` `
Illustrazione 26: Promozione E: Finestra Promozione> scheda Promozione
`` `
### 7.1.1 Promozione Scheda ................................................. .................................................. ........

** 1. ** Inserisci "Promozione 5" come nome della promozione **.
2. ** Inserisci "Acquista 2X e 1Y e ottieni il 10% di sconto su ogni X e ricevi Y per $ 5" come promozione ** Descrizione **.
** 3. ** Inserisci "5" come sequenza o ** Priorità relativa. **


`` `
Illustrazione 27: Promozione E: Finestra Promozione> scheda Condizione preliminare
`` `
### 7.1.2 Scheda Condizione preliminare ......................................... .................................................. ...........

** 1. ** Spunta la casella ** Attivo ** per indicare che la condizione preliminare è attiva.
** 2. ** Immettere "0" come ** sequenza **.
** 3. ** Seleziona il ** Business Partner ** a cui è applicabile la promozione. (Campo facoltativo)
** 4. ** Seleziona il ** Gruppo di partner commerciali ** appropriato a cui è applicabile la promozione. In questo caso
il gruppo di business partner da selezionare è "clienti standard".
** 5. ** Seleziona ** Listino prezzi ** come "Standard".
** 6. ** Seleziona ** Magazzino ** come "Magazzino HQ"
** 7. ** Inserisci il ** codice promozionale **. (Campo facoltativo) Se viene inserito un codice promozionale per la promozione,
quindi, al momento delle vendite, l'utente dovrà inserire lo stesso codice promozionale per completare l'ordine di vendita. che potrebbe avere prima
** 8. ** campo solo / non modificabile. ** Contatore di utilizzo ** determina il numero di volte in cui è stata applicata una promozione. È letto-


** 9. ** Campo Limite di utilizzo, il sistema limiterà il numero di volte in cui una promozione può essere applicata a un ordine, a Immettere "0" come ** Limite di utilizzo ** o Numero di volte limite. Se è stato inserito maggiore di zero nel campo (^)
cliente o in generale.

** 10. ** Immettere "01/01/2009 00:00" come ** Data di inizio **.
** 11. ** Inserisci "12/31/2009 00:00" come ** Data di fine ** o Data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

### 7.1.3 Scheda Riga promozione ......................................... .................................................. .........

** 1. ** Seleziona ** Gruppo promozione ** come "Gruppo promozionale X" inserito durante il gruppo promozione
impostare.
** 2. ** Inserisci "0" come ** Ammortamento minimo dell'ordine.
3. ** Spunta la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno
una riga ordine che corrisponde alla definizione della riga di promozione, ad es. gruppo promozionale X.
** 4. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.
** 5. ** Fai clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova linea di promozione.
** 6. ** Seleziona ** Gruppo promozione ** come "Gruppo promozionale Y" inserito durante il gruppo promozione
impostare.
** 7. ** Immettere "0" come ** Ammortamento minimo dell'ordine
8. ** una riga ordine che corrisponde alla definizione della riga di promozione, ad esempio selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno il gruppo promozionale Y.
** 9. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.

`` `
Illustrazione 28: Promozione E: Finestra Promozione> scheda Riga promozione
`` `

`` `
Illustrazione 29: Promozione E: Finestra Promozione> scheda Distribuzione quantità
`` `
### 7.1.4 Tab Distribuzione quantità ......................................... ..................................................

Abbiamo 2 distribuzioni, cioè X> = 2 e Y> = 1, secondo la Promozione 5.

** 1. ** Immettere "10" come ** sequenza.
2. ** Seleziona ** Linea promozionale ** come "Gruppo promozionale X".
** 3. ** Selezionare ** Operazione ** come "> =".
** 4. ** Inserisci "2" come ** Quantità **.
** 5. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 6. ** Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità.
** 7. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.
** 8. ** Fare clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova distribuzione.
** 9. ** Immettere "20" come ** sequenza.
10. ** Seleziona ** Linea promozionale ** come "Gruppo promozionale Y".
** 11. ** Selezionare ** Operazione ** come "> =".
** 12. ** Inserisci "1" come ** Quantità **.
** 13. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 14. ** ordine del prezzo e poi raggrupparli in set in base alla specifica della quantità. Seleziona ** Ordinamento distribuzione ** come "Decrescente". Il sistema riorganizzerà gli elementi in ordine discendente
** 15. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.


`` `
Illustrazione 30: Promozione E: Finestra Promozione> Scheda Ricompensa - Ricompensa 1
`` `
### 7.1.5 Scheda Ricompensa .......................................... .................................................. ...................

** 1. ** Quindi la Ricompensa 1 (vedi In questo esempio, dobbiamo dare la Figura 27a) dà il 10% di sconto su ogni X e ottiene Y per $ 510% di sconto su ogni X e la Ricompensa 2 (Vedi per le persone che acquistano Figura 27b) dà 2X e 1Y. $ 5 per Y (^)
(che contiene 2X e 1Y). Di seguito sono riportati i passaggi per impostare questi premi.

** 2. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 3. ** Inserisci "10" come ** Numero sequenza ** per identificare la ricompensa.
** 4. ** Deseleziona la casella di controllo ** Per tutta la distribuzione ** per indicare che questo premio non si applica a tutti i
distribuzioni.
** 5. ** Seleziona la ** Distribuzione promozionale ** appropriata a cui è collegata questa ricompensa. In questo caso il file
Promuovere la distribuzione da selezionare è "Gruppo promozionale X".
** 6. ** Distribuzione per questo premio. Seleziona la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzare la promozione selezionata
** 7. ** Seleziona ** Tipo di premio ** come "Percentuale".
** 8. ** l'insieme di elementi nella distribuzione. Inserisci l '** Importo ** da associare a un tipo di ricompensa. In questo caso dobbiamo applicare uno sconto del 10%


** 9. ** Immettere "0" come ** Quantità **.
** 10. ** Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con
addebito per indicare l'account a cui inviare la posta.
** 11. ** Fai clic sul pulsante ** Salva ** per salvare i dettagli del premio.
** 12. ** Fai clic sul pulsante ** Nuovo ** Registra per aggiungere un altro nuovo premio.

`` `
Illustrazione 31: Promozione E: Finestra Promozione> Scheda Ricompensa - Ricompensa 2
`` `
** 1. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 2. ** Inserisci "20" come ** Numero sequenza ** per identificare la ricompensa.
** 3. ** Deseleziona la casella di controllo ** Per tutta la distribuzione ** per indicare che questo premio non si applica a tutti i
distribuzioni.
** 4. ** Promuovere la distribuzione Selezionare l'appropriato da selezionare è "Gruppo promozionale Y" ** Promuovere la distribuzione ** a cui è collegata questa ricompensa. In questo caso. il
** 5. ** Selezionare la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzare la promozione selezionata
Distribuzione per questa ricompensa.
** 6. ** Seleziona ** Tipo di ricompensa ** come "Importo assoluto".


** 7. ** $ 5,00 sul set di elementi nella distribuzione. Inserisci l '** Importo ** da associare a un tipo di ricompensa. In questo caso dobbiamo applicare un prezzo assoluto di
** 8. ** Inserisci "0" come ** Quantità **.
** 9. ** addebito per indicare l'account a cui inviare. Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con
** 10. ** Fai clic sul pulsante ** Salva ** per salvare i dettagli del premio.

** 8 Promozione F **

## 8.1 Acquista 3X per $ 20 ........................................... .................................................. .................. 8. Promozione F

`` `
Illustrazione 32: Promozione F: Finestra Promozione> scheda Promozione
`` `
### 8.1.1 Scheda Promozione .......................................... .................................................. ...............

** 1. ** Immettere "Promozione 6" come nome della promozione **.
2. ** Inserisci "Acquista 3 volte per $ 20" come promozione ** Descrizione **.
** 3. ** Inserisci "6" come sequenza o ** Priorità relativa. **


`` `
Illustrazione 33: Promozione F: Finestra Promozione> scheda Condizione preliminare
`` `
### 8.1.2 Scheda Condizione preliminare ......................................... .................................................. ...........

** 1. ** Spunta la casella ** Attivo ** per indicare che la condizione preliminare è attiva.
** 2. ** Immettere "0" come ** sequenza **.
** 3. ** Seleziona il ** Business Partner ** a cui è applicabile la promozione. (Campo facoltativo)
** 4. ** il gruppo di business partner da selezionare è "clienti standard". Selezionare il ** gruppo di business partner ** appropriato a cui è applicabile la promozione. In questo caso
** 5. ** Seleziona ** Listino prezzi ** come "Standard".
** 6. ** Seleziona ** Magazzino ** come "Magazzino HQ"

** 7. ** quindi al momento dei saldi, l'utente dovrà inserire lo stesso codice promozionaleInserire il ** Codice promozionale **. (Campo facoltativo) Se viene inserito un codice promozionale per la promozione, che potrebbe avere prima (^)
completare l'ordine di vendita.

** 8. ** campo solo / non modificabile. ** Contatore di utilizzo ** determina il numero di volte in cui è stata applicata una promozione. È letto-


** 9. ** Campo Limite di utilizzo, il sistema limiterà il numero di volte in cui una promozione può essere applicata a un ordine, a Immettere "0" come ** Limite di utilizzo ** o Numero di volte limite. Se è stato inserito maggiore di zero nel campo (^)
cliente o in generale.

** 10. ** Immettere "01/01/2009 00:00" come ** Data di inizio **.
** 11. ** Inserisci "12/31/2009 00:00" come ** Data di fine ** o Data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

`` `
Illustrazione 34: Promozione F: Finestra Promozione> scheda Riga promozione
`` `
### 8.1.3 Linea di promozione Scheda ................................................. .................................................. .

** 1. ** Seleziona ** Gruppo promozione ** come "Gruppo promozionale X" inserito durante il gruppo promozione
impostare.
** 2. ** Inserisci "0" come ** Ammortamento minimo dell'ordine.
3. ** Spunta la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno
una riga ordine che corrisponde alla definizione della riga di promozione, ad es. gruppo promozionale X.


`` `
Figura 31: Promozione 6: Finestra Promozione> scheda Distribuzione quantità
`` `
### 8.1.4 Tab Distribuzione quantità ......................................... ..................................................

Abbiamo solo 1 distribuzione, cioè X> = 3, secondo la Promozione 6.

** 1. ** Immettere "10" come ** sequenza.
2. ** Seleziona ** Linea promozionale ** come "Gruppo promozionale X".
** 3. ** Selezionare ** Operazione ** come "> =".
** 4. ** Inserisci "3" come ** Quantità **.
** 5. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 6. ** del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità. Selezionare ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente


`` `
Illustrazione 35: Promozione F: Finestra Promozione> Scheda Ricompensa - Ricompensa
`` `
### 8.1.5 Scheda Ricompensa .......................................... .................................................. ...................

In questo esempio, dobbiamo dare $ 20 per le persone che acquistano 3X. Di seguito sono riportati i passaggi per impostare questo premio.

** 1. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 2. ** Inserisci "10" come ** Numero sequenza ** per identificare la ricompensa.
** 3. ** distribuzioni Deseleziona il file. ** Per tutte le distribuzioni ** casella di controllo per indicare che questo premio non si applica a tutti i
** 4. ** Promuovere la distribuzione Selezionare l'appropriato da selezionare è "Gruppo promozionale X" ** Promuovere la distribuzione ** a cui è collegata questa ricompensa. In questo caso. il
** 5. ** Selezionare la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzare la promozione selezionata
Distribuzione per questa ricompensa.
** 6. ** Seleziona ** Tipo di ricompensa ** come "Importo assoluto".
** 7. ** Inserisci l '** importo ** da associare a un tipo di premio. In questo caso dobbiamo applicare un prezzo assoluto di
$ 20,00 sul set di articoli nella distribuzione.
** 8. ** Inserisci "0" come ** Quantità **.


** 9. ** addebito per indicare l'account a cui inviare. Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con


** 9 Promozione G **

## 9.1 Acquista 1X e fino a 4Y al 50% ciascuno ..................................... ............................................... 9. Promozione G

`` `
Illustrazione 36: Promozione G: Finestra Promozione> scheda Promozione
`` `
### 9.1.1 Scheda Promozione .......................................... .................................................. ...............

** 1. ** Immettere "Promozione 7" come nome della promozione **.
2. ** Inserisci "Acquista 1X, prendi fino a 4 anni al 50% ciascuno" come promozione ** Descrizione **.
** 3. ** Inserisci "7" come sequenza o ** Priorità relativa. **


### 9.1.2 Scheda Condizione preliminare ......................................... .................................................. ...........

** 1. ** Spunta la casella ** Attivo ** per indicare che la condizione preliminare è attiva.
** 2. ** Immettere "0" come ** sequenza **.
** 3. ** Seleziona il ** Business Partner ** a cui è applicabile la promozione. (Campo facoltativo)
** 4. ** il gruppo di business partner da selezionare è "clienti standard". Selezionare il ** gruppo di business partner ** appropriato a cui è applicabile la promozione. In questo caso
** 5. ** Seleziona ** Listino prezzi ** come "Standard".
** 6. ** Seleziona ** Magazzino ** come "Magazzino HQ"

** 7. ** quindi al momento dei saldi, l'utente dovrà inserire lo stesso codice promozionaleInserire il ** Codice promozionale **. (Campo facoltativo) Se viene inserito un codice promozionale per la promozione, che potrebbe avere prima (^)
completare l'ordine di vendita.

** 8. ** campo solo / non modificabile. ** Contatore di utilizzo ** determina il numero di volte in cui è stata applicata una promozione. È letto-

`` `
Illustrazione 37: Promozione G: Finestra Promozione> scheda Condizione preliminare
`` `

** 9. ** Campo Limite di utilizzo, il sistema limiterà il numero di volte in cui una promozione può essere applicata a un ordine, a Immettere "0" come ** Limite di utilizzo ** o Numero di volte limite. Se è stato inserito maggiore di zero nel campo (^)
cliente o in generale.

** 10. ** Immettere "01/01/2009 00:00" come ** Data di inizio **.
** 11. ** Inserisci "12/31/2009 00:00" come ** Data di fine ** o Data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

`` `
Illustrazione 38: Promozione G: Finestra Promozione> scheda Riga promozione
`` `
** Passaggi: **

### 9.1.3 Linea di promozione Scheda ................................................. .................................................. .

** 1. ** Seleziona ** Gruppo promozione ** come "Gruppo promozionale X" inserito durante il gruppo promozione
impostare.
** 2. ** Inserisci "0" come ** Ammortamento minimo dell'ordine.
3. ** una riga di ordine che corrisponde alla definizione della riga di promozione, ad es. Selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno il gruppo promozionale X.
** 4. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.
** 5. ** Fai clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova linea di promozione.
** 6. ** configurazione. Seleziona ** Gruppo promozione ** come "Gruppo promozionale Y" inserito durante il gruppo promozione
** 7. ** Inserisci "0" come ** Importo minimo dell'ordine **.
** 8. ** una riga di ordine che corrisponde alla definizione della riga di promozione, ad es. Selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno il gruppo promozionale Y.
** 9. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.


`` `
Illustrazione 39: Promozione G: Finestra Promozione> scheda Distribuzione quantità
`` `
### 9.1.4 Tab Distribuzione quantità ......................................... ..................................................

Abbiamo 3 distribuzioni, ovvero X> = 1 e Y <= 4 e Y> = 4, secondo la Promozione 7.

** 1. ** Immettere "10" come ** sequenza.
2. ** Seleziona ** Linea promozionale ** come "Gruppo promozionale X".
** 3. ** Selezionare ** Operazione ** come "> =".
** 4. ** Inserisci "1" come ** Quantità **.
** 5. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 6. ** Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità.
** 7. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.
** 8. ** Fare clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova distribuzione.
** 9. ** Immettere "20" come ** sequenza.
10. ** Seleziona ** Linea promozionale ** come "Gruppo promozionale Y".
** 11. ** Selezionare ** Operazione ** come "<=".
** 12. ** Inserisci "4" come ** Quantità **.
** 13. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 14. ** Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità.
** 15. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.
** 16. ** Fare clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova distribuzione.
** 17. ** Inserisci "30" come ** sequenza. **


** 18. ** Seleziona ** Linea promozionale ** come "Gruppo promozionale Y".
** 19. ** Selezionare ** Operazione ** come "> =".
** 20. ** Inserisci "4" come ** Quantità **.
** 21. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 22. ** del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità. Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
** 23. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.


** Illustrazione 40: Promozione G: Finestra Promozione> Scheda Premio - Premio 1 **

** Illustrazione 41: Promozione G: Finestra Promozione> Scheda Premio - Premio 2 **


### 9.1.5 Scheda Ricompensa .......................................... .................................................. ...................

In questo esempio, dobbiamo dare il 50% di sconto a tutti gli articoli Y per le persone che acquistano (vedi Figura 37a) dà il 50% su tutti gli articoli Y se le persone acquistano 1X e prendono fino a 4Y, cioè X> = 1 e Y <= 4, e 1X e impiegano fino a 4Y. Quindi ricompensa 1 (^)
Ricompensa 2 (Vedi gli articoli, ad esempio X> = 1 e Y> = 4 Di seguito sono riportati i passaggi per impostare questi premi. Figura 37b) dà il 50% su tutti gli articoli Y se le persone acquistano più di un set della distribuzione

** 1. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 2. ** Inserisci "10" come ** Numero sequenza ** per identificare la ricompensa.
** 3. ** distribuzioni Deseleziona il file. ** Per tutte le distribuzioni ** casella di controllo per indicare che questo premio non si applica a tutti i
** 4. ** Seleziona la ** Distribuzione promozionale ** appropriata a cui è collegata questa ricompensa. In questo caso il file
Promuovere la distribuzione da selezionare è "Gruppo promozionale X".
** 5. ** Deseleziona la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzarne un'altra
distribuzioni / la distribuzione target selezionata per questo premio.
** 6. ** Seleziona ** Distribuzione target ** come "Gruppo promozionale Y".
** 7. ** Seleziona ** Tipo di premio ** come "Percentuale".
** 8. ** articoli se le persone acquistano 1X e impiegano fino a 4Y. Inserisci l '** Importo ** da associare a un tipo di ricompensa. In questo caso dobbiamo applicare il 50% di sconto su tutte le Y
** 9. ** Immettere "0" come ** Quantità **.
** 10. ** addebito per indicare l'account a cui inviare la posta. Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con
** 11. ** Fai clic sul pulsante ** Salva ** per salvare i dettagli del premio.
** 12. ** Fai clic sul pulsante ** Nuovo ** Registra per aggiungere un altro nuovo premio.
** 13. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 14. ** Inserisci "20" come ** Numero sequenza ** per identificare la ricompensa.
** 15. ** Deseleziona la casella di controllo ** Per tutta la distribuzione ** per indicare che questo premio non si applica a tutti i
distribuzioni.
** 16. ** Promuovere la distribuzione Selezionare l'appropriato da selezionare è "Gruppo promozionale X" ** Promuovere la distribuzione ** a cui è collegata questa ricompensa. In questo caso. il
** 17. ** Deseleziona la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzarne un'altra
distribuzioni / la distribuzione target selezionata per questo premio.
** 18. ** Seleziona ** Distribuzione target ** come "Gruppo promozionale Y".


** 19. ** Seleziona ** Tipo di premio ** come "Percentuale".
** 20. ** Inserisci l '** Importo ** da associare a un tipo di premio. In questo caso dobbiamo applicare il 50% di sconto su tutte le Y
articoli se le persone acquistano più di un set di articoli di distribuzione, ad esempio X> = 1 e Y> = 4.
** 21. ** Immettere "0" come ** Quantità **.
** 22. ** addebito per indicare l'account a cui inviare. Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con
** 23. ** Fai clic sul pulsante ** Salva ** per salvare i dettagli del premio.


** 10 Promozione H **

## 10.1 Acquista 1X e ricevi 1Y gratis ......................................... .................................................. ........ 10.Promozione H

### 10.1.1 Scheda Promozione .......................................... .................................................. ...............

** 1. ** Immettere "Promozione 7" come nome della promozione **.
2. ** Inserisci "Acquista 1X ricevi 1Y gratis" come promozione ** Descrizione **.
** 3. ** Inserisci "8" come sequenza o ** Priorità relativa. **

`` `
Illustrazione 42: Promozione H: Finestra Promozione> scheda Promozione
`` `

`` `
Illustrazione 43: Promozione H: Finestra Promozione> scheda Condizione preliminare
`` `
### 10.1.2 Scheda Condizione preliminare ......................................... .................................................. ...........

** 1. ** Spunta la casella ** Attivo ** per indicare che la condizione preliminare è attiva.
** 2. ** Immettere "0" come ** sequenza **.
** 3. ** Seleziona il ** Business Partner ** a cui è applicabile la promozione. (Campo facoltativo)
** 4. ** il gruppo di business partner da selezionare è "clienti standard". Selezionare il ** gruppo di business partner ** appropriato a cui è applicabile la promozione. In questo caso
** 5. ** Seleziona ** Listino prezzi ** come "Standard".
** 6. ** Seleziona ** Magazzino ** come "Magazzino HQ"

** 7. ** quindi al momento dei saldi, l'utente dovrà inserire lo stesso codice promozionaleInserire il ** Codice promozionale **. (Campo facoltativo) Se viene inserito un codice promozionale per la promozione, che potrebbe avere prima (^)
completare l'ordine di vendita.

** 8. ** campo solo / non modificabile. ** Contatore di utilizzo ** determina il numero di volte in cui è stata applicata una promozione. È letto-


** 9. ** Campo Limite di utilizzo, il sistema limiterà il numero di volte in cui una promozione può essere applicata a un ordine, a Immettere "0" come ** Limite di utilizzo ** o Numero di volte limite. Se è stato inserito maggiore di zero nel campo (^)
cliente o in generale.

** 10. ** Immettere "01/01/2009 00:00" come ** Data di inizio **.
** 11. ** Inserisci "12/31/2009 00:00" come ** Data di fine ** o Data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

`` `
Illustrazione 44: Promozione H: Finestra Promozione> scheda Riga promozione
`` `
### 10.1.3 Scheda Riga promozione ......................................... .................................................. .........

** 1. ** Seleziona ** Gruppo promozione ** come "Gruppo promozionale X" inserito durante il gruppo promozione
impostare.
** 2. ** Inserisci "0" come ** Ammortamento minimo dell'ordine.
3. ** Spunta la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno
una riga ordine che corrisponde alla definizione della riga di promozione, ad es. gruppo promozionale X.
** 4. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.
** 5. ** Fai clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova linea di promozione.
** 6. ** configurazione. Seleziona ** Gruppo promozione ** come "Gruppo promozionale Y" inserito durante il gruppo promozione
** 7. ** Inserisci "0" come ** Importo minimo dell'ordine **.
** 8. ** una riga di ordine che corrisponde alla definizione della riga di promozione, ad es. Selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno il gruppo promozionale Y.
** 9. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della linea di promozione.


`` `
Illustrazione 45: Promozione H: Finestra Promozione> scheda Distribuzione quantità
`` `
### 10.1.4 Tab Distribuzione quantità ......................................... ..................................................

Abbiamo 2 distribuzioni, cioè X> = 1 e Y> = 1, secondo la Promozione 8.

** 1. ** Immettere "10" come ** sequenza.
2. ** Seleziona ** Linea promozionale ** come "Gruppo promozionale X".
** 3. ** Selezionare ** Operazione ** come "> =".
** 4. ** Inserisci "1" come ** Quantità **.
** 5. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 6. ** Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità.
** 7. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.
** 8. ** Fare clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova distribuzione.
** 9. ** Immettere "20" come ** sequenza.
10. ** Seleziona ** Linea promozionale ** come "Gruppo promozionale Y".
** 11. ** Selezionare ** Operazione ** come "> =".
** 12. ** Inserisci "1" come ** Quantità **.
** 13. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 14. ** Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità.
** 15. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.


`` `
Illustrazione 46: Promozione H: Finestra Promozione> scheda Ricompensa
`` `
### 10.1.5 Scheda Ricompensa .......................................... .................................................. ...................

In questo esempio, dobbiamo regalare 1 anno gratis per le persone che acquistano 1X. Di seguito sono riportati i passaggi per impostare questo premio.

** 1. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 2. ** Inserisci "10" come ** Numero sequenza ** per identificare la ricompensa.
** 3. ** Deseleziona la casella di controllo ** Per tutta la distribuzione ** per indicare che questo premio non si applica a tutti i
distribuzioni.
** 4. ** Promuovere la distribuzione Selezionare l'appropriato da selezionare è "Gruppo promozionale X" ** Promuovere la distribuzione ** a cui è collegata questa ricompensa. In questo caso. il
** 5. ** Deseleziona la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzarne un'altra
distribuzioni / la distribuzione target selezionata per questo premio.
** 6. ** Seleziona ** Distribuzione target ** come "Gruppo promozionale Y".
** 7. ** Seleziona ** Tipo di premio ** come "Percentuale".
** 8. ** Inserisci l '** Importo ** da associare a un tipo di ricompensa. In questo caso dobbiamo applicare uno sconto del 100% su
l'elemento più economico in esso, in altre parole, lo dà gratuitamente.


** 9. ** Immettere "0" come ** Quantità **.
** 10. ** Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con
addebito per indicare l'account a cui inviare la posta.


** 11 Promozione I **

## 11.1 Ottieni il 10% di sconto sulle prime 3 volte, il 20% sulle successive 3, il 30% di eventuali extra ............................. ...................... 11.Promozione I

`` `
Illustrazione 47: Promozione I: Finestra Promozione> scheda Promozione
`` `
### 11.1.1 Scheda Promozione .......................................... .................................................. ...............

** 1. ** Inserisci "Promozione 9" come nome della promozione **.
2. ** ha acquistato "Entra" come promozione Ottieni il 10% di sconto su ciascuna delle prime 3X, il 20% sulle successive tre e il 30% su qualsiasi X aggiuntiva ** Descrizione **.
** 3. ** Inserisci "9" come sequenza o ** Priorità relativa. **


`` `
Illustrazione 48: Promozione I: Finestra Promozione> scheda Condizione preliminare
`` `
### 11.1.2 Scheda Condizione preliminare ......................................... .................................................. ...........

** 1. ** Spunta la casella ** Attivo ** per indicare che la condizione preliminare è attiva.
** 2. ** Immettere "0" come ** sequenza **.
** 3. ** Seleziona il ** Business Partner ** a cui è applicabile la promozione. (Campo facoltativo)
** 4. ** il gruppo di business partner da selezionare è "clienti standard". Selezionare il ** gruppo di business partner ** appropriato a cui è applicabile la promozione. In questo caso
** 5. ** Seleziona ** Listino prezzi ** come "Standard".
** 6. ** Seleziona ** Magazzino ** come "Magazzino HQ"

** 7. ** quindi al momento dei saldi, l'utente dovrà inserire lo stesso codice promozionaleInserire il ** Codice promozionale **. (Campo facoltativo) Se viene inserito un codice promozionale per la promozione, che potrebbe avere prima (^)
completare l'ordine di vendita.

** 8. ** Il ** Contatore di utilizzo ** determina il numero di volte in cui è stata applicata una promozione. È letto-
campo solo / non modificabile.


** 9. ** Campo Limite di utilizzo, il sistema limiterà il numero di volte in cui una promozione può essere applicata a un ordine, a Immettere "0" come ** Limite di utilizzo ** o Numero di volte limite. Se è stato inserito maggiore di zero nel campo (^)
cliente o in generale.

** 10. ** Immettere "01/01/2009 00:00" come ** Data di inizio **.
** 11. ** Inserisci "12/31/2009 00:00" come ** Data di fine ** o Data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

`` `
Illustrazione 49: Promozione I: Finestra Promozione> scheda Riga promozione
`` `
### 11.1.3 Scheda Riga di promozione ......................................... .................................................. .........

** 1. ** configurazione. Seleziona ** Gruppo promozione ** come "Gruppo promozionale X" inserito durante il gruppo promozione
** 2. ** Inserisci "0" come ** Ammortamento minimo dell'ordine.
3. ** una riga di ordine che corrisponde alla definizione della riga di promozione, ad es. Selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno il gruppo promozionale X.

`` `
Illustrazione 50: Promozione I: Finestra Promozione> scheda Distribuzione quantità
`` `

### 11.1.4 Tab Distribuzione quantità ......................................... ..................................................

Abbiamo 3 distribuzioni, ovvero 0 <= X <= 2, 3 <= X <= 5 e X> = 6, in base alla Promozione 9. Quando si accede al

distribuzioni, devi iniziare con il "3" più grande come 3 <= X <= 5 e quindi inserire "0" come 0 <= X <= 2. La distribuzione i) ** quantità **. In questo esempio, inserisci "6" come X> = 6, inserisci ** Operazione, ** ii) ** Tipo di distribuzione ** e iii) ** Distribuzione ** (^)
** L'ordinamento ** per tutte queste distribuzioni è i) "> =", ii) "Meno" e iii) "Decrescente".
** Illustrazione 51: Promozione I: Finestra Promozione> Scheda Premio - Premio 1 **


** Illustrazione 52: Promozione I: Finestra Promozione> Scheda Premio - Premio 2 **


`` `
Illustrazione 53: Promozione I: Finestra Promozione> Scheda Ricompensa - Ricompensa 3
`` `
### 11.1.5 Scheda Ricompensa .......................................... .................................................. ...................

In questo esempio, dobbiamo farlo in precedenza. Quindi la Ricompensa 1 (Vedi applicare una certa percentuale di sconto sugli articoli nella distribuzione inserita Figura 48a) dà il 30% sugli articoli nella Distribuzione1 (che contiene 7 o più X), (^)
La ricompensa 2 (vedere la Figura 48c) offre uno sconto del 10% sulla distribuzione 3 (che contiene 1-3 X). Di seguito sono riportati i passaggi per impostare la Figura 48b) offre uno sconto del 20% sulla distribuzione 2 (che contiene 4-6 X) e sulla ricompensa 3 (vedere (^)
ricompense come menzionato sopra.

** 1. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 2. ** Inserisci il ** Numero di sequenza ** per identificare la ricompensa.
** 3. ** distribuzioni Deseleziona il file. ** Per tutte le distribuzioni ** casella di controllo per indicare che questo premio non si applica a tutti i
** 4. ** Seleziona la ** Distribuzione promozionale ** appropriata a cui è collegata questa ricompensa.
** 5. ** Distribuzione per questo premio. Seleziona la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzare la promozione selezionata
** 6. ** Seleziona ** Tipo di ricompensa ** come "Percentuale".
** 7. ** Inserisci l '** importo ** da associare a un tipo di premio.


** 8. ** addebito per indicare l'account a cui inviare la posta. Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con


** 12 Promozione J **

## 12.1 Spendi> $ 1000, ottieni il 15% di sconto su un massimo di 15 articoli dal costo più basso ........................ 12.Promozione J

## voci di costo

`` `
Illustrazione 54: Promozione J: Finestra Promozione> scheda Promozione
`` `
### 12.1.1 Scheda Promozione .......................................... .................................................. ...............

** 1. ** Inserisci "Promozione 10" come nome della promozione **.
2. ** Promozione Inserisci "** Descrizione ** Acquista per $ 1000 o più e ottieni il 15% di sconto su un massimo di 15 articoli più economici". come la
** 3. ** Inserisci "10" come sequenza o ** Priorità relativa. **


`` `
Illustrazione 55: Promozione J: Finestra Promozione> scheda Condizione preliminare
`` `
### 12.1.2 Scheda Condizione preliminare ......................................... .................................................. ...........

** 1. ** Spunta la casella ** Attivo ** per indicare che la condizione preliminare è attiva.
** 2. ** Immettere "0" come ** sequenza **.
** 3. ** Seleziona il ** Business Partner ** a cui è applicabile la promozione. (Campo facoltativo)
** 4. ** Seleziona il ** Gruppo di partner commerciali ** appropriato a cui è applicabile la promozione. In questo caso
il gruppo di business partner da selezionare è "clienti standard".
** 5. ** Seleziona ** Listino prezzi ** come "Standard".
** 6. ** Seleziona ** Magazzino ** come "Magazzino HQ"
** 7. ** Inserisci il ** codice promozionale **. (Campo facoltativo) Se viene inserito un codice promozionale per la promozione,
quindi, al momento delle vendite, l'utente dovrà inserire lo stesso codice promozionale per completare l'ordine di vendita. che potrebbe avere prima
** 8. ** Il ** Contatore di utilizzo ** determina il numero di volte in cui è stata applicata una promozione. È letto-
campo solo / non modificabile.


** 9. ** Campo Limite di utilizzo, il sistema limiterà il numero di volte in cui una promozione può essere applicata a un ordine, a Immettere "0" come ** Limite di utilizzo ** o Numero di volte limite. Se è stato inserito maggiore di zero nel campo (^)
cliente o in generale.

** 10. ** Immettere "01/01/2009 00:00" come ** Data di inizio **.
** 11. ** Inserisci "12/31/2009 00:00" come ** Data di fine ** o Data di scadenza.
** Nota: ** solo entro un certo periodo di tempo. Il programma della promozione sopra (data di inizio e data di fine) serve a limitare l'applicazione di una promozione

`` `
Illustrazione 56: Promozione J: Finestra Promozione> scheda Condizione preliminare
`` `
### 12.1.3 Scheda Riga di promozione ......................................... .................................................. .........

** 1. ** Immettere "1000,00" come ** Ammontare minimo dell'ordine.
2. ** una riga di ordine che corrisponde alla definizione della riga di promozione, ad es. Selezionare la casella di controllo ** Riga di promozione obbligatoria ** per indicare che l'ordine di vendita deve contenere almeno $ 1000,00.

`` `
Illustrazione 57: Promozione J: Finestra Promozione> scheda Distribuzione quantità
`` `

### 12.1.4 Tab Distribuzione quantità ......................................... ..................................................

Abbiamo 3 distribuzioni secondo la Promozione 10.

** 1. ** Immettere "10" come ** sequenza.
2. ** Seleziona ** Linea promozionale ** come "1000.00".
** 3. ** Selezionare ** Operazione ** come "<=".
** 4. ** Inserisci "15" come ** Quantità **.
** 5. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 6. ** Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità.
** 7. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.
** 8. ** Fare clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova distribuzione.
** 9. ** Immettere "20" come ** sequenza.
10. ** Seleziona ** Linea promozionale ** come "1000,00".
** 11. ** Selezionare ** Operazione ** come "> =".
** 12. ** Inserisci "15" come ** Quantità **.
** 13. ** Seleziona ** Tipo di distribuzione ** come "Min".
** 14. ** del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità. Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
** 15. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.
** 16. ** Fare clic sul pulsante ** Nuovo ** Registra per aggiungere un'altra nuova distribuzione.
** 17. ** Immettere "30" come ** sequenza.
18. ** Seleziona ** Linea promozionale ** come "1000.00".
** 19. ** Selezionare ** Operazione ** come "> =".
** 20. ** Inserisci "0" come ** Quantità **.
** 21. ** Seleziona ** Tipo di distribuzione ** come "Max".
** 22. ** del loro prezzo e quindi raggrupparli in set in base alla specifica della quantità. Seleziona ** Ordinamento distribuzione ** come "Crescente". Il sistema riorganizzerà gli elementi in ordine crescente
** 23. ** Fare clic sul pulsante ** Salva ** per salvare i dettagli della distribuzione.


`` `
Illustrazione 58: Promozione J: Finestra Promozione> Scheda Ricompensa - Ricompensa 1
`` `
_..._


`` `
Illustrazione 59: Promozione J: Finestra Promozione> Scheda Ricompensa - Ricompensa 2
`` `
### 12.1.5 Scheda Ricompensa .......................................... .................................................. ...................

In questo esempio, dobbiamo offrire uno sconto del 15% su un massimo di 15 articoli più economici per le persone che acquistano $ 1000 o più

articoli $ 1000,00 <= importo acquisto <$ 2000,00). Pertanto la ricompensa 1 (vedere la figura 53a) e la ricompensa 2 (vedere il 15% di sconto su un massimo di 15 articoli più economici (che contiene la figura 53b) danno il 15% di sconto su più di 15 di (^)
gli articoli più economici (che le ricompense come menzionato sopra. contengono $ 1000,00 <= Importo dell'acquisto> = $ 2000,00). Di seguito sono riportati i passaggi per l'installazione

** 1. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 2. ** Inserisci "10" come ** Numero sequenza ** per identificare la ricompensa.
** 3. ** distribuzioni Deseleziona il file. ** Per tutte le distribuzioni ** casella di controllo per indicare che questo premio non si applica a tutti i
** 4. ** Seleziona la ** Distribuzione promozionale ** appropriata a cui è collegata questa ricompensa. In questo caso il file
La promozione della distribuzione da selezionare è "1000.00 - <= 15".
** 5. ** Distribuzione per questo premio. Seleziona la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzare la promozione selezionata
** 6. ** Seleziona ** Tipo di ricompensa ** come "Percentuale".


** 7. ** del 15% per Inserisci l'elemento ** Importo ** acquistato e valido da associare a un tipo di premio. fino a 15 articoli **. ** In questo caso dobbiamo applicare lo sconto massimo
** 8. ** Inserisci "0" come ** Quantità **.
** 9. ** addebito per indicare l'account a cui inviare. Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con
** 10. ** Fai clic sul pulsante ** Salva ** per salvare i dettagli del premio.
** 11. ** Fai clic sul pulsante ** Nuovo ** Registra per aggiungere un altro nuovo premio.
** 12. ** Seleziona la casella di controllo ** Attivo ** per indicare che la ricompensa è attiva.
** 13. ** Inserisci "20" come ** Numero sequenza ** per identificare la ricompensa.
** 14. ** distribuzioni Deseleziona il file. ** Per tutte le distribuzioni ** casella di controllo per indicare che questo premio non si applica a tutti i
** 15. ** Promuovere la distribuzione Selezionare l'appropriato da selezionare è "1000.00 -> = 15" ** Promuovere la distribuzione ** a cui è collegata questa ricompensa. In questo caso. il
** 16. ** Selezionare la casella di controllo ** Stessa distribuzione per origine e destinazione ** per utilizzare la promozione selezionata
Distribuzione per questa ricompensa.
** 17. ** Seleziona ** Tipo di premio ** come "Percentuale".
** 18. ** Inserisci l '** Importo ** da associare a un tipo di premio. In questo caso dobbiamo applicare lo sconto massimo
del 15% per ** articoli. ** articolo acquistato e valido per più di 15 articoli ** per persone che acquistano $ 2000,00 o più dei
19. ** Immettere "0" come ** Quantità **.
** 20. ** Seleziona ** Addebita ** come "Sconti promozionali". Al momento dei saldi, la riga di sconto verrà creata con
addebito per indicare l'account a cui inviare la posta.
** 21. ** Fai clic sul pulsante ** Salva ** per salvare i dettagli del premio.


** 13 uffici e contatti di Adaxa **

Informazioni di carattere generale su Adaxa e i suoi servizi possono essere trovate su [http://www.adaxa.com] (http://www.adaxa.com) o ottenute da
inviando una mail a info@adaxa.com con la descrizione delle informazioni che vorresti ricevere. Se
sei un cliente esistente e desideri avviare una richiesta di supporto software, invia un'e-mail a
helpdesk@adaxa.com con il maggior numero di dettagli possibile sulla natura della tua richiesta di supporto.
Per tutte le altre informazioni contatta l'ufficio Adaxa più vicino a te.

## 13.1 Australia

`` `
Indirizzo: 10 Kylie Place, Melbourne, Victoria, 3192, Australia
Contatti: Office
`` `
- 1300990120 (in Australia)
- +613 9510 4788 (fuori dall'Australia)

## 13.2 Nuova Zelanda ............................................. .................................................. ...................

`` `
Indirizzo: 73 Boston Road, Mt Eden, Auckland, 1023, Nuova Zelanda
Contatti: Office
`` `
- 0800 232 922 (in Nuova Zelanda)
- +649 9744600 (fuori dalla Nuova Zelanda)

## 13.3 Stati Uniti d'America ........................................... .................................................. ..

`` `
Indirizzo: 4400 NE 77th Ave, Suite 275, Vancouver, WA 98662, USA
Contatti: Office
`` `
- +1 760 576 5115


