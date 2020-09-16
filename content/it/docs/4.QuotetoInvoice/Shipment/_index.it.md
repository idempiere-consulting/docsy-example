---
title: "Spedizione"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 220
pre: "<b></b>"
---
## Documento di Trasporto  [DDT00]
La maschera permette l'inserimento del Documento di Trasporto.
[{{< figure src="/image/DocumentoTrasporto0.png"  width="850"  >}}](/image/DocumentoTrasporto0.png)

## Documento movimentazione/fatturazione prodotti.

| **Descrizione Causale**               |    **Codice**    | **Mag.Interno** | **Mag.Esterno** | **Mov.Contabile** | **Doc.Magazzino**  | **Note** |                                                     
| --------------------------------------|------------------| ------| -------|-----------| ---------------|--------------------------- |
| **Uscita Campionario (MM Shipment - Sample Shipment)**| **CCAMP**| **-** | **+**  | **NN** |  **Doc.di Trasporto** |**Il Ddt resta valido un anno**|
| **Reso Campionario da Agente** | **RCAMP** | **+** | **-**  | **NN**  | **NN** | **Ddt agente (entro anno solare)** |
| **Fatturazione Campionario** | **FCAMP** | **NN** | **NN** | **Fattura** | **NN**| Da che documento??? |                                                                                    
| **Uscita Comodato gratuito**  | **CCOMG** | **-** | **+**  | **NN**  | **Documento di Trasporto** | **Il Ddt resta valido un anno**|
| **Reso Comodato Gratuito**  | **RCOMG**| **+** | **-**  |  **NN** |  **NN** | **Ddt reso da parte cliente**|
| **Fatturazione Comodato gratuito (accordo o danno)**  | **FCOMG** |  **NN** |**NN** | **Fattura** |  | Da che documento??? |                                                                      
| **Conto Noleggio Oneroso** | **CNOLO** | **-** | **+**  | **Fattura** | **Doc. di trasporto**  | Fatturazione mensile se da contratto???  |
| **Rientro Noleggio Oneroso** | **RNOLO** | **+** | **-**  | **Fattura** |  **NN**|   **Ddt Reso da parte cliente** da che documento??? |
| **Trasferimento a Magazzino (Material Movement)** | **CTRAS**  | **-** | **+**  | **NN**  | **Doc. di Traferimento-Magazzino** |     |
| **Rientro da Trasferimento** | **RTRAS** | **-** | **+**  | **NN**  | **Doc. di Traferimento-Magazzino** |     |                                                                                    
| **Conto Deposito (Deposit Account)** | **CDEPC** | **-** | **+**  | **NN**    | **Doc. di Traferimento-Magazzino** | **(Il Ddt resta valido un anno + rientro da cto dep. usando la causale "RIENTRO")**???|
| **Reso Conto Deposito (Return Deposit Account)** | **RDEPC** | **-** | **+**  |  **NN** | **Documento di Trasporto**  |     |
| **Vendita da conto Deposito** | **FDEPC**     |  **NN** |  **NN** | **Fattura**  |       |    |                                                                                             
| **Conto Visione (Vision Account)**     | **CVISI** | **-** | **+**  | **NN** | **Documento di Trasporto-Magazzino** | **+ RIENTRO DA CONTO VISIONE (CAUSALE "RIENTRO") Report Mat. in CCV per nr giorni** |
| **Reso da Conto Visione (Return Vision Account)**   | **RVISI** | **-** | **+**  | **NN**    | **Documento di Trasporto**  | **(Come usufruitor)** |
| **Vendita da Conto Visione**  | **FVISI** |  **NN** | **NN** | **Fattura** |       |    |                                                                                      
| **Prestito d'uso gratuito (Loan of Use)**  | **CPRUG**  | **-** | **+**  | **NN** | **Documento di Trasporto-Magazzino** |     |                                                            
| **Reso da Prestito d'uso gratuito (Return Loan of Use)** | **RPRUG** | **+** | **-**  | **NN**  | **Documento di Trasporto** |     |
| **Vendita materiale da Prestito d'uso gratuito addebito per danno** | **FPRUG**  | **NN** | **NN**  | **Fattura**       |       |    |                                                                                      
| **Prestito d'uso oneroso**  | **CPRUA**  |  **-** | **+**  | **Fattura mensile se previsto contratto**  | **Documento di trasporto**  |     | 
| **Reso da Prestito d'uso oneroso**  | **RPRUA**  **+** | **-**  | **Fattura**  |       |         | **Ddt reso cliente**  |                                       
| **Manutenzione/Riparazione Fornitore in garanzia**  | **CRIGF**  | **-** | **+**  | **NN** | **Doc.di Trasporto-Magazzino** | **+ Rientro da conto manutenzione +causale RIENTRO** |
| **Rientro da Manutenzione/Riparazione Fornitore in garanzia** | **RRIGF**| **+** | **-**  | **NN**   |       |     |                          
| **Conto Riparazione/Manutenzione (Account Maintenance)**  | **CRIAF**| **-** | **+**  | **Fattura**      |       |     |                                                                                         
| **Rientro da Conto Riparazione /Manutenzione**  | **RRIAF**| **+** | **-**  | **Fattura**      |       |  **Ddt fornitore+Fattura**   |
| **Conto Riparazione/Manutenzione (Account Maintenance)X materiali non a giacenza magazzino** | **CMANC**     |  |  |   | **Documento di Trasporto**  |                                                                                                                        
| **Rientro da Conto Riparazione /Manutenzione X materiali non a giacenza magazzino**  | **RMANC**     |  |  | **Fattura**  |       | **Ddt fornitore**|                                                                                             
| **Conto Lavorazione Passivo OUTPROD (Account Working)**  | **CLAVP**| **-** | **+**  |                  | **Documento di Trasporto**          |      |                                                        
| **Reso Lavorato**                                             | **RLAVP**| **+** | **-**   |  **Fattura** |       | **Ddt reso lavorato Fornitore Scarico mag.esterno per particolari carico per prodotto padre |             
| **Reso a Fornitore con accredito**  **RMA** | **RFORA**| **-** | **+**   |  **Nota accr.**  | **Documento di trasporto** | **Caso merce resa a fronte fornitura già fatturata**|                                         
| **Reso a Fornitore differenza fattura** | **RFORD**| **-** | **+** |  **Fattura**  | **Documento di trasporto**  | **Fattura emessa al netto**|     
| **Merce Omaggio no rivalsa IVA**   **COM**  | **OMCLN**| **-** |           |  **Autofattura** | **Documento di trasporto**    |**No rivalsa IVA**| 




