---
title: "i-SmartMobile Mobile App "
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 2500
pre: "<b>90. </b>"
---


App iDempiere Mobile

pagina documentazione http://localhost:1313/docs/13.plugin/plugin-/5.altro/plugin-app-mobile/

Base
* [X] Nome App "iDempiere"
* [ ] Gestione Immagine App  Logo iDempiere
* [ ] Gestione Immagini Menu
* [x] Voci Menu attivabili da REST -LOGIN
* [ ] Marco creare campo lit_mobile_role (lit_m_userrole_v) **
 <br>da 1 a 20   -   Pulsanti APP 
 <br>1 - CRM
<br>2 - Service
<br>3 - Contabilità 
<br>4 - ACquisti
<br>5 - Magazzino
<br>6 - Produzione
<br>7 - Ore
<br>21 - Accesso Ore di altri utenti  (ADmin Rile.vamento ore)
<br>22 - ...  

[ ] Stampa Diretta 
[ ]  Get PDF Generato (JasperReport )
[ ] Gestire Allegati in Invio e Ricezione
	https://github.com/apache/cordova-plugin-file-transfer
[ ] Gestione NFC - Per segnare le ore ?
	- controllare plugin NFC

[x] gestione bacheca APP-to-APP (bacheca) **
	- scrivere da telefono sull bacheca degli altri? fare solita assegnazione a gruppo o persona?
[ ] Evidenziare gli appuntamenti/Visite/Riunione (pubblico? )
[ ] Gestione Attività Offline - Test :  Inserimento riga con 4 campi ID-TASK  ( Padre )  DATO1(testo)  DATO2(datanow) DATO3(SI/NO)  DATO4 (ID) 

Sicurezza 
[x] (eccezione momentanea) memorizzazione pwd 

# Menu Principale 

[{{< figure src="/image/MobileMenu.jpg"  width="350"  >}}](/image/MobileMenu.jpg)

{{% pageinfo %}}
##CRM
{{% /pageinfo %}}
[{{< figure src="/image/MobileCRM.jpg"  width="350"  >}}](/image/MobileCRM.jpg)

## Lead (lit_bi_lead_v) issalesLead=Y  Sono i Lead Sales

[{{< figure src="/image/MobileLead.jpg"  width="350"  >}}](/image/MobileLead.jpg)
<br><b> Dettaglio Lead 

[{{< figure src="/image/MobileLeadDettaglio.jpg"  width="350"  >}}](/image/MobileLeadDettaglio.jpg)
<br><b> Dettaglio Lead - Azioni

[{{< figure src="/image/MobileLeadDettaglioTodo.jpg"  width="350"  >}}](/image/MobileLeadDettaglioTodo.jpg)

<br><b> Dettaglio Lead - New Task 

[{{< figure src="/image/MobileLeadNewTask.jpg"  width="350"  >}}](/image/MobileLeadNewTask.jpg)

<br><b> Dettaglio Lead - Save as

[{{< figure src="/image/MobileLeadSaveas.jpg"  width="350"  >}}](/image/MobileLeadSaveas.jpg)



O Crea Lead - Scheda Inserimenti
O Importa Lead da Telefono

- Nuovi
- Convertiti
- In Corso
- Scaduti
O Modifica Lead
O Telefona  (e crea task come traccia)
O Invia Email (e crea task come traccia)
O Inserisci Opportunita

[x] Aggiungere possibilità CREA Task da Lead - Esempio creare un contactactivity PhoneCall/b/c/ -DataOraTodo -Risorsa 
[x] mettere visualizzazione ultima attività completata e ultima attività assegnata(non completata) **
[x] Creare sottotab Contactactivity 
[x] Salva Lead come contatto Telefono
[x] Lead per Agente ( vedo solo i miei o tutti ? o per Area ?) 
		- fare come per l'assegnazione dell'attività per gruppo con coalesce dove gli utenti sono dentro permessi area etc?
{{% pageinfo %}}
# LEAD PARTNER
{{% /pageinfo %}}
	-identica al CRM


