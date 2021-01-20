---
title: "Addon Limit Concurrent Sessions [A.LCS.STD00]"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 75
pre: "<b>720. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "LimitCon.Ses[LCS00].md" >}} "Installazione Addon Limit Concurrent Sessions")

## Descrizione
Questo plug-in consente agli amministratori di limitare il numero di utenti in sessioni simultanee per tenant.<br><br>
Come funziona?<br>
Dopo che l'utente ha effettuato l'accesso, il plug-in verifica se è stato raggiunto il numero massimo di utenti in sessioni.<br>
In caso affermativo, viene visualizzato un messaggio di "non accesso" è l'utente torna alla pagina di Log-in.

## Installazione
Una volta installato il plug-in, ecco i passaggi da eseguire:<br>
Vai a tutte le organizzazioni / ruoli / utenti e disabilita la casella di controllo, se necessario.
Abilita la funzionalità per ogni tenant (dalla finestra del client) selezionando "Limita il numero di sessioni simultanee" e imposta la sessione massima e il messaggio di errore.