### **Documento Principale di Carico e Scarico**  

####  **DDT Vendita da ODV Magazzino o Ordine Standard**  

**| Descrizione           |Scarico|Carico|Maschera|Descrizione Tipo Doc|Note|Report|Link Processo**
**|:----------------------|:-----:|:----:|-----|-|-|-|**
**| DDT Vendita da ODV Magazzino      | SI    | -    |DDT(Customer Shipment)|DDT di Vendita|InDiretta|0045|**

####  **DDT Vendita da ODV Fattura Immediata**

**| Descrizione           |Scarico|Carico|Maschera|Descrizione Tipo Doc|Note|Report|Link Processo**
**|:----------------------|:-----:|:----:|-----|-|-|-|**
**| DDT Vendita Order Standard        | SI    | -    |DDT(Customer Shipmet)|DDT di Vendita |Diretta|0045|**

####  **Scarico Merce tenuta in Conto Deposito per il cliente**

**| Descrizione           |Scarico|Carico|Maschera|Descrizione Tipo Doc|Note|Report|Link Processo**
**|:----------------------|:-----:|:----:|-----|-|-|-|**
**| Scarico Merce tenuta in Conto Deposito        | SI    | -    |DDT(Customer Shipment)|DDT Invio Cto Deposito|-|0045|**

**| Reso a Fornitore      | SI    | -    |Reso a Fornitore (RAF)|Reso a Fornitore|Nota di Accredito|???|**

*****| Reso a Fornitore      | SI    | -    |Reso a Fornitore (RAF)|Reso a Fornitore|Riapre Ordine|???|**

### **Documento di Trasferimento**

| **Descrizione**                             | **Scarico** | **Carico** | **Maschera**               | **Descrizione Tipo Doc** | **Note**      | **Report** |
| :------------------------------------------ | :---------: | :--------: | -------------------------- | ------------------------ | ------------- | ---------- |
| **Trasferimento a Magazzino /Cto Deposito** |   **SI**    |   **-**    | **DDT(Customer Shipment)** | **DDT di Vendita**       | **Diretta**   | **0045**   |
|                                             |   **SI**    |   **-**    | **DDT(Customer Shipmet)**  | **DDT di Vendita**       | **Indiretta** | **0045**   |

### **Altri Documenti**

| **Descrizione**            | **Scarico** | **Carico** | **Maschera**               | **Descrizione Tipo Doc**   | **Note**      | **Report** |
| :------------------------- | :---------: | :--------: | -------------------------- | -------------------------- | ------------- | ---------- |
| **Uscita Campionario**     |    **-**    |   **-**    | **DDT(Customer Shipment)** | **DDT di Vendita**         | **Diretta**   | **0045**   |
| **Uscita Campionario (M)** |    **-**    |   **-**    | **DDT(Customer Shipment)** | **DDT di Vendita**         | **Diretta**   | **0045**   |
|                            |   **SI**    |   **-**    | **DDT(Customer Shipmet)**  | **DDT di Vendita**         | **Indiretta** | **0045**   |
|                            |   **SI**    |   **-**    | **DDT(Customer Shipment)** | **DDT Invio Cto Deposito** | **-**         | **0045**   |

