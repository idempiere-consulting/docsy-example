---
title: "Richiesta / Ticket"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 200
pre: "<b></b>"
---
Menù Idempiere
- Anagrafica e Processi

[Richesta / Ticket [TIK00]]({{< ref "_index.it.md#TIK00" >}} "Richesta / Ticket") <br>
[Richiesta Tutto [RICT00]]({{< ref "_index.it.md#RICT00" >}} "Richiesta Tutto") <br>
[Risoluzione Richiesta [RR01]]({{< ref "_index.it.md#RR01" >}} "Risoluzione Richiesta") <br>
[Risposta Standard Richiesta [RSR00]]({{< ref "_index.it.md#RSR00" >}} "Risposta Standard Richiesta") <br>
[Riaprire Richiesta [RR03]]({{< ref "_index.it.md#RR03" >}} "Riaprire Richiesta") <br>
[Fattura per richiesta [FR00]]({{< ref "_index.it.md#FR00" >}} "Fattura per richiesta") <br>

- Report

- Tabelle e setup

[Configurazione richiesta [CR00]]({{< ref "_index.it.md#CR00" >}} "Configurazione richieste") <br>
[Tipo Richiesta [TR01]]({{< ref "_index.it.md#TR01" >}} "Tipo Richiesta") <br>
[Gruppo Richiesta [GR00]]({{< ref "_index.it.md#GR00" >}} "Gruppo Richiesta") <br>
[Categoria Richiesta [CR01]]({{< ref "_index.it.md#CR01" >}} "Categoria Richiesta") <br>
[Stato Richiesta [SR00]]({{< ref "_index.it.md#SR00" >}} "Stato Richiesta") <br>

- Funzionalità avanzate


## Ticket [TIK00] {#TIK00}
La maschera permetta la compilazione di un ticket. In corpo del ticket, nel corso del suo procedere verranno salvate le varie azioni apportate.
[{{< figure src="/image/TicketTIK00.png"  width="850"  >}}](/image/TicketTIK00.png)
Si possono ad esempio gestire nuovi Clienti e gestire in modo preciso e facilmente rivedibile tutta la cronistoria delle varie azioni schedate.
[{{< figure src="/image/Ticket.png"  width="850"  >}}](/image/Ticket.png)
Si dovrà procedere con il definire dei Tipi di Richiesta in base alla operazione che si vuole definire (esempio). 
[{{< figure src="/image/TipoRichiesta.png"  width="850"  >}}](/image/TipoRichiesta.png)
E all'interno della richiesta definire uno "stato" della stessa.
[{{< figure src="/image/StatoRichiesta.png"  width="850"  >}}](/image/StatoRichiesta.png)

## Richiesta Tutto [RICT00] {#RICT00}
La maschera permette di visualizzare qualsiasi informazione relativa ad un determinato Ticket in oggetto, le eventuali azioni apportate fatture a fronte, ecc.
[{{< figure src="/image/RichiestaTutto.png"  width="850"  >}}](/image/RichiestaTutto.png)

### Nota bene
```
Visualizza e lavora su tutte le richieste
Questa window "Request (All) " viene utilizzata per visualizzare tutte le richieste disponibili.
La scheda Richiesta definisce qualsiasi richiesta inviata da un Business Partner o internamente.
```
### Le richieste sono differenti dalle email
```
- Le email sono private e informative (alcune azioni)
- Le richieste sono pubbliche e oriente all’azione
```
---
## Risoluzione Richiesta [RR01] {#RR01}
La maschera permette di generare delle risposte o modalità operative per la risoluzione alla richiesta di un Ticket. 
[{{< figure src="/image/RisoluzioneRichiesta.png"  width="850"  >}}](/image/RisoluzioneRichiesta.png)
## Risposta Standard Richiesta [RSR00] {#RSR00}
La maschera permette di generare delle definizioni standardizzate per la risoluzione alla richiesta di un Ticket.
[{{< figure src="/image/RispostaStandardRichiesta0.png"  width="850"  >}}](/image/RispostaStandardRichiesta0.png)
Naturalmente questa maschera ritorna utile nelle richieste di routine ad esempio una compilazione di una scheda dati nuovo cliente quando esista.
[{{< figure src="/image/RispostaStandardRichiesta.png"  width="850"  >}}](/image/RispostaStandardRichiesta.png)
## Riaprire Richiesta [RR03] {#RR03}
Il processo permette la riapertura di una richiesta già ultimata.
[{{< figure src="/image/RiaprireRichiestaRR03.png"  width="850"  >}}](/image/RiaprireRichiestaRR03.png)
##  Fattura per richiesta [FR00] {#FR00}
Il processo permette di generare fattura a fronte di richieste.
[{{< figure src="/image/FatturaRichiestaFR00.png"  width="850"  >}}](/image/FatturaRichiestaFR00.png)

