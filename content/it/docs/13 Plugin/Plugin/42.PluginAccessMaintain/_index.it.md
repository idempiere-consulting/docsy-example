---
title: "Plugin AccessMaintain"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---


- https://wiki.idempiere.org/en/Plugin:_AccessMaintain


Installare il 2Pack presente nel plug-in e ricordarsi di creare il "tipo entità" **'TGI'** a livello System 


## Descrizione

[TRADUZIONE GOOGLE TRANSLATE da wiki....modificare...]<br>
Questo plugin aggiunge un pannello che aiuta a mantenere i record di * tabelle di accesso.

Quando si aggiunge un processo / finestra / ... è necessario inserire in ogni tenant:

per aggiungerlo (se necessario) ai ruoli manuali
per disattivarlo (se necessario) a ruoli "non manuali"
-> che richiede molto tempo.

Ecco perché creo un pannello che consente di aggiornare tutte le tabelle * _Access da un accesso di sistema (puoi interagire con tutti i tenant) o da un tenant> 0 (e lì interrompi solo i ruoli di questo tenant).

Seleziona il tipo (processo / finestra / finestra informativa / ...) e poi il record (es: <il tuo ultimo processo creato>) - puoi filtrare l'elenco usando il nome o creato Puoi filtrare i record usando il nome del cliente o del ruolo e / o vedi solo ruolo con accesso / senza accesso / con accesso attivo / tutto.

Quindi puoi vedere i record dalla tabella di accesso e scegliere di aggiungerli / eliminarli / attivarli / disattivarli.

Quando si preme il pulsante "Process", genera ed esegue l'SQL diretto per inserire / eliminare / aggiornare i record nella tabella.