PAGINA DETTAGLIO LEAD
	-Creare nella vista app filter con nome campagna (in un futuro si vedranno solo i propri lead), e altro chiedere a Marco
		per ora funziona solo per campaign name
	-Lead fornitore
	-Lead partner
	-Lead filtro per campagna/categoria

## Opportunità (lit...) 
<br><b> Dettaglio Lead - Save as

[{{< figure src="/image/MobileOpportunity.jpg"  width="350"  >}}](/image/MobileOpportunity.jpg)

<br><b> Dettaglio Lead - Save as

[{{< figure src="/image/MobileOpportunityDetail.jpg"  width="350"  >}}](/image/MobileOpportunityDetail.jpg)


[x] Aggiungere dettaglio informazione - Nuova Scheda come Lead ?
[x] Aggiungere opzioni come Lead  : Modifica
[x] Aggiungere CREA Task (sotto attività delle Opportunità)


{{% pageinfo %}}
# Bacheca
{{% /pageinfo %}}
[{{< figure src="/image/MobileBacheca.jpg"  width="350"  >}}](/image/MobileBacheca.jpg)
<br>
[{{< figure src="/image/MobileBachecaDetail.jpg"  width="350"  >}}](/image/MobileBachecaDetail.jpg)



[ ] Rivedere Insieme - ????
[x] Aggiungere campo isInTransit serve per organizzare tutti i task assegnati dall'ufficio verso l'app.
		get sulla c_contactactivity dove isInTransit = true e iscomplete = false

{{% pageinfo %}}
## Appuntamenti 
{{% /pageinfo %}}
[ ] Rivedere Insieme  ???
[ ] Creare evento su google calendar
{{% pageinfo %}}
## Contatti Clienti e Fornitori
{{% /pageinfo %}}
[{{< figure src="/image/MobileContact.jpg"  width="350"  >}}](/image/MobileContact.jpg)

[{{< figure src="/image/MobileContactDetail.jpg"  width="350"  >}}](/image/MobileContactDetail.jpg)


{{% pageinfo %}}
## Clienti
{{% /pageinfo %}}
[ ] Rivedere Insieme 
[ ] Scheda Pagamenti in Scadenza (Come Agente )
[ ] GRafici.. [ ] Di cosa ?
[{{< figure src="/image/MobileCustomer.jpg"  width="350"  >}}](/image/MobileCustomer.jpg)


{{% pageinfo %}}
# SERVICE 
{{% /pageinfo %}}
[ ] Da Rivedere Insieme
[{{< figure src="/image/MobileService.jpg"  width="350"  >}}](/image/MobileService.jpg)



# CONTABILITA' #########################################################################################################
[ ] Scheda Pagamenti in Scadenza (cosa definisce in scadenza? manca un settimana?)
	--
[ ] Scheda Prossimi incassi (prossimi come è definito?)
[ ] Fatture di Vendite (solo le ultime) - ultimi 30 giorni?
[ ] Fatture di Acquisto (solo le ultime)

1. Fatture di Acquisto 
2. Fatture di Vendita 
3. Pagamenti e Incassi 

[{{< figure src="/image/MobileFinance.jpg"  width="350"  >}}](/image/MobileFinance.jpg)
<br><b> Fattura di Acquisto
[{{< figure src="/image/MobileFatturaAcquisto.jpg"  width="350"  >}}](/image/MobileFatturaAcquisto.jpg)

[{{< figure src="/image/MobileFatturaAcquistoDetail.jpg"  width="350"  >}}](/image/MobileFatturaAcquistoDetail.jpg)

[{{< figure src="/image/MobilePayment.jpg"  width="350"  >}}](/image/MobilePayment.jpg)

[{{< figure src="/image/MobileFatturaVendita.jpg"  width="350"  >}}](/image/MobileFatturaVendita.jpg)


