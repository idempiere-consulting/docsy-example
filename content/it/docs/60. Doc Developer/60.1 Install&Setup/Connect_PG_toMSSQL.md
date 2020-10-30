---
title: "Connessione di MSSQL da Popstgres, db di frontiera "
date: 2020-10-01T16:37:10+02:00
draft: false
weight : 110
pre: "<b> </b>"

---

## Setup mail

lo scopo di questa guida è quello di collegare un database MSSQL al nostro db Postgresl in modo da poter scrivere sul primo tramite il secondo (db di frontiera)

## prerequisiti

- corretta configurazione di rete per permettere l'accesso dei due db
- le tabelle comunicanti devono contenere gli stessi campi e dello stesso tipo
- mappare i ruoli dei due db

