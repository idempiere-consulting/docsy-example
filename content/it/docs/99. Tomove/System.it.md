---
title: "Sicurezza"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10000
pre: "<b></b>"
---


# Utente

## - Come creare un Utente

Nella barra di ricerca digitiamo "Utente[UT00]", dopo di che creiamo un Nuovo Record per poi andare ad inserire tutti i dati del nuovo Utente, Nome, EMail e password, Password di login...

## - Assegnazione Ruolo

Bisogna assegnare un ruolo al nuovo Utente, senza, la login non sarà possibile.

Nella Tab "Ruoli Utente" andiamo a creare un Nuovo Record, poi andiamo a selezionare il ruolo che vogliamo assegnare all'utente.

![Immagine](/image/04.SelezioneRuolo.png)


## Ruolo 
-------------------------------------------
SESSIONE PER I RUOLI - RIASSUNTO SESSIONE - giorno 24/01/2019---
-------------------------------------------
a)	Esiste un Flag MANUALE si/no que definisce un ruolo appunto MANUALE o AUTOMATICO
b)	I ruoli manuali sono creati senza permessi, un utente al quale si associa un ruolo manuale al quale non e' stato aggiunto nessun permesso, non avrebbe acesso a nulla.
c)	Un ruolo creato come automatico e' paragonabile per permessi al ruolo di default ADMIN.
d)	Nel ruolo automatico il sistema "appende" i permessi anche di tutti gli oggetti creati successivmanete alla sua creazione.
e)	Per dare accesso a tutte le organizzazioni esiste un flag (Accede a tutte le org) in testata al ruolo, togliendo il flag si possono assegnare le organizzazioni desiderate in riga a livello dettaglio.
f)	Mostra Contabilita e Mostra Advanced Access in testata al ruolo sono due metodi efficaci per limitare o dare accesso ad un determinato ruolo, appunto alla Contabilita' e a tutte le finestre/funzioni definite a sistema come "Avanzate"
g)	Un ruolo definito come "Padre" e' un ruolo al quale si possono attribuire un SET di permessi specifici da poi riutilizzare in seguito attribuendoli ad un altro ruolo "normale" (per esempio un ruolo chiamato "Magazziniere" con acesso a windows "magazzino" inserendola nella tab "Accesso Finestra" - nello stesso luogo potrei definire l'accesso anche in sola lettura)
h)	Un ruolo non "Padre" e' di fatto un ruolo "normale". Ai ruoli normali puoi attribuire 1 o piu' ruoli "Padre" (da tab "Includi Ruoli").
i)	"Vuoi impostare di default una Customizzazione della Tab Utente?" e' una domanda che appare dopo la creazione di un utente nuovo e serve per riordinare in maniera migliorata le tab (personalizzazione IC)
h)	In testata ruolo troviamo altri flag rilevanti come: Puo' stampare, Puo' Esportare che si spiegano da soli.
l)	Dalla finestra "Ruolo access" posso attribuire ad un ruolo Padre dei permessi "negativi" ossia di rimozione di diritto, o come viene mostrato in dettaglio riga "Escluso". Esempio posso inserire nel dettaglio "Accesso Tabella" una riga con Tabella "c_invoice" e selezionare "Escluso". Questo ruolo attribuito ad un ruolo normale, andra' a rimuovere il diritto di accesso al utente con quel specifico ruolo. 
m)	Discorso identico al punto (l) puo' essere fatto per il tab "Accesso Colonna", ovviamente per quanto riguarda rimuovere accessi a colonne.


### Video - 1. SystemAdmin - Copy preference Grid / Copia Impostazioni Griglia [V001]
{{<youtube zHEWwTlVwFI>}}

## Riabilità Utente Bloccato [RUB00]

Per riabilitare un utente bloccatto per troppi fallimenti di accesso è possibile farlo dalla seguente maschera 

[{{< figure src="/image/UtenteRiabilita.png"  width="850"  >}}](/image/UtenteRiabilita.png)



## Descrizione:



Possiamo modificare la nostra Hompage iniziale a proprio piacimento modificando le immagini, icone e le loro posizioni (ovviamente per modificare la posizione e lo stile dovremo modificare il file .css)


Il Task da System  ( dopo l'installazione di Initial Client Setup)

/opt/repos/idempiere-download/tasksystem/HomeProperties.sh 

copia la directory /opt/repos/idempiere-download/tasksystem/HomeProperties/ 

nel server .

## Note di modifica

### Video - 1. SystemAdmin-Alert [V089]
{{<youtube URBB2k0ATu0>}}

### Video - 1.System Admin Alert Esempio Prodotto Deperibile se Termini di Pagamento   30 [V123]
{{<youtube r8Etz6tY854>}}

### Video - 1. System Admin - Addon #1472 Image on Grid / Gestione Immagini su Griglia [V168T]
{{<youtube G0hbmdoq8r8>}}


### Video -  1. System Admin - Developer - Help Context Link / Sviluppo Aiuto Contestuale [V049]
{{<youtube KeidiuQYSOo>}}