[{{< figure src="/image/MobileFatturaVenditaDetail.jpg"  width="350"  >}}](/image/MobileFatturaVenditaDetail.jpg)



# ACQUISTI 
[ ]	 Lead fornitori isleadvendor = Y
[ ]  Solo Ordini di acquisto + Search + Dettaglio + Linee  - solo ordini aperti o ultimi 30 gg
[ ]  Entrate Merci
[ ]  Prodotti SottoScorta -> Crea ODA

[{{< figure src="/image/MobileAcquistiMenu.jpg"  width="350"  >}}](/image/MobileAcquistiMenu.jpg)
[{{< figure src="/image/MobileAcquisti.jpg"  width="350"  >}}](/image/MobileAcquisti.jpg)

[{{< figure src="/image/MobileAcquistiDetail.jpg"  width="350"  >}}](/image/MobileAcquistiDetail.jpg)

[{{< figure src="/image/MobileAcquistiDetailAzioni.jpg"  width="350"  >}}](/image/MobileAcquistiDetailAzioni.jpg)


# MAGAZZINO ##
- ListaProdotti
[{{< figure src="/image/MobileMagazzino.jpg"  width="350"  >}}](/image/MobileMagazzino.jpg)
[{{< figure src="/image/MobileMagazzinoProdotto.jpg"  width="350"  >}}](/image/MobileMagazzinoProdotto.jpg)
[{{< figure src="/image/MobileMagazzinoProdottoDetail.jpg"  width="350"  >}}](/image/MobileMagazzinoProdottoDetail.jpg)
[{{< figure src="/image/MobileInventario.jpg"  width="350"  >}}](/image/MobileInventario.jpg)
[{{< figure src="/image/MobileInventarioDetail.jpg"  width="350"  >}}](/image/MobileInventarioDetail.jpg)
[{{< figure src="/image/MobileMagazzinoMovement.jpg"  width="350"  >}}](/image/MobileMagazzinoMovement.jpg)



[ ]Lista Prodotti   aggiungere dettagli - Listino Prezzi / Giacenza 
- Inventario
[x] inventario if00 m_inventory value name description documentno \\ per creare la vista creare vista where docstatus=dr \\copiare produzione
[x] dare la possibilità di aggiungere un prodotto
[ ]scanner (fatto la ricerca, per ora funziona solo cercando il nome del prodotto... da estendere la vista con appfilter)
	-crea nuove voci di inventario con figli (consumo)

	lit_mobile_inventoryline_v 	per vedere le sottovoci dei diversi inventari
	lit_mobile_inventory_v		per vedere i diversi inventari

     PAGINA INSERIMENTO PRODOTTO
	la ricerca viene fatta tramite o inserimento da tastiera col nome del prodotto e da una lista o tramite scansione codice
	-bisogna fare una vista dove c'è la concatenazione del nome prodotto con il codice prodotto per la ricerca
	-una volta trovato il prodotto premere e la possibilità di inserirne la quantità
     INSERIMENTO PRODOTTO NELLA LISTA

		- inserimento su m_inventoryline
		- m_inventory_id (id del padre)
		- m_product_id (codice del prodotto da inserire)
		- QtyCount (quantità del prodotto trovata)
		- AD_org_ID
		- InventoryType
	

	[x] INSERIMENTO TESTATA

		- ad org
		- magazzino 
		- C_DocType_ID 
		- Description

- Trasferimento
  [ ] bisogna fare delle insert
- Entrata Merci
  [ ] Migliorare dati  Documentno
  
  # PRODUZIONE ##
  
[{{< figure src="/image/MobileProduction.jpg"  width="350"  >}}](/image/MobileProduction.jpg)


 
[{{< figure src="/image/MobileProductionDetail.jpg"  width="350"  >}}](/image/MobileProductionDetail.jpg)

 
[{{< figure src="/image/MobileProductionPicking.jpg"  width="350"  >}}](/image/MobileProductionPicking.jpg)



# ORE 

