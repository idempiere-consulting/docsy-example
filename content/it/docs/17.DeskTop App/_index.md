---
title: "i-Desk-SmartApp "
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 2800
pre: "<b>90. </b>"
---


### TODO
- [ ] Logo App (togliere la X)  - Prio: medio/alta 
- [ ]Logo User (sx) quello dell'utente se presente Prio: bassa
- [ ] gestione permessi (lit_mobilerole) 
      0/1  CRM 
      0/1 Service User
      0/1 Service Portale
      0/1 Fatture di Vendita
      0/1 Ordini di Vendita
      0/1 Ticket Portale
      0/1 Ticket User
      0/1 Conto Lavoro Portale
      0/1 Acquisti User
      0/1 TaskOre 
      0/1 Produzione
      0/1 Logistica
      Esempio:
      1001  Crm si  Servise Iser  no Servi p
- [ ] gestione upload immagine e/o PDF o altro da sfoglia file
 


## Dashboard

- Dashboard BI ( Da Vedere Marco)






## CRM ( Internal)
Pagine:
- Lead
- Oppurtunità
- Bacheca
- Appuntamenti

<hr>

### Lead

La maschera di gestione dei Lead serve per...
[{{< figure src="/image/MobileLead.png"  width="850"  >}}](/image/MobileLead.png)

#### Dati tecnici
- tabella : ad_user 
- file: CRM_LeadsWindow.html
- request_api: http://+ ip +/api/v1/windows/lead

<hr>

### Opportunity

La maschera di gestione delle opportunità serve per...
[{{< figure src="/image/desktopappopportunity.png"  width="850"  >}}](/image/desktopappopportunity.png)

#### Dati tecnici
- tabella: C_Opportunity
- file: CRM_OpportunitàWindow.html
- request_api: http:// + ip + /api/v1/windows/sales-opportunity

<hr>

### Bacheca
La maschera di gestione della bacheca serve per...

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: CRM_BachecaWindow.html

<hr>

### Appuntamenti
La maschera di gestione delgli appuntamenti serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: CRM_AppuntamentiWindow.html




<hr>


## Service (Internal)
    
- Elenco Ordini di Lavoro da fare più gli ultimi 7gg / 3 mesi
- Calendario Intervento
- Gestione Intervento:
  - Inizio - Fine
  - Confermare
  - Sostituzione
  - Anomalia
  - Mappa
  - Chiusura anomalia
  
<hr>
  
  
### Ordini di lavoro
La maschera di gestione degli ordini di lavoro serve per... 

[{{< figure src="/image/DesktopAppOrdiniLavoro.png"  width="850"  >}}](/image/DesktopAppOrdiniLavoro.png)


#### Dati tecnici
- tabella:
- file: ServiceU_OrdinidiLavoroWindow.html

<hr>


### Calendario
La maschera di gestione del calendario serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella: 
- file: ServiceU_CalendarioWindow.html

<hr>

### Anomalie
La maschera di gestione delle anomalie serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: ServiceU_AnomalieWindow.html

  
<hr>
  
  
  
  
  

## Service (Portale)
Pagine:
- Anomalie
- Richiesta di Manutenzione

<hr>

### Anomalia
La maschera di gestione delle anomalie serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: ServiceP_AnomaliaWindow.html

<hr>

### Richiesta Manutenzione
La maschera di gestione della richiesta di manutenzione serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: ServiceP_ManutenzioneWindow.html



<hr>




## Fatture (Portale)
Pagine: 
- Fatture acquisto
- Fatture vendita

<hr>


### Fatture acquisto
La maschera di gestione delle fatture di acquisto serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: Fatture_AcquistiWindow.html

<hr>

### Fatture vendita
La maschera di gestione delle fatture di vendita serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: Fatture_VenditaWindow.html

<hr>






## Ordini di Vendita
Pagine: 
- Lista odv
- Crea odv
- add Descrizione su Ordine di Vendita
<hr>

### Lista odv
La maschera di gestione degli ordini di vendita serve per... 

[{{< figure src="/image/DesktopAppDettagliOdv.png"  width="850"  >}}](/image/DesktopAppDettagliOdv.png)

#### Dati tecnici
- tabella :
- file: ODV_VediODVWindow.html

<hr>

### Crea odv
La maschera di gestione per la creazione di ordini di vendita serve per... 

[{{< figure src="/image/DesktopAppDettagliOdv.png"  width="850"  >}}](/image/DesktopAppDettagliOdv.png)

#### Dati tecnici
- tabella :
- file: ODV_CreaODVWindow.html

- Filtro ordini <> CO e <> VO



<hr>




## Ordini di Vendita (Portale) + Fatture (Portale)

- Vedere gli ultimi ordini - stato di evasione - Stato Fatturazione  / Pagamento



<hr>



## Ticket (Internal)
Pagine:
- HelpDesk
- Dettaglio ticket
- Task
- Ticket da schedulare 
- Ore

<hr>

### HelpDesk
La maschera di gestione degli help-desk serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: TicketI_HelpDeskWindow.html

<hr>

### Dettagli ticket
La maschera di gestione dei dettagli ticket serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: TicketI_DettaglioWindow.html

<hr>

### Task
La maschera di gestione dei task serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: TicketI_TaskWindow.html

<hr>

### Da schedulare
La maschera di gestione dei ticket da schedulare serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: TicketI_ScheduleWindow.html

<hr>

### Ore
La maschera di gestione delle ore del ticket serve per... 

<!-- Manca lo screen -->

#### Dati tecnici
- tabella :
- file: TicketI_OreWindow.html

<hr>


## Ticket (Portale)
Pagine:
- Supporto
- Richiesta di Formazione / Sessione
- Creare un ticket

<hr>

### Supporto
La maschera di gestione del supporto serve per... 

[{{< figure src="/image/DesktopAppSupportoTicket.png"  width="850"  >}}](/image/DesktopAppSupportoTicket.png)

#### Dati tecnici
- tabella :
- file: TicketP_SupportoWindow.html

<hr>

#### Richiesta Sessione
La maschera di gestione di richiesta di sessione di un ticket serve per... 

[{{< figure src="/image/DesktopAppCreazioneTicket.png"  width="850"  >}}](/image/DesktopAppCreazioneTicket.png)

#### Dati tecnici
- tabella :
- file: TicketP_SessioneWindow.html

<hr>

### Creare un ticket
La maschera di gestione di creazione di un ticket serve per... 

[{{< figure src="/image/DesktopAppCreazioneTicket.png"  width="850"  >}}](/image/DesktopAppCreazioneTicket.png)

#### Dati tecnici
- tabella :
- file: TicketP_TicketWindow.html

<hr>



## Conto Lavoro (Portale)

- Vedere gli Ordini di Produzione del BP collegato all'utente
- Vedere il Programma da confermare 

## Acquisti

## Task /Ore

## Produzione

## Logistica 

### Prodotti - Giacenza

### Crea DDT CL

### Crea DDT

### Lista Viaggi




## Setup

### Permessi

LIT_MobileAccess 00000 00000 00000

0/U     CRM
0/U/P   Service
0/P     Fatture
0/P     Ordini di Vendita
0/U/P   Ticket
0/P     Conto Lavoro
0/U     Acquisti
0/U     Task/ore
0/U     Produzione
0/U     Logistica


