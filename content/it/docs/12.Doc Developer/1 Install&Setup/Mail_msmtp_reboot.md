---
title: "Setup mail via terminale per alert "
date: 2020-09-21T16:37:10+02:00
draft: false
weight : 100
pre: "<b> </b>"

---

## Setup mail

lo scopo di questa guida è quello di configutrare un sistema di MTA (mail transfer agent) 
per poter notificare via mail eventi "interessanti", nel caso specifico tratteremo il reboot
della macchina 

### installazione

- installiamo il pacchetto `msmtp` che andrà a sostituire l'ormai obsoleto `smtp`
```
apt install msmtp msmtp-mta 
```
- abilitiamo il servizio al boot
```
 systemctl enable msmtpd.service 
```
- avviamolo (senza riavviare il server)
```
service msmtpd start
```
- verifichiamo che abbia agganciato il server correttamente
```
msmtp --serverinfo
```
###  configurazione

- configuriamo l'utente che userà il servizio
creiamo (```msmtp --configure user@mail.server```) o modifichiamo il file  ~/.msmtprc 
```
# Set default values for all following accounts.
defaults
port 587
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
auth on
tls_starttls on

account root
host send.one.com
logfile ~/.msmtp.root.log
from root@idempiere.consulting
password r@@tidempiere18
domain idempiere.consulting
user root@idempiere.consulting

#account altroaccount
#host server.mail.qualsiasi.com
#logfile ~/.msmtp.altroaccount.log
#from mioutente1@mioserver.di.posta.com
#password &%$£%%%%&&&/(()(/
#domain mioserver.di.posta.com
#user mioutente1[@mioserver.di.posta.com] <-----attenzione a come lo vuole il server


# Set a default account
account default : root

```
la prima parte è comune ai possibili più account configurati
la seconda è "account-specifica"
l'ultima indica banalmente quale sarà l'utente da usare di default

- testiamo il servizio da riga di comando:
```
echo "Subject: $(hostname) was rebooted at: $(date +%m.%d.%Y.%H.%M)" | msmtp user@mail.server
```
  con l'opzione -a posso specificare un utente alternativo
```
echo "Subject: $(hostname) was rebooted at: $(date +%m.%d.%Y.%H.%M)" | msmtp -a altroaccount user@mail.server
```

### alert on reboot

(NOTA: Da debian Jessie  il sistema di avvio tramite ```init``` è deprecato in favore di ```SystemD``` ma 
siccome il compito è molto semplice è più "comodo" creare il servizio alla vecchia maniera e convertirlo poi, quindi:
- creiamo lo script che invierà la mail di alert  ```/etc/init.d/mail_on_reboot.sh```

```
#!/bin/bash

echo "Subject: $(hostname) was rebooted at: $(date +%m.%d.%Y.%H.%M)" | msmtp -a root user@mail.server

# ovviamente qui posso inserire tutte le informazioni che voglio inviare per esempio usando un here-document
# VAR1=$(date)
#
# cat >testo.mail << EOF
# Subject: $HOSTNAME was rebooted at $var1
# qui inserire il testo della mail
# 
# EOF
# ma poi devo usare il comando
#
# cat testo.mail | msmtp -a root user@mail.server
```
(NOTA: attenzione che se le mail non arrivano magari sono finite nella spam)

- lo rendiamo eseguibile con il solito:
```
chmod u+x mail_on_reboot
```
- verifichiamo il corretto funzionamento dello script eseguendolo:
```
/etc/init.d/mail_on_reboot
```

poi notifichiamo il sistema del nuovo servizio inserito:
```
update-rc.d mail_on_reboot defaults
```
lo impostiamo come avviabile al boot
```
systemctl enable mail_on_reboot
```
Qui potrebbe generarsi un errore a causa del fatto che non abbiamo creato la unit systemD ma 
non inficerà la funzionalità del servizio

- avviamo il servizio appena creato (per proseguire con i test):
```
service mail_on_reboot start
```

- il test finale è un riavvio della macchina:
```
reboot
```

(NOTA: avremmo potuto usare il tag @reboot nel file crontab ma ci saremmo persi l'eventualità che noi vogliampo intercettare
cioè il riavvio da chiusura brutale o crash e non via comando normale)












