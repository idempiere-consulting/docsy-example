# Fattura Elettronica  Plugin iDempiere











FPR12  

FPA12





| TD01 | fattura                      |
| ---- | ---------------------------- |
| TD02 | acconto/anticipo su fattura  |
| TD03 | acconto/anticipo su parcella |
| TD04 | nota di credito              |
| TD05 | nota di debito               |
| TD06 | parcella                     |









| **<RegimeFiscale>** |                                                              |
| ------------------- | ------------------------------------------------------------ |
| **RF01**            | Ordinario                                                    |
| **RF02**            | Contribuenti minimi (art.1, c.96-117, L. 244/07)             |
| **RF04**            | Agricoltura e attività connesse e pesca (artt.34 e 34-bis, DPR 633/72) |
| **RF05**            | Vendita sali e tabacchi (art.74, c.1, DPR. 633/72)           |
| **RF06**            | Commercio fiammiferi (art.74, c.1, DPR  633/72)              |
| **RF07**            | Editoria (art.74, c.1, DPR  633/72)                          |
| **RF08**            | Gestione servizi telefonia pubblica (art.74, c.1, DPR 633/72) |
| **RF09**            | Rivendita documenti di trasporto pubblico e di sosta (art.74, c.1, DPR  633/72) |
| **RF10**            | Intrattenimenti, giochi e altre attività di cui alla tariffa allegata al DPR 640/72 (art.74, c.6, DPR 633/72) |
| **RF11**            | Agenzie viaggi e turismo (art.74-ter, DPR 633/72)            |
| **RF12**            | Agriturismo (art.5, c.2, L. 413/91)                          |
| **RF13**            | Vendite a domicilio (art.25-bis, c.6, DPR  600/73)           |
| **RF14**            | Rivendita beni usati, oggetti d’arte, d’antiquariato o da collezione (art.36, DL 41/95) |
| **RF15**            | Agenzie di vendite all’asta di oggetti d’arte, antiquariato o da collezione (art.40-bis, DL 41/95) |
| **RF16**            | IVA per cassa P.A. (art.6, c.5, DPR 633/72)                  |
| **RF17**            | IVA per cassa (art. 32-bis, DL 83/2012)                      |
| **RF18**            | Altro                                                        |
| **RF19**            | Regime forfettario (art.1, c.54-89, L. 190/2014)             |



| **<TipoCassa>** |                                                              |
| --------------- | ------------------------------------------------------------ |
| **TC01**        | Cassa nazionale previdenza e assistenza avvocati e procuratori legali |
| **TC02**        | Cassa previdenza dottori commercialisti                      |
| **TC03**        | Cassa previdenza e assistenza geometri                       |
| **TC04**        | Cassa nazionale previdenza e assistenza ingegneri e architetti liberi professionisti |
| **TC05**        | Cassa nazionale del notariato                                |
| **TC06**        | Cassa nazionale previdenza e assistenza ragionieri e periti commerciali |
| **TC07**        | Ente nazionale assistenza agenti e rappresentanti di commercio (ENASARCO) |
| **TC08**        | Ente nazionale previdenza e assistenza consulenti del lavoro (ENPACL) |
| **TC09**        | Ente nazionale previdenza e assistenza medici (ENPAM)        |
| **TC10**        | Ente nazionale previdenza e assistenza farmacisti (ENPAF)    |
| **TC11**        | Ente nazionale previdenza e assistenza veterinari (ENPAV)    |
| **TC12**        | Ente nazionale previdenza e assistenza impiegati dell'agricoltura (ENPAIA) |
| **TC13**        | Fondo previdenza impiegati imprese di spedizione e agenzie marittime |
| **TC14**        | Istituto nazionale previdenza giornalisti italiani (INPGI)   |
| **TC15**        | Opera nazionale assistenza orfani sanitari italiani (ONAOSI) |
| **TC16**        | Cassa autonoma assistenza integrativa giornalisti italiani (CASAGIT) |
| **TC17**        | Ente previdenza periti industriali e periti industriali laureati (EPPI) |
| **TC18**        | Ente previdenza e assistenza pluricategoriale (EPAP)         |
| **TC19**        | Ente nazionale previdenza e assistenza biologi (ENPAB)       |
| **TC20**        | Ente nazionale previdenza e assistenza professione infermieristica (ENPAPI) |
| **TC21**        | Ente nazionale previdenza e assistenza psicologi (ENPAP)     |
| **TC22**        | INPS                                                         |





SELECT name,ParameterValue FROM AD_Ref_List 
WHERE 
AD_Reference_ID IN 
(SELECT AD_Reference_ID FROM AD_Reference WHERE Name = '_Payment Rule')

"Mixed POS Payment";""
"Direct Deposit";"MP05"
"Check";"MP02"
"Cash on delivery ";""
"RID";"MP09"
"Cash";"MP01"
"Credit Card";"MP08"
"On Credit";"MP05"
"Direct Debit";"MP05"

| **<ModalitaPagamento>** |                                            |
| ----------------------- | ------------------------------------------ |
| **MP01**                | contanti                                   |
| **MP02**                | assegno                                    |
| **MP03**                | assegno circolare                          |
| **MP04**                | contanti presso Tesoreria                  |
| **MP05**                | bonifico                                   |
| **MP06**                | vaglia cambiario                           |
| **MP07**                | bollettino bancario                        |
| **MP08**                | carta di pagamento                         |
| **MP09**                | RID                                        |
| **MP10**                | RID utenze                                 |
| **MP11**                | RID veloce                                 |
| **MP12**                | RIBA                                       |
| **MP13**                | MAV                                        |
| **MP14**                | quietanza erario                           |
| **MP15**                | giroconto su conti di contabilità speciale |
| **MP16**                | domiciliazione bancaria                    |
| **MP17**                | domiciliazione postale                     |
| **MP18**                | bollettino di c/c postale                  |
| **MP19**                | SEPA Direct Debit                          |
| **MP20**                | SEPA Direct Debit CORE                     |
| **MP21**                | SEPA Direct Debit B2B                      |
| **MP22**                | Trattenuta su somme già riscosse           |



| Codice   | Tipi di Documento            |
| -------- | ---------------------------- |
| **TD01** | Fattura                      |
| **TD02** | acconto/anticipo su fattura  |
| **TD03** | acconto/anticipo su parcella |
| **TD04** | nota di credito              |
| **TD05** | nota di debito               |
| **TD06** | parcella                     |





| Codice | VOCI NATURA                                                  |
| ------ | ------------------------------------------------------------ |
| **N1** | Escluso Art. 15 DPR 633/72                                   |
| **N2** | Fuori campo IVA Art. 2 DPR 633/72                            |
| **N3** | non imponibili                                               |
| **N4** | Esente Art. 10 DPR 633/72                                    |
| **N5** | Escluso Art. 74 DPR 633/72<                                  |
| **N6** | Reverse charge Art. 17 DPR 633/72<br />inversione contabile (per le operazioni in reverse charge ovvero nei casi di autofatturazione per acquisti extra UE di servizi ovvero per importazioni di beni nei soli casi previsti) |
| **N7** | Vendite a distanza Art. 40/41 DL 331/93<br />IVA assolta in altro stato UE (vendite a distanza ex art. 40 c. 3 e 4 e art. 41 c. 1 lett. b,  DL 331/93; prestazione di servizi di telecomunicazioni, tele-radiodiffusione ed elettronici ex art. 7-sexies lett. f, g, art. 74-sexies DPR 633/72) |





 



