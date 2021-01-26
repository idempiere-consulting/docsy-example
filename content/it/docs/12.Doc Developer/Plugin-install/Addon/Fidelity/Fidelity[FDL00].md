---
title: "Fidelity"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 190
pre: "<b> </b>"
---


## CONNETTORE TCPOS 

### Programma Access per collegamento DB TCPOS
Tabelle Collegate
- Articles             - Elenco Codici Prodotto
- Customers            - Elenco Clienti 
- Points_Campaigns     - Anagrafica Campagne 
- Trans_Point_Campain  - Punti Campagne
- Transaction          - Scontrini/Fatture
- Trans_Articles       - Dettaglio articoli qta/prezzi Scontrini /Fatture

- Query di creazione tabelle in locale
- Vista Customer  where isvalid=Y
- Vista Campaign  ..
- Vista PointCampaign  Raggruppoto e Totalizzo per mese

### Programma Talend

- Customer        -> Leggo Vista e importo /Aggiorno Ad_User   
- Point_Campaign  -> Leggo vista e importo in LIT_Campaign
- Trans_Campaign  -> Leggo vista e importo in LIT_PointCampaign

TODO :
- Sincronizzare PRodotti
- Sincronizzare Prezzi
- Importare Transazioni Scontrino




