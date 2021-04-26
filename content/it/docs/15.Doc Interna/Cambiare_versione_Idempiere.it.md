---
title: "Cambiare versione di Idempiere"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 1400
pre: "<b>40. </b>"
---

# Come cambiare versione di Idempiere su una macchina Cliente step by step

- 'ps -aux | grep daemon_'
- 'kill NUMEROPROCESSO'
- 'ps -aux | grep idempiere'
- 'kill NUMEROPROCESSO'
- 'ps -aux | grep idempiereTest'
- 'kill NUMEROPROCESSO'

## 1) Copiare Idempiere_8.zip su opt/idempiere

## 2) Rinomino le cartelle idempiere-server e idempiere_test aggiungendo _7_OLD alla fine

## 3) unzip di Idempiere_8.zip, copio la cartela idempiere-server estratta e la rinomino idempiere-idempiere_test

## 4) Cambio hostname di Idempiere

- cd /opt/idempiere/idempiere-server
- './console-setup.sh'
- modifico solo hostname in : db-id-NOMECLIENTE
- cd /opt/idempiere/idempiere-Test
- './console-setup.sh'
- modifico solo hostname in : db-id-NOMECLIENTE
- cd opt/idempiere/idempeire-server/utils/
- ./RUNSyncDB.sh
