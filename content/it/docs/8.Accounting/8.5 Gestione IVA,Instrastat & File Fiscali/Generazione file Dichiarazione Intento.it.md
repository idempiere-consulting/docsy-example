---
title: "Generazione file Dichiarazione Intento"
date: 2020-10-19T16:09:10+02:00
draft: false
weight : 690
pre: "<b></b>"
---

https://www.agenziaentrate.gov.it/portale/web/guest/schede/dichiarazioni/dichiarazioni-di-intento/sw-compilazione-dichintento-nuova
https://www.agenziaentrate.gov.it/portale/documents/20143/2362217/Specifiche_IVI.pdf/ecbc2b39-2866-542c-b062-17d65735839e

[{{< figure src="/image/Intento_1.png"  width="850"  >}}](/image/Intento_1.png)

### Campi Nuovi

| Campo Tracciato       | Campo iDempiere                              | Descrizione |
|-----------------------|----------------------------------------------|-------------|
| Record A - _Tipo Fornitore_ | **AD_OrgInfo.LIT_LetterIntent_ProviderType** |Assume i valori: <br>_**01**_ - Soggetti che inviano le proprie dichiarazione. <br>_**10**_ -Altri intermediari....|
| Record B - _Codice fiscale del soggetto dichiarante_ | **AD_OrgInfo.LIT_LetterIntet_BP_Provider_ID>LIT_TaxID** | |
| Record B - _Identificativo del produttore del software (codice fiscale)_ | **P.IVA  iDempiere Consulting** | |
| Record B - _Dichiarazione integrativa_ | **C_BP_Partner_LetterIntent.LIT_IsSupplementary** | |
| Record B - _Protocollo telematico da integrare - Prima parte_ | **C_BP_Partner_LetterIntent.bp_letterintentnrprotocol** | |
| Record B - _Protocollo telematico da integrare - Parte seconda_ | **C_BP_Partner_LetterIntent.bp_letterintentnrprotocol_2** | |
| Record B - _Denominazione_ | **AD_Org.Description** | |
| Record B - _Comune di nascita, Provincia di nascita, Data di nascita, Sesso_ | **LIT_LetterIntet_BP_Provider_ID(C_Bpartner) > Contatto(Ad_user) ….tutti i dati qui** | isLegalUser|
| Record B - _Codice fiscale_ | **AD_orgInfo.TaxID** | |
| Record B - _Codice fiscale società dichiarante, Codice carica, Cognome, Nome, Sesso, Data di nascita, Comune o stato estero di nascita, Sigla della provincia di nascita_ | **LIT_LetterIntet_BP_Provider_ID(C_Bpartner) > Contatto(Ad_user) ….tutti i dati qui** | isLegalUser|
| Record B - _Casella Acquisti_ | **C_BP_Partner_LetterIntent.LIT_IsIntentPurchase** | |
| Record B - _Casella Importazioni_ | **C_BP_Partner_LetterIntent.LIT_IsIntentImport** | |
| Record B - _Anno_ | **C_BP_Partner_LetterIntent.bp_letterintentdateprotocol(YYYY)** | |
| Record B - _Importo operazione(33), Importo fino a concorrenza(34)_ | if(**C_BP_Partner_LetterIntent.IsCreateSingleOrder**) then set campo 33 else set campo 34 --→ C_BP_Partner_LetterIntent.bp_letterintenttotalamount | |
| Record B - _Descrizione merce_ | **C_BP_Partner_LetterIntent.Description** | |
| Record B - _Codice fiscale(41), Partita IVA(42)_ | **C_BP_Partner_LetterIntent.C_Bpartner_ID.LIT_TaxID** | |

----------------

### Processo di creazione del file della Dichiarazione Intento

Processo dichiarato nella window "Lettera Intento Cliente/Fornitore [LI16]":

- [x] it.idIta.idempiere.LIT_InvoiceDataVAT.process.GenerateFileIntent

[{{< figure src="/image/Intento_2.png"  width="850"  >}}](/image/Intento_2.png)

### Software di creazione e controllo tracciato record

- http://jws.agenziaentrate.it/jws/dichiarazioni/2015/IVI15.jnlp   (Compilazione tracciato)

- http://jws.agenziaentrate.it/jws/dichiarazioni/2015/ControlliIVI15.jnlp (Controllo tracciato)
