---
title: "Setup macchina x Cliente"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 1400
pre: "<b>40. </b>"
---


# Come creare una macchina x il Cliente step by step

## 1) Fare il Backup della macchina Template

Su Proxmox: 'Macchina Template > Backup > Backup Now > spuntare Stop'
 
## 2) Creare la nuova macchina usando il Backup del template

- Sulla macchina contabo andare su /var/lib/vz/dump/
- 'mv NOMEFILEBACKUP template_42.tar.lzo'
- 'pct restore NUMEROMACCHINA template_42.tar.lzo --bwlimit 20480'

## 3) Cambiare nome container + IP

- 'pct set NUMEROMACCHINA -net0 name=eth0,bridge=vmbr0,ip=192.168.0.x/24,gw=192.168.0.254'
- 'pct set NUMEROMACCHINA -hostname db-id-NOMECLIENTE'

## 4) Cambiare hostname di Idempiere

- ssh nella macchina nuova
- 'ps -aux | grep daemon_'
- 'kill NUMEROPROCESSO'
- 'ps -aux | grep idempiere'
- 'kill NUMEROPROCESSO'
- 'ps -aux | grep idempiereTest'
- 'kill NUMEROPROCESSO'
- cd /opt/idempiere/idempiere-server
- './console-setup.sh'
- modifico solo hostname in : db-id-NOMECLIENTE
- cd /opt/idempiere/idempiere-Test
- './console-setup.sh'
- modifico solo hostname in : db-id-NOMECLIENTE

## 5) Sincronizzare il Database

- cd /opt/idempiere/idempiere-server/utils/
- ./RUN_SyncDB.sh 

## 6) Riavvio + Backup programmato

- 'crontab -e'
- scommento riavvo + backup e imposto l'ora desiderata

## 7) Cambiare nome su idempiere da DEMO a NOMECLIENTE
- nano setup_Idempiere.sh
- modifico i dati del cliente e salvo
- ./setup_Idempiere.sh

## 7) Reboot della macchina




