---
title: "Addon Info CockPit [A.ICP.STD00]"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 55
pre: "<b>720. </b>"
---


Il Plugin è distribuito nella speranza che possa essere utile, ma SENZA ALCUNA GARANZIA; senza nemmeno la garanzia implicita di COMMERCIABILITÀ o IDONEITÀ PER UN PARTICOLARE SCOPO. Vedere la GNU General Public License per maggiori dettagli.

Installa il plugin sulla console osgi

Per iDempiere 3.1 e 4.1 sono necessari passaggi aggiuntivi

    Nella cartella sql del plugin-source ci sono due file.
    pat_facource.sql -> È la vista necessaria.
    pat_accountcourse.sql -> La funzione per AccountCourse
    La vista e la funzione devono essere create nel database.
    Presto sarà disponibile un aggiornamento, quindi il passaggio aggiuntivo in sql non è più necessario.
