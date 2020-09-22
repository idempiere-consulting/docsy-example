
---
title: "Plugin Alexa"
linkTitle: "Documentation"
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

2)Incollare il token ottenuto in risposta sul header + scrivere il json che si vuole inviare nel BODY della chiamata ( il json creato nell'immagine è solo d'esempio)
[{{< figure src="/image/Alexa02.png" >}}](/image/Alexa02.png)

3)Fare la chiamata GET/POST su '/services/api/idempierepara/web/search/NOMECHIAMATA'
[{{< figure src="/image/Alexa03.png" >}}](/image/Alexa03.png)

## Consiglio:
Usare il sito 'webhook.site' per testare il ricevimento e la riuscita delle chiamate get/post

#
