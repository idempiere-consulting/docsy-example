---
title: "System Ansible"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 500
pre: "<b>512. </b>"
--- 

# IDEMPIERE-ANSIBLE TASK

automatizzare la gestione dell’infrastruttura in modo umano

## Come si faceva prima

Un tecnico ha la profonda conoscenza dello stato di tutte le macchine sotto il suo controllo e una ad una o tramite strumenti professionali una volta giustamente configurati e mantenuti aggiornati, procede allo svolgimento del compito assegnato

## Come lo facciamo noi

Diventa banale fare una cosa che era rivolta ad un pubblico estremamente specializzato in tempi ridotti in modo esponenziale, semplicemente compiliamo un form con i dati necessari, cioè cosa voglio fare e popoliamo la lista degli host su cui voglio eseguirle.

## Componenti principali

Il sistema di gestione è, come ben chiaro dal titolo, Ansible, uno strumento per il controllo da remoto delle macchine.

Questo tool necessita per prima cosa di un elenco di macchine che esso dovrà raggiungere, via ssh, questo elenco è l’inventory.

Quello che vogliamo che Ansible faccia possiamo indicarlo one-shot da riga di comando, ovviamente procedure molto semplici causa la limitatezza della “risorsa”, oppure salvare le procedure in playbook, raccolte di play specifici ad un host/gruppo, ognuno composto da uno o più task, unità minima di elaborazione di ansible, che possono anche essere salvati in singoli file e quindi richiamati.

L’interfaccia è una maschera di iDempiere che raccoglie tutto ciò che è necessario indicare per eseguire le procedure volute e, naturalmente, sulla quale riceveremo le informazioni, o gli eventuali errori, del task in esecuzione.

Questa intefaccia si appoggia su una struttura di tabelle nelle quali vengono salvati i dati importanti per tutte le elaborazioni:

\- Ansible Host: 

\- Ansible Node

\- Ansible Group

\- Ansible Host Object

\- Plugin

\- Plugin Version

\- Ansible Action (già tipo_file)

In base all’ Ansible Action scelta dovremo compilare campi diversi o in diverso modo:


- SQL command: (Esegue un comando SQL, unico campo necessario è `IstruzioneSQL`, in realtà per questo bisogna creare una voce apposita)

  Esegue il SQLstatemenet sostituendo le variabili (@variabile@) con i valori recuperati nella select indicata nel campo superiore (clausola select)


- JAR: Installa/aggiorna (rimuove?) il/i plugin in allegato, se abbiamo più plugin assieme allora li devo allegare direttamente nella finestra principale altrimenti dall’apposito campo scelgo la versione ed in essa sarà caricato il file; questa Action funziona in due tempi (determinati dal flag `install` nella riga del singolo host):  

  1.  retrive(install= N): riporta, nella riga `descrizione` del singolo host, la versione del/i plugin allegati oppure ‘plugin assente’ ( o malauguratamente un errore)
  2.  install(install= Y): usando le info ottenute al primo giro esegue `l’installazione/update (remove?)`
  
  al termine del secondo giro, se impostato il flag restart, riavvia la macchina.
  ATTENZIONE: al momento non è certo il funzionamento con più plugin assieme o se si ritenta dopo un errore con la "sdescrizione" sporca dei messaggi precedenti


- 2 Pack: esegue il Packin del packout allegato alla finestra principale.
  posso anche allegare più packin contemporaneamente, nella linea dell'host posso scegliere anche il client su cui installare, devo scegliere però tra le due action: 2Pack System e 2Pack client
- PROXMOX: (in lavorazione) esegue il restore di un container sugli host indicati
- SHELL script: TBD

Per tutti vale la regola che nel campo descrizione del singolo host otteremo i risultati specifici del task (o gli errori relativi all’host)  mentre in ‘elabora messaggio’ gli eventuali errori generali.





 