## **2. Tipo di Documento In Entrata**

| **Descrizione tipo doc.** | **Scarico** | **Carico** | **Maschera**              | **Descrizione Tipo Doc** | **Note** | **Report** |
| :------------------------ | :---------: | :--------: | ------------------------- | ------------------------ | -------- | ---------- |
| **Entrata Merci e**       |    **-**    |   **SI**   | **Reso da Cliente (RDC)** | **Reso**                 | **-**    | **-**      |
| **Reso da Cliente**       |    **-**    |   **SI**   | **Reso da Cliente (RDC)** | **Reso**                 | **-**    | **-**      |


- [ ] **test**
- [ ] **sdfsdf**
- [x] **sdf**
## Riaprire DDT Chiuso da Ordine Magazzino 

Non è possibile riaprire un documento DDT se l'ordine è stato chiuso.
Contattare il supporto tecnico per eseguire una modifica specifica

Per evitare un eventuale errore è possibile iimpostare la conferma nei seguenti casi

* conferma su azione Chiudi

* conferma su azione Annulla

![ClientConfermaChiudi](/image/ClientConfermaChiudi.jpg)

# Plugin: Shipment Custom

---

## Descrizione Plugin

---

## Funzionalità supportate

---

## Installazione Plugin

---

## Parametrizzazione Plugin

---

## Istruzioni Plugin

---

## Documentazione Tecnica Plugin

### Modifiche all'AD

#### Existing Tables / Windows

#### New Tables /Windows

#### Removed Tables /Windows

---

## Funzionalità Future

---

## Test

Prova d'inserimento manuale di DDT (Shipment Customer):
creato un nuovo Document Type "MM Shipment_Custom", uguale identico al "MM Shipment" ma con il flag attivo su 'Create Negative Movement' e il 'Document Type To Be Created'( --> ID impostato a C_DocType_ID) impostato su "Internal Use Inventory"(value_Key: 200000); inserito un prodotto con quantità a 1 e avviato il processo di COMPLETE. Completa il DDT e in più, intercettando l'evento con il plug-in, viene creato un movimento dello stesso prodotto (M_Inventory/M_InventoryLine) e viene Completato anche questo; il risultato GIUSTO viene visualizzato sulla sottoTab "Transaction" della Window 'Product': una riga con -1 relativa al DDT (Shipment Customer) e una riga con +1 relativa all'Inventario (Inventory In)



## Operazione di Spedizione [ODS00]
La maschera raccoglie tutte le informazioni della Spedizione.
[{{< figure src="/image/OperazioneSpedizione0.png"  width="850"  >}}](/image/OperazioneSpedizione0.png)
## Crea Spedizione (manuale) [CSPEM00]
La Info Window Form serve a creare la Spedizione manuale del prodotto. 
[{{< figure src="/image/CreaSpedizioneManuale.png"  width="850"  >}}](/image/CreaSpedizioneManuale.png)
## Crea Spedizione [CSPE00]
Il processo crea le Spedizioni dei prodotti.
[{{< figure src="/image/CreaSpedizioneCSPE00.png"  width="850"  >}}](/image/CreaSpedizioneCSPE00.png)
## Info crea spedizione da ordine riga [ICSR00]
La Info Window permette di creare le spedizioni da righe di ordine.
[{{< figure src="/image/InfoCreaSpedizionedaOrdineRiga.png"  width="850"  >}}](/image/InfoCreaSpedizionedaOrdineRiga.png)
## Info crea spedizione [ICS00]
La Info Window permette di creare le spedizioni in maniera automatizzata.
[{{< figure src="/image/InfoCreaSpedizione.png"  width="850"  >}}](/image/InfoCreaSpedizione.png)
## Pacchetto spedizione [PCS00]
La maschera raccoglie le informazioni relative a spedizione di pacchi.
[{{< figure src="/image/PacchettoSpedizione0.png"  width="850"  >}}](/image/PacchettoSpedizione0.png)

# Report Spedizione
## Report Dettaglio Ordini [RE.54]
Il Report mette in evidenza gli ordini non ancora evasi.
[{{< figure src="/image/DettaglioOrdiniNonEvasiRE54.png"  width="850"  >}}](/image/DettaglioOrdiniNonEvasiRE54.png)
## Report dettaglio Spedizioni [R.07]
Il Report mette in evidenza i dettagli della spedizione.
[{{< figure src="/image/InformazioniDettagliSpedizioniR07.png"  width="850"  >}}](/image/InformazioniDettagliSpedizioniR07.png)
[{{< figure src="/image/ReportDettagliSpedizioni1.png"  width="850"  >}}](/image/ReportDettagliSpedizioni1.png)
# Setup Shipping
## Tariffa Doganale [TFD00]
La maschera permette di inserire le tariffe doganali relative ai prodotti.
[{{< figure src="/image/TariffaDoganaleTFD00.png"  width="850"  >}}](/image/TariffaDoganaleTFD00.png)



