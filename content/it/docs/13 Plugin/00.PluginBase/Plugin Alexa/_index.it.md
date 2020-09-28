---
title: "Plugin Alexa"
linkTitle: "Plugin Alexa"
weight: 20
menu:
main:
weight: 20
--- 



# Prerequisiti:

- Account Amazon: (info@idempiere.consulting --- password: Idempiere01)
- Account Amazon AWS: (info@idempiere.consulting --- password: Idempiere01)
- Alexa App sul telefono registrata con l'account info@idempiere.consulting
- Alexa echo fisica
- Aver finito il tutorial offerto dal sito di creazione delle skill alexa (è completo e facile da seguire)


# Come fare una chiamata ad una rest api su idempiere:

Utilizzare  axios per node.js (ricordarsi di dichiarare il nome e la versione del pacchetto su packet.json)

1)Fare una chiamata post in cui vengono inviate le credenziali di accesso a '/services/api/auth/login'
[{{< figure src="/image/Alexa01.png" >}}](/image/Alexa01.png)

2)Incollare il token ottenuto in risposta sul header + scrivere il json che si vuole inviare nel BODY della chiamata (il json creato nell'immagine è solo d'esempio)
[{{< figure src="/image/Alexa02.png" >}}](/image/Alexa02.png)

3)Fare la chiamata GET/POST su '/services/api/idempierepara/web/search/NOMECHIAMATA'
[{{< figure src="/image/Alexa03.png" >}}](/image/Alexa03.png)

# Come esportare il lato 'Build' di una skill:
- build > 'JSON EDITOR' nel menù verticale a sinistra > copiare il json in un file

# Come importare il lato 'Build di una skill:
- build > 'JSON EDITOR' nel menù verticale a sinistra > trascinare il file json su 'drag and drop json file' > 'save build' > 'build model'

## Consiglio:
Usare il sito https://webhook.site per testare il ricevimento e il funzionamento delle chiamate GET/POST

# Troubleshooting:

- Per testare la skill con l'Alexa echo: Alexa app > 'Altro' > 'Skill e Giochi' > 'Le tue Skill' > 'Sviluppatore' > seleziona la skill > 'abilita la skill'.
- E' obbligatorio che l'app alexa sia registrata sotto l'account developer amazon per testare una  skill propria non ancora pubblicata, in caso contrario è necessario resettare l'app per registrare una mail nuovamente.
- Assicurarsi che Alexa sia connessa ad una rete wi-fi/Hotspot. In caso di riavvio di queste reti, potrebbe essere necessario riconfigurare la connessione a queste tramite l'app Alexa.
- Al triggeramento di un intento all'interno della skill, uno slot inutilizzato nella frase ma preso ugualmente tramite 'Alexa.getSlotValue' nel codice ha valore undefined
- Se si cercano esempi di skill visitare https://alexa.design/cookbook

# Case Study iDempiere Consulting Progetto attuale:


[{{< figure src="/image/Alexa-Excel-03.png" >}}](/image/Alexa-Excel-02.png)


## MODELLO INSERIMENTO TASK APERTURA FINESTRE

[{{< figure src="/image/Alexa-Task.png" >}}](/image/Alexa-Task.png)

### Parole accettate dallo slot {name}:
[{{< figure src="/image/Alexa-NameType.png" >}}](/image/Alexa-NameType.png)

### Parole accettate dallo slot {number}:
- qualsiasi numero fino a 4 cifre

### Parole accettate dallo slot {letter}:
- qualsiasi lettera dell'alfabeto

### Esempio frase valida:
- Apri la pagina ordine
- dammi la pagina ordine 82 V

## MODELLO INSERIMENTO TASK APERTURA INFO
[{{< figure src="/image/Alexa-Info.png" >}}](/image/Alexa-Info.png)

### Parole accettate dallo slot {NameInfo}:
[{{< figure src="/image/Alexa-InfoType.png" >}}](/image/Alexa-InfoType.png)

### Esempio frase valida:
- Apri la info crea ddt

## MODELLO DI APERTURA TASK INSERIMENTO ORE/APPUNTAMENTI
[{{< figure src="/image/Alexa-HourInsert01.png" >}}](/image/Alexa-HourInsert01.png)

### Parola accettata dallo slot {time}
-  qualsiasi tipo di unità di tempo ( es: 1 ora e cinque minuti)


### Parola accettata dallo slot {intention}
[{{< figure src="/image/Alexa-IntentionType.png" >}}](/image/Alexa-IntentionType.png)

### Parola accettata dallo slot {bpName}
[{{< figure src="/image/Alexa-bpType-01.png" >}}](/image/Alexa-bpType.png)



### Parola accettata dallo slot {ora}
- ora
- 18 e 45
- mezzogiorno

### Parola accettata dallo slot {dipendente} (viene chiesto da alexa quando richiedi l'inserimento ore/appuntamento):
[{{< figure src="/image/Alexa-EmployeeType.png" >}}](/image/Alexa-EmployeeType.png)

### Esempio frase valida:
- Segna 1 ora di telefonata con morgera ora
- Segna appuntamento con il Pane oggi 16 e 55

## MODELLO DI APERTURA TASK INSERIMENTO APPUNTAMENTI
[{{< figure src="/image/Alexa-Appointment.png" >}}](/image/Alexa-Appointment.png)

### Parola accettata dallo slot {bpName}
[{{< figure src="/image/Alexa-bpType-01.png" >}}](/image/Alexa-bpType.png)

### Parola accettata dallo slot {data}
- oggi, domani, ieri
- il due settembre

### Parola accettata dallo slot {ora}
- ora
- 18 e 45
- mezzogiorno

### Esempio frase valida:
- segna appuntamento
- Segna appuntamento con il Pane oggi 16 e 55