[{{< figure src="/image/MobileTaskOre.jpg"  width="350"  >}}](/image/MobileTaskOre.jpg)

[{{< figure src="/image/MobileTaskOreDetail.jpg"  width="350"  >}}](/image/MobileTaskOreDetail.jpg)

[{{< figure src="/image/MobileTaskOreDetail1.jpg"  width="350"  >}}](/image/MobileTaskOreDetail1.jpg)

[{{< figure src="/image/MobileTaskOreSummary.jpg"  width="350"  >}}](/image/MobileTaskOreSummary.jpg)



   RIEPILOGO ORE
	fare due parti, la parte che c'è già... e un calendario che fa la possibilità di vedere tutti i giorni fino al 1970 scorribile
	dateworkstart per data task completata
	https://jamboard.google.com/d/14VS4wkY1hYToeVWasGuvqQtIhzY7945k0Y1W1Z2wmsI/viewer?f=0

   INSERIMENTO TASK
	selezione del task fare l'elenco
	assegnazione a persona default IO
	Qty quantità ore
	prodotto step 2
	info lavoro

	get task, get utenti
	post task[TAK10] 
	
		c_contactactivity_id(id padre),
		salesrep_id,
		Name(di solito viene ereditato dal padre ma può essere inserito a mano),
		description(descrizione),
		dateworkstart(inizio del lavoro che viene preso di default nel momento in cui viene aperta la maschera)
		qty (durata dell'attività)

	vista: name qty data

	


  CONTEGGIO ORE
	[x] invertire titolo e sottotitolo
	[x] business partner in vista nella card
	[x] ora visibile e non tagliata
	[x] Creare filtro in conteggio ore per filtrare il nome del lead

  INSERIMENTO ATTIVITÀ
	[x] dare la possibilità di completare instant l'attività
		-invece di farlo instant faccio una pagina di visualizzazione dell'attività che verrà condivisa con il dettaglio attività e da li si modifica o    completa
		- mettere una spunta di flag per terminare e completare l'attività inserita
	[x] ordinare in ordine alfabetico le attività e gli assegnati
	[x] inserimento business partner nella scheda
	[ ] fare i menù di scelta più gradi
	[ ] trovare il modo che l'"assegnato a:" venga già completato senza bisogno di clickarlo... è un problema di angular

	[ ] modifica della vista lit_mobile_activity_v per filtrare solo le attività assegnate a persona o gruppo
			 


  DETTAGLIO ATTIVITÀ
	[x] cambiare metodo di modifica, fare come i lead 
	- non si capisce che la pagina è modificabile
	[x] dividere la modifica dalla completazione della task 
	[ ] mettere in visualizzazione il giorno della settimana a cui corrisponde il numero del giorno

	[x]	modificare la vista lit_mobile_taskdetail_v siccome ora non si usa più LIT_Hour bisogna modificarla per S_ResourceAssignment


	######### PARTE OFFLINE

		- fare setup di ionic storage con sqlite drivers ( https://github.com/ionic-team/ionic-storage  https://github.com/thgreasi/localForage-cordovaSQLiteDriver )
			-- trovare il modo di modificare lo storage in Offline  https://www.youtube.com/watch?v=fZ4giHzXfSg
		- creare un array con oggetti di modifica per iDempiere
		- fare un forEach sull'array e fare chiamata put su iDempiere
		

----------------------------------------------------------------------------------------------------------------------------------------------------------------

Viste utilizzate

	lit_contactssc_v
    lit_m_lead_v
    lit_m_task_v
    lit_mobile_c_invoice_v
    lit_mobile_c_invoiceline_v
    lit_mobile_c_order_v
    lit_mobile_c_orderline_v
    lit_mobile_c_payment_v 
    lit_mobile_product_v
    lit_mobile_production_v
    lit_mobile_productionline_v
    lit_mobile_resatt_v
    lit_mobile_task_v
    lit_mobile_taskdetail_v
    lit_mobile_inventory_v
    lit_mobile_inventoryline_v