# Setup Richieste
## Configurazione richiesta [CR00] {#CR00}
Nello schema si vedono gli step delle richieste.
[{{< figure src="/image/ConfigurazioneRichieste.png"  width="850"  >}}](/image/ConfigurazioneRichieste.png)
### Gestione delle Request
Per gestire le richieste è fondamentale inserire i dati Host, Smtp, ecc... nella window "Client" (mittente della mail)
[{{< figure src="/image/Request4.png"  width="850"  >}}](/image/Request4.png)
Vediamo altre informazioni che devono essere necessarie per l'invio della mail (destinatario della mail/notifica)
[{{< figure src="/image/Request8.png"  width="850"  >}}](/image/Request8.png)
### Creazione delle Request
```
1) Creare una Richiesta dalla window "Richiesta" (Request)
2) Creare una Richiesta da quasi documento (es:Sales Order, Purchase Order, Resource 	   	  Attendance,.....)
```
[{{< figure src="/image/Request1.png"  width="850"  >}}](/image/Request1.png)
Creiamo la Richiesta legata a questo Ordine di Vendita e vediamo tutte le informazioni:
[{{< figure src="/image/Request2.png"  width="850"  >}}](/image/Request2.png)
Vediamo adesso la maschera "Tipo di Richiesta"
[{{< figure src="/image/Request6.png"  width="850"  >}}](/image/Request6.png)
Dopo aver creato la Request possiamo vedere che c’è una richiesta aperta legata a quest’ordine
[{{< figure src="/image/Request5.png"  width="850"  >}}](/image/Request5.png)

### Fatturazione delle Request
Andiamo adesso a Fatturare le Richieste.
Per poter fatturare le richieste è importante che:
```
- il login avvenga con organizzazione ≠ * (la fattura viene creata con Organizzazione con   cui accediamo e non può essere *)
- la Richiesta (Request) abbia il flag impostato su Fatturato='Y'
- il Tipo di Richiesta associato alla Richiesta da Fatturare abbia il flag impostato su     Fatturato='Y'
- lo stato della Richiesta sia "CLOSED"
- le righe della richiesta (Tab Aggiornamenti) abbia una o più righe con Quantità           Fatturata ≠ 0
```
Da menù andiamo nel Processo "Fattura per Richieste" ed inseriamo i dati che ci interessano (unico dato obbligatorio è Tipo Richiesta)
[{{< figure src="/image/Request7.png"  width="850"  >}}](/image/Request7.png)
Dopo aver completato la nostra fattura è stata generata con successo
[{{< figure src="/image/Request3.png"  width="850"  >}}](/image/Request3.png)
## Tipo Richiesta [TR01] {#TR01}
La maschera permette di generare il tipo di richiesta.
[{{< figure src="/image/TipoRichiesta0.png"  width="850"  >}}](/image/TipoRichiesta0.png)
## Gruppo Richiesta [GR00] {#GR00}
La maschera permette di generare un raggruppamento in base alle esigenze delle richieste.
[{{< figure src="/image/GruppoRichiesta0.png"  width="850"  >}}](/image/GruppoRichiesta0.png)
## Categoria Richiesta [CR01] {#CR01}
La maschera permette di generare la categoria della richiesta.
[{{< figure src="/image/CategoriaRichiesta0.png"  width="850"  >}}](/image/CategoriaRichiesta0.png)
## Stato Richiesta [SR00] {#SR00}
La maschera permette di generare i tipi di stato della richiesta.
[{{< figure src="/image/StatoRichiesta0.png"  width="850"  >}}](/image/StatoRichiesta0.png)




