---
typora-root-url: ./
---

# Contabilità Competenza Ratei Risconti

---

![image](PrimaNotaRateiRisconti.jpg)

## Contabilità - Periodo di competenza in Fattura di Acquisto e di Vendita [RISCONTO]

![image](800px-CompetenzaRateiRisconti.png)

Per la gestione di creazione Risconto, si fa utilizzo della Info Window da dashboard "Info Ratei/Risconti"
![800px-InfoRisconti](/800px-InfoRisconti.png)

### Documentazione Tecnica

```
Table : C_InvoiceLine  add  DateFrom , DateTo , DateLastRun, AmtAcct, LIT_CompetenceType(Referencelist)

Reference : LIT_CompetenceType  LIST 
			- DM // Monthly Deferred (Risconto Mensile)
			- DY // Annual Deferred  (Risconto Annuale)
=========================================================
Table : C_AcctSchema_GL add LIT_Deferrals_Acct(Risconto Passivo), LIT_DeferralsSO_Acct(Risconto Attivo)
```

## Contabilità - Periodo di competenza in Contratto di Acquisto e di Vendita [RATEO]

![image](/opt/md/Progetti%20iDempiere%20Da%20Iniziare%20In%20Corso%20Archiviati/Contabilit%C3%A0%20competenza%20Ratei%20Risconti/800px-CompetenzaRateiRisconti_2.png)

Per la gestione di creazione Rateo, si fa utilizzo della Info Window da dashboard "Info Ratei/Risconti_2"
![800px-InfoRisconti](/800px-InfoRateo.png)

### Documentazione Tecnica

```
Table : C_ContractLine  add  DateFrom , DateTo , DateLastRun, AmtAcct, LIT_CompetenceType(Referencelist)
Reference : LIT_CompetenceType  LIST 
			- AM // Monthly Accrual (Rateo Mensile)
			- AY // Annual Accrual  (Rateo Annuale)
=========================================================
Table : C_AcctSchema_GL add LIT_Accruals_Acct(Rateo Passivo), LIT_AccrualsSO_Acct(Rateo Attivo)
```

