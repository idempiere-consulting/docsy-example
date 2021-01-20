---
title: "Addon Access Mantain [A.AMA.STD00]"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 15
pre: "<b>720. </b>"
---

[Vai alla Pagina Di Installazione]({{< ref "AccessMaintain[AMA00].md" >}} "Installazione Addon Access Mantain")

- https://wiki.idempiere.org/en/Plugin:_AccessMaintain

Link Video https://youtu.be/4UYGWHonl34 [V188]

Installare il 2Pack presente nel plug-in e ricordarsi di creare il "tipo entità" **'TGI'** a livello System 


## Descrizione
Il plugin "Access Maintain" aiuta a mantenere i record delle tabelle di accesso, basta aggiungere un processo.

Quando si aggiunge un processo / finestra, è necessario inserirlo anche in ogni tenant
{{< figure src="/image/AccMT.png"  width="850"  >}}
per aggiungerlo (se necessario) ai ruoli manuali, per disattivarlo (se necessario) a ruoli "non manuali"<br>
che richiede molto tempo.

Bisogna creare un pannello che consente di aggiornare tutte le tabelle. "Access" da un accesso di sistema (puoi interagire con tutti i tenant) o da un tenant > 0 (e lì interrompi solo i ruoli di questo tenant).

Seleziona il tipo (processo / finestra / finestra informativa / ...) e poi il record (es: <il tuo ultimo processo creato>) - puoi filtrare l'elenco usando il nome o creato Puoi filtrare i record usando il nome del cliente o del ruolo e / o vedi solo ruolo con accesso / senza accesso / con accesso attivo / tutto.

Quindi puoi vedere i record dalla tabella di accesso e scegliere di aggiungerli / eliminarli / attivarli / disattivarli.

Quando si preme il pulsante "Process", genera ed esegue l'SQL diretto per inserire / eliminare / aggiornare i record nella tabella.
