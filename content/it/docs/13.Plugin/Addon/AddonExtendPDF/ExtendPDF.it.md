---
title: "Addon ExtendedPDF [A.PDF.STD00]"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 85
pre: "<b>720. </b>"
---

Questo plugin è relativo agli aspetti demografici su Idempiere ERP.<br>
Alcuni paesi hanno una divisione politica con concetti che vanno al di là di paese, regione e città.<br><br>
Ad esempio in Spagna si parla di comunità che sono legate al gruppo di province che mantiene il governo locale.<br>
Hanno anche una divisione politica per le province chiamate Comuni (Comune-Municipio).
Un altro esempio è il Venezuela, hanno una divisione politica per le province (Estados) chiamate Comuni (Comune-Municipio) e un Comune è anche diviso in Parrocchie (Parrocchia-Parroquia).<br><br>
Particolarità L'ufficio postale principale in Venezuela ha pubblicato una nuova regola che indica il modo in cui deve essere scritto l'indirizzo postale: Comunità, Regione, Comune e Parrocchia, possono essere utilizzati per analisi statistiche e BI su vendite, costi, personale e altri tipi di risultati delle transazioni.

I codici postali sono un'altra preoccupazione da trattare in futuro su questo plugin, perché un valore predefinito può essere ottenuto da Regione, Province, Comune e Parrocchia. Anche i nomi delle strade forniscono una regola per trovare i codici postali.

Per realizzare quanto spiegato in precedenza, alcune tabelle devono essere modificate e altre devono essere aggiunte per implementare la nuova finestra e il nuovo plugin.

Tabelle aggiunte:<br>
C_Municipality, C_Parish, C_Zipcode, C_Community

Tabelle modificate:<br>
(1) Aggiungi nuovi record (2) Aggiungi nuovi campi<br>
C_Country (2), AD_Message (1), C_Location (2), C_Region (2), AD_Reference (1)

In questo link ce in specifico cosa fa:<br>
 https://github.com/luisamesty/Amerpsoft-iDempiere-community/blob/master/org.amerpsoft.com.idempiere.editors-com/documentation/DemografiaExtendida_amxeditor.pdf
 
