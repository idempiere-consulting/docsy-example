DOC_FragPatch





## FRAG : idIta.modification.org.adempiere.base

### P1583  Apertura SP senza Dimensioni Contabili #PATCH -  DATA : 2019-12-03

Descrizione : Dimensione contabile raggruppata SOLO per Account_ID, se su tab Dettaglio della maschera
   "Generatore Giornale Prima Nota" il flag 'CopyAllDimensions' è uguale a FALSE

Classe java :	GLJournalGenerate.java

```
diff -r efaf165c8352 -r 062d3c88c4d8 idIta.modification.org.adempiere.base/src/org/globalqss/process/GLJournalGenerate.java
--- a/idIta.modification.org.adempiere.base/src/org/globalqss/process/GLJournalGenerate.java	mar dic 03 11:03:18 2019 +0100to
+++ b/idIta.modification.org.adempiere.base/src/org/globalqss/process/GLJournalGenerate.java	mar dic 03 17:12:05 2019 +0100
@@ -173,6 +173,12 @@
 					groupColumns.add(tablename + "_ID");
 					idxBPColumn = groupColumns.size()-1;
 				}
+				//iDempiereConsulting __03/12/2019 ---- Dimensione contabile raggruppata SOLO per Account_ID. se flag 'CopyAllDimensions' è uguale a FALSE
+				else {
+					groupColumns.add("Account_ID");
+					line.setIsCopyAllDimensions(true);///forzato.....
+				}
+				//iDempiereConsulting __03/12/2019 ---------- END
 
 				if (line.isSameProduct())
 					groupColumns.add("M_Product_ID");

```



------

### P1621 Duplicazione Promotion con ordine parzialmente evaso #PATCH DATA : 2019-12-02 

Descrizione : Promotion_CONAI update_5, Se in caso la promo presente sull'ordine è gia legata ad un DDT,
   evito la duplicazione in caso di riapertura dell'ordine

Classe Java : PromotionRule.java

```
diff -r 5c085b2b676b -r 32d96d8f5897 idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java	lun dic 02 09:56:32 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java	lun dic 02 14:55:27 2019 +0100
@@ -69,6 +69,7 @@
 		boolean isVATCalcLine = false;
 		boolean isSupplPromotion = false;
 		MOrderLine[] lines_1 = order.getLines();
+		List<Integer> noPromoDuplicate = new ArrayList<Integer>();
 		
 		//cacheReset
 		if(listConsolid!=null)
@@ -87,7 +88,12 @@
 			Number id = (Number) ol.get_Value("M_Promotion_ID");
 			if (id != null && id.intValue() > 0) {
 				ol.setQtyReserved(BigDecimal.ZERO);
-				ol.delete(false);
+				boolean noDuplicate= ol.delete(false);
+				//iDempiereConsulting __02/12/2019 --- Se in caso la promo presente sull'ordine è gia legata ad un DDT, evito la duplicazione in caso di riapertura dell'ordine
+				if(!noDuplicate) {
+					noPromoDuplicate.add(id.intValue());
+				}
+				///////
 				hasDeleteLine = true;
 			}
 		}
@@ -105,7 +111,7 @@
 
 			orderLineQty = new LinkedHashMap<Integer, BigDecimal>();
 			promotions = PromotionRule.findM_Promotion_IDByOrderLine(mOrderLine);
-			if (promotions == null || promotions.isEmpty()) continue;
+			if ((promotions == null || promotions.isEmpty())) continue;
 
 			BigDecimal orderAmount = mOrderLine.getLineNetAmt();
 			orderLineQty.put(mOrderLine.getC_OrderLine_ID(), mOrderLine.getQtyOrdered());
@@ -116,6 +122,11 @@
 
 			//distribute order lines
 			for (Map.Entry<Integer, List<Integer>> entry : promotions.entrySet()) {
+				//iDempiereConsulting __02/12/2019 --- Se in caso la promo presente sull'ordine è gia legata ad un DDT, evito la duplicazione in caso di riapertura dell'ordine
+				if(noPromoDuplicate.contains(entry.getKey()))
+					continue;
+				/////
+				
 				Query query = new Query(Env.getCtx(), MTable.get(order.getCtx(), I_M_PromotionDistribution.Table_ID),
 						"M_PromotionDistribution.M_Promotion_ID = ? AND M_PromotionDistribution.IsActive = 'Y'", order.get_TrxName());
 				query.setParameters(new Object[]{entry.getKey()});

```

------

### P1620 Consulenza iDempiere #PATCH DATA : 2019-11-25

Descrizione : aggiunta BOMQty su righe Production + modifica processo Crea/Aggiorna Dettaglio + Creata callout BOMQty

Classe Java : MProduction.java

```
diff -r 1ae0f2e0fc39 -r 67b4066365c5 idIta.modification.org.adempiere.base/src/org/compiere/model/MProduction.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MProduction.java	lun nov 25 12:12:28 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MProduction.java	lun nov 25 16:30:46 2019 +0100
@@ -317,6 +317,7 @@
 	 //// iDempiereConsulting __ 12/10/2019 -- Prendo il locator inverto la valorizzazione del locator						
 						BOMLine.setM_Locator_ID( locatorWIP );  
 						BOMLine.set_ValueOfColumn("LIT_M_LocatorFrom_ID", defaultLocator);
+						BOMLine.set_ValueOfColumn("BOMQty", BOMQty);
 	  //// iDempiereConsulting __ 12/10/2019 -- END ------------------------------------------------					
 						BOMLine.setQtyUsed(BOMMovementQty );
 						BOMLine.setPlannedQty( BOMMovementQty );
@@ -333,7 +334,8 @@
 						BOMLine.setM_Product_ID( BOMProduct_ID );
 	 //// iDempiereConsulting __ 12/10/2019 -- Prendo il locator inverto la valorizzazione del locator		
 						BOMLine.setM_Locator_ID( locatorWIP );  
-						BOMLine.set_ValueOfColumn("LIT_M_LocatorFrom_ID", defaultLocator);						
+						BOMLine.set_ValueOfColumn("LIT_M_LocatorFrom_ID", defaultLocator);	
+						BOMLine.set_ValueOfColumn("BOMQty", BOMQty);
 	  //// iDempiereConsulting __ 12/10/2019 -- END ------------------------------------------------	
 						BOMLine.setQtyUsed( BOMMovementQty );
 						BOMLine.setPlannedQty( BOMMovementQty );
@@ -393,6 +395,9 @@
 									BOMLine.setQtyUsed(BOMLine.getQtyUsed()
 											.add(lineQty));
 									BOMLine.setPlannedQty(BOMLine.getQtyUsed());
+								     //// iDempiereConsulting __ 22/11/2019 -- Prendo il BOMQty
+									BOMLine.set_ValueOfColumn("BOMQty", BOMQty);
+								     //// iDempiereConsulting __ 22/11/2019 -- END
 									BOMLine.saveEx(get_TrxName());
 
 								}
@@ -406,6 +411,7 @@
 							//		BOMLine.set_ValueOfColumn("LIT_M_LocatorFrom_ID", loc);	 
 							//		imposto sempre il default locator e non guardo la giacenza nella StorageONHand
 									BOMLine.set_ValueOfColumn("LIT_M_LocatorFrom_ID", defaultLocator);	
+									BOMLine.set_ValueOfColumn("BOMQty", BOMQty);
 	//// iDempiereConsulting __ 12/10/2019 -- END ------------------------------------------------
 									BOMLine.setQtyUsed( lineQty);
 									BOMLine.setPlannedQty( lineQty);
@@ -436,6 +442,9 @@
 									BOMLine.setQtyUsed(BOMLine.getQtyUsed()
 											.add(BOMMovementQty));
 									BOMLine.setPlannedQty(BOMLine.getQtyUsed());
+								     //// iDempiereConsulting __ 22/11/2019 -- Prendo il BOMQty
+									BOMLine.set_ValueOfColumn("BOMQty", BOMQty);
+								     //// iDempiereConsulting __ 22/11/2019 -- END
 									BOMLine.saveEx(get_TrxName());
 
 								}
@@ -447,7 +456,8 @@
 									BOMLine.setM_Product_ID( BOMProduct_ID );
      //// iDempiereConsulting __ 12/10/2019 -- Prendo il locator inverto la valorizzazione del locator	
 									BOMLine.setM_Locator_ID( locatorWIP );
-									BOMLine.set_ValueOfColumn("LIT_M_LocatorFrom_ID", defaultLocator);	
+									BOMLine.set_ValueOfColumn("LIT_M_LocatorFrom_ID", defaultLocator);
+									BOMLine.set_ValueOfColumn("BOMQty", BOMQty);
 	//// iDempiereConsulting __ 12/10/2019 -- END ------------------------------------------------
 									BOMLine.setQtyUsed( BOMMovementQty);
 									BOMLine.setPlannedQty( BOMMovementQty);
@@ -828,6 +838,9 @@
 					MProductionLine tline = new MProductionLine(tplan);
 					PO.copyValues (fline, tline, getAD_Client_ID(), getAD_Org_ID());
 					tline.setM_ProductionPlan_ID(tplan.getM_ProductionPlan_ID());
+				     //// iDempiereConsulting __ 22/11/2019 -- Prendo il BOMQty
+				    tline.set_ValueOfColumn("BOMQty",fline.get_Value("BOMQty"));		    
+				     //// iDempiereConsulting __ 12/10/2019 -- END
 					tline.setMovementQty(fline.getMovementQty().negate());
 					tline.setPlannedQty(fline.getPlannedQty().negate());
 					tline.setQtyUsed(fline.getQtyUsed().negate());
@@ -842,6 +855,9 @@
 				MProductionLine tline = new MProductionLine(to);
 				PO.copyValues (fline, tline, getAD_Client_ID(), getAD_Org_ID());
 				tline.setM_Production_ID(to.getM_Production_ID());
+			     //// iDempiereConsulting __ 22/11/2019 -- Prendo il BOMQty
+			    tline.set_ValueOfColumn("BOMQty",fline.get_Value("BOMQty"));		    
+			     //// iDempiereConsulting __ 12/10/2019 -- END
 				tline.setMovementQty(fline.getMovementQty().negate());
 				tline.setPlannedQty(fline.getPlannedQty().negate());
 				tline.setQtyUsed(fline.getQtyUsed().negate());

```

------

### P1615 Rettifica Lotti #Patch Data : 2019-11-21

Descrizione : Nuova Special Form "Rettifica Lotti"

Classe Java : MMovementLine.java

N° Stringa: 99

```
public int getM_AttributeSetInstanceTo_ID ()
+	{
+		int M_AttributeSetInstanceTo_ID = super.getM_AttributeSetInstanceTo_ID();
+		//iDempiereConsulting __20/11/2019 --- No set for special form "Attribute Set Adjustment"
+//		if (M_AttributeSetInstanceTo_ID == 0 && (getM_Locator_ID() == getM_LocatorTo_ID()))
+//			M_AttributeSetInstanceTo_ID = super.getM_AttributeSetInstance_ID();
+		//iDempiereConsulting __20/11/2019 --------- END 
+		return M_AttributeSetInstanceTo_ID;
+	}	//	getM_AttributeSetInstanceTo_ID
```



------

###  P1546 RMA #PATCH Data : 2019-11-15 

Descrizione : modificata classe ProductionLine Aggiungo controllo se qtà = 0 non scrivo nella Transacion e StorageOnHand 

Classe Java :MProductionLine.java

```
diff -r 2492c21dbe99 -r 01ffaa64375a idIta.modification.org.adempiere.base/src/org/compiere/model/MProductionLine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MProductionLine.java	ven nov 15 15:55:01 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MProductionLine.java	ven nov 15 17:13:00 2019 +0100
@@ -107,44 +107,49 @@
 		if (log.isLoggable(Level.FINEST))	log.log(Level.FINEST, "asi Description is: " + asiString);
 		// create transactions for finished goods
 		if ( getM_Product_ID() == getEndProduct_ID()) {
-			if (reversalId <= 0  && isAutoGenerateLot && getM_AttributeSetInstance_ID() == 0)
-			{
-				asi = MAttributeSetInstance.generateLot(getCtx(), (MProduct)getM_Product(), get_TrxName());
-				setM_AttributeSetInstance_ID(asi.getM_AttributeSetInstance_ID());
-			} 
-			Timestamp dateMPolicy = date;
-			if(getM_AttributeSetInstance_ID()>0){
-				Timestamp t = MStorageOnHand.getDateMaterialPolicy(getM_Product_ID(), getM_AttributeSetInstance_ID(), getM_Locator_ID(), get_TrxName());
-				if (t != null)
-					dateMPolicy = t;
-			}
-			
-			dateMPolicy = Util.removeTime(dateMPolicy);
-			//for reversal, keep the ma copy from original trx
-			if (reversalId <= 0  ) 
-			{
-				MProductionLineMA lineMA = new MProductionLineMA( this,
-						asi.get_ID(), getMovementQty(),dateMPolicy);
-				if ( !lineMA.save(get_TrxName()) ) {
-					log.log(Level.SEVERE, "Could not save MA for " + toString());
-					errorString.append("Could not save MA for " + toString() + "\n" );
+			//iDempiereConsulting __15/11/2019 --- Aggiungo controllo se qtà = 0 non scrivo nella Transacion e StorageOnHand
+			if (getMovementQty().compareTo(BigDecimal.ZERO)!=0) {
+				//iDempiereConsulting __15/11/2019 -------------------------------
+				if (reversalId <= 0  && isAutoGenerateLot && getM_AttributeSetInstance_ID() == 0)
+				{
+					asi = MAttributeSetInstance.generateLot(getCtx(), (MProduct)getM_Product(), get_TrxName());
+					setM_AttributeSetInstance_ID(asi.getM_AttributeSetInstance_ID());
+				} 
+				Timestamp dateMPolicy = date;
+				if(getM_AttributeSetInstance_ID()>0){
+					Timestamp t = MStorageOnHand.getDateMaterialPolicy(getM_Product_ID(), getM_AttributeSetInstance_ID(), getM_Locator_ID(), get_TrxName());
+					if (t != null)
+						dateMPolicy = t;
 				}
-			}
-			MTransaction matTrx = new MTransaction (getCtx(), getAD_Org_ID(), 
-					"P+", 
-					getM_Locator_ID(), getM_Product_ID(), asi.get_ID(), 
-					getMovementQty(), date, get_TrxName());
-			matTrx.setM_ProductionLine_ID(get_ID());
-			if ( !matTrx.save(get_TrxName()) ) {
-				log.log(Level.SEVERE, "Could not save transaction for " + toString());
-				errorString.append("Could not save transaction for " + toString() + "\n");
-			}
-			MStorageOnHand storage = MStorageOnHand.getCreate(getCtx(), getM_Locator_ID(),
-					getM_Product_ID(), asi.get_ID(),dateMPolicy, get_TrxName());
-			storage.addQtyOnHand(getMovementQty());
-			if (log.isLoggable(Level.FINE))log.log(Level.FINE, "Created finished goods line " + getLine());
-			
-			return errorString.toString();
+				
+				dateMPolicy = Util.removeTime(dateMPolicy);
+				//for reversal, keep the ma copy from original trx
+				if (reversalId <= 0  ) 
+				{
+					MProductionLineMA lineMA = new MProductionLineMA( this,
+							asi.get_ID(), getMovementQty(),dateMPolicy);
+					if ( !lineMA.save(get_TrxName()) ) {
+						log.log(Level.SEVERE, "Could not save MA for " + toString());
+						errorString.append("Could not save MA for " + toString() + "\n" );
+					}
+				}
+				
+				MTransaction matTrx = new MTransaction (getCtx(), getAD_Org_ID(), 
+						"P+", 
+						getM_Locator_ID(), getM_Product_ID(), asi.get_ID(), 
+						getMovementQty(), date, get_TrxName());
+				matTrx.setM_ProductionLine_ID(get_ID());
+				if ( !matTrx.save(get_TrxName()) ) {
+					log.log(Level.SEVERE, "Could not save transaction for " + toString());
+					errorString.append("Could not save transaction for " + toString() + "\n");
+				}
+				MStorageOnHand storage = MStorageOnHand.getCreate(getCtx(), getM_Locator_ID(),
+						getM_Product_ID(), asi.get_ID(),dateMPolicy, get_TrxName());
+				storage.addQtyOnHand(getMovementQty());
+				if (log.isLoggable(Level.FINE))log.log(Level.FINE, "Created finished goods line " + getLine());
+				
+				return errorString.toString();
+				}
 		}
 		
 		// create transactions and update stock used in production

```

------

### P1526 Saldo Conto su Infoconto #Patch Data : 2019-11-12

- add data 1 
- nascondere fino alla data from 
- inserire saldo 

Descrizione : modifica Callout Cespiti con aggiunta calcolo Date Entrata in Funzione su Importazione Cespiti

Classe Java : CalloutA_Depreciation_Workfile.java

```
diff -r 248a5874bb39 -r 7be6fdbe2969 idIta.modification.org.adempiere.base/src/org/idempiere/fa/model/CalloutA_Depreciation_Workfile.java
--- a/idIta.modification.org.adempiere.base/src/org/idempiere/fa/model/CalloutA_Depreciation_Workfile.java	mar nov 12 16:59:48 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/idempiere/fa/model/CalloutA_Depreciation_Workfile.java	mar nov 12 17:43:36 2019 +0100
@@ -2,6 +2,10 @@
 
 import java.math.BigDecimal;
 import java.math.RoundingMode;
+import java.sql.Timestamp;
+import java.text.SimpleDateFormat;
+import java.util.Calendar;
+import java.util.Date;
 import java.util.Properties;
 
 import org.compiere.model.CalloutEngine;
@@ -143,15 +147,58 @@
 			BigDecimal operation = (BigDecimal.valueOf(100.0)).divide(PercentUtilization , 4, RoundingMode.HALF_UP).multiply(A_Period_1);
 			BigDecimal Amount_Period_1 =  ((BigDecimal)mTab.getValue("A_Asset_Cost")).divide(operation, 4, RoundingMode.HALF_UP); 
 			BigDecimal AccumulatedResidual = ((BigDecimal)mTab.getValue("A_Accumulated_Depr")).subtract(Amount_Period_1.multiply(BigDecimal.valueOf(12.0)));
+			
+			BigDecimal Actual_Period = BigDecimal.ZERO;
 			if (AccumulatedResidual.compareTo(BigDecimal.ZERO) >= 0) {				
 				BigDecimal operat = (BigDecimal.valueOf(100.0)).divide(Percent, 4, RoundingMode.HALF_UP).multiply(A_Period_1);
 				BigDecimal Amount_Residual = ((BigDecimal)mTab.getValue("A_Asset_Cost")).divide(operat, 4, RoundingMode.HALF_UP); 
-				BigDecimal Actual_Period = (AccumulatedResidual.divide(Amount_Residual, 4, RoundingMode.HALF_UP)).add(A_Period_1).add(BigDecimal.valueOf(1.0));
+				Actual_Period = (AccumulatedResidual.divide(Amount_Residual, 1, RoundingMode.HALF_UP)).add(A_Period_1).add(BigDecimal.valueOf(1.0));
 		
 				mTab.setValue(MDepreciationWorkfile.COLUMNNAME_A_Current_Period, Actual_Period);
 			} else {
 				mTab.setValue(MDepreciationWorkfile.COLUMNNAME_A_Current_Period, 1);
 			}
+			//"Data Entrata in Funzione" calcolata
+			if ((Timestamp)mTab.getValue("DateAcct")!=null) {
+				
+				Calendar calendar = Calendar.getInstance();
+				calendar.clear();
+				calendar.setTime((Timestamp)mTab.getValue("DateAcct"));
+				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 00:00:00.0");	
+				int PeriodStartAsset = (Actual_Period.negate().add(BigDecimal.ONE)).intValue();
+				calendar.add(Calendar.MONTH, PeriodStartAsset);
+				Date result = calendar.getTime();			
+
+				Timestamp mDate_convert = Timestamp.valueOf(formatter.format(result));
+				
+				//"Data Entrata in Funzione" calcolata
+				mTab.setValue("AssetServiceDate", mDate_convert);		
+			}
+		  }	  
+		}
+		//sulla Tabella Asset Addition
+		 else if (MDepreciationWorkfile.COLUMNNAME_A_Accumulated_Depr.equals(mField.getColumnName()) && mTab.getAD_Table_ID()==53137)
+		{
+		  if (value!=null) {
+			
+			 MDepreciationWorkfile assetwk = MDepreciationWorkfile.get(ctx, (Integer)mTab.getValue("A_Asset_ID"), (String)mTab.getValue("PostingType"));
+	
+			BigDecimal PercentUtilization = new BigDecimal(assetwk.get_ValueAsString("PercentUtilization"));
+			BigDecimal Percent = new BigDecimal(assetwk.get_ValueAsString("Percent"));
+			BigDecimal A_Period_1 = new BigDecimal(assetwk.get_ValueAsString("A_Period_1"));
+			
+			BigDecimal operation = (BigDecimal.valueOf(100.0)).divide(PercentUtilization , 4, RoundingMode.HALF_UP).multiply(A_Period_1);
+			BigDecimal Amount_Period_1 =  ((BigDecimal)mTab.getValue("AssetValueAmt")).divide(operation, 4, RoundingMode.HALF_UP); 
+			BigDecimal AccumulatedResidual = ((BigDecimal)mTab.getValue("A_Accumulated_Depr")).subtract(Amount_Period_1.multiply(BigDecimal.valueOf(12.0)));
+			if (AccumulatedResidual.compareTo(BigDecimal.ZERO) >= 0) {				
+				BigDecimal operat = (BigDecimal.valueOf(100.0)).divide(Percent, 4, RoundingMode.HALF_UP).multiply(A_Period_1);
+				BigDecimal Amount_Residual = ((BigDecimal)mTab.getValue("AssetValueAmt")).divide(operat, 4, RoundingMode.HALF_UP); 
+				BigDecimal Actual_Period = (AccumulatedResidual.divide(Amount_Residual, 1, RoundingMode.HALF_UP)).add(A_Period_1).add(BigDecimal.valueOf(1.0));
+		
+				mTab.setValue("A_Period_Start", Actual_Period);
+			} else {
+				mTab.setValue("A_Period_Start", 1);
+			}
 		  }	  
 		}
 //////iDempiereConsulting __ 24/09/2019 - CHIUSO/////////////////////////////////////////////////////////////////////////////////////////////////////

```

------

### P1522 Prendere Magazzino in anagrafica del prodotto #Patch Data : 2019-11-07

Descrizione : Prendere magazzino da anagrafica Prodotto, se presente.

Classe Java : MStorageOnHand.java

N° Stringa: 756

```
int M_Product_ID, int M_AttributeSetInstance_ID, BigDecimal Qty,
		String trxName)
	{
		//iDempiereConsulting __06/11/2019 --- TASK N. 1001522 (Magazzino / Locator Patch  )
		int locatorIDFromProd = DB.getSQLValue(null, "SELECT M_Locator_ID FROM M_Product WHERE AD_Client_ID=? AND M_Product_ID=?", Env.getAD_Client_ID(Env.getCtx()), M_Product_ID);
		if(locatorIDFromProd>0)
			return locatorIDFromProd;
		//iDempiereConsulting __06/11/2019 ----- END

		int M_Locator_ID = 0;
		
```



------

###   P1546  RMA #PATCH  Data: 2019-10-30   

Descrizione : Settaggio M_Locator_ID prendendo dalla testata RMA

Classe Java : MRMALine.java

```
diff -r ec851e303afd -r 411407348a24 idIta.modification.org.adempiere.base/src/org/compiere/model/MRMALine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MRMALine.java	mar ott 29 18:39:53 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MRMALine.java	mer ott 30 14:53:53 2019 +0100
@@ -366,6 +366,12 @@
         
         this.setLineNetAmt(getTotalAmt());
         
+        //iDempiereConsulting __30/10/2019 --- Settaggio M_Locator_ID prendendo dalla testata RMA
+        if(get_ColumnIndex("M_Locator_ID")>-1 && get_ValueAsInt("M_Locator_ID")<=0 && getParent().get_ColumnIndex("M_locator_ID")>-1 && getParent().get_ValueAsInt("M_locator_ID")>0) {
+        	set_ValueNoCheck("M_Locator_ID", getParent().get_ValueAsInt("M_locator_ID"));
+        }
+        //iDempiereConsulting __30/10/2019 ---- END
+        
         return true;
     }
     

```

------

### P547 x Andrea Bellotto - TIPODOC Fattura anticipo a standard vedi BITRABI #Patch Data : 2019-10-25

Descrizione : Processo di "Crea/Aggiorna Dettaglio" maschera "Produzione (Prodotto Singolo) [PPS00]",
   creazione di linee SOLO di un storage del default Locator

Classe Java : MProduction.java

```
diff -r 80162c3be534 -r ec5467b19e8a idIta.modification.org.adempiere.base/src/org/compiere/model/MProduction.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MProduction.java	gio ott 24 16:23:12 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MProduction.java	ven ott 25 11:24:32 2019 +0200
@@ -363,8 +363,12 @@
 							MMPolicy = client.getMMPolicy();
 						}
 
+						//iDempiereConsulting __25/10/2019 --- Storage di un SOLO determinato Locator
+							//storages = MStorageOnHand.getWarehouse(getCtx(), M_Warehouse_ID, BOMProduct_ID, 0, null,
+								//	MProductCategory.MMPOLICY_FiFo.equals(MMPolicy), true, 0, get_TrxName());
 						storages = MStorageOnHand.getWarehouse(getCtx(), M_Warehouse_ID, BOMProduct_ID, 0, null,
-								MProductCategory.MMPOLICY_FiFo.equals(MMPolicy), true, 0, get_TrxName());
+								MProductCategory.MMPOLICY_FiFo.equals(MMPolicy), true, defaultLocator, get_TrxName());
+						//iDempiereConsulting __25/10/2019 ----- END
 
 						MProductionLine BOMLine = null;
 						int prevLoc = -1;

```

------

### P928 . add task JOLLY _AC #Patch Data : 2019-10-21

Descrizione : Processo di "Crea/Aggiorna Dettaglio" maschera "Produzione (Prodotto Singolo) [PPS00]",
   creazione di linee SOLO di prodotti attivi su distinta base

Classe Java : MProduction.java

```
diff -r dc35def3ef69 -r 1fc166b5ba10 idIta.modification.org.adempiere.base/src/org/compiere/model/MProduction.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MProduction.java	lun ott 21 15:34:32 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MProduction.java	lun ott 21 16:42:18 2019 +0200
@@ -272,8 +272,13 @@
 		int asi = 0;
 
 		// products used in production
+		
+		//iDempiereConsulting __21/10/2019 --- M_Product.isActive ='Y'
+//		String sql = "SELECT M_ProductBom_ID, BOMQty" + " FROM M_Product_BOM"
+//				+ " WHERE M_Product_ID=" + finishedProduct.getM_Product_ID() + " ORDER BY Line";
 		String sql = "SELECT M_ProductBom_ID, BOMQty" + " FROM M_Product_BOM"
-				+ " WHERE M_Product_ID=" + finishedProduct.getM_Product_ID() + " ORDER BY Line";
+				+ " WHERE M_Product_ID=" + finishedProduct.getM_Product_ID() + " AND isActive='Y' ORDER BY Line";
+		//iDempiereConsulting __21/10/2019 ----- END
 
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;

```

------

### P1345 modificare genera scritture prima x chiusura + parametro  #Patch Data : 2019-10-21

Descrizione : Processo su "Generatore Giornale Prima Nota [GGPN00]", inserimento_dato del flag
   "Scrittura di Chiusura Bilancio" su Prima Nota

Classe Java : GLJournalGenerate.java

N° Stringa: 87

```
	private int p_M_Product_ID = 0;
	/* The Journal Generator */
	private int p_QSS_JournalGenerator_ID;
	//iDempiereConsulting __21/10/2019 --- Scrittura di Chiusura Bilancio, utilizzo di un Element già presente a sistema --> IsExclude
	/** Scrittura di Chiusura Bilancio */
	private boolean p_IsExclude = false;
	//

	/**
	 *  Prepare - e.g., get Parameters.
	 */
	protected void prepare()
	{
		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();
			if (name.equals("ProcessingDate")) {
				p_ProcessingDateFrom = (Timestamp)para[i].getParameter();
				p_ProcessingDateTo = (Timestamp)para[i].getParameter_To();
			}
			else if (name.equals("DateAcct"))
				p_DateAcct = (Timestamp)para[i].getParameter();
			else if (name.equals("IsSimulation"))
				p_IsSimulation = para[i].getParameterAsBoolean();
			else if (name.equals("DocAction"))
				p_DocAction = (String) para[i].getParameter();
			else if (name.equals("DocumentNo"))
				p_DocumentNo = (String) para[i].getParameter();
			else if (name.equals("C_BPartner_ID"))
				p_C_BPartner_ID = para[i].getParameterAsInt();
			else if (name.equals("M_Product_ID"))
				p_M_Product_ID = para[i].getParameterAsInt();
			//iDempiereConsulting __21/10/2019 --- Scrittura di Chiusura Bilancio, utilizzo di un Element già presente a sistema --> IsExclude
			else if(name.equals("IsExclude"))
				p_IsExclude = para[i].getParameterAsBoolean();
			else

```

------

###   P1101 scarico per c/lavorazione e carico come gestire il c/lavorazione #Patch Data : 2019-10-14

Descrizione : Aggiornamenti vari per conto lavoro _UPD4

Classe Java : MProductionLine.java

N° Stringa: 

```
diff -r e6778987df06 -r 1d952220e252 idIta.modification.org.adempiere.base/src/org/compiere/model/MProductionLine.java
--- /dev/null	gio gen 01 00:00:00 1970 +0000
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MProductionLine.java	lun ott 14 14:13:03 2019 +0200
@@ -0,0 +1,451 @@
+package org.compiere.model;
+
+import java.math.BigDecimal;
+import java.sql.PreparedStatement;
+import java.sql.ResultSet;
+import java.sql.SQLException;
+import java.sql.Timestamp;
+import java.util.ArrayList;
+import java.util.List;
+import java.util.Properties;
+import java.util.logging.Level;
+
+import org.adempiere.exceptions.AdempiereException;
+import org.compiere.util.DB;
+import org.compiere.util.Env;
+import org.compiere.util.Util;
+
+
+public class MProductionLine extends X_M_ProductionLine {
+	/**
+	 * 
+	 */
+	private static final long serialVersionUID = 3720901152312853611L;
+
+	protected MProduction productionParent;
+
+
+	/**
+	 * 	Standard Constructor
+	 *	@param ctx ctx
+	 *	@param M_ProductionLine_ID id
+	 */
+	public MProductionLine (Properties ctx, int M_ProductionLine_ID, String trxName)
+	{
+		super (ctx, M_ProductionLine_ID, trxName);
+		if (M_ProductionLine_ID == 0)
+		{
+			setLine (0);	// @SQL=SELECT NVL(MAX(Line),0)+10 AS DefaultValue FROM M_ProductionLine WHERE M_Production_ID=@M_Production_ID@
+			setM_AttributeSetInstance_ID (0);
+//			setM_Locator_ID (0);	// @M_Locator_ID@
+//			setM_Product_ID (0);
+			setM_ProductionLine_ID (0);
+			setM_Production_ID (0);
+			setMovementQty (Env.ZERO);
+			setProcessed (false);
+		}
+			
+	}	// MProductionLine
+	
+	public MProductionLine (Properties ctx, ResultSet rs, String trxName)
+	{
+		super(ctx, rs, trxName);
+	}	//	MProductionLine
+	
+	/**
+	 * Parent Constructor
+	 * @param plan
+	 */
+	public MProductionLine( MProduction header ) {
+		super( header.getCtx(), 0, header.get_TrxName() );
+		setM_Production_ID( header.get_ID());
+		setAD_Client_ID(header.getAD_Client_ID());
+		setAD_Org_ID(header.getAD_Org_ID());
+		productionParent = header;
+	}
+	
+	public MProductionLine( MProductionPlan header ) {
+		super( header.getCtx(), 0, header.get_TrxName() );
+		setM_ProductionPlan_ID( header.get_ID());
+		setAD_Client_ID(header.getAD_Client_ID());
+		setAD_Org_ID(header.getAD_Org_ID());
+	}
+	
+
+	/**
+	 * 
+	 * @param date
+	 * @return "" for success, error string if failed
+	 */
+	public String createTransactions(Timestamp date, boolean mustBeStocked) {
+		int reversalId = getProductionReversalId ();
+		if (reversalId <= 0  )
+		{
+			// delete existing ASI records
+			int deleted = deleteMA();
+			if (log.isLoggable(Level.FINE))log.log(Level.FINE, "Deleted " + deleted + " attribute records ");
+		}
+		MProduct prod = new MProduct(getCtx(), getM_Product_ID(), get_TrxName());
+		if (log.isLoggable(Level.FINE))log.log(Level.FINE,"Loaded Product " + prod.toString());
+		
+		if ( !prod.isStocked() || prod.getProductType().compareTo(MProduct.PRODUCTTYPE_Item ) != 0 )  {
+			// no need to do any movements
+			if (log.isLoggable(Level.FINE))log.log(Level.FINE, "Production Line " + getLine() + " does not require stock movement");
+			return "";
+		}
+		StringBuilder errorString = new StringBuilder();
+		
+		MAttributeSetInstance asi = new MAttributeSetInstance(getCtx(), getM_AttributeSetInstance_ID(), get_TrxName());
+		I_M_AttributeSet attributeset = prod.getM_AttributeSet();
+		boolean isAutoGenerateLot = false;
+		if (attributeset != null)
+			isAutoGenerateLot = attributeset.isAutoGenerateLot();		
+		String asiString = asi.getDescription();
+		if ( asiString == null )
+			asiString = "";
+		
+		if (log.isLoggable(Level.FINEST))	log.log(Level.FINEST, "asi Description is: " + asiString);
+		// create transactions for finished goods
+		if ( getM_Product_ID() == getEndProduct_ID()) {
+			if (reversalId <= 0  && isAutoGenerateLot && getM_AttributeSetInstance_ID() == 0)
+			{
+				asi = MAttributeSetInstance.generateLot(getCtx(), (MProduct)getM_Product(), get_TrxName());
+				setM_AttributeSetInstance_ID(asi.getM_AttributeSetInstance_ID());
+			} 
+			Timestamp dateMPolicy = date;
+			if(getM_AttributeSetInstance_ID()>0){
+				Timestamp t = MStorageOnHand.getDateMaterialPolicy(getM_Product_ID(), getM_AttributeSetInstance_ID(), getM_Locator_ID(), get_TrxName());
+				if (t != null)
+					dateMPolicy = t;
+			}
+			
+			dateMPolicy = Util.removeTime(dateMPolicy);
+			//for reversal, keep the ma copy from original trx
+			if (reversalId <= 0  ) 
+			{
+				MProductionLineMA lineMA = new MProductionLineMA( this,
+						asi.get_ID(), getMovementQty(),dateMPolicy);
+				if ( !lineMA.save(get_TrxName()) ) {
+					log.log(Level.SEVERE, "Could not save MA for " + toString());
+					errorString.append("Could not save MA for " + toString() + "\n" );
+				}
+			}
+			MTransaction matTrx = new MTransaction (getCtx(), getAD_Org_ID(), 
+					"P+", 
+					getM_Locator_ID(), getM_Product_ID(), asi.get_ID(), 
+					getMovementQty(), date, get_TrxName());
+			matTrx.setM_ProductionLine_ID(get_ID());
+			if ( !matTrx.save(get_TrxName()) ) {
+				log.log(Level.SEVERE, "Could not save transaction for " + toString());
+				errorString.append("Could not save transaction for " + toString() + "\n");
+			}
+			MStorageOnHand storage = MStorageOnHand.getCreate(getCtx(), getM_Locator_ID(),
+					getM_Product_ID(), asi.get_ID(),dateMPolicy, get_TrxName());
+			storage.addQtyOnHand(getMovementQty());
+			if (log.isLoggable(Level.FINE))log.log(Level.FINE, "Created finished goods line " + getLine());
+			
+			return errorString.toString();
+		}
+		
+		// create transactions and update stock used in production
+		MStorageOnHand[] storages = MStorageOnHand.getAll( getCtx(), getM_Product_ID(),
+				getM_Locator_ID(), get_TrxName(), false, 0);
+		
+		MProductionLineMA lineMA = null;
+		MTransaction matTrx = null;
+		BigDecimal qtyToMove = getMovementQty().negate();
+
+		if (qtyToMove.signum() > 0) {
+			for (int sl = 0; sl < storages.length; sl++) {
+	
+				BigDecimal lineQty = storages[sl].getQtyOnHand();
+				
+				if (log.isLoggable(Level.FINE))log.log(Level.FINE, "QtyAvailable " + lineQty );
+				if (lineQty.signum() > 0) 
+				{
+					if (lineQty.compareTo(qtyToMove ) > 0)
+							lineQty = qtyToMove;
+	
+					MAttributeSetInstance slASI = new MAttributeSetInstance(getCtx(),
+							storages[sl].getM_AttributeSetInstance_ID(),get_TrxName());
+					String slASIString = slASI.getDescription();
+					if (slASIString == null)
+						slASIString = "";
+					
+					if (log.isLoggable(Level.FINEST))log.log(Level.FINEST,"slASI-Description =" + slASIString);
+						
+					if ( slASIString.compareTo(asiString) == 0
+							|| asi.getM_AttributeSet_ID() == 0  )  
+					//storage matches specified ASI or is a costing asi (inc. 0)
+				    // This process will move negative stock on hand quantities
+					{
+						lineMA = MProductionLineMA.get(this,storages[sl].getM_AttributeSetInstance_ID(),storages[sl].getDateMaterialPolicy());
+						lineMA.setMovementQty(lineMA.getMovementQty().add(lineQty.negate()));
+						if ( !lineMA.save(get_TrxName()) ) {
+							log.log(Level.SEVERE, "Could not save MA for " + toString());
+							errorString.append("Could not save MA for " + toString() + "\n" );
+						} else {
+							if (log.isLoggable(Level.FINE))log.log(Level.FINE, "Saved MA for " + toString());
+						}
+						matTrx = new MTransaction (getCtx(), getAD_Org_ID(), 
+								"P-", 
+								getM_Locator_ID(), getM_Product_ID(), lineMA.getM_AttributeSetInstance_ID(), 
+								lineQty.negate(), date, get_TrxName());
+						matTrx.setM_ProductionLine_ID(get_ID());
+						if ( !matTrx.save(get_TrxName()) ) {
+							log.log(Level.SEVERE, "Could not save transaction for " + toString());
+							errorString.append("Could not save transaction for " + toString() + "\n");
+						} else {
+							if (log.isLoggable(Level.FINE))log.log(Level.FINE, "Saved transaction for " + toString());
+						}
+						DB.getDatabase().forUpdate(storages[sl], 120);
+						storages[sl].addQtyOnHand(lineQty.negate());
+						qtyToMove = qtyToMove.subtract(lineQty);
+						if (log.isLoggable(Level.FINE))log.log(Level.FINE, getLine() + " Qty moved = " + lineQty + ", Remaining = " + qtyToMove );
+					}
+				}
+				
+				if ( qtyToMove.signum() == 0 )			
+					break;
+				
+			} // for available storages
+		}
+		else if (qtyToMove.signum() < 0 )
+		{
+		
+			MClientInfo m_clientInfo = MClientInfo.get(getCtx(), getAD_Client_ID(), get_TrxName());
+			MAcctSchema acctSchema = new MAcctSchema(getCtx(), m_clientInfo.getC_AcctSchema1_ID(), get_TrxName());				
+			if (asi.get_ID() == 0 && MAcctSchema.COSTINGLEVEL_BatchLot.equals(prod.getCostingLevel(acctSchema)) )
+			{
+				//add quantity to last attributesetinstance
+				String sqlWhere = "M_Product_ID=? AND M_Locator_ID=? AND M_AttributeSetInstance_ID > 0 ";
+				MStorageOnHand storage = new Query(getCtx(), MStorageOnHand.Table_Name, sqlWhere, get_TrxName())
+						.setParameters(getM_Product_ID(), getM_Locator_ID())
+						.setOrderBy(MStorageOnHand.COLUMNNAME_DateMaterialPolicy+" DESC,"+ MStorageOnHand.COLUMNNAME_M_AttributeSetInstance_ID +" DESC")
+						.first();
+			
+				if (storage != null)
+				{
+					setM_AttributeSetInstance_ID(storage.getM_AttributeSetInstance_ID());
+					asi = new MAttributeSetInstance(getCtx(), storage.getM_AttributeSetInstance_ID(), get_TrxName());
+					asiString = asi.getDescription();
+				} 
+				else
+				{	
+					String costingMethod = prod.getCostingMethod(acctSchema);
+					StringBuilder localWhereClause = new StringBuilder("M_Product_ID =?" )
+							.append(" AND C_AcctSchema_ID=?")
+							.append(" AND ce.CostingMethod = ? ")
+							.append(" AND CurrentCostPrice <> 0 ");
+						MCost cost = new Query(getCtx(),I_M_Cost.Table_Name,localWhereClause.toString(),get_TrxName())
+						.setParameters(getM_Product_ID(), acctSchema.get_ID(), costingMethod)
+						.addJoinClause(" INNER JOIN M_CostElement ce ON (M_Cost.M_CostElement_ID =ce.M_CostElement_ID ) ")
+						.setOrderBy("Updated DESC")
+						.first();
+					if (cost != null)
+					{
+						setM_AttributeSetInstance_ID(cost.getM_AttributeSetInstance_ID());
+						asi = new MAttributeSetInstance(getCtx(), cost.getM_AttributeSetInstance_ID(), get_TrxName());
+						asiString = asi.getDescription();
+						
+					} 
+					else
+					{
+						log.log(Level.SEVERE, "Cannot retrieve cost of Product r " + prod.toString());
+						errorString.append( "Cannot retrieve cost of Product " +prod.toString() ) ;
+					}
+
+				}			
+			
+			}
+		}
+		
+		
+		if ( !( qtyToMove.signum() == 0) ) {
+			if (mustBeStocked && qtyToMove.signum() > 0)
+			{
+				MLocator loc = new MLocator(getCtx(), getM_Locator_ID(), get_TrxName());
+				errorString.append( "Insufficient qty on hand of " + prod.toString() + " at "
+						+ loc.toString() + "\n");
+			}
+			else
+			{
+				MStorageOnHand storage = MStorageOnHand.getCreate(Env.getCtx(), getM_Locator_ID(), getM_Product_ID(),
+						asi.get_ID(), date, get_TrxName(), true);
+				
+				BigDecimal lineQty = qtyToMove;
+				MAttributeSetInstance slASI = new MAttributeSetInstance(getCtx(),
+						storage.getM_AttributeSetInstance_ID(),get_TrxName());
+				String slASIString = slASI.getDescription();
+				if (slASIString == null)
+					slASIString = "";
+				
+				if (log.isLoggable(Level.FINEST))log.log(Level.FINEST,"slASI-Description =" + slASIString);
+					
+				if ( slASIString.compareTo(asiString) == 0
+						|| asi.getM_AttributeSet_ID() == 0  )  
+				//storage matches specified ASI or is a costing asi (inc. 0)
+			    // This process will move negative stock on hand quantities
+				{
+					lineMA = MProductionLineMA.get(this,storage.getM_AttributeSetInstance_ID(),storage.getDateMaterialPolicy());
+					lineMA.setMovementQty(lineMA.getMovementQty().add(lineQty.negate()));
+					
+					if ( !lineMA.save(get_TrxName()) ) {
+						log.log(Level.SEVERE, "Could not save MA for " + toString());
+						errorString.append("Could not save MA for " + toString() + "\n" );
+					} else {
+						if (log.isLoggable(Level.FINE))log.log(Level.FINE, "Saved MA for " + toString());
+					}
+					matTrx = new MTransaction (getCtx(), getAD_Org_ID(), 
+							"P-", 
+							getM_Locator_ID(), getM_Product_ID(), asi.get_ID(), 
+							lineQty.negate(), date, get_TrxName());
+					matTrx.setM_ProductionLine_ID(get_ID());
+					if ( !matTrx.save(get_TrxName()) ) {
+						log.log(Level.SEVERE, "Could not save transaction for " + toString());
+						errorString.append("Could not save transaction for " + toString() + "\n");
+					} else {
+						if (log.isLoggable(Level.FINE))log.log(Level.FINE, "Saved transaction for " + toString());
+					}
+					storage.addQtyOnHand(lineQty.negate());
+					qtyToMove = qtyToMove.subtract(lineQty);
+					if (log.isLoggable(Level.FINE))log.log(Level.FINE, getLine() + " Qty moved = " + lineQty + ", Remaining = " + qtyToMove );
+				} else {
+					errorString.append( "Storage doesn't match ASI " + prod.toString() + " / "
+							+ slASIString + " vs. " + asiString + "\n");
+				}
+				
+			}
+			
+		}
+			
+		return errorString.toString();
+		
+	}
+
+	protected int getEndProduct_ID() {
+		if (productionParent != null) {
+			return productionParent.getM_Product_ID();
+		} else if (getM_Production_ID() > 0) {
+			return getM_Production().getM_Product_ID();
+		} else {
+			return getM_ProductionPlan().getM_Product_ID();
+		}
+	}
+
+	protected int deleteMA() {
+		String sql = "DELETE FROM M_ProductionLineMA WHERE M_ProductionLine_ID = " + get_ID();
+		int count = DB.executeUpdateEx( sql, get_TrxName() );
+		return count;
+	}
+
+	public String toString() {
+		if ( getM_Product_ID() == 0 )
+			return ("No product defined for production line " + getLine());
+		MProduct product = new MProduct(getCtx(),getM_Product_ID(), get_TrxName());
+		return ( "Production line:" + getLine() + " -- " + getMovementQty() + " of " + product.getValue());
+	}
+
+	@Override
+	protected boolean beforeSave(boolean newRecord) 
+	{
+		if (productionParent == null && getM_Production_ID() > 0)
+			productionParent = new MProduction(getCtx(), getM_Production_ID(), get_TrxName());
+
+		if (getM_Production_ID() > 0) 
+		{
+			//iDempiereConsulting __14/10/2019 --- Quantità Movimentata del prodotto padre (o prodottoFinito) accettata anche a '0'. Modifica per conto lavoro....
+			//if ( productionParent.getM_Product_ID() == getM_Product_ID() && productionParent.getProductionQty().signum() == getMovementQty().signum())
+			if ( productionParent.getM_Product_ID() == getM_Product_ID() && (productionParent.getProductionQty().signum() == getMovementQty().signum() || getMovementQty().compareTo(BigDecimal.ZERO)==0))
+				setIsEndProduct(true);
+			else 
+				setIsEndProduct(false);
+		} 
+		else 
+		{
+			I_M_ProductionPlan plan = getM_ProductionPlan();
+			if (plan.getM_Product_ID() == getM_Product_ID() && plan.getProductionQty().signum() == getMovementQty().signum())
+				setIsEndProduct(true);
+			else 
+				setIsEndProduct(false);
+		}
+		
+		if ( isEndProduct() && getM_AttributeSetInstance_ID() != 0 )
+		{
+			String where = "M_QualityTest_ID IN (SELECT M_QualityTest_ID " +
+			"FROM M_Product_QualityTest WHERE M_Product_ID=?) " +
+			"AND M_QualityTest_ID NOT IN (SELECT M_QualityTest_ID " +
+			"FROM M_QualityTestResult WHERE M_AttributeSetInstance_ID=?)";
+
+			List<MQualityTest> tests = new Query(getCtx(), MQualityTest.Table_Name, where, get_TrxName())
+			.setOnlyActiveRecords(true).setParameters(getM_Product_ID(), getM_AttributeSetInstance_ID()).list();
+			// create quality control results
+			for (MQualityTest test : tests)
+			{
+				test.createResult(getM_AttributeSetInstance_ID());
+			}
+		}
+		
+		if ( !isEndProduct() )
+		{
+			setMovementQty(getQtyUsed().negate());
+		}
+		
+		return true;
+	}
+	
+	@Override
+	protected boolean beforeDelete() {
+		
+		deleteMA();
+		return true;
+	}
+
+	/**
+	 * 	Get Reversal_ID of parent production
+	 *	@return Reversal_ID
+	 */
+	public int getProductionReversalId() {
+		if (getM_Production_ID() > 0)
+			return DB.getSQLValueEx(get_TrxName(), "SELECT Reversal_ID FROM M_Production WHERE M_Production_ID=?", getM_Production_ID());
+		else
+			return DB.getSQLValueEx(get_TrxName(), "SELECT p.Reversal_ID FROM M_ProductionPlan pp INNER JOIN M_Production p ON (pp.M_Production_ID = p.M_Production_ID) WHERE pp.M_ProductionPlan_ID=?", getM_ProductionPlan_ID());
+	}
+
+	/**
+	 * 
+	 * @return
+	 */
+	public MProductionLineMA[] getLineMAs() {
+		ArrayList<MProductionLineMA> list = new ArrayList<MProductionLineMA>();
+		
+		String sql = "SELECT pl.M_ProductionLine_ID, pl,M_AttributeSetInstance_ID , pl.MovementQty, pl.DateMaterialPolicy "
+			+ "FROM M_ProductionLineMA pl "
+			+ "WHERE pl.M_ProductionLine_ID = ?";
+		
+		PreparedStatement pstmt = null;
+		ResultSet rs = null;
+		try
+		{
+			pstmt = DB.prepareStatement(sql, get_TrxName());
+			pstmt.setInt(1, get_ID());			
+			rs = pstmt.executeQuery();
+			while (rs.next())
+				list.add( new MProductionLineMA( this, rs.getInt(2), rs.getBigDecimal(3), rs.getTimestamp(4) ) );	
+		}
+		catch (SQLException ex)
+		{
+			throw new AdempiereException("Unable to load production lines", ex);
+		}
+		finally
+		{
+			DB.close(rs, pstmt);
+			rs = null;
+			pstmt = null;
+		}
+		
+		MProductionLineMA[] retValue = new MProductionLineMA[list.size()];
+		list.toArray(retValue);
+		return retValue;
+	}
+}

```

------

###  P680 Aggiungere campo Data Stamp #Patch Data : 2019-10-14

Descrizione : Aggiornamenti vari per conto lavoro _UPD2

   + update 2Packs 1.0.0 e 1.0.1 [ver. 2019.10.14]

Classe Java : MProduction.java

N° Stringa: 135

```
						else {
+									BOMLine = new MProductionLine( this );
+									BOMLine.setLine( lineno );
+									BOMLine.setM_Product_ID( BOMProduct_ID );
+	 //// iDempiereConsulting __ 12/10/2019 -- Prendo il locator inverto la valorizzazione del locator	
+									BOMLine.setM_Locator_ID( locatorWIP );
+							//		BOMLine.set_ValueOfColumn("LIT_M_LocatorFrom_ID", loc);	 
+							//		imposto sempre il default locator e non guardo la giacenza nella StorageONHand
+									BOMLine.set_ValueOfColumn("LIT_M_LocatorFrom_ID", defaultLocator);	
+	//// iDempiereConsulting __ 12/10/2019 -- END ------------------------------------------------
+									BOMLine.setQtyUsed( lineQty);
+									BOMLine
```



------

### P0901 i-Service Gestire i Viaggi #PatchData : 2019-10-09

Descrizione : Patchs varie per gestione resi customizzati _UPD2

Classe Java : MRMALine.java

```
diff -r 2a75a3d815d6 -r 5978c4f5f2d5 idIta.modification.org.adempiere.base/src/org/compiere/model/MRMALine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MRMALine.java	mar ott 08 16:46:20 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MRMALine.java	mer ott 09 16:51:51 2019 +0200
@@ -19,6 +19,7 @@
 import java.math.BigDecimal;
 import java.math.RoundingMode;
 import java.sql.ResultSet;
+import java.sql.Timestamp;
 import java.util.Properties;
 
 import org.adempiere.base.Core;
@@ -180,6 +181,20 @@
         		//iDempiereConsulting __01/10/2019 No check error
 //            	else
 //            		throw new IllegalStateException("No Invoice/Order found the Shipment/Receipt associated");
+    			else {
+    				Timestamp today = new Timestamp(System.currentTimeMillis());
+    				//Recupero dati dalla testata
+    				int M_Warehouse_ID = getParent().get_ValueAsInt("M_Warehouse_ID");
+    				int C_BPartner_ID =  getParent().getC_BPartner_ID();
+    				int C_BPartner_Location_ID = DB.getSQLValue(null, "SELECT C_BPartner_Location_ID FROM C_BPartner_Location WHERE IsActive='Y' AND AD_Client_ID=? AND C_BPartner_ID=? AND IsBillTo='Y'", 
+    						getParent().getAD_Client_ID(), C_BPartner_ID);
+    				taxId = Tax.get(getCtx(), getM_Product_ID(), 0,
+    						today, today,
+    						getAD_Org_ID(), M_Warehouse_ID, 
+    						C_BPartner_Location_ID, // should be bill to
+    						C_BPartner_Location_ID, getParent().isSOTrx(), null);
+    			}
+    			//iDempiereConsulting __01/10/2019 ---- END
         	}
         	
         	pp.calculatePrice();

```

------

### P0083 Banca - Pagamento Online (1° Paypal ,...) #PatchData : 2019-10-08

Descrizione : Richieste di pagamento fatture tramite PayPal + aggiunto su controllo di creazione pagamento il paymentRule
   "Paypal"(L)

Classe Java : MPaySelectionCheck.java

```
diff -r 43eccf3c3a94 -r cc47d569a49f idIta.modification.org.adempiere.base/src/org/compiere/model/MPaySelectionCheck.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MPaySelectionCheck.java	gio ott 03 09:02:24 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MPaySelectionCheck.java	mar ott 08 16:45:54 2019 +0200
@@ -307,7 +307,8 @@
 				else if (check.getPaymentRule().equals(PAYMENTRULE_CreditCard))
 					payment.setTenderType(X_C_Payment.TENDERTYPE_CreditCard);
 				else if (check.getPaymentRule().equals(PAYMENTRULE_DirectDeposit)
-					|| check.getPaymentRule().equals(PAYMENTRULE_DirectDebit))
+					|| check.getPaymentRule().equals(PAYMENTRULE_DirectDebit) 
+					|| check.getPaymentRule().equals("L"))//iDempiereConsulting __07/10/2019 --- PayPal_paymentRULE ("L")
 					payment.setBankACH(check);
 				else
 				{
 				
```

------

###  P1546 RMA #PATCH   Data : 2019-10-07 

Descrizione : rimodifito Documento "Approve" su maschera Customer RMA in "Prepare"

Classe Java: DocumentEngine.java

```
diff -r 09dbdcd9db69 -r 1ef90e58711a idIta.modification.org.adempiere.base/src/org/compiere/process/DocumentEngine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/process/DocumentEngine.java	lun ott 07 17:20:10 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/process/DocumentEngine.java	lun ott 07 17:59:28 2019 +0200
@@ -1232,7 +1232,7 @@
 					|| docStatus.equals(DocumentEngine.STATUS_InProgress)
 					|| docStatus.equals(DocumentEngine.STATUS_Invalid))
 			{
-				options[index++] = DocumentEngine.ACTION_Approve;
+				options[index++] = DocumentEngine.ACTION_Prepare;
 			}
 			//iDempiereConsulting 07/10/2019  --- END
 			

```

------

###  P1546  RMA #PATCH Data : 2019-10-07 

Descrizione : aggiunto Documento "Approve" su maschera Customer RMA

Classe Java : DocumentEngine.java

```
diff -r 741f929cf444 -r 09dbdcd9db69 idIta.modification.org.adempiere.base/src/org/compiere/process/DocumentEngine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/process/DocumentEngine.java	lun ott 07 15:15:50 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/process/DocumentEngine.java	lun ott 07 17:20:10 2019 +0200
@@ -1227,6 +1227,15 @@
 		 */
 		else if (AD_Table_ID == MRMA.Table_ID)
 		{
+			//iDempiereConsulting 07/10/2019 --- Add "ACTION_Approve" nella lista DocAction
+			if (docStatus.equals(DocumentEngine.STATUS_Drafted)
+					|| docStatus.equals(DocumentEngine.STATUS_InProgress)
+					|| docStatus.equals(DocumentEngine.STATUS_Invalid))
+			{
+				options[index++] = DocumentEngine.ACTION_Approve;
+			}
+			//iDempiereConsulting 07/10/2019  --- END
+			
 			if(docStatus.equals(DocumentEngine.STATUS_Completed))
 			{
 				// IDEMPIERE-98 - Implement void for completed RMAs - Diego Ruiz - globalqss

```

------

### P0901 i-Service Gestire i Viaggi Data : 2019-10-04 #Patch

Descrizione : modificate maschere Creazione Ammortamento con relativa registrazione contabile (CESPITI)

Classe Java : Doc_DepreciationEntry.java

N° stringa: 75

```
+		Fact fact = new Fact (this, as, m_PostingType);
+
+		MDepreciationEntry entry = (MDepreciationEntry)getPO();
+		
+ //iDempiereConsulting __ 04/10/2019 --- Aggiunta gestione per Contabilizzazione Riepilogativa		
+		BigDecimal expenseAmt = Env.ZERO;
+		MAccount dr_acct =  new MAccount (getCtx(), 0, null);
+		MAccount cr_acct =  new MAccount (getCtx(), 0, null);
+		MDepreciationExp depexp = new MDepreciationExp(getCtx(), 0, null);
+		
+		if ( entry.get_Value("LIT_IsAllowSummaryPosting").equals(true) ) {
+			
+			Iterator<MDepreciationExp> it = entry.getLinesIteratorForSummaryPosting(false);
+			MAccount oldvalue_dr_acct =  new MAccount (getCtx(), 0, null);
+			MAccount oldvalue_cr_acct =  new MAccount (getCtx(), 0, null);
+			BigDecimal amt = Env.ZERO;
+			
+			while(it.hasNext())
+			{
+				depexp = it.next();
+				dr_acct = MAccount.get(getCtx(), depexp.getDR_Account_ID());
+				cr_acct = MAccount.get(getCtx(), depexp.getCR_Account_ID());
+				
+
+				if ((!MAccount.get(getCtx(), depexp.getDR_Account_ID()).equals(oldvalue_dr_acct)) ) {
+					DocLine line = createLine(depexp);
+					//amt = expenseAmt.subtract(amt);
+					FactUtil.createSimpleOperation(fact, line, oldvalue_dr_acct, oldvalue_cr_acct, as.getC_Currency_ID(), amt, false);
+					
+					amt=Env.ZERO;
+				}
+				if (!it.hasNext()) {
+					DocLine line = createLine(depexp);
+					
+					if ((!MAccount.get(getCtx(), depexp.getDR_Account_ID()).equals(oldvalue_dr_acct)) ) {
+						//amt = expenseAmt.subtract(amt);
+						FactUtil.createSimpleOperation(fact, line, dr_acct, cr_acct, as.getC_Currency_ID(), depexp.getExpense(), false);
+					} else {
+						FactUtil.createSimpleOperation(fact, line, dr_acct, cr_acct, as.getC_Currency_ID(), depexp.getExpense().add(amt), false);
+					}
+					
+				}
+
+				expenseAmt = depexp.getExpense().add(amt);
+				amt=expenseAmt;
+				//
+				oldvalue_dr_acct = dr_acct;
+				oldvalue_cr_acct = cr_acct;
+				
+
+			}
+			//
+ //iDempiereConsulting __ 04/10/2019 --- END ////////////////////////////////////
+		} else {
+			
+			Iterator<MDepreciationExp> it = entry.getLinesIterator(false);
+			
```



------

### Data : 2019-10-02

Descrizione : delete

Classe Java : Nessuna 

```
diff -r c55a1f40a6d9 -r 40e1d632ed4f idIta.modification.org.adempiere.base/idIta.modification.org.adempiere.base.jar
Binary file idIta.modification.org.adempiere.base/idIta.modification.org.adempiere.base.jar has changed

```

------

### P0083 Banca - Pagamento Online (1° Paypal ,...) #Patch Data : 2019-10-02

Descrizione : Aggiornamento processo di reso Merci Cliente + patchs varie per gestione resi customizzati

Classe Java : MRMALine.java

 N° Stringa: 75

```
+		MDepreciationEntry entry = (MDepreciationEntry)getPO();
+		
+ //iDempiereConsulting __ 04/10/2019 --- Aggiunta gestione per Contabilizzazione Riepilogativa		
+		BigDecimal expenseAmt = Env.ZERO;
+		MAccount dr_acct =  new MAccount (getCtx(), 0, null);
+		MAccount cr_acct =  new MAccount (getCtx(), 0, null);
+		MDepreciationExp depexp = new MDepreciationExp(getCtx(), 0, null);
+		
+		if ( entry.get_Value("LIT_IsAllowSummaryPosting").equals(true) ) {
+			
+			Iterator<MDepreciationExp> it = entry.getLinesIteratorForSummaryPosting(false);
+			MAccount oldvalue_dr_acct =  new MAccount (getCtx(), 0, null);
+			MAccount oldvalue_cr_acct =  new MAccount (getCtx(), 0, null);
+			BigDecimal amt = Env.ZERO;
+			
+			while(it.hasNext())
+			{
+				depexp = it.next();
+				dr_acct = MAccount.get(getCtx(), depexp.getDR_Account_ID());
+				cr_acct = MAccount.get(getCtx(), depexp.getCR_Account_ID());
+				
+
+				if ((!MAccount.get(getCtx(), depexp.getDR_Account_ID()).equals(oldvalue_dr_acct)) ) {
+					DocLine line = createLine(depexp);
+					//amt = expenseAmt.subtract(amt);
+					FactUtil.createSimpleOperation(fact, line, oldvalue_dr_acct, oldvalue_cr_acct, as.getC_Currency_ID(), amt, false);
+					
+					amt=Env.ZERO;
+				}
+				if (!it.hasNext()) {
+					DocLine line = createLine(depexp);
+					
+					if ((!MAccount.get(getCtx(), depexp.getDR_Account_ID()).equals(oldvalue_dr_acct)) ) {
+						//amt = expenseAmt.subtract(amt);
+						FactUtil.createSimpleOperation(fact, line, dr_acct, cr_acct, as.getC_Currency_ID(), depexp.getExpense(), false);
+					} else {
+						FactUtil.createSimpleOperation(fact, line, dr_acct, cr_acct, as.getC_Currency_ID(), depexp.getExpense().add(amt), false);
+					}
+					
+				}
+
+				expenseAmt = depexp.getExpense().add(amt);
+				amt=expenseAmt;
+				//
+				oldvalue_dr_acct = dr_acct;
+				oldvalue_cr_acct = cr_acct;
+				
+
+			}
+			//
+ //iDempiereConsulting __ 04/10/2019 --- END ////////////////////////////////////
+		} else {
+			
```



------

### Data :2019-10-02

Descrizione: delete 

Classe java: nessuna

```
binary file
```

------

### P0901 i-Service/Ticket- After Sales /Maintenance #Patch Data: 2019-10-01

Descrizione:aggiunti arrotondamenti alle divisioni che davano errore in importazione Cespiti

classe java: MDepreciationWorkfile.java

```
diff -r 7ccf7435d3d1 -r 7b7d90f567dd idIta.modification.org.adempiere.base/idIta.modification.org.adempiere.base.jar
Binary file idIta.modification.org.adempiere.base/idIta.modification.org.adempiere.base.jar has changed
diff -r 7ccf7435d3d1 -r 7b7d90f567dd idIta.modification.org.adempiere.base/src/org/compiere/model/MDepreciationWorkfile.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MDepreciationWorkfile.java	ven set 27 10:34:04 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MDepreciationWorkfile.java	mar ott 01 16:20:50 2019 +0200
@@ -1,6 +1,7 @@
 package org.compiere.model;
 
 import java.math.BigDecimal;
+import java.math.RoundingMode;
 import java.sql.ResultSet;
 import java.sql.Timestamp;
 import java.util.Calendar;
@@ -648,7 +649,7 @@
 		int LIT_Period_1 =  Integer.valueOf(get_Value("A_Period_1").toString());		
 		BigDecimal LIT_Percent_Period1 = new BigDecimal(get_Value("PercentUtilization").toString());
 		BigDecimal LIT_Percent = new BigDecimal(get_Value("Percent").toString());
-		BigDecimal LIT_period_rem = BigDecimal.valueOf(100).divide(LIT_Percent).multiply( BigDecimal.valueOf(LIT_Period_1)); 			
+		BigDecimal LIT_period_rem = BigDecimal.valueOf(100).divide(LIT_Percent, 4, RoundingMode.HALF_UP).multiply( BigDecimal.valueOf(LIT_Period_1)); 			
 		int LIT_periodo_trunc  = lifePeriods - Integer.valueOf(LIT_period_rem.intValue());
 		BigDecimal accum_Period1_C = accumDep_C; 
 		BigDecimal accum_Period1_F = accumDep_F; 
@@ -701,7 +702,7 @@
 				setFiscal(false);
 				exp_C = depreciation_C.invoke(this, assetacct, LIT_periodo_trunc+currentPeriod, accum_Period1_C, depreciationMethod);
 				accum_Period1_C=accum_Period1_C.add(exp_C);
-				exp_C = exp_C.multiply(LIT_Percent_Period1.divide(LIT_Percent));
+				exp_C = exp_C.multiply(LIT_Percent_Period1.divide(LIT_Percent, 4, RoundingMode.HALF_UP));
 				accumDep_C = accumDep_C.add(exp_C);
 			}
   //////iDempiereConsulting __ 24/09/2019 - CHIUSO/////////////////////////////////////////////////////////////////////////////////////////////////////		
@@ -727,7 +728,7 @@
 				setFiscal(true);
 				exp_F = depreciation_F.invoke(this, assetacct,LIT_periodo_trunc+currentPeriod, accum_Period1_F, depreciationMethod);
 				accum_Period1_F=accum_Period1_F.add(exp_F);
-				exp_F = exp_F.multiply(LIT_Percent_Period1.divide(LIT_Percent));
+				exp_F = exp_F.multiply(LIT_Percent_Period1.divide(LIT_Percent, 4, RoundingMode.HALF_UP));
 				accumDep_F = accumDep_F.add(exp_F);
 			}
 	//////iDempiereConsulting __ 24/09/2019 - CHIUSO//////////////////////////////////////////////////////////////////////////////////////////////////
diff -r 7ccf7435d3d1 -r 7b7d90f567dd idIta.modification.org.adempiere.base/src/org/idempiere/fa/model/CalloutA_Depreciation_Workfile.java
--- a/idIta.modification.org.adempiere.base/src/org/idempiere/fa/model/CalloutA_Depreciation_Workfile.java	ven set 27 10:34:04 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/idempiere/fa/model/CalloutA_Depreciation_Workfile.java	mar ott 01 16:20:50 2019 +0200
@@ -140,13 +140,13 @@
 			BigDecimal Percent = new BigDecimal(Acctassetgrpacct.get_ValueAsString("Percent"));
 			BigDecimal A_Period_1 = new BigDecimal(Acctassetgrpacct.get_ValueAsString("A_Period_1"));
 			
-			BigDecimal Amount_Period_1 =  ((BigDecimal)mTab.getValue("A_Asset_Cost")).divide((BigDecimal.valueOf(100.0))
-					.divide(PercentUtilization).multiply(A_Period_1)); 
+			BigDecimal operation = (BigDecimal.valueOf(100.0)).divide(PercentUtilization , 4, RoundingMode.HALF_UP).multiply(A_Period_1);
+			BigDecimal Amount_Period_1 =  ((BigDecimal)mTab.getValue("A_Asset_Cost")).divide(operation, 4, RoundingMode.HALF_UP); 
 			BigDecimal AccumulatedResidual = ((BigDecimal)mTab.getValue("A_Accumulated_Depr")).subtract(Amount_Period_1.multiply(BigDecimal.valueOf(12.0)));
-			if (AccumulatedResidual.compareTo(BigDecimal.ZERO) >= 0) {
-				BigDecimal Amount_Residual = ((BigDecimal)mTab.getValue("A_Asset_Cost")).divide((BigDecimal.valueOf(100.0))
-						.divide(Percent).multiply(A_Period_1)); 
-				BigDecimal Actual_Period = (AccumulatedResidual.divide(Amount_Residual)).add(A_Period_1).add(BigDecimal.valueOf(1.0));
+			if (AccumulatedResidual.compareTo(BigDecimal.ZERO) >= 0) {				
+				BigDecimal operat = (BigDecimal.valueOf(100.0)).divide(Percent, 4, RoundingMode.HALF_UP).multiply(A_Period_1);
+				BigDecimal Amount_Residual = ((BigDecimal)mTab.getValue("A_Asset_Cost")).divide(operat, 4, RoundingMode.HALF_UP); 
+				BigDecimal Actual_Period = (AccumulatedResidual.divide(Amount_Residual, 4, RoundingMode.HALF_UP)).add(A_Period_1).add(BigDecimal.valueOf(1.0));
 		
 				mTab.setValue(MDepreciationWorkfile.COLUMNNAME_A_Current_Period, Actual_Period);
 			} else {
@@ -156,7 +156,6 @@
 		}
 //////iDempiereConsulting __ 24/09/2019 - CHIUSO/////////////////////////////////////////////////////////////////////////////////////////////////////
 		return "";
-		
 	}
 	
 }
\ No newline at end of file

```

------

### *P0639 Data: 2019-09-27 #Patch*

Descrizione: Gestione cespiti personalizzato

Classe java: MAssetAddition.java

N°Stringa: 717

```
				} else{
+					assetworkFile.setA_Salvage_Value(this.getA_Salvage_Value());
+				}
+			}
+ //iDempiereConsulting __ 25/09/2019 --- Aggiungo la valorizzazione del campo A_Accumulated_Depr, A_Accumulated_Depr_F, A_Period_Start	
+			assetworkFile.setA_Accumulated_Depr((BigDecimal)get_Value("A_Accumulated_Depr"));
+			assetworkFile.setA_Accumulated_Depr_F((BigDecimal)get_Value("A_Accumulated_Depr_F"));
+			assetworkFile.setA_Current_Period((Integer)get_Value("A_Period_Start"));
+ //////iDempiereConsulting __ 25/09/2019 - CHIUSO//////////////////////////////////////////////////////////////////////////////////////////////////
+			
+			assetworkFile.setDateAcct(getDateAcct());
+			assetw
```

------

### * P0639 Core iDempiere: avanzamento versione iDempiere x.y + Eclipse Data: 2019-09-24

Descrizione:update code for progress core_iDempiere

classe java: update code for progress core_iDempiere

N°stringa: 717

```
				} else{
+					assetworkFile.setA_Salvage_Value(this.getA_Salvage_Value());
+				}
+			}
+ //iDempiereConsulting __ 25/09/2019 --- Aggiungo la valorizzazione del campo A_Accumulated_Depr, A_Accumulated_Depr_F, A_Period_Start	
+			assetworkFile.setA_Accumulated_Depr((BigDecimal)get_Value("A_Accumulated_Depr"));
+			assetworkFile.setA_Accumulated_Depr_F((BigDecimal)get_Value("A_Accumulated_Depr_F"));
+			assetworkFile.setA_Current_Period((Integer)get_Value("A_Period_Start"));
+ //////iDempiereConsulting __ 25/09/2019 - CHIUSO//////////////////////////////////////////////////////////////////////////////////////////////////
+			
+			assetworkFile.setDateAcct(getDateAcct());
+			assetw
```



------

### P1507 Patch per reigstrazione fattura in valuda con data cambio da #Patch  Data :2019-09-11 

Descrizione: Calcolo della conversione della valuta in base alla dataFattura, se presente variabile
   di sistema "LIT_CURRENCYONDATEDOC = Y

classe java: Doc.java

```
diff -r 78886b832591 -r 8e5bcf78b00b idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc.java	mer set 11 11:42:42 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc.java	mer set 11 17:43:11 2019 +0200
@@ -45,6 +45,7 @@
 import org.compiere.model.MMatchPO;
 import org.compiere.model.MNote;
 import org.compiere.model.MPeriod;
+import org.compiere.model.MSysConfig;
 import org.compiere.model.ModelValidationEngine;
 import org.compiere.model.ModelValidator;
 import org.compiere.model.PO;
@@ -1072,8 +1073,15 @@
 			int C_Currency_ID = it.next().intValue();
 			if (C_Currency_ID != acctSchema.getC_Currency_ID())
 			{
+				//iDempiereConsulting __11/09/2019 --- Calcolo della conversione in base alla dataFattura, se presente variabile di sistema 'LIT_CURRENCYONDATEDOC' = Y
+					//BigDecimal amt = MConversionRate.getRate (C_Currency_ID, acctSchema.getC_Currency_ID(),
+						//getDateAcct(), getC_ConversionType_ID(), getAD_Client_ID(), getAD_Org_ID());
+				Timestamp conversionDate = getDateAcct();
+				if(MSysConfig.getBooleanValue("LIT_CURRENCYONDATEDOC", true, getAD_Client_ID()) && get_Table_ID()==MInvoice.Table_ID)
+					conversionDate = getDateDoc();
 				BigDecimal amt = MConversionRate.getRate (C_Currency_ID, acctSchema.getC_Currency_ID(),
-					getDateAcct(), getC_ConversionType_ID(), getAD_Client_ID(), getAD_Org_ID());
+					conversionDate, getC_ConversionType_ID(), getAD_Client_ID(), getAD_Org_ID());
+				//iDempiereConsulting __11/09/2019 --- END
 				if (amt == null)
 				{
 					convertible = false;
diff -r 78886b832591 -r 8e5bcf78b00b idIta.modification.org.adempiere.base/src/org/compiere/acct/FactLine.java
--- /dev/null	gio gen 01 00:00:00 1970 +0000
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/acct/FactLine.java	mer set 11 17:43:11 2019 +0200
@@ -0,0 +1,1219 @@
+/******************************************************************************
+ * Product: Adempiere ERP & CRM Smart Business Solution                       *
+ * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
+ * This program is free software; you can redistribute it and/or modify it    *
+ * under the terms version 2 of the GNU General Public License as published   *
+ * by the Free Software Foundation. This program is distributed in the hope   *
+ * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
+ * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
+ * See the GNU General Public License for more details.                       *
+ * You should have received a copy of the GNU General Public License along    *
+ * with this program; if not, write to the Free Software Foundation, Inc.,    *
+ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
+ * For the text or an alternative of this public license, you may reach us    *
+ * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
+ * or via info@compiere.org or http://www.compiere.org/license.html           *
+ *****************************************************************************/
+package org.compiere.acct;
+
+import java.math.BigDecimal;
+import java.math.RoundingMode;
+import java.sql.PreparedStatement;
+import java.sql.ResultSet;
+import java.sql.SQLException;
+import java.sql.Timestamp;
+import java.util.Properties;
+import java.util.logging.Level;
+
+import org.compiere.model.MAccount;
+import org.compiere.model.MAcctSchema;
+import org.compiere.model.MAcctSchemaElement;
+import org.compiere.model.MConversionRate;
+import org.compiere.model.MCurrency;
+import org.compiere.model.MFactAcct;
+import org.compiere.model.MInvoice;
+import org.compiere.model.MMovement;
+import org.compiere.model.MRevenueRecognitionPlan;
+import org.compiere.model.MSysConfig;
+import org.compiere.model.X_C_AcctSchema_Element;
+import org.compiere.model.X_Fact_Acct;
+import org.compiere.util.DB;
+import org.compiere.util.Env;
+
+/**
+ *  Accounting Fact Entry.
+ *
+ *  @author 	Jorg Janke
+ *  @version 	$Id: FactLine.java,v 1.3 2006/07/30 00:53:33 jjanke Exp $
+ *  
+ *  Contributor(s):
+ *  Chris Farley: Fix Bug [ 1657372 ] M_MatchInv records can not be balanced
+ *    https://sourceforge.net/forum/message.php?msg_id=4151117
+ *  Carlos Ruiz - globalqss: Add setAmtAcct method rounded by Currency
+ *  Armen Rizal, Goodwill Consulting
+ * 			<li>BF [ 1745154 ] Cost in Reversing Material Related Docs  
+ *  Bayu Sistematika -  
+ *  		<li>BF [ 2213252 ] Matching Inv-Receipt generated unproperly value for src amt
+ *	Teo Sarca
+ *			<li>FR [ 2819081 ] FactLine.getDocLine should be public
+ *				https://sourceforge.net/tracker/?func=detail&atid=879335&aid=2819081&group_id=176962
+ *  
+ */
+public final class FactLine extends X_Fact_Acct
+{
+	/**
+	 * 
+	 */
+	private static final long serialVersionUID = 6141312459030795891L;
+
+	/**
+	 *	Constructor
+	 *	@param ctx context
+	 *  @param AD_Table_ID  - Table of Document Source
+	 *  @param Record_ID    - Record of document
+	 *  @param Line_ID      - Optional line id
+	 *  @param trxName transaction
+	 */
+	public FactLine (Properties ctx, int AD_Table_ID, int Record_ID, int Line_ID, String trxName)
+	{
+		super(ctx, 0, trxName);
+		setAD_Client_ID(0);							//	do not derive
+		setAD_Org_ID(0);							//	do not derive
+		//
+		setAmtAcctCr (Env.ZERO);
+		setAmtAcctDr (Env.ZERO);
+		setAmtSourceCr (Env.ZERO);
+		setAmtSourceDr (Env.ZERO);
+	//	Log.trace(this,Log.l1_User, "FactLine " + AD_Table_ID + ":" + Record_ID);
+		setAD_Table_ID (AD_Table_ID);
+		setRecord_ID (Record_ID);
+		setLine_ID (Line_ID);
+	}   //  FactLine
+
+	/**	Account					*/
+	private MAccount	m_acct = null;
+	/** Accounting Schema		*/
+	private MAcctSchema	m_acctSchema = null;
+	/** Document Header			*/
+	private Doc			m_doc = null;
+	/** Document Line 			*/
+	private DocLine 	m_docLine = null;
+	
+	/**
+	 * 	Create Reversal (negate DR/CR) of the line
+	 *	@param description new description
+	 *	@return reversal line
+	 */
+	public FactLine reverse (String description)
+	{
+		FactLine reversal = new FactLine (getCtx(), getAD_Table_ID(), getRecord_ID(), getLine_ID(), get_TrxName());
+		reversal.setClientOrg(this);	//	needs to be set explicitly
+		reversal.setDocumentInfo(m_doc, m_docLine);
+		reversal.setAccount(m_acctSchema, m_acct);
+		reversal.setPostingType(getPostingType());
+		//
+		reversal.setAmtSource(getC_Currency_ID(), getAmtSourceDr().negate(), getAmtSourceCr().negate());
+		reversal.setQty(getQty().negate());
+		reversal.convert();
+		reversal.setDescription(description);
+		
+		reversal.setC_BPartner_ID(getC_BPartner_ID());
+		reversal.setM_Product_ID(getM_Product_ID());
+		reversal.setC_Project_ID(getC_Project_ID());
+		reversal.setC_Campaign_ID(getC_Campaign_ID());
+		reversal.setC_Activity_ID(getC_Activity_ID());
+		reversal.setAD_OrgTrx_ID(getAD_OrgTrx_ID());
+		reversal.setC_SalesRegion_ID(getC_SalesRegion_ID());
+		reversal.setC_LocTo_ID(getC_LocTo_ID());
+		reversal.setC_LocFrom_ID(getC_LocFrom_ID());
+		reversal.setUser1_ID(getUser1_ID());
+		reversal.setUser2_ID(getUser1_ID());
+		reversal.setUserElement1_ID(getUserElement1_ID());
+		reversal.setUserElement2_ID(getUserElement2_ID());
+		
+		return reversal;
+	}	//	reverse
+
+	/**
+	 * 	Create Accrual (flip CR/DR) of the line
+	 *	@param description new description
+	 *	@return accrual line
+	 */
+	public FactLine accrue (String description)
+	{
+		FactLine accrual = new FactLine (getCtx(), getAD_Table_ID(), getRecord_ID(), getLine_ID(), get_TrxName());
+		accrual.setClientOrg(this);	//	needs to be set explicitly
+		accrual.setDocumentInfo(m_doc, m_docLine);
+		accrual.setAccount(m_acctSchema, m_acct);
+		accrual.setPostingType(getPostingType());
+		//
+		accrual.setAmtSource(getC_Currency_ID(), getAmtSourceCr(), getAmtSourceDr());
+		accrual.convert();
+		accrual.setDescription(description);
+		return accrual;
+	}	//	reverse
+
+	/**
+	 *  Set Account Info
+	 *  @param acctSchema account schema
+	 *  @param acct account
+	 */
+	public void setAccount (MAcctSchema acctSchema, MAccount acct)
+	{
+		m_acctSchema = acctSchema;
+		setC_AcctSchema_ID (acctSchema.getC_AcctSchema_ID());
+		//
+		m_acct = acct;
+		if (getAD_Client_ID() == 0)
+			setAD_Client_ID(m_acct.getAD_Client_ID());
+		setAccount_ID (m_acct.getAccount_ID());
+		setC_SubAcct_ID(m_acct.getC_SubAcct_ID());
+
+		//	User Defined References
+		MAcctSchemaElement ud1 = m_acctSchema.getAcctSchemaElement(
+				X_C_AcctSchema_Element.ELEMENTTYPE_UserColumn1);
+		if (ud1 != null)
+		{
+			String ColumnName1 = ud1.getDisplayColumnName();
+			if (ColumnName1 != null)
+			{
+				int ID1 = 0;
+				if (m_docLine != null)
+					ID1 = m_docLine.getValue(ColumnName1);
+				if (ID1 == 0)
+				{
+					if (m_doc == null)
+						throw new IllegalArgumentException("Document not set yet");
+					ID1 = m_doc.getValue(ColumnName1);
+				}
+				if (ID1 != 0)
+					setUserElement1_ID(ID1);
+			}
+		}
+		MAcctSchemaElement ud2 = m_acctSchema.getAcctSchemaElement(
+				X_C_AcctSchema_Element.ELEMENTTYPE_UserColumn2);
+		if (ud2 != null)
+		{
+			String ColumnName2 = ud2.getDisplayColumnName();
+			if (ColumnName2 != null)
+			{
+				int ID2 = 0;
+				if (m_docLine != null)
+					ID2 = m_docLine.getValue(ColumnName2);
+				if (ID2 == 0)
+				{
+					if (m_doc == null)
+						throw new IllegalArgumentException("Document not set yet");
+					ID2 = m_doc.getValue(ColumnName2);
+				}
+				if (ID2 != 0)
+					setUserElement2_ID(ID2);
+			}
+		}
+	}   //  setAccount
+
+	/**
+	 *  Set Source Amounts
+	 *  @param C_Currency_ID currency
+	 *  @param AmtSourceDr source amount dr
+	 *  @param AmtSourceCr source amount cr
+	 *  @return true, if any if the amount is not zero
+	 */
+	public boolean setAmtSource (int C_Currency_ID, BigDecimal AmtSourceDr, BigDecimal AmtSourceCr)
+	{
+		if (! m_acctSchema.isAllowNegativePosting()) {
+	        // begin Victor Perez e-evolution 30.08.2005
+			// fix Debit & Credit 
+			if (AmtSourceDr != null)
+			{	
+				if (AmtSourceDr.compareTo(Env.ZERO) == -1)
+				{	
+					AmtSourceCr = AmtSourceDr.abs();
+					AmtSourceDr = Env.ZERO;
+				}
+			}
+			if (AmtSourceCr != null)
+			{	
+				if (AmtSourceCr.compareTo(Env.ZERO) == -1)
+				{	
+					AmtSourceDr = AmtSourceCr.abs();
+					AmtSourceCr = Env.ZERO;
+				}
+			}
+			// end Victor Perez e-evolution 30.08.2005
+		}
+		
+		setC_Currency_ID (C_Currency_ID);
+		if (AmtSourceDr != null)
+			setAmtSourceDr (AmtSourceDr);
+		if (AmtSourceCr != null)
+			setAmtSourceCr (AmtSourceCr);
+		//  one needs to be non zero
+		if (getAmtSourceDr().compareTo(Env.ZERO)==0 && getAmtSourceCr().compareTo(Env.ZERO)==0)
+			return false;
+		//	Currency Precision
+		int precision = MCurrency.getStdPrecision(getCtx(), C_Currency_ID);
+		if (AmtSourceDr != null && AmtSourceDr.scale() > precision)
+		{
+			BigDecimal AmtSourceDr1 = AmtSourceDr.setScale(precision, RoundingMode.HALF_UP);
+			if (AmtSourceDr1.compareTo(AmtSourceDr) != 0)
+				log.warning("Source DR Precision " + AmtSourceDr + " -> " + AmtSourceDr1);
+			setAmtSourceDr(AmtSourceDr1);
+		}
+		if (AmtSourceCr != null && AmtSourceCr.scale() > precision)
+		{
+			BigDecimal AmtSourceCr1 = AmtSourceCr.setScale(precision, RoundingMode.HALF_UP);
+			if (AmtSourceCr1.compareTo(AmtSourceCr) != 0)
+				log.warning("Source CR Precision " + AmtSourceCr + " -> " + AmtSourceCr1);
+			setAmtSourceCr(AmtSourceCr1);
+		}
+		return true;
+	}   //  setAmtSource
+
+	/**
+	 *  Set Accounted Amounts (alternative: call convert)
+	 *  @param AmtAcctDr acct amount dr
+	 *  @param AmtAcctCr acct amount cr
+	 */
+	public void setAmtAcct(BigDecimal AmtAcctDr, BigDecimal AmtAcctCr)
+	{
+		if (! m_acctSchema.isAllowNegativePosting()) {
+	        // begin Victor Perez e-evolution 30.08.2005
+			// fix Debit & Credit 
+			if (AmtAcctDr.compareTo(Env.ZERO) == -1)
+			{	
+				AmtAcctCr = AmtAcctDr.abs();
+				AmtAcctDr = Env.ZERO;
+			}
+			if (AmtAcctCr.compareTo(Env.ZERO) == -1)
+			{	
+				AmtAcctDr = AmtAcctCr.abs();
+				AmtAcctCr = Env.ZERO;
+			}
+			// end Victor Perez e-evolution 30.08.2005
+		}
+		setAmtAcctDr (AmtAcctDr);
+		setAmtAcctCr (AmtAcctCr);
+	}   //  setAmtAcct
+
+	/**
+	 *  Set Accounted Amounts rounded by currency
+	 *  @param C_Currency_ID currency
+	 *  @param AmtAcctDr acct amount dr
+	 *  @param AmtAcctCr acct amount cr
+	 */
+	public void setAmtAcct(int C_Currency_ID, BigDecimal AmtAcctDr, BigDecimal AmtAcctCr)
+	{
+		if (! m_acctSchema.isAllowNegativePosting()) {
+	        // fix Debit & Credit 
+			if (AmtAcctDr != null)
+			{	
+				if (AmtAcctDr.compareTo(Env.ZERO) == -1)
+				{	
+					AmtAcctCr = AmtAcctDr.abs();
+					AmtAcctDr = Env.ZERO;
+				}
+			}
+			if (AmtAcctCr != null)
+			{	
+				if (AmtAcctCr.compareTo(Env.ZERO) == -1)
+				{	
+					AmtAcctDr = AmtAcctCr.abs();
+					AmtAcctCr = Env.ZERO;
+				}
+			}
+		}
+		setAmtAcctDr (AmtAcctDr);
+		setAmtAcctCr (AmtAcctCr);
+		//	Currency Precision
+		int precision = MCurrency.getStdPrecision(getCtx(), C_Currency_ID);
+		if (AmtAcctDr != null && AmtAcctDr.scale() > precision)
+		{
+			BigDecimal AmtAcctDr1 = AmtAcctDr.setScale(precision, RoundingMode.HALF_UP);
+			if (AmtAcctDr1.compareTo(AmtAcctDr) != 0)
+				log.warning("Accounted DR Precision " + AmtAcctDr + " -> " + AmtAcctDr1);
+			setAmtAcctDr(AmtAcctDr1);
+		}
+		if (AmtAcctCr != null && AmtAcctCr.scale() > precision)
+		{
+			BigDecimal AmtAcctCr1 = AmtAcctCr.setScale(precision, RoundingMode.HALF_UP);
+			if (AmtAcctCr1.compareTo(AmtAcctCr) != 0)
+				log.warning("Accounted CR Precision " + AmtAcctCr + " -> " + AmtAcctCr1);
+			setAmtAcctCr(AmtAcctCr1);
+		}
+	}   //  setAmtAcct
+
+	/**
+	 *  Set Document Info
+	 *  @param doc document
+	 *  @param docLine doc line
+	 */
+	public void setDocumentInfo(Doc doc, DocLine docLine)
+	{
+		m_doc = doc;
+		m_docLine = docLine;
+		//	reset
+		setAD_Org_ID(0);
+		setC_SalesRegion_ID(0);
+		//	Client
+		if (getAD_Client_ID() == 0)
+			setAD_Client_ID (m_doc.getAD_Client_ID());
+		//	Date Trx
+		setDateTrx (m_doc.getDateDoc());
+		if (m_docLine != null && m_docLine.getDateDoc() != null)
+			setDateTrx (m_docLine.getDateDoc());
+		//	Date Acct
+		setDateAcct (m_doc.getDateAcct());
+		if (m_docLine != null && m_docLine.getDateAcct() != null)
+			setDateAcct (m_docLine.getDateAcct());
+		//	Period, Tax
+		if (m_docLine != null &&  m_docLine.getC_Period_ID() != 0)
+			setC_Period_ID(m_docLine.getC_Period_ID());
+		else
+			setC_Period_ID (m_doc.getC_Period_ID());
+		if (m_docLine != null)
+			setC_Tax_ID (m_docLine.getC_Tax_ID());
+		//	Description
+		StringBuilder description = new StringBuilder().append(m_doc.getDocumentNo());
+		if (m_docLine != null)
+		{
+			description.append(" #").append(m_docLine.getLine());
+			if (m_docLine.getDescription() != null)
+				description.append(" (").append(m_docLine.getDescription()).append(")");
+			else if (m_doc.getDescription() != null && m_doc.getDescription().length() > 0)
+				description.append(" (").append(m_doc.getDescription()).append(")");		
+		}
+		else if (m_doc.getDescription() != null && m_doc.getDescription().length() > 0)
+			description.append(" (").append(m_doc.getDescription()).append(")");
+		setDescription(description.toString());
+		//	Journal Info
+		setGL_Budget_ID (m_doc.getGL_Budget_ID());
+		setGL_Category_ID (m_doc.getGL_Category_ID());
+
+		//	Product
+		if (m_docLine != null)
+			setM_Product_ID (m_docLine.getM_Product_ID());
+		if (getM_Product_ID() == 0)
+			setM_Product_ID (m_doc.getM_Product_ID());
+		//	UOM
+		if (m_docLine != null)
+			setC_UOM_ID (m_docLine.getC_UOM_ID());
+		//	Qty
+		if (get_Value("Qty") == null)	// not previously set
+		{
+			setQty (m_doc.getQty());	//	neg = outgoing
+			if (m_docLine != null)
+				setQty (m_docLine.getQty());
+		}
+		
+		//	Loc From (maybe set earlier)
+		if (getC_LocFrom_ID() == 0 && m_docLine != null)
+			setC_LocFrom_ID (m_docLine.getC_LocFrom_ID());
+		if (getC_LocFrom_ID() == 0)
+			setC_LocFrom_ID (m_doc.getC_LocFrom_ID());
+		//	Loc To (maybe set earlier)
+		if (getC_LocTo_ID() == 0 && m_docLine != null)
+			setC_LocTo_ID (m_docLine.getC_LocTo_ID());
+		if (getC_LocTo_ID() == 0)
+			setC_LocTo_ID (m_doc.getC_LocTo_ID());
+		//	BPartner
+		if (m_docLine != null)
+			setC_BPartner_ID (m_docLine.getC_BPartner_ID());
+		if (getC_BPartner_ID() == 0)
+			setC_BPartner_ID (m_doc.getC_BPartner_ID());
+		//	Sales Region from BPLocation/Sales Rep
+		//	Trx Org
+		if (m_docLine != null)
+			setAD_OrgTrx_ID (m_docLine.getAD_OrgTrx_ID());
+		if (getAD_OrgTrx_ID() == 0)
+			setAD_OrgTrx_ID (m_doc.getAD_OrgTrx_ID());
+		//	Project
+		if (m_docLine != null)
+			setC_Project_ID (m_docLine.getC_Project_ID());
+		if (getC_Project_ID() == 0)
+			setC_Project_ID (m_doc.getC_Project_ID());
+		if (m_docLine != null)
+			setC_ProjectPhase_ID(m_docLine.getC_ProjectPhase_ID());
+		if (getC_ProjectPhase_ID() == 0)
+			setC_ProjectPhase_ID (m_doc.getC_ProjectPhase_ID());
+		if (m_docLine != null)
+			setC_ProjectTask_ID(m_docLine.getC_ProjectTask_ID());
+		if (getC_ProjectTask_ID() == 0)
+			setC_ProjectTask_ID (m_doc.getC_ProjectTask_ID());
+		//	Campaign
+		if (m_docLine != null)
+			setC_Campaign_ID (m_docLine.getC_Campaign_ID());
+		if (getC_Campaign_ID() == 0)
+			setC_Campaign_ID (m_doc.getC_Campaign_ID());
+		//	Activity
+		if (m_docLine != null)
+			setC_Activity_ID (m_docLine.getC_Activity_ID());
+		if (getC_Activity_ID() == 0)
+			setC_Activity_ID (m_doc.getC_Activity_ID());
+		//	User List 1
+		if (m_docLine != null)
+			setUser1_ID (m_docLine.getUser1_ID());
+		if (getUser1_ID() == 0)
+			setUser1_ID (m_doc.getUser1_ID());
+		//	User List 2
+		if (m_docLine != null)
+			setUser2_ID (m_docLine.getUser2_ID());
+		if (getUser2_ID() == 0)
+			setUser2_ID (m_doc.getUser2_ID());
+		//	References in setAccount
+	}   //  setDocumentInfo
+
+	/**
+	 * 	Get Document Line
+	 *	@return doc line
+	 */
+	public DocLine getDocLine()
+	{
+		return m_docLine;
+	}	//	getDocLine
+	
+	/**
+	 * 	Set Description
+	 *	@param description description
+	 */
+	public void addDescription (String description)
+	{
+		String original = getDescription();
+		if (original == null || original.trim().length() == 0)
+			super.setDescription(description);
+		else{
+			StringBuilder msgd = new StringBuilder(original).append(" - ").append(description);
+			super.setDescription(msgd.toString());
+		}	
+	}	//	addDescription
+	
+	/**
+	 *  Set Warehouse Locator.
+	 *  - will overwrite Organization -
+	 *  @param M_Locator_ID locator
+	 */
+	public void setM_Locator_ID (int M_Locator_ID)
+	{
+		super.setM_Locator_ID (M_Locator_ID);
+		setAD_Org_ID(0);	//	reset
+	}   //  setM_Locator_ID
+
+	
+	/**************************************************************************
+	 *  Set Location
+	 *  @param C_Location_ID location
+	 *  @param isFrom from
+	 */
+	public void setLocation (int C_Location_ID, boolean isFrom)
+	{
+		if (isFrom)
+			setC_LocFrom_ID (C_Location_ID);
+		else
+			setC_LocTo_ID (C_Location_ID);
+	}   //  setLocator
+
+	/**
+	 *  Set Location from Locator
+	 *  @param M_Locator_ID locator
+	 *  @param isFrom from
+	 */
+	public void setLocationFromLocator (int M_Locator_ID, boolean isFrom)
+	{
+		if (M_Locator_ID == 0)
+			return;
+		int C_Location_ID = 0;
+		String sql = "SELECT w.C_Location_ID FROM M_Warehouse w, M_Locator l "
+				+ "WHERE w.M_Warehouse_ID=l.M_Warehouse_ID AND l.M_Locator_ID=?";
+		PreparedStatement pstmt = null;
+		ResultSet rs = null;
+		try
+		{
+			pstmt = DB.prepareStatement(sql, get_TrxName());
+			pstmt.setInt(1, M_Locator_ID);
+			rs = pstmt.executeQuery();
+			if (rs.next())
+				C_Location_ID = rs.getInt(1);
+		}
+		catch (SQLException e)
+		{
+			log.log(Level.SEVERE, sql, e);
+			return;
+		}
+		finally {
+			DB.close(rs, pstmt);
+			rs = null; pstmt = null;
+		}
+		if (C_Location_ID != 0)
+			setLocation (C_Location_ID, isFrom);
+	}   //  setLocationFromLocator
+
+	/**
+	 *  Set Location from Busoness Partner Location
+	 *  @param C_BPartner_Location_ID bp location
+	 *  @param isFrom from
+	 */
+	public void setLocationFromBPartner (int C_BPartner_Location_ID, boolean isFrom)
+	{
+		if (C_BPartner_Location_ID == 0)
+			return;
+		int C_Location_ID = 0;
+		String sql = "SELECT C_Location_ID FROM C_BPartner_Location WHERE C_BPartner_Location_ID=?";
+		PreparedStatement pstmt = null;
+		ResultSet rs = null;
+		try
+		{
+			pstmt = DB.prepareStatement(sql, get_TrxName());
+			pstmt.setInt(1, C_BPartner_Location_ID);
+			rs = pstmt.executeQuery();
+			if (rs.next())
+				C_Location_ID = rs.getInt(1);
+		}
+		catch (SQLException e)
+		{
+			log.log(Level.SEVERE, sql, e);
+			return;
+		}
+		finally {
+			DB.close(rs, pstmt);
+			rs = null; pstmt = null;
+		}
+		if (C_Location_ID != 0)
+			setLocation (C_Location_ID, isFrom);
+	}   //  setLocationFromBPartner
+
+	/**
+	 *  Set Location from Organization
+	 *  @param AD_Org_ID org
+	 *  @param isFrom from
+	 */
+	public void setLocationFromOrg (int AD_Org_ID, boolean isFrom)
+	{
+		if (AD_Org_ID == 0)
+			return;
+		int C_Location_ID = 0;
+		String sql = "SELECT C_Location_ID FROM AD_OrgInfo WHERE AD_Org_ID=?";
+		PreparedStatement pstmt = null;
+		ResultSet rs = null;
+		try
+		{
+			pstmt = DB.prepareStatement(sql, get_TrxName());
+			pstmt.setInt(1, AD_Org_ID);
+			rs = pstmt.executeQuery();
+			if (rs.next())
+				C_Location_ID = rs.getInt(1);
+		}
+		catch (SQLException e)
+		{
+			log.log(Level.SEVERE, sql, e);
+			return;
+		}
+		finally {
+			DB.close(rs, pstmt);
+			rs = null; pstmt = null;
+		}
+		if (C_Location_ID != 0)
+			setLocation (C_Location_ID, isFrom);
+	}   //  setLocationFromOrg
+
+	
+	/**************************************************************************
+	 *  Returns Source Balance of line
+	 *  @return source balance
+	 */
+	public BigDecimal getSourceBalance()
+	{
+		if (getAmtSourceDr() == null)
+			setAmtSourceDr (Env.ZERO);
+		if (getAmtSourceCr() == null)
+			setAmtSourceCr (Env.ZERO);
+		//
+		return getAmtSourceDr().subtract(getAmtSourceCr());
+	}   //  getSourceBalance
+
+	/**
+	 *	Is Debit Source Balance
+	 *  @return true if DR source balance
+	 */
+	public boolean isDrSourceBalance()
+	{
+		return getSourceBalance().signum() != -1;
+	}   //  isDrSourceBalance
+
+	/**
+	 *  Get Accounted Balance
+	 *  @return accounting balance
+	 */
+	public BigDecimal getAcctBalance()
+	{
+		if (getAmtAcctDr() == null)
+			setAmtAcctDr (Env.ZERO);
+		if (getAmtAcctCr() == null)
+			setAmtAcctCr (Env.ZERO);
+		return getAmtAcctDr().subtract(getAmtAcctCr());
+	}   //  getAcctBalance
+
+	/**
+	 *	Is Account on Balance Sheet
+	 *  @return true if account is a balance sheet account
+	 */
+	public boolean isBalanceSheet()
+	{
+		return m_acct.isBalanceSheet();
+	}	//	isBalanceSheet
+
+	/**
+	 *	Currect Accounting Amount.
+	 *  <pre>
+	 *  Example:    1       -1      1       -1
+	 *  Old         100/0   100/0   0/100   0/100
+	 *  New         99/0    101/0   0/99    0/101
+	 *  </pre>
+	 *  @param deltaAmount delta amount
+	 */
+	public void currencyCorrect (BigDecimal deltaAmount)
+	{
+		boolean negative = deltaAmount.compareTo(Env.ZERO) < 0;
+		boolean adjustDr = getAmtAcctDr().abs().compareTo(getAmtAcctCr().abs()) > 0;
+
+		if (log.isLoggable(Level.FINE)) log.fine(deltaAmount.toString()
+			+ "; Old-AcctDr=" + getAmtAcctDr() + ",AcctCr=" + getAmtAcctCr()
+			+ "; Negative=" + negative + "; AdjustDr=" + adjustDr);
+
+		if (adjustDr)
+			if (negative)
+				setAmtAcctDr (getAmtAcctDr().subtract(deltaAmount));
+			else
+				setAmtAcctDr (getAmtAcctDr().subtract(deltaAmount));
+		else
+			if (negative)
+				setAmtAcctCr (getAmtAcctCr().add(deltaAmount));
+			else
+				setAmtAcctCr (getAmtAcctCr().add(deltaAmount));
+
+		if (log.isLoggable(Level.FINE)) log.fine("New-AcctDr=" + getAmtAcctDr() + ",AcctCr=" + getAmtAcctCr());
+	}	//	currencyCorrect
+
+	/**
+	 *  Convert to Accounted Currency
+	 *  @return true if converted
+	 */
+	public boolean convert ()
+	{
+		//  Document has no currency
+		if (getC_Currency_ID() == Doc.NO_CURRENCY)
+			setC_Currency_ID (m_acctSchema.getC_Currency_ID());
+
+		if (m_acctSchema.getC_Currency_ID() == getC_Currency_ID())
+		{
+			setAmtAcctDr (getAmtSourceDr());
+			setAmtAcctCr (getAmtSourceCr());
+			return true;
+		}
+		//	Get Conversion Type from Line or Header
+		int C_ConversionType_ID = 0;
+		int AD_Org_ID = 0;
+		if (m_docLine != null)			//	get from line
+		{
+			C_ConversionType_ID = m_docLine.getC_ConversionType_ID();
+			AD_Org_ID = m_docLine.getAD_Org_ID();
+		}
+		if (C_ConversionType_ID == 0)	//	get from header
+		{
+			if (m_doc == null)
+			{
+				log.severe ("No Document VO");
+				return false;
+			}
+			C_ConversionType_ID = m_doc.getC_ConversionType_ID();
+			if (AD_Org_ID == 0)
+				AD_Org_ID = m_doc.getAD_Org_ID();
+		}
+		
+		Timestamp convDate = getDateAcct();
+
+		if (m_docLine != null && m_doc instanceof Doc_BankStatement)
+			convDate = m_docLine.getDateConv();				
+			
+		//iDempiereConsulting __11/09/2019 --- Calcolo della conversione in base alla dataFattura, se presente variabile di sistema 'LIT_CURRENCYONDATEDOC' = Y
+		if(MSysConfig.getBooleanValue("LIT_CURRENCYONDATEDOC", true, getAD_Client_ID()) && m_doc.get_Table_ID()==MInvoice.Table_ID)
+			convDate = getDateTrx();
+		//iDempiereConsulting __11/09/2019 --- END
+			
+		setAmtAcctDr (MConversionRate.convert (getCtx(),
+			getAmtSourceDr(), getC_Currency_ID(), m_acctSchema.getC_Currency_ID(),
+			convDate, C_ConversionType_ID, m_doc.getAD_Client_ID(), AD_Org_ID));
+		if (getAmtAcctDr() == null)
+			return false;
+		setAmtAcctCr (MConversionRate.convert (getCtx(),
+			getAmtSourceCr(), getC_Currency_ID(), m_acctSchema.getC_Currency_ID(),
+			convDate, C_ConversionType_ID, m_doc.getAD_Client_ID(), AD_Org_ID));
+		return true;
+	}	//	convert
+
+	/**
+	 * 	Get Account
+	 *	@return account
+	 */
+	public MAccount getAccount()
+	{
+		return m_acct;
+	}	//	getAccount
+	
+	/**
+	 *	To String
+	 *  @return String
+	 */
+	public String toString()
+	{
+		StringBuilder sb = new StringBuilder("FactLine=[");
+		sb.append(getAD_Table_ID()).append(":").append(getRecord_ID())
+			.append(",").append(m_acct)
+			.append(",Cur=").append(getC_Currency_ID())
+			.append(", DR=").append(getAmtSourceDr()).append("|").append(getAmtAcctDr())
+			.append(", CR=").append(getAmtSourceCr()).append("|").append(getAmtAcctCr())
+			.append("]");
+		return sb.toString();
+	}	//	toString
+
+	
+	/**
+	 *  Get AD_Org_ID (balancing segment).
+	 *  (if not set directly - from document line, document, account, locator)
+	 *  <p>
+	 *  Note that Locator needs to be set before - otherwise
+	 *  segment balancing might produce the wrong results
+	 *  @return AD_Org_ID
+	 */
+	public int getAD_Org_ID()
+	{
+		if (super.getAD_Org_ID() != 0)      //  set earlier
+			return super.getAD_Org_ID();
+		//	Prio 1 - get from locator - if exist
+		if (getM_Locator_ID() != 0)
+		{
+			String sql = "SELECT AD_Org_ID FROM M_Locator WHERE M_Locator_ID=? AND AD_Client_ID=?";
+			PreparedStatement pstmt = null;
+			ResultSet rs = null;
+			try
+			{
+				pstmt = DB.prepareStatement(sql, get_TrxName());
+				pstmt.setInt(1, getM_Locator_ID());
+				pstmt.setInt(2, getAD_Client_ID());
+				rs = pstmt.executeQuery();
+				if (rs.next())
+				{
+					setAD_Org_ID (rs.getInt(1));
+					if (log.isLoggable(Level.FINER)) log.finer("AD_Org_ID=" + super.getAD_Org_ID() + " (1 from M_Locator_ID=" + getM_Locator_ID() + ")");
+				}
+				else
+					log.log(Level.SEVERE, "AD_Org_ID - Did not find M_Locator_ID=" + getM_Locator_ID());
+			}
+			catch (SQLException e)
+			{
+				log.log(Level.SEVERE, sql, e);
+			}
+			finally {
+				DB.close(rs, pstmt);
+				rs = null; pstmt = null;
+			}
+		}   //  M_Locator_ID != 0
+
+		//	Prio 2 - get from doc line - if exists (document context overwrites)
+		if (m_docLine != null && super.getAD_Org_ID() == 0)
+		{
+			setAD_Org_ID (m_docLine.getAD_Org_ID());
+			if (log.isLoggable(Level.FINER)) log.finer("AD_Org_ID=" + super.getAD_Org_ID() + " (2 from DocumentLine)");
+		}
+		//	Prio 3 - get from doc - if not GL
+		if (m_doc != null && super.getAD_Org_ID() == 0)
+		{
+			if (Doc.DOCTYPE_GLJournal.equals (m_doc.getDocumentType()))
+			{
+				setAD_Org_ID (m_acct.getAD_Org_ID()); //	inter-company GL
+				if (log.isLoggable(Level.FINER)) log.finer("AD_Org_ID=" + super.getAD_Org_ID() + " (3 from Acct)");
+			}
+			else
+			{
+				setAD_Org_ID (m_doc.getAD_Org_ID());
+				if (log.isLoggable(Level.FINER)) log.finer("AD_Org_ID=" + super.getAD_Org_ID() + " (3 from Document)");
+			}
+		}
+		//	Prio 4 - get from account - if not GL
+		if (m_doc != null && super.getAD_Org_ID() == 0)
+		{
+			if (Doc.DOCTYPE_GLJournal.equals (m_doc.getDocumentType()))
+			{
+				setAD_Org_ID (m_doc.getAD_Org_ID());
+				if (log.isLoggable(Level.FINER)) log.finer("AD_Org_ID=" + super.getAD_Org_ID() + " (4 from Document)");
+			}
+			else
+			{
+				setAD_Org_ID (m_acct.getAD_Org_ID());
+				if (log.isLoggable(Level.FINER)) log.finer("AD_Org_ID=" + super.getAD_Org_ID() + " (4 from Acct)");
+			}
+		}
+		return super.getAD_Org_ID();
+	}   //  setAD_Org_ID
+
+
+	/**
+	 *	Get/derive Sales Region
+	 *	@return Sales Region
+	 */
+	public int getC_SalesRegion_ID ()
+	{
+		if (super.getC_SalesRegion_ID() != 0)
+			return super.getC_SalesRegion_ID();
+		//
+		if (m_docLine != null)
+			setC_SalesRegion_ID (m_docLine.getC_SalesRegion_ID());
+		if (m_doc != null)
+		{
+			if (super.getC_SalesRegion_ID() == 0)
+				setC_SalesRegion_ID (m_doc.getC_SalesRegion_ID());
+			if (super.getC_SalesRegion_ID() == 0 && m_doc.getBP_C_SalesRegion_ID() > 0)
+				setC_SalesRegion_ID (m_doc.getBP_C_SalesRegion_ID());
+			//	derive SalesRegion if AcctSegment
+			if (super.getC_SalesRegion_ID() == 0
+				&& m_doc.getC_BPartner_Location_ID() != 0
+				&& m_doc.getBP_C_SalesRegion_ID() == -1)	//	never tried
+			//	&& m_acctSchema.isAcctSchemaElement(MAcctSchemaElement.ELEMENTTYPE_SalesRegion))
+			{
+				String sql = "SELECT COALESCE(C_SalesRegion_ID,0) FROM C_BPartner_Location WHERE C_BPartner_Location_ID=?";
+				setC_SalesRegion_ID (DB.getSQLValue(null,
+					sql, m_doc.getC_BPartner_Location_ID()));
+				if (super.getC_SalesRegion_ID() != 0)		//	save in VO
+				{
+					m_doc.setBP_C_SalesRegion_ID(super.getC_SalesRegion_ID());
+					if (log.isLoggable(Level.FINE)) log.fine("C_SalesRegion_ID=" + super.getC_SalesRegion_ID() + " (from BPL)" );
+				}
+				else	//	From Sales Rep of Document -> Sales Region
+				{
+					sql = "SELECT COALESCE(MAX(C_SalesRegion_ID),0) FROM C_SalesRegion WHERE SalesRep_ID=?";
+					setC_SalesRegion_ID (DB.getSQLValue(null,
+						sql, m_doc.getSalesRep_ID()));
+					if (super.getC_SalesRegion_ID() != 0)		//	save in VO
+					{
+						m_doc.setBP_C_SalesRegion_ID(super.getC_SalesRegion_ID());
+						if (log.isLoggable(Level.FINE)) log.fine("C_SalesRegion_ID=" + super.getC_SalesRegion_ID() + " (from SR)" );
+					}
+					else
+						m_doc.setBP_C_SalesRegion_ID(-2);	//	don't try again
+				}
+			}
+			if (m_acct != null && super.getC_SalesRegion_ID() == 0)
+				setC_SalesRegion_ID (m_acct.getC_SalesRegion_ID());
+		}
+		//
+	//	log.fine("C_SalesRegion_ID=" + super.getC_SalesRegion_ID() 
+	//		+ ", C_BPartner_Location_ID=" + m_docVO.C_BPartner_Location_ID
+	//		+ ", BP_C_SalesRegion_ID=" + m_docVO.BP_C_SalesRegion_ID 
+	//		+ ", SR=" + m_acctSchema.isAcctSchemaElement(MAcctSchemaElement.ELEMENTTYPE_SalesRegion));
+		return super.getC_SalesRegion_ID();
+	}	//	getC_SalesRegion_ID
+
+	
+	/**
+	 * 	Before Save
+	 *	@param newRecord new
+	 *	@return true
+	 */
+	protected boolean beforeSave (boolean newRecord)
+	{
+		if (newRecord)
+		{
+			if (log.isLoggable(Level.FINE)) log.fine(toString());
+			//
+			getAD_Org_ID();
+			getC_SalesRegion_ID();
+			//  Set Default Account Info
+			if (getM_Product_ID() == 0)
+				setM_Product_ID (m_acct.getM_Product_ID());
+			if (getC_LocFrom_ID() == 0)
+				setC_LocFrom_ID (m_acct.getC_LocFrom_ID());
+			if (getC_LocTo_ID() == 0)
+				setC_LocTo_ID (m_acct.getC_LocTo_ID());
+			if (getC_BPartner_ID() == 0)
+				setC_BPartner_ID (m_acct.getC_BPartner_ID());
+			if (getAD_OrgTrx_ID() == 0)
+				setAD_OrgTrx_ID (m_acct.getAD_OrgTrx_ID());
+			if (getC_Project_ID() == 0)
+				setC_Project_ID (m_acct.getC_Project_ID());
+			if (getC_Campaign_ID() == 0)
+				setC_Campaign_ID (m_acct.getC_Campaign_ID());
+			if (getC_Activity_ID() == 0)
+				setC_Activity_ID (m_acct.getC_Activity_ID());
+			if (getUser1_ID() == 0)
+				setUser1_ID (m_acct.getUser1_ID());
+			if (getUser2_ID() == 0)
+				setUser2_ID (m_acct.getUser2_ID());
+			
+			//  Revenue Recognition for AR/AP Invoices
+			if ((m_doc.getDocumentType().equals(Doc.DOCTYPE_ARInvoice) || m_doc.getDocumentType().equals(Doc.DOCTYPE_APInvoice)) 
+				&& m_docLine != null 
+				&& m_docLine.getC_RevenueRecognition_ID() != 0)
+			{
+				int AD_User_ID = 0;
+				setAccount_ID (
+					createRevenueRecognition (
+						m_docLine.getC_RevenueRecognition_ID(), m_docLine.get_ID(),
+						getAD_Client_ID(), getAD_Org_ID(), AD_User_ID, 
+						getAccount_ID(), getC_SubAcct_ID(),
+						getM_Product_ID(), getC_BPartner_ID(), getAD_OrgTrx_ID(),
+						getC_LocFrom_ID(), getC_LocTo_ID(), 
+						getC_SalesRegion_ID(), getC_Project_ID(),
+						getC_Campaign_ID(), getC_Activity_ID(), 
+						getUser1_ID(), getUser2_ID(), 
+						getUserElement1_ID(), getUserElement2_ID())
+					);
+			}
+		}
+		return true;
+	}	//	beforeSave
+	
+	
+	/**************************************************************************
+	 *  Revenue Recognition.
+	 *  Called from FactLine.save
+	 *  <p>
+	 *  Create Revenue recognition plan and return Unearned Revenue account
+	 *  to be used instead of Revenue Account. If not found, it returns
+	 *  the revenue account.
+	 *
+	 *  @param C_RevenueRecognition_ID revenue recognition
+	 *  @param C_InvoiceLine_ID invoice line
+	 *  @param AD_Client_ID client
+	 *  @param AD_Org_ID org
+	 *  @param AD_User_ID user
+	 *  @param Account_ID of Revenue Account
+	 *  @param C_SubAcct_ID sub account
+	 *  @param M_Product_ID product
+	 *  @param C_BPartner_ID bpartner
+	 *  @param AD_OrgTrx_ID trx org
+	 *  @param C_LocFrom_ID loc from
+	 *  @param C_LocTo_ID loc to
+	 *  @param C_SRegion_ID sales region
+	 *  @param C_Project_ID project
+	 *  @param C_Campaign_ID campaign
+	 *  @param C_Activity_ID activity
+	 *  @param User1_ID user1
+	 *  @param User2_ID user2
+	 *  @param UserElement1_ID user element 1
+	 *  @param UserElement2_ID user element 2
+	 *  @return Account_ID for Unearned Revenue or Revenue Account if not found
+	 */
+	private int createRevenueRecognition (
+		int C_RevenueRecognition_ID, int C_InvoiceLine_ID,
+		int AD_Client_ID, int AD_Org_ID, int AD_User_ID, 
+		int Account_ID, int C_SubAcct_ID,
+		int M_Product_ID, int C_BPartner_ID, int AD_OrgTrx_ID,
+		int C_LocFrom_ID, int C_LocTo_ID, int C_SRegion_ID, int C_Project_ID,
+		int	C_Campaign_ID, int C_Activity_ID, 
+		int User1_ID, int User2_ID, int UserElement1_ID, int UserElement2_ID)
+	{
+		if (log.isLoggable(Level.FINE)) log.fine("From Account_ID=" + Account_ID);
+		//  get VC for P_Revenue (from Product)
+		MAccount revenue = MAccount.get(getCtx(),
+			AD_Client_ID, AD_Org_ID, getC_AcctSchema_ID(), Account_ID, C_SubAcct_ID,
+			M_Product_ID, C_BPartner_ID, AD_OrgTrx_ID, C_LocFrom_ID, C_LocTo_ID, C_SRegion_ID, 
+			C_Project_ID, C_Campaign_ID, C_Activity_ID, 
+			User1_ID, User2_ID, UserElement1_ID, UserElement2_ID, get_TrxName());
+		if (revenue != null && revenue.get_ID() == 0)
+			revenue.saveEx();
+		if (revenue == null || revenue.get_ID() == 0)
+		{
+			log.severe ("Revenue_Acct not found");
+			return Account_ID;
+		}
+		
+		int existing = DB.getSQLValue(get_TrxName(), "SELECT vc.Account_ID FROM C_RevenueRecognition_Plan rp" +
+				" JOIN C_ValidCombination vc ON rp.UnearnedRevenue_Acct=vc.C_ValidCombination_ID" + 
+				" WHERE rp.C_InvoiceLine_ID = ? AND rp.C_AcctSchema_ID=?"
+				, C_InvoiceLine_ID, getC_AcctSchema_ID());
+		if ( existing > 0 )
+			return existing;
+		
+		
+		int P_Revenue_Acct = revenue.get_ID();
+
+		//  get Unearned Revenue Acct from BPartner Group
+		int UnearnedRevenue_Acct = 0;
+		int new_Account_ID = 0;
+		String sql = "SELECT ga.UnearnedRevenue_Acct, vc.Account_ID "
+			+ "FROM C_BP_Group_Acct ga, C_BPartner p, C_ValidCombination vc "
+			+ "WHERE ga.C_BP_Group_ID=p.C_BP_Group_ID"
+			+ " AND ga.UnearnedRevenue_Acct=vc.C_ValidCombination_ID"
+			+ " AND ga.C_AcctSchema_ID=? AND p.C_BPartner_ID=?";
+		PreparedStatement pstmt = null;
+		ResultSet rs = null;
+		try
+		{
+			pstmt = DB.prepareStatement(sql, get_TrxName());
+			pstmt.setInt(1, getC_AcctSchema_ID());
+			pstmt.setInt(2, C_BPartner_ID);
+			rs = pstmt.executeQuery();
+			if (rs.next())
+			{
+				UnearnedRevenue_Acct = rs.getInt(1);
+				new_Account_ID = rs.getInt(2);
+			}
+		}
+		catch (SQLException e)
+		{
+			log.log(Level.SEVERE, sql, e);
+		}
+		finally {
+			DB.close(rs, pstmt);
+			rs = null; pstmt = null;
+		}
+		if (new_Account_ID == 0)
+		{
+			log.severe ("UnearnedRevenue_Acct not found");
+			return Account_ID;
+		}
+		
+		MAccount unearned = MAccount.get(getCtx(),
+				AD_Client_ID, AD_Org_ID, getC_AcctSchema_ID(), new_Account_ID, C_SubAcct_ID,
+				M_Product_ID, C_BPartner_ID, AD_OrgTrx_ID, C_LocFrom_ID, C_LocTo_ID, C_SRegion_ID, 
+				C_Project_ID, C_Campaign_ID, C_Activity_ID, 
+				User1_ID, User2_ID, UserElement1_ID, UserElement2_ID, get_TrxName());
+
+		MRevenueRecognitionPlan plan = new MRevenueRecognitionPlan(getCtx(), 0, get_TrxName());
+		plan.setAD_Org_ID(AD_Org_ID);
+		plan.setC_RevenueRecognition_ID (C_RevenueRecognition_ID);
+		plan.setC_AcctSchema_ID (getC_AcctSchema_ID());
+		plan.setC_InvoiceLine_ID (C_InvoiceLine_ID);
+		plan.setUnEarnedRevenue_Acct (unearned.getC_ValidCombination_ID());
+		plan.setP_Revenue_Acct (P_Revenue_Acct);
+		plan.setC_Currency_ID (getC_Currency_ID());
+		plan.setTotalAmt (getAcctBalance());
+		if (!plan.save(get_TrxName()))
+		{
+			log.severe ("Plan NOT created");
+			return Account_ID;
+		}
+		if (log.isLoggable(Level.FINE)) log.fine("From Account_ID=" + Account_ID + " to " + new_Account_ID
+			+ " - Plan from UnearnedRevenue_Acct=" + UnearnedRevenue_Acct + " to Revenue_Acct=" + P_Revenue_Acct);
+		return new_Account_ID;
+	}   //  createRevenueRecognition
+
+
+	/**************************************************************************
+	 * 	Update Line with reversed Original Amount in Accounting Currency.
+	 * 	Also copies original dimensions like Project, etc.
+	 * 	Called from Doc_MatchInv
+	 * 	@param AD_Table_ID table
+	 * 	@param Record_ID record
+	 * 	@param Line_ID line
+	 * 	@param multiplier targetQty/documentQty
+	 * 	@return true if success
+	 */
+	public boolean updateReverseLine (int AD_Table_ID, int Record_ID, int Line_ID,
+		BigDecimal multiplier)
+	{
+		boolean success = false;
+
+		StringBuilder sql = new StringBuilder("SELECT * ")
+			.append("FROM Fact_Acct ")
+			.append("WHERE C_AcctSchema_ID=? AND AD_Table_ID=? AND Record_ID=?")
+			.append(" AND Account_ID=?");
+		if (Line_ID > 0) 
+		{
+			sql.append(" AND Line_ID=? ");
+		}
+		else
+		{
+			sql.append(" AND Line_ID IS NULL ");
+		}
+		// MZ Goodwill
+		// for Inventory Move
+		if (MMovement.Table_ID == AD_Table_ID)
+			sql.append(" AND M_Locator_ID=?");
+		// end MZ
+		PreparedStatement pstmt = null;
+		ResultSet rs = null;
+		try
+		{
+			int pindex=1;
+			pstmt = DB.prepareStatement(sql.toString(), get_TrxName());
+			pstmt.setInt(pindex++, getC_AcctSchema_ID());
+			pstmt.setInt(pindex++, AD_Table_ID);
+			pstmt.setInt(pindex++, Record_ID);			
+			pstmt.setInt(pindex++, m_acct.getAccount_ID());
+			if (Line_ID > 0)
+			{
+				pstmt.setInt(pindex++, Line_ID);
+			}
+			// MZ Goodwill
+			// for Inventory Move
+			if (MMovement.Table_ID == AD_Table_ID)
+				pstmt.setInt(pindex++, getM_Locator_ID());
+			// end MZ
+			rs = pstmt.executeQuery();
+			if (rs.next())
+			{
+				MFactAcct fact = new MFactAcct(getCtx(), rs, get_TrxName());
+				//  Accounted Amounts - reverse
+				BigDecimal dr = fact.getAmtAcctDr();
+				BigDecimal cr = fact.getAmtAcctCr();
+				// setAmtAcctDr (cr.multiply(multiplier));
+				// setAmtAcctCr (dr.multiply(multiplier));
+				setAmtAcct(fact.getC_Currency_ID(), cr.multiply(multiplier), dr.multiply(multiplier));
+				//  
+				//  Bayu Sistematika - Source Amounts
+				//  Fixing source amounts
+				BigDecimal drSourceAmt = fact.getAmtSourceDr();
+				BigDecimal crSourceAmt = fact.getAmtSourceCr();
+				setAmtSource(fact.getC_Currency_ID(), crSourceAmt.multiply(multiplier), drSourceAmt.multiply(multiplier));
+				//  end Bayu Sistematika
+				//
+				success = true;
+				if (log.isLoggable(Level.FINE)) log.fine(new StringBuilder("(Table=").append(AD_Table_ID)
+					.append(",Record_ID=").append(Record_ID)
+					.append(",Line=").append(Record_ID)
+					.append(", Account=").append(m_acct)
+					.append(",dr=").append(dr).append(",cr=").append(cr)
+					.append(") - DR=").append(getAmtSourceDr()).append("|").append(getAmtAcctDr())
+					.append(", CR=").append(getAmtSourceCr()).append("|").append(getAmtAcctCr())
+					.toString());
+				//	Dimensions
+				setAD_OrgTrx_ID(fact.getAD_OrgTrx_ID());
+				setC_Project_ID (fact.getC_Project_ID());
+				setC_ProjectPhase_ID(fact.getC_ProjectPhase_ID());
+				setC_ProjectTask_ID(fact.getC_ProjectTask_ID());
+				setC_Activity_ID(fact.getC_Activity_ID());
+				setC_Campaign_ID(fact.getC_Campaign_ID());
+				setC_SalesRegion_ID(fact.getC_SalesRegion_ID());
+				setC_LocFrom_ID(fact.getC_LocFrom_ID());
+				setC_LocTo_ID(fact.getC_LocTo_ID());
+				setM_Product_ID(fact.getM_Product_ID());
+				setM_Locator_ID(fact.getM_Locator_ID());
+				setUser1_ID(fact.getUser1_ID());
+				setUser2_ID(fact.getUser2_ID());
+				setC_UOM_ID(fact.getC_UOM_ID());
+				setC_Tax_ID(fact.getC_Tax_ID());
+				//	Org for cross charge
+				setAD_Org_ID (fact.getAD_Org_ID());
+				if (fact.getQty() != null)
+					setQty(fact.getQty().negate());
+			}
+			else
+				log.warning(new StringBuilder("Not Found (try later) ")
+					.append(",C_AcctSchema_ID=").append(getC_AcctSchema_ID())
+					.append(", AD_Table_ID=").append(AD_Table_ID)
+					.append(",Record_ID=").append(Record_ID)
+					.append(",Line_ID=").append(Line_ID)
+					.append(", Account_ID=").append(m_acct.getAccount_ID()).toString());
+		}
+		catch (SQLException e)
+		{
+			log.log(Level.SEVERE, sql.toString(), e);
+		}
+		finally {
+			DB.close(rs, pstmt);
+			rs = null; pstmt = null;
+		}
+		return success;
+	}   //  updateReverseLine
+
+}	//	FactLine
diff -r 78886b832591 -r 8e5bcf78b00b idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	mer set 11 11:42:42 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	mer set 11 17:43:11 2019 +0200
@@ -1961,8 +1961,15 @@
 		MBPartner bp = new MBPartner (getCtx(), getC_BPartner_ID(), get_TrxName());
 		DB.getDatabase().forUpdate(bp, 0);
 		//	Update total revenue and balance / credit limit (reversed on AllocationLine.processIt)
+		//iDempiereConsulting __11/09/2019 --- Calcolo della conversione in base alla dataFattura, se presente variabile di sistema 'LIT_CURRENCYONDATEDOC' = Y
+			//BigDecimal invAmt = MConversionRate.convertBase(getCtx(), getGrandTotal(true),	//	CM adjusted
+				//getC_Currency_ID(), getDateAcct(), getC_ConversionType_ID(), getAD_Client_ID(), getAD_Org_ID());
+		Timestamp conversionDate = getDateAcct();
+		if(MSysConfig.getBooleanValue("LIT_CURRENCYONDATEDOC", true, getAD_Client_ID()))
+			conversionDate = getDateInvoiced();
 		BigDecimal invAmt = MConversionRate.convertBase(getCtx(), getGrandTotal(true),	//	CM adjusted
-			getC_Currency_ID(), getDateAcct(), getC_ConversionType_ID(), getAD_Client_ID(), getAD_Org_ID());
+				getC_Currency_ID(), conversionDate, getC_ConversionType_ID(), getAD_Client_ID(), getAD_Org_ID());
+		//iDempiereConsulting __11/09/2019 --- END
 		if (invAmt == null)
 		{
 			m_processMsg = MConversionRateUtil.getErrorMessage(getCtx(), "ErrorConvertingCurrencyToBaseCurrency",

```

------

### P1506 Param Value Nomer PDF x i Processi #Patch Data: 2019-09-05

Descrizione: By pass controllo ordine obbligatorio

Classe java: MInOut.java

```
diff -r 0277ed6afcc6 -r 00d9349c1536 idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java	lun set 02 10:11:21 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java	gio set 05 12:02:19 2019 +0200
@@ -1039,14 +1039,21 @@
             log.saveError("OrderOrRMA", "");
             return false;
         }
-
-		//	Shipment - Needs Order/RMA
-		if (!getMovementType().contentEquals(MInOut.MOVEMENTTYPE_CustomerReturns) && isSOTrx() && getC_Order_ID() == 0 && getM_RMA_ID() == 0)
-		{
-			log.saveError("FillMandatory", Msg.translate(getCtx(), "C_Order_ID"));
-			return false;
+        
+        // iDempiereConsulting __ 04/09/2019 -- By pass controllo ordine obbligatorio
+        String ship_OrderMand = MSysConfig.getValue("IDIT_Shipment_OrderMandatory", Env.getAD_Client_ID(Env.getCtx()));
+		if(ship_OrderMand != null && !ship_OrderMand.equals("")){
+			if(!ship_OrderMand.equals("N")){
+				//	Shipment - Needs Order/RMA
+				if (!getMovementType().contentEquals(MInOut.MOVEMENTTYPE_CustomerReturns) && isSOTrx() && getC_Order_ID() == 0 && getM_RMA_ID() == 0)
+				{
+					log.saveError("FillMandatory", Msg.translate(getCtx(), "C_Order_ID"));
+					return false;
+				}
+			}
 		}
-
+		// iDempiereConsulting __ 04/09/2019 -- END 
+		
         if (isSOTrx() && getM_RMA_ID() != 0)
         {
             // Set Document and Movement type for this Receipt
diff -r 0277ed6afcc6 -r 00d9349c1536 idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java	lun set 02 10:11:21 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java	gio set 05 12:02:19 2019 +0200
@@ -568,16 +568,23 @@
 		if (newRecord || is_ValueChanged("MovementQty"))
 			setMovementQty(getMovementQty());
 
-		//	Order/RMA Line
-		if (getC_OrderLine_ID() == 0 && getM_RMALine_ID() == 0)
-		{
-			if (getParent().isSOTrx())
-			{
-				log.saveError("FillMandatory", Msg.translate(getCtx(), "C_Order_ID"));
-				return false;
+        // iDempiereConsulting __ 04/09/2019 -- By pass controllo ordine obbligatorio
+        String ship_OrderMand = MSysConfig.getValue("IDIT_Shipment_OrderMandatory", Env.getAD_Client_ID(Env.getCtx()));
+		if(ship_OrderMand != null && !ship_OrderMand.equals("")){
+			if(!ship_OrderMand.equals("N")){
+				//	Order/RMA Line
+				if (getC_OrderLine_ID() == 0 && getM_RMALine_ID() == 0)
+				{
+					if (getParent().isSOTrx())
+					{
+						log.saveError("FillMandatory", Msg.translate(getCtx(), "C_Order_ID"));
+						return false;
+					}
+				}
 			}
 		}
-
+		// iDempiereConsulting __ 04/09/2019 -- END 
+		
 		// Validate Locator/Warehouse - teo_sarca, BF [ 2784194 ]
 		if (getM_Locator_ID() > 0)
 		{
```

------

### P1013 Creare Personalizza Infowindow #Patch Data: 2019-08-08 

Descrzione: Customizzazione infoColumn su maschere di tipo InfoWindow, tramite window_popup "Personalizza"
   da bottone su InfoWindow e salvataggio delle personalizzazioni su nuova
   tabella LIT_Info_Customization

Classe java: MANIFEST.MF

```
diff -r 220caec37d93 -r b4e5258e42d9 idIta.modification.org.adempiere.base/META-INF/MANIFEST.MF
--- a/idIta.modification.org.adempiere.base/META-INF/MANIFEST.MF	mer lug 31 11:04:35 2019 +0200
+++ b/idIta.modification.org.adempiere.base/META-INF/MANIFEST.MF	gio ago 08 16:42:40 2019 +0200
@@ -5,3 +5,4 @@
 Bundle-Version: 6.2.0.qualifier
 Fragment-Host: org.adempiere.base;bundle-version="6.1.0"
 Automatic-Module-Name: idIta.modification.org.adempiere.base
+Export-Package: it.idIta.compiere.model
diff -r 220caec37d93 -r b4e5258e42d9 idIta.modification.org.adempiere.base/src/it/idIta/compiere/model/I_LIT_Info_Customization.java
--- /dev/null	gio gen 01 00:00:00 1970 +0000
+++ b/idIta.modification.org.adempiere.base/src/it/idIta/compiere/model/I_LIT_Info_Customization.java	gio ago 08 16:42:40 2019 +0200
@@ -0,0 +1,186 @@
+/******************************************************************************
+ * Product: iDempiere ERP & CRM Smart Business Solution                       *
+ * Copyright (C) 1999-2012 ComPiere, Inc. All Rights Reserved.                *
+ * This program is free software, you can redistribute it and/or modify it    *
+ * under the terms version 2 of the GNU General Public License as published   *
+ * by the Free Software Foundation. This program is distributed in the hope   *
+ * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
+ * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
+ * See the GNU General Public License for more details.                       *
+ * You should have received a copy of the GNU General Public License along    *
+ * with this program, if not, write to the Free Software Foundation, Inc.,    *
+ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
+ * For the text or an alternative of this public license, you may reach us    *
+ * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
+ * or via info@compiere.org or http://www.compiere.org/license.html           *
+ *****************************************************************************/
+package it.idIta.compiere.model;
+
+import java.math.BigDecimal;
+import java.sql.Timestamp;
+import org.compiere.model.*;
+import org.compiere.util.KeyNamePair;
+
+/** Generated Interface for LIT_Info_Customization
+ *  @author iDempiere (generated) 
+ *  @version Release 6.2
+ */
+@SuppressWarnings("all")
+public interface I_LIT_Info_Customization 
+{
+
+    /** TableName=LIT_Info_Customization */
+    public static final String Table_Name = "LIT_Info_Customization";
+
+    /** AD_Table_ID=1000160 */
+    public static final int Table_ID = MTable.getTable_ID(Table_Name);
+
+    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);
+
+    /** AccessLevel = 4 - System 
+     */
+    BigDecimal accessLevel = BigDecimal.valueOf(4);
+
+    /** Load Meta Data */
+
+    /** Column name AD_Client_ID */
+    public static final String COLUMNNAME_AD_Client_ID = "AD_Client_ID";
+
+	/** Get Client.
+	  * Client/Tenant for this installation.
+	  */
+	public int getAD_Client_ID();
+
+    /** Column name AD_InfoWindow_ID */
+    public static final String COLUMNNAME_AD_InfoWindow_ID = "AD_InfoWindow_ID";
+
+	/** Set Info Window.
+	  * Info and search/select Window
+	  */
+	public void setAD_InfoWindow_ID (int AD_InfoWindow_ID);
+
+	/** Get Info Window.
+	  * Info and search/select Window
+	  */
+	public int getAD_InfoWindow_ID();
+
+	public org.compiere.model.I_AD_InfoWindow getAD_InfoWindow() throws RuntimeException;
+
+    /** Column name AD_Org_ID */
+    public static final String COLUMNNAME_AD_Org_ID = "AD_Org_ID";
+
+	/** Set Organization.
+	  * Organizational entity within client
+	  */
+	public void setAD_Org_ID (int AD_Org_ID);
+
+	/** Get Organization.
+	  * Organizational entity within client
+	  */
+	public int getAD_Org_ID();
+
+    /** Column name AD_User_ID */
+    public static final String COLUMNNAME_AD_User_ID = "AD_User_ID";
+
+	/** Set User/Contact.
+	  * User within the system - Internal or Business Partner Contact
+	  */
+	public void setAD_User_ID (int AD_User_ID);
+
+	/** Get User/Contact.
+	  * User within the system - Internal or Business Partner Contact
+	  */
+	public int getAD_User_ID();
+
+	public org.compiere.model.I_AD_User getAD_User() throws RuntimeException;
+
+    /** Column name Created */
+    public static final String COLUMNNAME_Created = "Created";
+
+	/** Get Created.
+	  * Date this record was created
+	  */
+	public Timestamp getCreated();
+
+    /** Column name CreatedBy */
+    public static final String COLUMNNAME_CreatedBy = "CreatedBy";
+
+	/** Get Created By.
+	  * User who created this records
+	  */
+	public int getCreatedBy();
+
+    /** Column name Custom */
+    public static final String COLUMNNAME_Custom = "Custom";
+
+	/** Set Custom	  */
+	public void setCustom (String Custom);
+
+	/** Get Custom	  */
+	public String getCustom();
+
+    /** Column name IsActive */
+    public static final String COLUMNNAME_IsActive = "IsActive";
+
+	/** Set Active.
+	  * The record is active in the system
+	  */
+	public void setIsActive (boolean IsActive);
+
+	/** Get Active.
+	  * The record is active in the system
+	  */
+	public boolean isActive();
+
+    /** Column name IsDisplayedGrid */
+    public static final String COLUMNNAME_IsDisplayedGrid = "IsDisplayedGrid";
+
+	/** Set Show in Grid	  */
+	public void setIsDisplayedGrid (String IsDisplayedGrid);
+
+	/** Get Show in Grid	  */
+	public String getIsDisplayedGrid();
+
+    /** Column name LIT_Info_Customization_ID */
+    public static final String COLUMNNAME_LIT_Info_Customization_ID = "LIT_Info_Customization_ID";
+
+	/** Set InfoWindow Customization	  */
+	public void setLIT_Info_Customization_ID (int LIT_Info_Customization_ID);
+
+	/** Get InfoWindow Customization	  */
+	public int getLIT_Info_Customization_ID();
+
+    /** Column name LIT_Info_Customization_UU */
+    public static final String COLUMNNAME_LIT_Info_Customization_UU = "LIT_Info_Customization_UU";
+
+	/** Set LIT_Info_Customization_UU	  */
+	public void setLIT_Info_Customization_UU (String LIT_Info_Customization_UU);
+
+	/** Get LIT_Info_Customization_UU	  */
+	public String getLIT_Info_Customization_UU();
+
+    /** Column name LIT_Layout */
+    public static final String COLUMNNAME_LIT_Layout = "LIT_Layout";
+
+	/** Set Layout Name	  */
+	public void setLIT_Layout (String LIT_Layout);
+
+	/** Get Layout Name	  */
+	public String getLIT_Layout();
+
+    /** Column name Updated */
+    public static final String COLUMNNAME_Updated = "Updated";
+
+	/** Get Updated.
+	  * Date this record was updated
+	  */
+	public Timestamp getUpdated();
+
+    /** Column name UpdatedBy */
+    public static final String COLUMNNAME_UpdatedBy = "UpdatedBy";
+
+	/** Get Updated By.
+	  * User who updated this records
+	  */
+	public int getUpdatedBy();
+}
diff -r 220caec37d93 -r b4e5258e42d9 idIta.modification.org.adempiere.base/src/it/idIta/compiere/model/MLITInfoCustomization.java
--- /dev/null	gio gen 01 00:00:00 1970 +0000
+++ b/idIta.modification.org.adempiere.base/src/it/idIta/compiere/model/MLITInfoCustomization.java	gio ago 08 16:42:40 2019 +0200
@@ -0,0 +1,38 @@
+package it.idIta.compiere.model;
+
+import java.sql.ResultSet;
+import java.util.Properties;
+
+import org.compiere.model.Query;
+
+public class MLITInfoCustomization extends X_LIT_Info_Customization {
+	
+	/**
+	 * 
+	 */
+	private static final long serialVersionUID = 2910030709109625657L;
+
+	public MLITInfoCustomization(Properties ctx, int LIT_Info_Customization_ID, String trxName) {
+		super(ctx, LIT_Info_Customization_ID, trxName);
+		if (LIT_Info_Customization_ID == 0)
+		{
+			setIsActive(true); 
+		}	
+	}
+
+	public MLITInfoCustomization(Properties ctx, ResultSet rs, String trxName) {
+		super(ctx, rs, trxName);
+		// TODO Auto-generated constructor stub
+	}
+	
+	/**
+	 * 
+	 * @param ctx
+	 * @param AD_InfoWindow_ID
+	 */
+	public static MLITInfoCustomization get(Properties ctx, int AD_User_ID, int AD_InfoWindow_ID, String trxName) {
+		Query query = new Query(ctx, Table_Name, "AD_User_ID=? AND AD_InfoWindow_ID=?", trxName);
+		return query.setClient_ID().setParameters(new Object[]{AD_User_ID, AD_InfoWindow_ID}).first();
+	}
+
+}
diff -r 220caec37d93 -r b4e5258e42d9 idIta.modification.org.adempiere.base/src/it/idIta/compiere/model/X_LIT_Info_Customization.java
--- /dev/null	gio gen 01 00:00:00 1970 +0000
+++ b/idIta.modification.org.adempiere.base/src/it/idIta/compiere/model/X_LIT_Info_Customization.java	gio ago 08 16:42:40 2019 +0200
@@ -0,0 +1,212 @@
+/******************************************************************************
+ * Product: iDempiere ERP & CRM Smart Business Solution                       *
+ * Copyright (C) 1999-2012 ComPiere, Inc. All Rights Reserved.                *
+ * This program is free software, you can redistribute it and/or modify it    *
+ * under the terms version 2 of the GNU General Public License as published   *
+ * by the Free Software Foundation. This program is distributed in the hope   *
+ * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
+ * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
+ * See the GNU General Public License for more details.                       *
+ * You should have received a copy of the GNU General Public License along    *
+ * with this program, if not, write to the Free Software Foundation, Inc.,    *
+ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
+ * For the text or an alternative of this public license, you may reach us    *
+ * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
+ * or via info@compiere.org or http://www.compiere.org/license.html           *
+ *****************************************************************************/
+/** Generated Model - DO NOT CHANGE */
+package it.idIta.compiere.model;
+
+import java.sql.ResultSet;
+import java.util.Properties;
+import org.compiere.model.*;
+
+/** Generated Model for LIT_Info_Customization
+ *  @author iDempiere (generated) 
+ *  @version Release 6.2 - $Id$ */
+public class X_LIT_Info_Customization extends PO implements I_LIT_Info_Customization, I_Persistent 
+{
+
+	/**
+	 *
+	 */
+	private static final long serialVersionUID = 20190731L;
+
+    /** Standard Constructor */
+    public X_LIT_Info_Customization (Properties ctx, int LIT_Info_Customization_ID, String trxName)
+    {
+      super (ctx, LIT_Info_Customization_ID, trxName);
+      /** if (LIT_Info_Customization_ID == 0)
+        {
+			setAD_User_ID (0);
+			setCustom (null);
+        } */
+    }
+
+    /** Load Constructor */
+    public X_LIT_Info_Customization (Properties ctx, ResultSet rs, String trxName)
+    {
+      super (ctx, rs, trxName);
+    }
+
+    /** AccessLevel
+      * @return 4 - System 
+      */
+    protected int get_AccessLevel()
+    {
+      return accessLevel.intValue();
+    }
+
+    /** Load Meta Data */
+    protected POInfo initPO (Properties ctx)
+    {
+      POInfo poi = POInfo.getPOInfo (ctx, Table_ID, get_TrxName());
+      return poi;
+    }
+
+    public String toString()
+    {
+      StringBuffer sb = new StringBuffer ("X_LIT_Info_Customization[")
+        .append(get_ID()).append("]");
+      return sb.toString();
+    }
+
+	public org.compiere.model.I_AD_InfoWindow getAD_InfoWindow() throws RuntimeException
+    {
+		return (org.compiere.model.I_AD_InfoWindow)MTable.get(getCtx(), org.compiere.model.I_AD_InfoWindow.Table_Name)
+			.getPO(getAD_InfoWindow_ID(), get_TrxName());	}
+
+	/** Set Info Window.
+		@param AD_InfoWindow_ID 
+		Info and search/select Window
+	  */
+	public void setAD_InfoWindow_ID (int AD_InfoWindow_ID)
+	{
+		if (AD_InfoWindow_ID < 1) 
+			set_ValueNoCheck (COLUMNNAME_AD_InfoWindow_ID, null);
+		else 
+			set_ValueNoCheck (COLUMNNAME_AD_InfoWindow_ID, Integer.valueOf(AD_InfoWindow_ID));
+	}
+
+	/** Get Info Window.
+		@return Info and search/select Window
+	  */
+	public int getAD_InfoWindow_ID () 
+	{
+		Integer ii = (Integer)get_Value(COLUMNNAME_AD_InfoWindow_ID);
+		if (ii == null)
+			 return 0;
+		return ii.intValue();
+	}
+
+	public org.compiere.model.I_AD_User getAD_User() throws RuntimeException
+    {
+		return (org.compiere.model.I_AD_User)MTable.get(getCtx(), org.compiere.model.I_AD_User.Table_Name)
+			.getPO(getAD_User_ID(), get_TrxName());	}
+
+	/** Set User/Contact.
+		@param AD_User_ID 
+		User within the system - Internal or Business Partner Contact
+	  */
+	public void setAD_User_ID (int AD_User_ID)
+	{
+		if (AD_User_ID < 1) 
+			set_Value (COLUMNNAME_AD_User_ID, null);
+		else 
+			set_Value (COLUMNNAME_AD_User_ID, Integer.valueOf(AD_User_ID));
+	}
+
+	/** Get User/Contact.
+		@return User within the system - Internal or Business Partner Contact
+	  */
+	public int getAD_User_ID () 
+	{
+		Integer ii = (Integer)get_Value(COLUMNNAME_AD_User_ID);
+		if (ii == null)
+			 return 0;
+		return ii.intValue();
+	}
+
+	/** Set Custom.
+		@param Custom Custom	  */
+	public void setCustom (String Custom)
+	{
+		set_Value (COLUMNNAME_Custom, Custom);
+	}
+
+	/** Get Custom.
+		@return Custom	  */
+	public String getCustom () 
+	{
+		return (String)get_Value(COLUMNNAME_Custom);
+	}
+
+	/** IsDisplayedGrid AD_Reference_ID=319 */
+	public static final int ISDISPLAYEDGRID_AD_Reference_ID=319;
+	/** Yes = Y */
+	public static final String ISDISPLAYEDGRID_Yes = "Y";
+	/** No = N */
+	public static final String ISDISPLAYEDGRID_No = "N";
+	/** Set Show in Grid.
+		@param IsDisplayedGrid Show in Grid	  */
+	public void setIsDisplayedGrid (String IsDisplayedGrid)
+	{
+
+		set_Value (COLUMNNAME_IsDisplayedGrid, IsDisplayedGrid);
+	}
+
+	/** Get Show in Grid.
+		@return Show in Grid	  */
+	public String getIsDisplayedGrid () 
+	{
+		return (String)get_Value(COLUMNNAME_IsDisplayedGrid);
+	}
+
+	/** Set InfoWindow Customization.
+		@param LIT_Info_Customization_ID InfoWindow Customization	  */
+	public void setLIT_Info_Customization_ID (int LIT_Info_Customization_ID)
+	{
+		if (LIT_Info_Customization_ID < 1) 
+			set_ValueNoCheck (COLUMNNAME_LIT_Info_Customization_ID, null);
+		else 
+			set_ValueNoCheck (COLUMNNAME_LIT_Info_Customization_ID, Integer.valueOf(LIT_Info_Customization_ID));
+	}
+
+	/** Get InfoWindow Customization.
+		@return InfoWindow Customization	  */
+	public int getLIT_Info_Customization_ID () 
+	{
+		Integer ii = (Integer)get_Value(COLUMNNAME_LIT_Info_Customization_ID);
+		if (ii == null)
+			 return 0;
+		return ii.intValue();
+	}
+
+	/** Set LIT_Info_Customization_UU.
+		@param LIT_Info_Customization_UU LIT_Info_Customization_UU	  */
+	public void setLIT_Info_Customization_UU (String LIT_Info_Customization_UU)
+	{
+		set_Value (COLUMNNAME_LIT_Info_Customization_UU, LIT_Info_Customization_UU);
+	}
+
+	/** Get LIT_Info_Customization_UU.
+		@return LIT_Info_Customization_UU	  */
+	public String getLIT_Info_Customization_UU () 
+	{
+		return (String)get_Value(COLUMNNAME_LIT_Info_Customization_UU);
+	}
+
+	/** Set Layout Name.
+		@param LIT_Layout Layout Name	  */
+	public void setLIT_Layout (String LIT_Layout)
+	{
+		set_Value (COLUMNNAME_LIT_Layout, LIT_Layout);
+	}
+
+	/** Get Layout Name.
+		@return Layout Name	  */
+	public String getLIT_Layout () 
+	{
+		return (String)get_Value(COLUMNNAME_LIT_Layout);
+	}
+}
\ No newline at end of file

```

------

### * Data: 2019-07-02 

Descrizione: Modifiche per gestioni messaggi 

Classe java: UpdatePriceMarkup.jav

```
diff -r 264706f385eb -r bf00931706f3 idIta.modification.org.adempiere.base/src/org/adempiere/process/UpdatePriceMarkup.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/process/UpdatePriceMarkup.java	lun lug 01 16:17:46 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/process/UpdatePriceMarkup.java	mar lug 02 16:38:34 2019 +0200
@@ -29,6 +29,7 @@
 import org.compiere.model.Query;
 import org.compiere.process.SvrProcess;
 import org.compiere.util.Env;
+import org.compiere.util.Msg;
 
 import it.idIta.compiere.model.MLITGroupMarkup;
 import it.idIta.compiere.model.MLITGroupMarkupLine;
@@ -67,7 +68,7 @@
 				LocalDate afterDate = dateTo.toLocalDateTime().toLocalDate();
 				
 				if((mdNow.isAfter(beforeDate)|| mdNow.compareTo(beforeDate)==0) && (mdNow.isBefore(afterDate)|| mdNow.compareTo(afterDate)==0))
-					return "@Error@ Is Not Update SO Price Now()";
+					return "@Error@ "+Msg.getMsg(Env.getCtx(), "LIT_NotUpdSOPrice");
 				
 //				MonthDay mdNow = MonthDay.now();
 //				MonthDay beforeDate = MonthDay.of(dateFrom.toLocalDateTime().getMonthValue(), dateFrom.toLocalDateTime().getDayOfMonth()) ;

```

------

### * Data: 2019-07-01 

Descrizione: Modifiche per gestioni messaggi _2

Classe java: PromotionRuleInvoice.java

```
diff -r 0f6a01d98500 -r d34b49e989d7 idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java	mer mar 13 16:50:54 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java	lun lug 01 09:23:51 2019 +0200
@@ -683,7 +683,7 @@
 			priceList = prodPrice2.getPriceList();
 		}
 		else
-			throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_OrderProduct")+product_CONAI.getName()); //LIT_CONAI_OrderProduct
+			throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_OrderProduct") +" "+product_CONAI.getName());
 		
 		//iDempiereConsulting __ 09/10/2018 -- Calcolo o no dell'IVA a livello riga promozione/CONAI
 		if(isVATCalcLine && oLine != null)
diff -r 0f6a01d98500 -r d34b49e989d7 idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRuleInvoice.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRuleInvoice.java	mer mar 13 16:50:54 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRuleInvoice.java	lun lug 01 09:23:51 2019 +0200
@@ -678,7 +678,7 @@
 			priceList = prodPrice2.getPriceList();
 		}
 		else
-			throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_OrderProduct")+product_CONAI.getName());//LIT_CONAI_OrderProduct
+			throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_OrderProduct")+" "+product_CONAI.getName());
 
 		//iDempiereConsulting __ 09/10/2018 -- Calcolo o no dell'IVA a livello riga promozione/CONAI
 		if(isVATCalcLine && iLine != null)

```

------

### * Data: 2019-06-06

Descrizione: Creazione registrazione contabile in base flag 'LIT_IsNotPosting' su C_DocType del documento.
   Non visualizzazione su maschera 'Controllo bolla fattura' del record
   entrata merce non registrato a livello contabile

Classe java: Doc.java

N°stringa: 731

```
	return STATUS_PeriodClosed;
+
+		//  createFacts
+		//iDempiereConsulting __06/06/2019 --- Se il tipo documento ha il flag 'LIT_IsNotPosting'=Y, allora non fa NESSUNA registrazione
+//		ArrayList<Fact> facts = createFacts (m_as);
+		ArrayList<Fact> facts = null;
+		PO po_tmp = getPO();
+		MDocType docType = MDocType.get(getCtx(), po_tmp.get_ValueAsInt("C_DocType_ID"));
+		if(docType.get_ValueAsBoolean("LIT_IsNotPosting")) { 
+			facts = new ArrayList<Fact>();
+			facts.add(new Fact(this, m_as, Fact.POST_Actual));
+		}
+		else
+			facts = createFacts (m_as);
+		//iDempiereConsulting __06/06/2019 ----- END 
+		
+		if (facts == null)
+			return STATUS_Error;
+
```

------

### * Data: 2019-06-05 

Descrizione: Creazione di incasso o pagamento in base al 'check.isReceipt()'

Classe Java : MPaySelectionCheck.java

N° stringa : 351

```
else
				{
					payment.setWriteOffAmt(Env.ZERO);
					payment.setDiscountAmt(Env.ZERO);
				}
				//iDempiereConsulting __04/06/2019 --- Creazione di incasso o pagamento in base al 'check.isReceipt()' 
				payment.setIsReceipt(check.isReceipt());
				//-----
				
				payment.saveEx();
				//
				int C_Payment_ID = payment.get_ID();
				if (C_Payment_ID < 1)
					s_log.log(Level.SEVERE, "Payment not created=" + check);
```

------

### P1309 Incasso Totale RIBA - scrivere dimensione contabile Cliente #Patch Data : 2019-05-30

Descrizione : Rimosso controllo salvataggio per campo AD_User.EMail per inserire piu' mail nell'invio posta da maschera + eliminata modifica "IDEMPIERE-3936" per il corretto funzionamento del campo

Classe Java : MUser.java

N° stringa : 889

```
protected boolean beforeSave (boolean newRecord)
	{
		//	New Address invalidates verification
		if (!newRecord && is_ValueChanged("EMail"))
			setEMailVerifyDate(null);
		
	//iDempiereConsulting __30/05/2019 --- NO Controllo, per poter inserire più indirizzi mail in automatico nel campo destinatari della WEmailDialog...
//		// IDEMPIERE-1409
//		if (!Util.isEmpty(getEMail()) && (newRecord || is_ValueChanged("EMail"))) {
//			if (! EMail.validate(getEMail())) {
//				log.saveError("SaveError", Msg.getMsg(getCtx(), "InvalidEMailFormat") + Msg.getElement(getCtx(), COLUMNNAME_EMail) + " - [" + getEMail() + "]");
//				return false;
//			}
//		}
```

------

### P1292 Termini di pagamento valorizzati a livello di riga #Patch Data : 2019-04-10 

Descrizione : aChecchia: update code for progress core_iDempiere

Classe Java : nothing

```
@@ -1814,7 +1814,7 @@
 		dropShipment.setDocAction(DocAction.ACTION_Complete);
 		// added AdempiereException by Zuhri
 		if (!dropShipment.processIt(DocAction.ACTION_Complete))
-			throw new AdempiereException("Failed when processing document - " + dropShipment.getProcessMsg());
+			throw new AdempiereException(Msg.getMsg(getCtx(), "FailedProcessingDocument") + " - " + dropShipment.getProcessMsg());
 		// end added
 		dropShipment.saveEx();
 
@@ -2084,7 +2084,7 @@
 				counter.setDocAction(counterDT.getDocAction());
 				// added AdempiereException by zuhri
 				if (!counter.processIt(counterDT.getDocAction()))
-					throw new AdempiereException("Failed when processing document - " + counter.getProcessMsg());
+					throw new AdempiereException(Msg.getMsg(getCtx(), "FailedProcessingDocument") + " - " + counter.getProcessMsg());
 				// end added
 				counter.saveEx(get_TrxName());
 			}

```

------

### P0639 Core iDempiere: avanzamento versione iDempiere x.y + Eclipse #Patch Data : 2019-04-09

Descrizione : aChecchia: update code for progress core_iDempiere

Classe Java : nothing

```
@@ -51,6 +51,7 @@
 import org.compiere.model.MRole;
 import org.compiere.model.MTable;
 import org.compiere.model.PO;
+import org.compiere.model.SystemIDs;
 import org.compiere.util.CLogger;
 import org.compiere.util.DB;
 import org.compiere.util.Env;
@@ -1363,4 +1364,62 @@
 
 		return success;
 	}
+	

+	/**

+	 * Fill Vector with DocAction Ref_List(131) values

+	 * @param v_value

+	 * @param v_name

+	 * @param v_description

+	 */

+	public static void readStatusReferenceList(ArrayList<String> v_value, ArrayList<String> v_name,

+			ArrayList<String> v_description)

+	{

+		if (v_value == null)

+			throw new IllegalArgumentException("v_value parameter is null");

+		if (v_name == null)

+			throw new IllegalArgumentException("v_name parameter is null");

+		if (v_description == null)

+			throw new IllegalArgumentException("v_description parameter is null");

+

+		String sql;

+		if (Env.isBaseLanguage(Env.getCtx(), "AD_Ref_List"))

+			sql = "SELECT Value, Name, Description FROM AD_Ref_List "

+				+ "WHERE AD_Reference_ID=? ORDER BY Name";

+		else

+			sql = "SELECT l.Value, t.Name, t.Description "

+				+ "FROM AD_Ref_List l, AD_Ref_List_Trl t "

+				+ "WHERE l.AD_Ref_List_ID=t.AD_Ref_List_ID"

+				+ " AND t.AD_Language='" + Env.getAD_Language(Env.getCtx()) + "'"

+				+ " AND l.AD_Reference_ID=? ORDER BY t.Name";

+		PreparedStatement pstmt = null;

+		ResultSet rs = null;

+		try

+		{

+			pstmt = DB.prepareStatement(sql, null);

+			pstmt.setInt(1, SystemIDs.REFERENCE_DOCUMENTSTATUS);

+			rs = pstmt.executeQuery();

+			while (rs.next())

+			{

+				String value = rs.getString(1);

+				String name = rs.getString(2);

+				String description = rs.getString(3);

+				if (description == null)

+					description = "";

+				//

+				v_value.add(value);

+				v_name.add(name);

+				v_description.add(description);

+			}

+		}

+		catch (SQLException e)

+		{

+			log.log(Level.SEVERE, sql, e);

+		}

+		finally

+		{

+			DB.close(rs, pstmt);

+			rs = null;

+			pstmt = null;

+		}

+	}
 }	//	DocumentEnine

```

------

### * Data : 2019-04-09 

Descrizione: Bypass controllo date di registrazione su record tabella C_AllocationHdr
   legato al pagamento, al momento del Complete.

classe java: MAllocationHdr.java

N° Stringa: 443

```
	m_processMsg = "No Business Partner";
+				return DocAction.STATUS_Invalid;
+			}
+
+			//iDempiereConsulting __09/04/2019 --- Bypass controllo date
+			String byPassWrongDate = MSysConfig.getValue("LIT_ALLOW_WRONGALLOCATIONDATE",  getAD_Client_ID());
+			if(byPassWrongDate==null || byPassWrongDate.isEmpty() || !byPassWrongDate.equals("Y")) {
+				// IDEMPIERE-1850 - validate date against related docs
+				if (line.getC_Invoice_ID() > 0) {
+					if (line.getC_Invoice().getDateAcct().after(getDateAcct())) {
+						m_processMsg = "Wrong allocation date";
+						return DocAction.STATUS_Invalid;
+					}
+				}
+				if (line.getC_Payment_ID() > 0) {
+					if (line.getC_Payment().getDateAcct().after(getDateAcct())) {
+						m_processMsg = "Wrong allocation date";
+						return DocAction.STATUS_Invalid;
+					}
+				}
+			}
+			//iDempiereConsulting __09/04/2019 ----- END
+		}
+		setApprovalAmt(approval);
+		//
+		m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_AFTER_PREPARE);
+		if (m_processMsg != null)
+			return DocAction.STATUS_Invalid;
+		
+		etDocAction()))
+			setDocAction(DOCACTION_Complete);
```

------

### * Data : 2019-04-05

Descrizione : delete

Classe Java : nothing

```
diff -r 15dceb738161 -r c75aa57dddf1 idIta.modification.org.adempiere.base/idIta.modification.org.adempiere.base.jar
Binary file idIta.modification.org.adempiere.base/idIta.modification.org.adempiere.base.jar has changed

```

------

### P1292 Termini di pagamento valorizzati a livello di riga #Patch Data : 2019-04-05

Descrione : Modifica query di processo "Crea da..." in Seleziona Fattura per Pagamento, ricerca di SOLO
   fatture di vendita + regole di pagamento a livello di C_InvoicePaySchedule

Classe Java : MInvoice.java

```
diff -r bcea480a2471 -r 15dceb738161 idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	gio apr 04 17:37:39 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	ven apr 05 09:40:53 2019 +0200
@@ -1066,8 +1066,8 @@
 				}
 			}
 		}
-
-		if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID)) && !get_ValueAsBoolean("LIT_isNoCheckPaymentTerm")) {
+		// iDempiereConsulting __ 04/04/2019 --- Apply paymentTerm for update PaymentRule into C_InvoicePaySchedule.... 
+		if (! recursiveCall && (!newRecord && (is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID)||is_ValueChanged(COLUMNNAME_PaymentRule))) && !get_ValueAsBoolean("LIT_isNoCheckPaymentTerm")) {
 			recursiveCall = true;
 			try {
 				MPaymentTerm pt = new MPaymentTerm (getCtx(), getC_PaymentTerm_ID(), get_TrxName());
diff -r bcea480a2471 -r 15dceb738161 idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java	gio apr 04 17:37:39 2019 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java	ven apr 05 09:40:53 2019 +0200
@@ -298,7 +298,12 @@
 				}
 				else
 					dateFrom = invoice.getDateInvoiced();
+  
 				String payRule = m_schedule[i].get_ValueAsString("PaymentRule");
+				// iDempiereConsulting __ 04/04/2019 --- Set paymentRule into line from Invoice, if PAYMENTRULE!=PAYMENTRULE_MixedPOSPayment 
+				if(!invoice.getPaymentRule().equals(MInvoice.PAYMENTRULE_MixedPOSPayment))
+					payRule = invoice.getPaymentRule();
+				// iDempiereConsulting __ 04/04/2019 ----- 
 				if(payRule.trim().length()>0)
 					ips.set_ValueOfColumn("PaymentRule", payRule);
 			}

```

------

### P148 Spese Bancarie su registrazione pagamento /incasso + Msk Fat #Patch Data : 2019-03-26

Descrizione : modifica classe FinReport, modifica codice per recupero di più periodi Esclusi (es periodo 13-rettifica anno in corso e anno precedente)

Classe Java : FinReport.java

N° stringa : nothing

```
diff -r 600fc1ae5e25 -r 1f1da47f05b8 idIta.modification.org.adempiere.base/idIta.modification.org.adempiere.base.jar
Binary file idIta.modification.org.adempiere.base/idIta.modification.org.adempiere.base.jar has changed
diff -r 600fc1ae5e25 -r 1f1da47f05b8 idIta.modification.org.adempiere.base/src/org/compiere/report/FinReport.java
--- /dev/null	gio gen 01 00:00:00 1970 +0000
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/report/FinReport.java	mar mar 26 10:06:53 2019 +0100
@@ -0,0 +1,1848 @@
+package org.compiere.report;
+
+/******************************************************************************
+ * Product: Adempiere ERP & CRM Smart Business Solution                       *
+ * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
+ * This program is free software; you can redistribute it and/or modify it    *
+ * under the terms version 2 of the GNU General Public License as published   *
+ * by the Free Software Foundation. This program is distributed in the hope   *
+ * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
+ * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
+ * See the GNU General Public License for more details.                       *
+ * You should have received a copy of the GNU General Public License along    *
+ * with this program; if not, write to the Free Software Foundation, Inc.,    *
+ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
+ * For the text or an alternative of this public license, you may reach us    *
+ * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
+ * or via info@compiere.org or http://www.compiere.org/license.html           *
+ *****************************************************************************/
+
+import static org.compiere.model.SystemIDs.TABLE_T_REPORT;
+
+import java.math.BigDecimal;
+import java.sql.PreparedStatement;
+import java.sql.ResultSet;
+import java.sql.Timestamp;
+import java.util.ArrayList;
+import java.util.List;
+import java.util.logging.Level;
+
+import org.compiere.model.I_C_ValidCombination;
+import org.compiere.model.MAcctSchemaElement;
+import org.compiere.model.MPeriod;
+import org.compiere.model.MReportCube;
+import org.compiere.print.MPrintFormat;
+import org.compiere.print.MPrintFormatItem;
+import org.compiere.process.ProcessInfoParameter;
+import org.compiere.process.SvrProcess;
+import org.compiere.util.AdempiereUserError;
+import org.compiere.util.DB;
+import org.compiere.util.Env;
+import org.compiere.util.Ini;
+import org.compiere.util.TimeUtil;
+
+/**
+ *  Financial Report Engine
+ *
+ *  @author Jorg Janke
+ *	@author Armen Rizal, Goodwill Consulting
+ *			<li>FR [2857076] User Element 1 and 2 completion - https://sourceforge.net/tracker/?func=detail&aid=2857076&group_id=176962&atid=879335
+ *
+ *  @version $Id: FinReport.java,v 1.2 2006/07/30 00:51:05 jjanke Exp $
+ */
+public class FinReport extends SvrProcess
+{
+	/**	Period Parameter				*/
+	private int					p_C_Period_ID = 0;
+	/**	Org Parameter					*/
+	private int					p_Org_ID = 0;
+	/**	BPartner Parameter				*/
+	private int					p_C_BPartner_ID = 0;
+	/**	Product Parameter				*/
+	private int					p_M_Product_ID = 0;
+	/**	Project Parameter				*/
+	private int					p_C_Project_ID = 0;
+	/**	Activity Parameter				*/
+	private int					p_C_Activity_ID = 0;
+	/**	SalesRegion Parameter			*/
+	private int					p_C_SalesRegion_ID = 0;
+	/**	Campaign Parameter				*/
+	private int					p_C_Campaign_ID = 0;
+	/** User 1 Parameter				*/
+	private int					p_User1_ID = 0;
+	/** User 2 Parameter				*/
+	private int					p_User2_ID = 0;
+	/** User Element 1 Parameter		*/
+	private int					p_UserElement1_ID = 0;
+	/** User Element 2 Parameter		*/
+	private int					p_UserElement2_ID = 0;
+	/** Details before Lines			*/
+	private boolean				p_DetailsSourceFirst = false;
+	/** Hierarchy						*/
+	private int					p_PA_Hierarchy_ID = 0;
+	/** Optional report cube			*/
+	private int 				p_PA_ReportCube_ID = 0;
+	/** Exclude Adjustment Period		*/
+	private String				p_AdjPeriodToExclude = "";
+
+	/**	Start Time						*/
+	private long 				m_start = System.currentTimeMillis();
+
+	/**	Report Definition				*/
+	private MReport				m_report = null;
+	/**	Periods in Calendar				*/
+	private FinReportPeriod[]	m_periods = null;
+	/**	Index of m_C_Period_ID in m_periods		**/
+	private int					m_reportPeriod = -1;
+	/**	Parameter Where Clause			*/
+	private StringBuffer		m_parameterWhere = new StringBuffer();
+	/**	The Report Columns				*/
+	private MReportColumn[] 	m_columns;
+	/** The Report Lines				*/
+	private MReportLine[] 		m_lines;
+
+
+	/**
+	 *  Prepare - e.g., get Parameters.
+	 */
+	protected void prepare()
+	{
+		StringBuffer sb = new StringBuffer ("Record_ID=")
+			.append(getRecord_ID());
+		//	Parameter
+		ProcessInfoParameter[] para = getParameter();
+		for (int i = 0; i < para.length; i++)
+		{
+			String name = para[i].getParameterName();
+			if (para[i].getParameter() == null)
+				;
+			else if (name.equals("C_Period_ID"))
+				p_C_Period_ID = para[i].getParameterAsInt();
+			else if (name.equals("PA_Hierarchy_ID"))
+				p_PA_Hierarchy_ID = para[i].getParameterAsInt();
+			else if (name.equals("Org_ID"))
+				p_Org_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("C_BPartner_ID"))
+				p_C_BPartner_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("M_Product_ID"))
+				p_M_Product_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("C_Project_ID"))
+				p_C_Project_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("C_Activity_ID"))
+				p_C_Activity_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("C_SalesRegion_ID"))
+				p_C_SalesRegion_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("C_Campaign_ID"))
+				p_C_Campaign_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("User1_ID"))
+				p_User1_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("User2_ID"))
+				p_User2_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("UserElement1_ID"))
+				p_UserElement1_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("UserElement2_ID"))
+				p_UserElement2_ID = ((BigDecimal)para[i].getParameter()).intValue();
+			else if (name.equals("DetailsSourceFirst"))
+				p_DetailsSourceFirst = "Y".equals(para[i].getParameter());
+			else if (name.equals("PA_ReportCube_ID"))
+				p_PA_ReportCube_ID = para[i].getParameterAsInt();
+			else
+				log.log(Level.SEVERE, "Unknown Parameter: " + name);
+		}
+		//	Optional Org
+		if (p_Org_ID != 0)
+			m_parameterWhere.append(" AND ").append(MReportTree.getWhereClause(getCtx(), 
+				p_PA_Hierarchy_ID, MAcctSchemaElement.ELEMENTTYPE_Organization, p_Org_ID));
+		//	Optional BPartner
+		if (p_C_BPartner_ID != 0)
+			m_parameterWhere.append(" AND ").append(MReportTree.getWhereClause(getCtx(), 
+				p_PA_Hierarchy_ID, MAcctSchemaElement.ELEMENTTYPE_BPartner, p_C_BPartner_ID));
+		//	Optional Product
+		if (p_M_Product_ID != 0)
+			m_parameterWhere.append(" AND ").append(MReportTree.getWhereClause(getCtx(), 
+				p_PA_Hierarchy_ID, MAcctSchemaElement.ELEMENTTYPE_Product, p_M_Product_ID));
+		//	Optional Project
+		if (p_C_Project_ID != 0)
+			m_parameterWhere.append(" AND ").append(MReportTree.getWhereClause(getCtx(), 
+				p_PA_Hierarchy_ID, MAcctSchemaElement.ELEMENTTYPE_Project, p_C_Project_ID));
+		//	Optional Activity
+		if (p_C_Activity_ID != 0)
+			m_parameterWhere.append(" AND ").append(MReportTree.getWhereClause(getCtx(), 
+				p_PA_Hierarchy_ID, MAcctSchemaElement.ELEMENTTYPE_Activity, p_C_Activity_ID));
+		//	Optional Campaign
+		if (p_C_Campaign_ID != 0)
+			m_parameterWhere.append(" AND C_Campaign_ID=").append(p_C_Campaign_ID);
+		//	m_parameterWhere.append(" AND ").append(MReportTree.getWhereClause(getCtx(), 
+		//		MAcctSchemaElement.ELEMENTTYPE_Campaign, p_C_Campaign_ID));
+		//	Optional Sales Region
+		if (p_C_SalesRegion_ID != 0)
+			m_parameterWhere.append(" AND ").append(MReportTree.getWhereClause(getCtx(), 
+				p_PA_Hierarchy_ID, MAcctSchemaElement.ELEMENTTYPE_SalesRegion, p_C_SalesRegion_ID));
+		//	Optional User1_ID
+		if (p_User1_ID != 0)
+			m_parameterWhere.append(" AND ").append(MReportTree.getWhereClause(getCtx(), 
+				p_PA_Hierarchy_ID, MAcctSchemaElement.ELEMENTTYPE_UserElementList1, p_User1_ID));
+		//  Optional User2_ID
+		if (p_User2_ID != 0)
+			m_parameterWhere.append(" AND ").append(MReportTree.getWhereClause(getCtx(), 
+				p_PA_Hierarchy_ID, MAcctSchemaElement.ELEMENTTYPE_UserElementList2, p_User2_ID));
+		//	Optional UserElement1_ID
+		if (p_UserElement1_ID != 0)
+			m_parameterWhere.append(" AND UserElement1_ID=").append(p_UserElement1_ID);
+		//  Optional UserElement2_ID
+		if (p_UserElement2_ID != 0)
+			m_parameterWhere.append(" AND UserElement2_ID=").append(p_UserElement2_ID);	
+
+		//	Load Report Definition
+		m_report = new MReport (getCtx(), getRecord_ID(), null);
+		sb.append(" - ").append(m_report);
+
+		/* Exclude adjustment period
+		 * - if the report period is standard
+		 * - and there is an adjustment period with the same end date (on the same year)
+		 */
+		
+ ////--------------IDEMPIERE CONSULTING 26-03-2019--------modifica codice per recupero di più periodi Esclusi (es: periodo 13-rettifica anno in corso e anno precedente)
+		/*if (p_C_Period_ID > 0) {
+			MPeriod per = MPeriod.get(getCtx(), p_C_Period_ID);
+			if (MPeriod.PERIODTYPE_StandardCalendarPeriod.equals(per.getPeriodType())) {
+				int adjPeriodToExclude_ID = DB.getSQLValue(get_TrxName(),
+						"SELECT C_Period_ID FROM C_Period WHERE IsActive='Y' AND PeriodType=? AND EndDate=? AND C_Year_ID=?",
+						MPeriod.PERIODTYPE_AdjustmentPeriod, per.getEndDate(), per.getC_Year_ID());
+				if (adjPeriodToExclude_ID > 0) {
+					p_AdjPeriodToExclude = " C_Period_ID!=" + adjPeriodToExclude_ID + " AND ";
+					log.warning("Will Exclude Adjustment Period -> " + p_AdjPeriodToExclude);
+				}
+			}
+		} */	
+		if (p_C_Period_ID > 0) {
+			MPeriod per = MPeriod.get(getCtx(), p_C_Period_ID);
+			if (MPeriod.PERIODTYPE_StandardCalendarPeriod.equals(per.getPeriodType())) {
+				int[] adjPeriodToExclude_ID = DB.getIDsEx(get_TrxName(),
+						"SELECT C_Period_ID FROM C_Period WHERE IsActive='Y' AND PeriodType=? ",
+						MPeriod.PERIODTYPE_AdjustmentPeriod); 
+				if (adjPeriodToExclude_ID.length > 0) {
+					for (int recordid : adjPeriodToExclude_ID) {
+						p_AdjPeriodToExclude += " C_Period_ID!=" + recordid + " AND ";
+					} 
+					log.warning("Will Exclude Adjustment Period -> " + p_AdjPeriodToExclude);
+				}
+			}
+		}
+	////--------------IDEMPIERE CONSULTING 26-03-2019--------END
+		//
+		setPeriods();
+		sb.append(" - C_Period_ID=").append(p_C_Period_ID)
+			.append(" - ").append(m_parameterWhere);
+		//
+		
+		if ( p_PA_ReportCube_ID > 0)
+			m_parameterWhere.append(" AND PA_ReportCube_ID=").append(p_PA_ReportCube_ID);
+		
+		if (log.isLoggable(Level.INFO)) log.info(sb.toString());
+	//	m_report.list();
+	}	//	prepare
+
+	/**
+	 * 	Set Periods
+	 */
+	private void setPeriods()
+	{
+		if (log.isLoggable(Level.INFO)) log.info("C_Calendar_ID=" + m_report.getC_Calendar_ID());
+		Timestamp today = TimeUtil.getDay(System.currentTimeMillis());
+
+		// enable reporting on an adjustment period
+		if (p_C_Period_ID > 0) {
+			MPeriod per = MPeriod.get(getCtx(), p_C_Period_ID);
+			if (MPeriod.PERIODTYPE_AdjustmentPeriod.equals(per.getPeriodType())) {
+				today = per.getEndDate();
+				p_C_Period_ID = 0;
+			}
+		}
+		ArrayList<FinReportPeriod> list = new ArrayList<FinReportPeriod>();
+
+		String sql = "SELECT p.C_Period_ID, p.Name, p.StartDate, p.EndDate, MIN(p1.StartDate) "
+			+ "FROM C_Period p "
+			+ " INNER JOIN C_Year y ON (p.C_Year_ID=y.C_Year_ID),"
+			+ " C_Period p1 "
+			+ "WHERE y.C_Calendar_ID=?"
+			// globalqss - cruiz - Bug [ 1577712 ] Financial Period Bug
+			+ " AND p.IsActive='Y'"
+			+ " AND p.PeriodType='S' "
+			+ " AND p1.C_Year_ID=y.C_Year_ID AND p1.PeriodType='S' "
+			+ "GROUP BY p.C_Period_ID, p.Name, p.StartDate, p.EndDate "
+			+ "ORDER BY p.StartDate";
+
+		PreparedStatement pstmt = null;
+		ResultSet rs = null;
+		try
+		{
+			pstmt = DB.prepareStatement(sql, null);
+			pstmt.setInt(1, m_report.getC_Calendar_ID());
+			rs = pstmt.executeQuery();
+			while (rs.next())
+			{
+				FinReportPeriod frp = new FinReportPeriod (rs.getInt(1), rs.getString(2),
+					rs.getTimestamp(3), rs.getTimestamp(4), rs.getTimestamp(5));
+				list.add(frp);
+				if (p_C_Period_ID == 0 && frp.inPeriod(today))
+					p_C_Period_ID = frp.getC_Period_ID();
+			}
+		}
+		catch (Exception e)
+		{
+			log.log(Level.SEVERE, sql, e);
+		}
+		finally
+		{
+			DB.close(rs, pstmt);
+			rs = null; pstmt = null;
+		}
+		//	convert to Array
+		m_periods = new FinReportPeriod[list.size()];
+		list.toArray(m_periods);
+		//	today after latest period
+		if (p_C_Period_ID == 0)
+		{
+			m_reportPeriod = m_periods.length - 1;
+			p_C_Period_ID = m_periods[m_reportPeriod].getC_Period_ID ();
+		}
+	}	//	setPeriods
+
+	
+	/**************************************************************************
+	 *  Perform process.
+	 *  @return Message to be translated
+	 *  @throws Exception
+	 */
+	protected String doIt() throws Exception
+	{
+		if (log.isLoggable(Level.INFO)) log.info("AD_PInstance_ID=" + getAD_PInstance_ID());
+		
+		if ( p_PA_ReportCube_ID > 0 )
+		{
+			MReportCube cube = new MReportCube(getCtx(), p_PA_ReportCube_ID, get_TrxName());
+			String result = cube.update(false, false);
+			if (log.isLoggable(Level.FINE))log.log(Level.FINE, result);
+		}
+		//	** Create Temporary and empty Report Lines from PA_ReportLine
+		//	- AD_PInstance_ID, PA_ReportLine_ID, 0, 0
+		int PA_ReportLineSet_ID = m_report.getLineSet().getPA_ReportLineSet_ID();
+		StringBuffer sql = new StringBuffer ("INSERT INTO T_Report "
+			+ "(AD_PInstance_ID, PA_ReportLine_ID, Record_ID,Fact_Acct_ID, SeqNo,LevelNo, Name,Description) "
+			+ "SELECT ").append(getAD_PInstance_ID()).append(", PA_ReportLine_ID, 0,0, SeqNo,0, Name,Description "
+			+ "FROM PA_ReportLine "
+			+ "WHERE IsActive='Y' AND PA_ReportLineSet_ID=").append(PA_ReportLineSet_ID);
+
+		int no = DB.executeUpdate(sql.toString(), get_TrxName());
+		if (log.isLoggable(Level.FINE)) log.fine("Report Lines = " + no);
+
+		//	** Get Data	** Segment Values
+		m_columns = m_report.getColumnSet().getColumns();
+		if (m_columns.length == 0)
+			throw new AdempiereUserError("@No@ @PA_ReportColumn_ID@");
+		m_lines = m_report.getLineSet().getLiness();
+		if (m_lines.length == 0)
+			throw new AdempiereUserError("@No@ @PA_ReportLine_ID@");
+		
+		//	for all lines
+		for (int line = 0; line < m_lines.length; line++)
+		{
+			//	Line Segment Value (i.e. not calculation)
+			if (m_lines[line].isLineTypeSegmentValue())
+				insertLine (line);
+		}	//	for all lines
+
+		insertLineDetail();
+		doCalculations();
+		doColumnPercentageOfLineForMultiRange();
+
+		deleteUnprintedLines();
+		
+		scaleResults();
+
+		//	Create Report
+		if (Ini.isClient())
+			getProcessInfo().setTransientObject (getPrintFormat());
+		else
+			getProcessInfo().setSerializableObject(getPrintFormat());
+
+		if (log.isLoggable(Level.FINE)) log.fine((System.currentTimeMillis() - m_start) + " ms");
+		return "";
+	}	//	doIt
+
+	/**************************************************************************
+	 * 	For all columns (in a line) with relative period access
+	 * 	@param line line
+	 */
+	private void insertLine (int line)
+	{
+		if (log.isLoggable(Level.INFO)) log.info("" + m_lines[line]);
+
+		//	No source lines - Headings
+		if (m_lines[line] == null || m_lines[line].getSources().length == 0)
+		{
+			log.warning ("No Source lines: " + m_lines[line]);
+			return;
+		}
+
+		StringBuffer update = new StringBuffer();
+		//	for all columns
+		for (int col = 0; col < m_columns.length; col++)
+		{
+			//	Ignore calculation columns
+			if (m_columns[col].isColumnTypeCalculation())
+				continue;
+			StringBuilder info = new StringBuilder();
+			info.append("Line=").append(line).append(",Col=").append(col);
+
+			//	SELECT SUM()
+			StringBuffer select = new StringBuffer ("SELECT ");
+			if (m_lines[line].getPAAmountType() != null)				//	line amount type overwrites column
+			{
+				String sql = m_lines[line].getSelectClause (true);
+				select.append (sql);
+				info.append(": LineAmtType=").append(m_lines[line].getPAAmountType());
+			}
+			else if (m_columns[col].getPAAmountType() != null)
+			{
+				String sql = m_columns[col].getSelectClause (true);
+				select.append (sql);
+				info.append(": ColumnAmtType=").append(m_columns[col].getPAAmountType());
+			}
+			else
+			{
+				log.warning("No Amount Type in line: " + m_lines[line] + " or column: " + m_columns[col]);
+				continue;
+			}
+			
+			if (p_PA_ReportCube_ID > 0) 
+				select.append(" FROM Fact_Acct_Summary fa WHERE ").append(p_AdjPeriodToExclude).append("DateAcct ");
+			else {
+				//	Get Period/Date info
+				select.append(" FROM Fact_Acct fa WHERE ").append(p_AdjPeriodToExclude).append("TRUNC(DateAcct) ");
+			}
+
+			BigDecimal relativeOffset = null;	//	current
+			if (m_columns[col].isColumnTypeRelativePeriod())
+				relativeOffset = m_columns[col].getRelativePeriod();
+			FinReportPeriod frp = getPeriod (relativeOffset);
+			if (m_lines[line].getPAPeriodType() != null)			//	line amount type overwrites column
+			{
+				info.append(" - LineDateAcct=");
+				if (m_lines[line].isPeriod())
+				{
+					String sql = frp.getPeriodWhere();
+					info.append("Period");
+					select.append(sql);
+				}
+				else if (m_lines[line].isYear())
+				{
+					String sql = frp.getYearWhere();
+					info.append("Year");
+					select.append(sql);
+				}
+				else if (m_lines[line].isTotal())
+				{
+					String sql = frp.getTotalWhere();
+					info.append("Total");
+					select.append(sql);
+				}
+				else if (m_lines[line].isNatural())
+				{
+						select.append( frp.getNaturalWhere("fa"));
+				}
+				else
+				{
+					log.log(Level.SEVERE, "No valid Line PAPeriodType");
+					select.append("=0");	// valid sql	
+				}
+			}
+			else if (m_columns[col].getPAPeriodType() != null)
+			{
+				info.append(" - ColumnDateAcct=");
+				if (m_columns[col].isPeriod())
+				{
+					String sql = frp.getPeriodWhere();
+					info.append("Period");
+					select.append(sql);
+				}
+				else if (m_columns[col].isYear())
+				{
+					String sql = frp.getYearWhere();
+					info.append("Year");
+					select.append(sql);
+				}
+				else if (m_columns[col].isTotal())
+				{
+					String sql = frp.getTotalWhere();
+					info.append("Total");
+					select.append(sql);
+				}
+				else if (m_columns[col].isNatural())
+				{
+					select.append( frp.getNaturalWhere("fa"));
+				}
+				else
+				{
+					log.log(Level.SEVERE, "No valid Column PAPeriodType");
+					select.append("=0");	// valid sql	
+				}
+			}
+
+		//	Line Where
+		String s = m_lines[line].getWhereClause(p_PA_Hierarchy_ID);	//	(sources, posting type)
+		if (s != null && s.length() > 0)
+			select.append(" AND ").append(s);
+
+		//	Report Where
+		s = m_report.getWhereClause();
+		if (s != null && s.length() > 0)
+			select.append(" AND ").append(s);
+
+		//	PostingType
+		if (!m_lines[line].isPostingType())		//	only if not defined on line
+		{
+			String PostingType = m_columns[col].getPostingType();
+			if (PostingType != null && PostingType.length() > 0)
+				select.append(" AND PostingType='").append(PostingType).append("'");
+			// globalqss - CarlosRuiz
+			if (MReportColumn.POSTINGTYPE_Budget.equals(PostingType)) {
+				if (m_columns[col].getGL_Budget_ID() > 0)
+					select.append(" AND GL_Budget_ID=" + m_columns[col].getGL_Budget_ID());
+			}
+			// end globalqss
+		}
+
+			if (m_columns[col].isColumnTypeSegmentValue())
+				select.append(m_columns[col].getWhereClause(p_PA_Hierarchy_ID));
+			
+			//	Parameter Where
+			select.append(m_parameterWhere);
+			if (log.isLoggable(Level.FINEST)) log.finest("Line=" + line + ",Col=" + line + ": " + select);
+
+			//	Update SET portion
+			if (update.length() > 0)
+				update.append(", ");
+			update.append("Col_").append(col)
+				.append(" = (").append(select).append(")");
+			//
+			if (log.isLoggable(Level.FINEST)) log.finest(info.toString());
+		}
+		//	Update Line Values
+		if (update.length() > 0)
+		{
+			update.insert (0, "UPDATE T_Report SET ");
+			update.append(" WHERE AD_PInstance_ID=").append(getAD_PInstance_ID())
+				.append(" AND PA_ReportLine_ID=").append(m_lines[line].getPA_ReportLine_ID())
+				.append(" AND ABS(LevelNo)<2");		//	0=Line 1=Acct
+			int no = DB.executeUpdate(update.toString(), get_TrxName());
+			if (no != 1)
+				log.log(Level.SEVERE, "#=" + no + " for " + update);
+			if (log.isLoggable(Level.FINEST)) log.finest(update.toString());
+		}
+	}	//	insertLine
+
+
+	/**************************************************************************
+	 *	Line + Column calculation
+	 */
+	private void doCalculations()
+	{
+		//	for all lines	***************************************************
+		for (int line = 0; line < m_lines.length; line++)
+		{
+			if (!m_lines[line].isLineTypeCalculation ())
+				continue;
+			
+			if (log.isLoggable(Level.FINE)) log.fine("Line " + line + " = #" + m_lines[line].getOper_1_ID() + " " 
+				+ m_lines[line].getCalculationType() + " #" + m_lines[line].getOper_2_ID());
+
+			List<Integer> addList = new ArrayList<Integer>();
+			List<Integer> notAddList = new ArrayList<Integer>();
+			
+			boolean inverse = m_lines[line].isInverseDebitCreditOnly();
+			
+			if (m_lines[line].isCalculationTypeAdd()
+					|| m_lines[line].isCalculationTypeRange())
+			{
+				for (int col = 0; col < m_columns.length; col++) 
+				{
+					if (m_columns[col].isColumnTypeCalculation() || !inverse)
+					{
+						addList.add(col);
+					}
+					else 
+					{
+						String amountType = m_columns[col].getPAAmountType();
+						if (amountType != null && (amountType.startsWith("C") || amountType.startsWith("D")))
+						{
+							notAddList.add(col);
+						}
+						else
+						{
+							addList.add(col);
+						}
+					}
+				}
+			}
+			else if (m_lines[line].isCalculationTypeSubtract()) 
+			{
+				for (int col = 0; col < m_columns.length; col++) 
+				{
+					if (m_columns[col].isColumnTypeCalculation() || !inverse) 
+					{
+						notAddList.add(col);
+					}
+					else
+					{
+						String amountType = m_columns[col].getPAAmountType();
+						if (amountType != null && (amountType.startsWith("C") || amountType.startsWith("D")))
+						{
+							addList.add(col);
+						}
+						else
+						{
+							notAddList.add(col);
+						}
+					}					
+				}
+			} 
+			else
+			{
+				//percentage
+				for (int col = 0; col < m_columns.length; col++) 
+				{
+					notAddList.add(col);
+				}
+			}
+			
+			//	Adding
+			if (addList.size() > 0)
+			{
+				int oper_1 = m_lines[line].getOper_1_ID();
+				int oper_2 = m_lines[line].getOper_2_ID();
+
+				//	Reverse range
+				if (oper_1 > oper_2)
+				{
+					int temp = oper_1;
+					oper_1 = oper_2;
+					oper_2 = temp;
+				}
+				StringBuilder sb = new StringBuilder ("UPDATE T_Report SET ");
+				if (DB.isPostgreSQL()) {
+					for (int col : addList) 
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("Col_").append (col)
+						  .append("=")
+						  .append("r2.c").append (col);
+					}
+					sb.append(" FROM ( SELECT ");
+					for (int col : addList) 
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("COALESCE(SUM(r2.Col_").append (col).append("),0) AS c").append(col);
+					}
+				} else {
+					sb.append(" (");
+					for (int col : addList) 
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("Col_").append (col);
+					}
+					sb.append(") = (SELECT ");
+					for (int col : addList)
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("COALESCE(SUM(r2.Col_").append (col).append("),0)");
+					}
+				}
+				
+				sb.append(" FROM T_Report r2 WHERE r2.AD_PInstance_ID=").append(getAD_PInstance_ID())
+					.append(" AND r2.PA_ReportLine_ID IN (");
+				if (m_lines[line].isCalculationTypeAdd())
+					sb.append(oper_1).append(",").append(oper_2);
+				else
+					sb.append(getLineIDs (oper_1, oper_2));		//	list of columns to add up
+				sb.append(") AND ABS(r2.LevelNo)<1) ");		//	0=Line 1=Acct
+				if (DB.isPostgreSQL()) {
+					sb.append(" r2 ");
+				}
+				sb.append("WHERE T_Report.AD_PInstance_ID=").append(getAD_PInstance_ID())
+					.append(" AND T_Report.PA_ReportLine_ID=").append(m_lines[line].getPA_ReportLine_ID())
+					.append(" AND ABS(T_Report.LevelNo)<1");		//	not trx
+				int no = DB.executeUpdate(sb.toString(), get_TrxName());
+				if (no != 1)
+					log.log(Level.SEVERE, "(+) #=" + no + " for " + m_lines[line] + " - " + sb.toString());
+				else
+				{
+					if (log.isLoggable(Level.FINE)) log.fine("(+) Line=" + line + " - " + m_lines[line]);
+					if (log.isLoggable(Level.FINEST)) log.finest ("(+) " + sb.toString ());
+				}
+			}
+			
+			//	No Add (subtract, percent)
+			if (notAddList.size() > 0)
+			{
+				int oper_1 = m_lines[line].getOper_1_ID();
+				int oper_2 = m_lines[line].getOper_2_ID();
+
+				//	Step 1 - get First Value or 0 in there
+				StringBuilder sb = new StringBuilder ("UPDATE T_Report SET ");
+				if (DB.isPostgreSQL()) 
+				{
+					for (int col : notAddList)
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("Col_").append (col)
+						  .append("=r2.c").append(col);
+					}
+					sb.append(" FROM (SELECT ");
+					for (int col : notAddList)
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("COALESCE(r2.Col_").append (col).append(",0) AS c").append(col);
+					}
+				}
+				else 
+				{
+					sb.append(" (");
+					for (int col : notAddList)
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("Col_").append (col);
+					}
+					sb.append(") = (SELECT ");
+					for (int col : notAddList)
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("COALESCE(r2.Col_").append (col).append(",0)");
+					}
+				}
+				sb.append(" FROM T_Report r2 WHERE r2.AD_PInstance_ID=").append(getAD_PInstance_ID())
+					.append(" AND r2.PA_ReportLine_ID=").append(oper_1)
+					.append(" AND r2.Record_ID=0 AND r2.Fact_Acct_ID=0) ");
+				if (DB.isPostgreSQL())
+				{
+					sb.append(" r2 ");
+				}
+				//
+				sb.append("WHERE T_Report.AD_PInstance_ID=").append(getAD_PInstance_ID())
+					   .append(" AND T_Report.PA_ReportLine_ID=").append(m_lines[line].getPA_ReportLine_ID())
+					.append(" AND ABS(T_Report.LevelNo)<1");			//	0=Line 1=Acct
+				int no = DB.executeUpdate(sb.toString(), get_TrxName());
+				if (no != 1)
+				{
+					log.severe ("(x) #=" + no + " for " + m_lines[line] + " - " + sb.toString ());
+					continue;
+				}
+
+				//	Step 2 - do Calculation with Second Value
+				sb = new StringBuilder ("UPDATE T_Report r1 SET ");
+				if (DB.isPostgreSQL())
+				{
+					for (int col : notAddList)
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("Col_").append (col).append("=");
+						sb.append ("COALESCE(r1.Col_").append (col).append(",0)");
+						// fix bug [ 1563664 ] Errors in values shown in Financial Reports
+						// Carlos Ruiz - globalqss
+						if (m_lines[line].isCalculationTypeSubtract()) {
+							sb.append("-");
+							// Solution, for subtraction replace the null with 0, instead of 0.000000001 
+							sb.append (" r2.c").append (col);
+						} else {
+							// Solution, for division don't replace the null, convert 0 to null (avoid ORA-01476)
+							sb.append("/ r2.c").append(col);
+						}
+						// end fix bug [ 1563664 ]
+						if (m_lines[line].isCalculationTypePercent())
+							sb.append(" *100");
+					}
+					sb.append(" FROM (SELECT ");
+					for (int col : notAddList)
+					{
+						if (col > 0)
+							sb.append(",");
+						
+						if (m_lines[line].isCalculationTypeSubtract()) {
+							// Solution, for subtraction replace the null with 0, instead of 0.000000001 
+							sb.append ("COALESCE(r2.Col_").append (col).append(",0) AS c").append(col);
+						} else {
+							// Solution, for division don't replace the null, convert 0 to null (avoid ORA-01476)
+							sb.append ("CASE WHEN r2.Col_").append (col).append("=0 THEN NULL ELSE r2.Col_").append (col).append(" END AS c").append(col);
+						}
+					}
+				}
+				else
+				{
+					sb.append(" (");
+					for (int col : notAddList)
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("Col_").append (col);
+					}
+					sb.append(") = (SELECT ");
+					for (int col : notAddList)
+					{
+						if (col > 0)
+							sb.append(",");
+						sb.append ("COALESCE(r1.Col_").append (col).append(",0)");
+						// fix bug [ 1563664 ] Errors in values shown in Financial Reports
+						// Carlos Ruiz - globalqss
+						if (m_lines[line].isCalculationTypeSubtract()) {
+							sb.append("-");
+							// Solution, for subtraction replace the null with 0, instead of 0.000000001 
+							sb.append ("COALESCE(r2.Col_").append (col).append(",0)");
+						} else {
+							// Solution, for division don't replace the null, convert 0 to null (avoid ORA-01476)
+							sb.append("/");
+							sb.append ("CASE WHEN r2.Col_").append (col).append("=0 THEN NULL ELSE r2.Col_").append (col).append(" END");
+						}
+						// end fix bug [ 1563664 ]
+						if (m_lines[line].isCalculationTypePercent())
+							sb.append(" *100");
+					}
+				}
+				sb.append(" FROM T_Report r2 WHERE r2.AD_PInstance_ID=").append(getAD_PInstance_ID())
+					.append(" AND r2.PA_ReportLine_ID=").append(oper_2)
+					.append(" AND r2.Record_ID=0 AND r2.Fact_Acct_ID=0) ");
+				if (DB.isPostgreSQL())
+				{
+					sb.append(" r2 ");
+				}
+				//
+				sb.append("WHERE r1.AD_PInstance_ID=").append(getAD_PInstance_ID())
+					   .append(" AND r1.PA_ReportLine_ID=").append(m_lines[line].getPA_ReportLine_ID())
+					.append(" AND ABS(r1.LevelNo)<1");			//	0=Line 1=Acct
+				no = DB.executeUpdate(sb.toString(), get_TrxName());
+				if (no != 1)
+					log.severe ("(x) #=" + no + " for " + m_lines[line] + " - " + sb.toString ());
+				else
+				{
+					if (log.isLoggable(Level.FINE)) log.fine("(x) Line=" + line + " - " + m_lines[line]);
+					if (log.isLoggable(Level.FINEST)) log.finest (sb.toString());
+				}
+			}
+		}	//	for all lines
+
+
+		//	for all columns		***********************************************
+		for (int col = 0; col < m_columns.length; col++)
+		{
+			//	Only Calculations
+			if (!m_columns[col].isColumnTypeCalculation ())
+				continue;
+
+			StringBuilder sb = new StringBuilder ("UPDATE T_Report SET ");
+			//	Column to set
+			sb.append ("Col_").append (col).append("=");
+			//	First Operand
+			int ii_1 = getColumnIndex(m_columns[col].getOper_1_ID());
+			if (ii_1 < 0)
+			{
+				log.log(Level.SEVERE, "Column Index for Operator 1 not found - " + m_columns[col]);
+				continue;
+			}
+			//	Second Operand
+			int ii_2 = getColumnIndex(m_columns[col].getOper_2_ID());
+			if (ii_2 < 0)
+			{
+				log.log(Level.SEVERE, "Column Index for Operator 2 not found - " + m_columns[col]);
+				continue;
+			}
+			if (log.isLoggable(Level.FINE)) log.fine("Column " + col + " = #" + ii_1 + " " 
+				+ m_columns[col].getCalculationType() + " #" + ii_2);
+			//	Reverse Range
+			if (ii_1 > ii_2 && m_columns[col].isCalculationTypeRange())
+			{
+				if (log.isLoggable(Level.FINE)) log.fine("Swap operands from " + ii_1 + " op " + ii_2);
+				int temp = ii_1;
+				ii_1 = ii_2;
+				ii_2 = temp;
+			}
+
+			//	+
+			if (m_columns[col].isCalculationTypeAdd())
+				sb.append ("COALESCE(Col_").append (ii_1).append(",0)")
+					.append("+")
+					.append ("COALESCE(Col_").append (ii_2).append(",0)");
+			//	-
+			else if (m_columns[col].isCalculationTypeSubtract())
+				sb.append ("COALESCE(Col_").append (ii_1).append(",0)")
+					.append("-")
+					.append ("COALESCE(Col_").append (ii_2).append(",0)");
+			//	/
+			if (m_columns[col].isCalculationTypePercent()) 
+			{
+				String oper2Line = (String) m_columns[col].get_Value("Oper_2_LineName");
+				String oper1col = "Col_" + ii_1;
+				String oper2col = "Col_" + ii_2;
+				if (oper2Line != null)
+				{
+					String oper2 = null;
+					//multiple range or all column value as percentage of a single calculated line value
+					String[] multi = oper2Line.split("[,]");
+					if (multi.length > 1)
+						continue;
+					String colsql = "SELECT a." + oper2col + " FROM T_Report a " +
+							" INNER JOIN PA_ReportLine b ON a.PA_ReportLine_ID = b.PA_ReportLine_ID " +
+							" WHERE a.AD_PInstance_ID = " + getAD_PInstance_ID() +
+							" AND b.Name = ?";
+					BigDecimal value2 = DB.getSQLValueBD(get_TrxName(), colsql, oper2Line);
+					if (value2 != null && value2.signum() != 0)
+						oper2 = value2.toPlainString();
+
+					if (oper2 == null)
+					{
+						sb.append(" NULL ");
+					}
+					else
+					{
+						sb.append("Round(");
+						sb.append("COALESCE(").append(oper1col).append(",0)")
+						  .append("/")
+						  .append(oper2)
+						  .append("*100 ");
+						sb.append(", 2)");
+					}
+				}
+				else
+				{
+					sb.append ("CASE WHEN COALESCE(Col_").append(ii_2)
+						.append(",0)=0 THEN NULL ELSE ")
+						.append("COALESCE(Col_").append (ii_1).append(",0)")
+						.append("/")
+						.append ("Col_").append (ii_2)
+						.append("*100 END");	//	Zero Divide
+				}
+			}
+			//	Range
+			else if (m_columns[col].isCalculationTypeRange())
+			{
+				sb.append ("COALESCE(Col_").append (ii_1).append(",0)");
+				for (int ii = ii_1+1; ii <= ii_2; ii++)
+					sb.append("+COALESCE(Col_").append (ii).append(",0)");
+			}
+			//
+			sb.append(" WHERE AD_PInstance_ID=").append(getAD_PInstance_ID())
+				.append(" AND ABS(LevelNo)<2");			//	0=Line 1=Acct
+			int no = DB.executeUpdate(sb.toString(), get_TrxName());
+			if (no < 1)
+				log.severe ("#=" + no + " for " + m_columns[col] 
+					+ " - " + sb.toString());
+			else
+			{
+				if (log.isLoggable(Level.FINE)) log.fine("Col=" + col + " - " + m_columns[col]);
+				if (log.isLoggable(Level.FINEST)) log.finest (sb.toString ());
+			}
+		} 	//	for all columns
+
+	}	//	doCalculations
+
+	/**
+	 * percentage calculation for column value against calculated line value for multiple range
+	 */
+	private void doColumnPercentageOfLineForMultiRange() {
+		//	for all columns		***********************************************
+		for (int col = 0; col < m_columns.length; col++)
+		{
+			//	Only Calculations
+			if (!m_columns[col].isColumnTypeCalculation ())
+				continue;
+
+			if (!m_columns[col].isCalculationTypePercent())
+				continue;
+
+			//	First Operand
+			int ii_1 = getColumnIndex(m_columns[col].getOper_1_ID());
+			if (ii_1 < 0)
+			{
+				log.log(Level.SEVERE, "Column Index for Operator 1 not found - " + m_columns[col]);
+				continue;
+			}
+			//	Second Operand
+			int ii_2 = getColumnIndex(m_columns[col].getOper_2_ID());
+			if (ii_2 < 0)
+			{
+				log.log(Level.SEVERE, "Column Index for Operator 2 not found - " + m_columns[col]);
+				continue;
+			}
+			log.fine("Column " + col + " = #" + ii_1 + " "
+				+ m_columns[col].getCalculationType() + " #" + ii_2);
+			//	Reverse Range
+			if (ii_1 > ii_2 && m_columns[col].isCalculationTypeRange())
+			{
+				log.fine("Swap operands from " + ii_1 + " op " + ii_2);
+				int temp = ii_1;
+				ii_1 = ii_2;
+				ii_2 = temp;
+			}
+
+			String oper2Line = (String) m_columns[col].get_Value("Oper_2_LineName");
+			String oper1col = "Col_" + ii_1;
+			String oper2col = "Col_" + ii_2;
+			if (oper2Line == null)
+				continue;
+
+			String oper2 = null;
+			String[] multi = oper2Line.split("[,]");
+			if (multi.length < 2)
+				continue;
+
+			boolean lteq = true; //less than or equal to
+			String seqsql = "SELECT b.seqNo FROM T_Report a " +
+			" INNER JOIN PA_ReportLine b ON a.PA_ReportLine_ID = b.PA_ReportLine_ID " +
+			" WHERE a.AD_PInstance_ID = " + getAD_PInstance_ID() +
+			" AND b.Name = ?";
+			int seqNo = -1;
+			try {
+				seqNo = Integer.parseInt(multi[0].trim());
+			} catch (Exception e) {}
+			if (seqNo == -1)
+			{
+				seqNo = DB.getSQLValue(get_TrxName(), seqsql, multi[0].trim());
+			}
+			if (seqNo < 0)
+				continue;
+
+			String countsql = "SELECT count(*) FROM T_Report a " +
+			" INNER JOIN PA_ReportLine b ON a.PA_ReportLine_ID = b.PA_ReportLine_ID " +
+			" WHERE a.AD_PInstance_ID = " + getAD_PInstance_ID() +
+			" AND b.seqNo < ? AND a."+oper1col+" IS NOT NULL " +
+			" AND a."+oper2col+" IS NOT NULL ";
+			int count = DB.getSQLValue(get_TrxName(), countsql, seqNo);
+			if (count == 0)
+				lteq = false;
+
+			List<Integer> seqlist = new ArrayList<Integer>();
+			seqlist.add(seqNo);
+			for(int i = 1; i < multi.length; i++)
+			{
+				seqNo = -1;
+				try {
+					seqNo = Integer.parseInt(multi[i].trim());
+				} catch (Exception e) {}
+				if (seqNo == -1)
+				{
+					seqNo = DB.getSQLValue(get_TrxName(), seqsql, multi[i].trim());
+				}
+				if (seqNo < 0)
+					continue;
+				seqlist.add(seqNo);
+			}
+
+			for (int i = 0; i < seqlist.size(); i++)
+			{
+				int currentSeq = seqlist.get(i);
+				StringBuffer sb = new StringBuffer ("UPDATE T_Report SET ");
+				//	Column to set
+				sb.append ("Col_").append (col).append("=");
+
+				String colsql = "SELECT a." + oper2col + " FROM T_Report a " +
+						" INNER JOIN PA_ReportLine b ON a.PA_ReportLine_ID = b.PA_ReportLine_ID " +
+						" WHERE a.AD_PInstance_ID = " + getAD_PInstance_ID() +
+						" AND b.seqNo = ?";
+				BigDecimal value2 = DB.getSQLValueBD(get_TrxName(), colsql, currentSeq);
+				if (value2 != null && value2.signum() != 0)
+					oper2 = value2.toPlainString();
+
+				if (oper2 == null)
+				{
+					sb.append(" NULL ");
+				}
+				else
+				{
+					sb.append("Round(");
+					sb.append("COALESCE(").append(oper1col).append(",0)")
+					  .append("/")
+					  .append(oper2)
+					  .append("*100 ");
+					sb.append(", 2)");
+				}
+							//
+				sb.append(" WHERE AD_PInstance_ID=").append(getAD_PInstance_ID())
+					.append(" AND ABS(LevelNo)<2");			//	0=Line 1=Acct
+				if (lteq)
+				{
+					sb.append(" AND seqNo <= " + currentSeq);
+					if (i > 0)
+					{
+						int prevSeq = seqlist.get(i - 1);
+						sb.append(" AND seqNo > " + prevSeq);
+					}
+				}
+				else
+				{
+					sb.append(" AND seqNo >= " + currentSeq);
+					if (i+1 < seqlist.size())
+					{
+						int nextSeq = seqlist.get(i+1);
+						sb.append(" AND seqNo < " + nextSeq);
+					}
+				}
+				int no = DB.executeUpdate(sb.toString(), get_TrxName());
+				if (no < 1)
+					log.severe ("#=" + no + " for " + m_columns[col]
+						+ " - " + sb.toString());
+				else
+				{
+					log.fine("Col=" + col + " - " + m_columns[col]);
+					log.finest (sb.toString ());
+				}
+			}
+
+		}
+
+	}
+
+	/**
+	 * 	Get List of PA_ReportLine_ID from .. to
+	 * 	@param fromID from ID
+	 * 	@param toID to ID
+	 * 	@return comma separated list
+	 */
+	private String getLineIDs (int fromID, int toID)
+	{
+		if (log.isLoggable(Level.FINEST)) log.finest("From=" + fromID + " To=" + toID);
+		int firstPA_ReportLine_ID = 0;
+		int lastPA_ReportLine_ID = 0;
+		
+		// find the first and last ID 
+		for (int line = 0; line < m_lines.length; line++)
+		{
+			int PA_ReportLine_ID = m_lines[line].getPA_ReportLine_ID();
+			if (PA_ReportLine_ID == fromID || PA_ReportLine_ID == toID)
+			{
+				if (firstPA_ReportLine_ID == 0) { 
+					firstPA_ReportLine_ID = PA_ReportLine_ID;
+				} else {
+					lastPA_ReportLine_ID = PA_ReportLine_ID;
+					break;
+				}
+			}
+		}
+
+		// add to the list
+		StringBuilder sb = new StringBuilder();
+		sb.append(firstPA_ReportLine_ID);
+		boolean addToList = false;
+		for (int line = 0; line < m_lines.length; line++)
+		{
+			int PA_ReportLine_ID = m_lines[line].getPA_ReportLine_ID();
+			if (log.isLoggable(Level.FINEST)) log.finest("Add=" + addToList 
+				+ " ID=" + PA_ReportLine_ID + " - " + m_lines[line]);
+			if (addToList)
+			{
+				sb.append (",").append (PA_ReportLine_ID);
+				if (PA_ReportLine_ID == lastPA_ReportLine_ID)		//	done
+					break;
+			}
+			else if (PA_ReportLine_ID == firstPA_ReportLine_ID)	//	from already added
+				addToList = true;
+		}
+		return sb.toString();
+	}	//	getLineIDs
+	
+	/**
+	 * 	Get Column Index
+	 * 	@param PA_ReportColumn_ID PA_ReportColumn_ID
+	 * 	@return zero based index or if not found
+	 */
+	private int getColumnIndex (int PA_ReportColumn_ID)
+	{
+		for (int i = 0; i < m_columns.length; i++)
+		{
+			if (m_columns[i].getPA_ReportColumn_ID() == PA_ReportColumn_ID)
+				return i;
+		}
+		return -1;
+	}	//	getColumnIndex
+
+	
+	/**************************************************************************
+	 * 	Get Financial Reporting Period based on reporting Period and offset.
+	 * 	@param relativeOffset offset
+	 * 	@return reporting period
+	 */
+	private FinReportPeriod getPeriod (BigDecimal relativeOffset)
+	{
+		if (relativeOffset == null)
+			return getPeriod(0);
+		return getPeriod(relativeOffset.intValue());
+	}	//	getPeriod
+
+	/**
+	 * 	Get Financial Reporting Period based on reporting Period and offset.
+	 * 	@param relativeOffset offset
+	 * 	@return reporting period
+	 */
+	private FinReportPeriod getPeriod (int relativeOffset)
+	{
+		//	find current reporting period C_Period_ID
+		if (m_reportPeriod < 0)
+		{
+			for (int i = 0; i < m_periods.length; i++)
+			{
+				if (p_C_Period_ID == m_periods[i].getC_Period_ID())
+				{
+					m_reportPeriod = i;
+					break;
+				}
+			}
+		}
+		if (m_reportPeriod < 0 || m_reportPeriod >= m_periods.length)
+			throw new UnsupportedOperationException ("Period index not found - ReportPeriod="
+				+ m_reportPeriod + ", C_Period_ID=" + p_C_Period_ID);
+
+		//	Bounds check
+		int index = m_reportPeriod + relativeOffset;
+		if (index < 0)
+		{
+			log.log(Level.SEVERE, "Relative Offset(" + relativeOffset 
+				+ ") not valid for selected Period(" + m_reportPeriod + ")");
+			index = 0;
+		}
+		else if (index >= m_periods.length)
+		{
+			log.log(Level.SEVERE, "Relative Offset(" + relativeOffset 
+				+ ") not valid for selected Period(" + m_reportPeriod + ")");
+			index = m_periods.length - 1;
+		}
+		//	Get Period
+		return m_periods[index];
+	}	//	getPeriod
+
+	
+	/**************************************************************************
+	 *	Insert Detail Lines if enabled
+	 */
+	private void insertLineDetail()
+	{
+		if (!m_report.isListSources())
+			return;
+		log.info("");
+
+		//	for all source lines
+		for (int line = 0; line < m_lines.length; line++)
+		{
+			//	Line Segment Value (i.e. not calculation)
+			if (m_lines[line].isLineTypeSegmentValue ())
+				insertLineSource (line);
+		}
+
+		//Add the ability to display all child account elements of a summary account even though there is no transaction 
+		//for that child account element in the selected period.
+		boolean listSourceNoTrx = m_report.isListSourcesXTrx();
+		if (!listSourceNoTrx) {
+			//	Clean up empty rows
+			StringBuilder sql = new StringBuilder("DELETE FROM T_Report WHERE ABS(LevelNo)<>0")
+				.append(" AND Col_0 IS NULL AND Col_1 IS NULL AND Col_2 IS NULL AND Col_3 IS NULL AND Col_4 IS NULL AND Col_5 IS NULL AND Col_6 IS NULL AND Col_7 IS NULL AND Col_8 IS NULL AND Col_9 IS NULL")
+				.append(" AND Col_10 IS NULL AND Col_11 IS NULL AND Col_12 IS NULL AND Col_13 IS NULL AND Col_14 IS NULL AND Col_15 IS NULL AND Col_16 IS NULL AND Col_17 IS NULL AND Col_18 IS NULL AND Col_19 IS NULL AND Col_20 IS NULL"); 
+			int no = DB.executeUpdate(sql.toString(), get_TrxName());
+			if (log.isLoggable(Level.FINE)) log.fine("Deleted empty #=" + no);
+		}
+		//
+		
+		//	Set SeqNo
+		StringBuilder sql = new StringBuilder ("UPDATE T_Report r1 "
+			+ "SET SeqNo = (SELECT SeqNo "
+				+ "FROM T_Report r2 "
+				+ "WHERE r1.AD_PInstance_ID=r2.AD_PInstance_ID AND r1.PA_ReportLine_ID=r2.PA_ReportLine_ID"
+				+ " AND r2.Record_ID=0 AND r2.Fact_Acct_ID=0)"
+			+ "WHERE SeqNo IS NULL");
+		int no = DB.executeUpdate(sql.toString(), get_TrxName());
+		if (log.isLoggable(Level.FINE)) log.fine("SeqNo #=" + no);
+
+		if (!m_report.isListTrx())
+			return;
+
+		//	Set Name,Description
+		String sql_select = "SELECT e.Name, fa.Description "
+			+ "FROM Fact_Acct fa"
+			+ " INNER JOIN AD_Table t ON (fa.AD_Table_ID=t.AD_Table_ID)"
+			+ " INNER JOIN AD_Element e ON (t.TableName||'_ID'=e.ColumnName) "
+			+ "WHERE r.Fact_Acct_ID=fa.Fact_Acct_ID";
+		//	Translated Version ...
+		sql = new StringBuilder ("UPDATE T_Report r SET (Name,Description)=(")
+			.append(sql_select).append(") "
+			+ "WHERE Fact_Acct_ID <> 0 AND AD_PInstance_ID=")
+			.append(getAD_PInstance_ID());
+		no = DB.executeUpdate(sql.toString(), get_TrxName());
+		if (log.isLoggable(Level.FINE)) log.fine("Trx Name #=" + no + " - " + sql.toString());
+	}	//	insertLineDetail
+
+	/**
+	 * 	Insert Detail Line per Source.
+	 * 	For all columns (in a line) with relative period access
+	 * 	- AD_PInstance_ID, PA_ReportLine_ID, variable, 0 - Level 1
+	 * 	@param line line
+	 */
+	private void insertLineSource (int line)
+	{
+		if (log.isLoggable(Level.INFO)) log.info("Line=" + line + " - " + m_lines[line]);
+
+		//	No source lines
+		if (m_lines[line] == null || m_lines[line].getSources().length == 0)
+			return;
+		String variable = m_lines[line].getSourceColumnName();
+		if (variable == null || variable.equals("") )
+			return;
+		if (log.isLoggable(Level.FINE)) log.fine("Variable=" + variable);
+
+		//	Insert
+		StringBuffer insert = new StringBuffer("INSERT INTO T_Report "
+			+ "(AD_PInstance_ID, PA_ReportLine_ID, Record_ID,Fact_Acct_ID,LevelNo ");
+		for (int col = 0; col < m_columns.length; col++)
+			insert.append(",Col_").append(col);
+		//	Select
+		insert.append(") SELECT ")
+			.append(getAD_PInstance_ID()).append(",")
+			.append(m_lines[line].getPA_ReportLine_ID()).append(",")
+			.append(variable).append(",0,");
+		
+		boolean listSourceNoTrx = m_report.isListSourcesXTrx() && variable.equalsIgnoreCase(I_C_ValidCombination.COLUMNNAME_Account_ID);
+		//SQL to get the Account Element which no transaction		
+		StringBuffer unionInsert = listSourceNoTrx ? new StringBuffer() : null;
+		if (listSourceNoTrx) {
+			unionInsert.append(" UNION SELECT ")
+			.append(getAD_PInstance_ID()).append(",")
+			.append(m_lines[line].getPA_ReportLine_ID()).append(",")
+			.append(variable).append(",0,");
+		}
+		//
+				
+		if (p_DetailsSourceFirst) {
+			insert.append("-1 ");
+			if (listSourceNoTrx)
+				unionInsert.append("-1 ");
+		} else {
+			insert.append("1 ");
+			if (listSourceNoTrx)
+				unionInsert.append("1 ");
+		}
+
+		//	for all columns create select statement
+		for (int col = 0; col < m_columns.length; col++)
+		{
+			insert.append(", ");
+			if (listSourceNoTrx)
+				unionInsert.append(", Cast(NULL AS NUMBER)");
+			//	No calculation
+			if (m_columns[col].isColumnTypeCalculation())
+			{
+				insert.append("Cast(NULL AS NUMBER)");
+				continue;
+			}
+
+			//	SELECT SUM()
+			StringBuffer select = new StringBuffer ("SELECT ");
+			if (m_lines[line].getPAAmountType() != null)				//	line amount type overwrites column
+				select.append (m_lines[line].getSelectClause (true));
+			else if (m_columns[col].getPAAmountType() != null)
+				select.append (m_columns[col].getSelectClause (true));
+			else
+			{
+				insert.append("Cast(NULL AS NUMBER)");
+				continue;
+			}
+
+			if (p_PA_ReportCube_ID > 0) {
+				select.append(" FROM Fact_Acct_Summary fb WHERE ").append(p_AdjPeriodToExclude).append("DateAcct ");
+			}  //report cube
+			else {
+			//	Get Period info
+				select.append(" FROM Fact_Acct fb WHERE ").append(p_AdjPeriodToExclude).append("TRUNC(DateAcct) ");
+			}
+			FinReportPeriod frp = getPeriod (m_columns[col].getRelativePeriod());
+			if (m_lines[line].getPAPeriodType() != null)			//	line amount type overwrites column
+			{
+				if (m_lines[line].isPeriod())
+					select.append(frp.getPeriodWhere());
+				else if (m_lines[line].isYear())
+					select.append(frp.getYearWhere());
+				else if (m_lines[line].isNatural())
+					select.append(frp.getNaturalWhere("fb"));
+				else
+					select.append(frp.getTotalWhere());
+			}
+			else if (m_columns[col].getPAPeriodType() != null)
+			{
+				if (m_columns[col].isPeriod())
+					select.append(frp.getPeriodWhere());
+				else if (m_columns[col].isYear())
+					select.append(frp.getYearWhere());
+				else if (m_columns[col].isNatural())
+					select.append(frp.getNaturalWhere("fb"));
+				else
+					select.append(frp.getTotalWhere());
+			}
+			//	Link
+			select.append(" AND fb.").append(variable).append("=x.").append(variable);
+			//	PostingType
+			if (!m_lines[line].isPostingType())		//	only if not defined on line
+			{
+				String PostingType = m_columns[col].getPostingType();
+				if (PostingType != null && PostingType.length() > 0)
+					select.append(" AND fb.PostingType='").append(PostingType).append("'");
+				// globalqss - CarlosRuiz
+				if (MReportColumn.POSTINGTYPE_Budget.equals(PostingType)) {
+					if (m_columns[col].getGL_Budget_ID() > 0)
+						select.append(" AND GL_Budget_ID=" + m_columns[col].getGL_Budget_ID());
+				}
+				// end globalqss
+			}
+			//	Report Where
+			String s = m_report.getWhereClause();
+			if (s != null && s.length() > 0)
+				select.append(" AND ").append(s);
+			//	Limited Segment Values
+			if (m_columns[col].isColumnTypeSegmentValue())
+				select.append(m_columns[col].getWhereClause(p_PA_Hierarchy_ID));
+			
+			//	Parameter Where
+			select.append(m_parameterWhere);
+			if (log.isLoggable(Level.FINEST))
+				log.finest("Col=" + col + ", Line=" + line + ": " + select);
+			//
+			insert.append("(").append(select).append(")");
+		}
+		//	WHERE (sources, posting type)
+		StringBuffer where = new StringBuffer(m_lines[line].getWhereClause(p_PA_Hierarchy_ID));
+		
+		StringBuffer unionWhere = listSourceNoTrx ? new StringBuffer() : null;
+		if (listSourceNoTrx && m_lines[line].getSources() != null && m_lines[line].getSources().length > 0){
+			//	Only one
+			if (m_lines[line].getSources().length == 1 
+				&& (m_lines[line].getSources()[0]).getElementType().equalsIgnoreCase(MReportSource.ELEMENTTYPE_Account))
+			{
+				unionWhere.append(m_lines[line].getSources()[0].getWhereClause(p_PA_Hierarchy_ID));
+			}
+			else
+			{
+				//	Multiple
+				StringBuffer sb = new StringBuffer ("(");
+				for (int i = 0; i < m_lines[line].getSources().length; i++)
+				{
+					if ((m_lines[line].getSources()[i]).getElementType().equalsIgnoreCase(MReportSource.ELEMENTTYPE_Account)) {
+						if (i > 0)
+							sb.append (" OR ");
+						sb.append (m_lines[line].getSources()[i].getWhereClause(p_PA_Hierarchy_ID));
+					}
+				}
+				sb.append (")");
+				unionWhere.append(sb.toString ());
+			}
+		}
+		//
+
+		String s = m_report.getWhereClause();
+		if (s != null && s.length() > 0)
+		{
+			if (where.length() > 0)
+				where.append(" AND ");
+			where.append(s);
+
+			if (listSourceNoTrx)
+			{
+				if (unionWhere.length() > 0)
+					unionWhere.append(" AND ");
+				unionWhere.append(s);
+			}
+
+		}
+		if (where.length() > 0)
+			where.append(" AND ");
+		where.append(variable).append(" IS NOT NULL");
+
+		if (p_PA_ReportCube_ID > 0)
+			insert.append(" FROM Fact_Acct_Summary x WHERE ").append(p_AdjPeriodToExclude).append(where);
+		else
+			//	FROM .. WHERE
+			insert.append(" FROM Fact_Acct x WHERE ").append(p_AdjPeriodToExclude).append(where);	
+		//
+		insert.append(m_parameterWhere)
+			.append(" GROUP BY ").append(variable);
+
+		if (listSourceNoTrx) {
+			if (unionWhere.length() > 0)
+				unionWhere.append(" AND ");
+			unionWhere.append(variable).append(" IS NOT NULL");
+			unionWhere.append(" AND Account_ID not in (select Account_ID ");
+			if (p_PA_ReportCube_ID > 0)
+				unionWhere.append(" from Fact_Acct_Summary x WHERE ").append(p_AdjPeriodToExclude).append(where);
+			else
+				unionWhere.append(" from Fact_Acct x WHERE ").append(p_AdjPeriodToExclude).append(where);	
+			//
+			unionWhere.append(m_parameterWhere).append(")");
+	
+			unionInsert.append(" FROM (select c_elementvalue.c_elementvalue_id as Account_ID, c_acctschema_element.C_AcctSchema_ID from c_elementvalue inner join c_acctschema_element on (c_elementvalue.c_element_id = c_acctschema_element.c_element_id)) x WHERE ").append(unionWhere);
+			unionInsert.append(" GROUP BY ").append(variable);
+				
+			insert.append(unionInsert);
+		}
+
+		int no = DB.executeUpdate(insert.toString(), get_TrxName());
+		if (log.isLoggable(Level.FINE)) log.fine("Source #=" + no + " - " + insert);
+		if (no == 0)
+			return;
+
+		//	Set Name,Description
+		StringBuffer sql = new StringBuffer ("UPDATE T_Report SET (Name,Description)=(")
+			.append(m_lines[line].getSourceValueQuery()).append("T_Report.Record_ID) "
+			//
+			+ "WHERE Record_ID <> 0 AND AD_PInstance_ID=").append(getAD_PInstance_ID())
+			.append(" AND PA_ReportLine_ID=").append(m_lines[line].getPA_ReportLine_ID())
+			.append(" AND Fact_Acct_ID=0");
+		no = DB.executeUpdate(sql.toString(), get_TrxName());
+		if (log.isLoggable(Level.FINE)) log.fine("Name #=" + no + " - " + sql.toString());
+
+		if (m_report.isListTrx())
+			insertLineTrx (line, variable);
+	}	//	insertLineSource
+
+	/**
+	 * 	Create Trx Line per Source Detail.
+	 * 	- AD_PInstance_ID, PA_ReportLine_ID, variable, Fact_Acct_ID - Level 2
+	 * 	@param line line
+	 * 	@param variable variable, e.g. Account_ID
+	 */
+	private void insertLineTrx (int line, String variable)
+	{
+		if (log.isLoggable(Level.INFO)) log.info("Line=" + line + " - Variable=" + variable);
+
+		//	Insert
+		StringBuffer insert = new StringBuffer("INSERT INTO T_Report "
+			+ "(AD_PInstance_ID, PA_ReportLine_ID, Record_ID,Fact_Acct_ID,LevelNo ");
+		for (int col = 0; col < m_columns.length; col++)
+			insert.append(",Col_").append(col);
+		//	Select
+		insert.append(") SELECT ")
+			.append(getAD_PInstance_ID()).append(",")
+			.append(m_lines[line].getPA_ReportLine_ID()).append(",")
+			.append(variable).append(",Fact_Acct_ID, ");
+		if (p_DetailsSourceFirst)
+			insert.append("-2 ");
+		else
+			insert.append("2 ");
+
+		//	for all columns create select statement
+		for (int col = 0; col < m_columns.length; col++)
+		{
+			insert.append(", ");
+			//	No calculation
+			if (m_columns[col].isColumnTypeCalculation())
+			{
+				insert.append("Cast(NULL AS NUMBER)");
+				continue;
+			}
+
+			//	SELECT
+			StringBuffer select = new StringBuffer ("SELECT ");
+			if (m_lines[line].getPAAmountType() != null)				//	line amount type overwrites column
+				select.append (m_lines[line].getSelectClause (false));
+			else if (m_columns[col].getPAAmountType() != null)
+				select.append (m_columns[col].getSelectClause (false));
+			else
+			{
+				insert.append("Cast(NULL AS NUMBER)");
+				continue;
+			}
+
+			if (p_PA_ReportCube_ID > 0) {
+				select.append(" FROM Fact_Acct_Summary fb WHERE ").append(p_AdjPeriodToExclude).append("DateAcct ");
+			}  //report cube
+			else {
+			//	Get Period info
+				select.append(" FROM Fact_Acct fb WHERE ").append(p_AdjPeriodToExclude).append("TRUNC(DateAcct) ");
+			}
+			FinReportPeriod frp = getPeriod (m_columns[col].getRelativePeriod());
+			if (m_lines[line].getPAPeriodType() != null)			//	line amount type overwrites column
+			{
+				if (m_lines[line].isPeriod())
+					select.append(frp.getPeriodWhere());
+				else if (m_lines[line].isYear())
+					select.append(frp.getYearWhere());
+				else if (m_lines[line].isNatural())
+					select.append(frp.getNaturalWhere("fb"));
+				else
+					select.append(frp.getTotalWhere());
+			}
+			else if (m_columns[col].getPAPeriodType() != null)
+			{
+				if (m_columns[col].isPeriod())
+					select.append(frp.getPeriodWhere());
+				else if (m_columns[col].isYear())
+					select.append(frp.getYearWhere());
+				else if (m_columns[col].isNatural())
+					select.append(frp.getNaturalWhere("fb"));
+				else
+					select.append(frp.getTotalWhere());
+			}
+			//	Link
+			select.append(" AND fb.Fact_Acct_ID=x.Fact_Acct_ID");
+			//	PostingType
+			if (!m_lines[line].isPostingType())		//	only if not defined on line
+			{
+				String PostingType = m_columns[col].getPostingType();
+				if (PostingType != null && PostingType.length() > 0)
+					select.append(" AND fb.PostingType='").append(PostingType).append("'");
+				// globalqss - CarlosRuiz
+				if (MReportColumn.POSTINGTYPE_Budget.equals(PostingType)) {
+					if (m_columns[col].getGL_Budget_ID() > 0)
+						select.append(" AND GL_Budget_ID=" + m_columns[col].getGL_Budget_ID());
+				}
+				// end globalqss
+			}
+			//	Report Where
+			String s = m_report.getWhereClause();
+			if (s != null && s.length() > 0)
+				select.append(" AND ").append(s);
+			//	Limited Segment Values
+			if (m_columns[col].isColumnTypeSegmentValue())
+				select.append(m_columns[col].getWhereClause(p_PA_Hierarchy_ID));
+			
+			//	Parameter Where
+			select.append(m_parameterWhere);
+			if (log.isLoggable(Level.FINEST))
+				log.finest("Col=" + col + ", Line=" + line + ": " + select);
+			//
+			insert.append("(").append(select).append(")");
+		}
+
+		//
+		insert.append(" FROM Fact_Acct x WHERE ")
+			.append(m_lines[line].getWhereClause(p_PA_Hierarchy_ID));	//	(sources, posting type)
+		//	Report Where
+		String s = m_report.getWhereClause();
+		if (s != null && s.length() > 0)
+			insert.append(" AND ").append(s);
+		
+		// Exclude PA_ReportCube_ID parameter condition, PA_ReportCube_ID column does not exists in Fact_Acct table
+		String whereClause = m_parameterWhere.toString();
+		if (p_PA_ReportCube_ID > 0)
+			whereClause = whereClause.replaceAll(" AND PA_ReportCube_ID=" + p_PA_ReportCube_ID, "");
+		insert.append(whereClause); // IDEMPIERE-130
+
+		int no = DB.executeUpdate(insert.toString(), get_TrxName());
+		if (log.isLoggable(Level.FINEST)) log.finest("Trx #=" + no + " - " + insert);
+		if (no == 0)
+			return;
+	}	//	insertLineTrx
+
+	
+	/**************************************************************************
+	 *	Delete Unprinted Lines
+	 */
+	private void deleteUnprintedLines()
+	{
+		for (int line = 0; line < m_lines.length; line++)
+		{
+			//	Not Printed - Delete in T
+			if (!m_lines[line].isPrinted())
+			{
+				String sql = "DELETE FROM T_Report WHERE AD_PInstance_ID=" + getAD_PInstance_ID()
+					+ " AND PA_ReportLine_ID=" + m_lines[line].getPA_ReportLine_ID();
+				int no = DB.executeUpdate(sql, get_TrxName());
+				if (no > 0)
+					if (log.isLoggable(Level.FINE)) log.fine(m_lines[line].getName() + " - #" + no);
+			}
+		}	//	for all lines
+	}	//	deleteUnprintedLines
+
+
+	private void scaleResults() {
+
+		for (int column = 0; column < m_columns.length; column++)
+		{
+			String factor = m_columns[column].getFactor();
+			if ( factor != null )
+			{
+				int divisor = 1;
+				if ( factor.equals("k") )
+					divisor = 1000;
+				else if (factor.equals("M"))
+					divisor = 1000000;
+				else
+					break;
+				
+				String sql = "UPDATE T_Report SET Col_" + column 
+					+ "=Col_" + column + "/" + divisor
+					+  " WHERE AD_PInstance_ID=" + getAD_PInstance_ID();
+				int no = DB.executeUpdate(sql, get_TrxName());
+				if (no > 0)
+					if (log.isLoggable(Level.FINE)) log.fine(m_columns[column].getName() + " - #" + no);
+			}
+		}
+		
+	}
+	
+	/**************************************************************************
+	 *	Get/Create PrintFormat
+	 * 	@return print format
+	 */
+	private MPrintFormat getPrintFormat()
+	{
+		int AD_PrintFormat_ID = m_report.getAD_PrintFormat_ID();
+		if (log.isLoggable(Level.INFO)) log.info("AD_PrintFormat_ID=" + AD_PrintFormat_ID);
+		MPrintFormat pf = null;
+		boolean createNew = AD_PrintFormat_ID == 0;
+
+		//	Create New
+		if (createNew)
+		{
+			int AD_Table_ID = TABLE_T_REPORT;		//	T_Report
+			pf = MPrintFormat.createFromTable(Env.getCtx(), AD_Table_ID);
+			AD_PrintFormat_ID = pf.getAD_PrintFormat_ID();
+			m_report.setAD_PrintFormat_ID(AD_PrintFormat_ID);
+			m_report.saveEx();
+		}
+		else
+			pf = MPrintFormat.get (getCtx(), AD_PrintFormat_ID, false);	//	use Cache
+
+		//	Print Format Sync
+		if (!m_report.getName().equals(pf.getName())) {
+			pf.setName(m_report.getName());
+			MPrintFormat.setUniqueName(pf.getAD_Client_ID(), pf, pf.getName());
+		}
+		if (m_report.getDescription() == null)
+		{
+			if (pf.getDescription () != null)
+				pf.setDescription (null);
+		}
+		else if (!m_report.getDescription().equals(pf.getDescription()))
+			pf.setDescription(m_report.getDescription());
+		pf.saveEx();
+		if (log.isLoggable(Level.FINE)) log.fine(pf + " - #" + pf.getItemCount());
+
+		//	Print Format Item Sync
+		int count = pf.getItemCount();
+		for (int i = 0; i < count; i++)
+		{
+			MPrintFormatItem pfi = pf.getItem(i);
+			String ColumnName = pfi.getColumnName();
+			//
+			if (ColumnName == null)
+			{
+				log.log(Level.SEVERE, "No ColumnName for #" + i + " - " + pfi);
+				if (pfi.isPrinted())
+					pfi.setIsPrinted(false);
+				if (pfi.isOrderBy())
+					pfi.setIsOrderBy(false);
+				if (pfi.getSortNo() != 0)
+					pfi.setSortNo(0);
+			}
+			else if (ColumnName.startsWith("Col"))
+			{
+				int index = Integer.parseInt(ColumnName.substring(4));
+				if (index < m_columns.length)
+				{
+					pfi.setIsPrinted(m_columns[index].isPrinted());
+					String s = m_columns[index].getName();
+					
+					if (m_columns[index].isColumnTypeRelativePeriod())
+					{
+						BigDecimal relativeOffset = m_columns[index].getRelativePeriod();
+						FinReportPeriod frp = getPeriod (relativeOffset);
+					
+						if ( s.contains("@Period@") )
+							s = s.replace("@Period@", frp.getName() );
+					}
+					
+					if (!pfi.getName().equals(s))
+					{
+						pfi.setName (s);
+						pfi.setPrintName (s);
+					}
+					int seq = 30 + index;
+					if (pfi.getSeqNo() != seq)
+						pfi.setSeqNo(seq);
+					
+					s = m_columns[index].getFormatPattern();
+					pfi.setFormatPattern(s);
+				}
+				else	//	not printed
+				{
+					if (pfi.isPrinted())
+						pfi.setIsPrinted(false);
+				}
+				//	Not Sorted
+				if (pfi.isOrderBy())
+					pfi.setIsOrderBy(false);
+				if (pfi.getSortNo() != 0)
+					pfi.setSortNo(0);
+			}
+			else if (ColumnName.equals("SeqNo"))
+			{
+				if (pfi.isPrinted())
+					pfi.setIsPrinted(false);
+				if (!pfi.isOrderBy())
+					pfi.setIsOrderBy(true);
+				if (pfi.getSortNo() != 10)
+					pfi.setSortNo(10);
+			}
+			else if (ColumnName.equals("LevelNo"))
+			{
+				if (pfi.isPrinted())
+					pfi.setIsPrinted(false);
+				if (!pfi.isOrderBy())
+					pfi.setIsOrderBy(true);
+				if (pfi.getSortNo() != 20)
+					pfi.setSortNo(20);
+			}
+			else if (ColumnName.equals("Name"))
+			{
+				if (pfi.getSeqNo() != 10)
+					pfi.setSeqNo(10);
+				if (!pfi.isPrinted())
+					pfi.setIsPrinted(true);
+				if (!pfi.isOrderBy())
+					pfi.setIsOrderBy(true);
+				if (pfi.getSortNo() != 30)
+					pfi.setSortNo(30);
+			}
+			else if (ColumnName.equals("Description"))
+			{
+				if (pfi.getSeqNo() != 20)
+					pfi.setSeqNo(20);
+				if (!pfi.isPrinted())
+					pfi.setIsPrinted(true);
+				if (pfi.isOrderBy())
+					pfi.setIsOrderBy(false);
+				if (pfi.getSortNo() != 0)
+					pfi.setSortNo(0);
+			}
+			else	//	Not Printed, No Sort
+			{
+				if (pfi.isPrinted())
+					pfi.setIsPrinted(false);
+				if (pfi.isOrderBy())
+					pfi.setIsOrderBy(false);
+				if (pfi.getSortNo() != 0)
+					pfi.setSortNo(0);
+			}
+			pfi.saveEx();
+			if (log.isLoggable(Level.FINE)) log.fine(pfi.toString());
+		}
+		//	set translated to original
+		pf.setTranslation();
+		
+		// Reload to pick up changed pfi
+		pf = MPrintFormat.get (getCtx(), AD_PrintFormat_ID, true);	//	no cache
+		return pf;
+	}	//	getPrintFormat
+
+}	//	FinReport

```

------

### P0639 Core iDempiere: avanzamento versione iDempiere x.y + Eclipse #Patch Data : 2019-03-22

Descrizione : update code for progress core_iDempiere

Classe Java : MOrderLine.java

```
diff -r 647aaf1d98a9 -r 53143fe16a09 idIta.modification.org.adempiere.base/src/org/compiere/model/MOrderLine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MOrderLine.java	gio mar 21 17:04:30 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MOrderLine.java	ven mar 22 17:39:40 2019 +0100
@@ -818,9 +818,9 @@
 			setHeaderInfo(getParent());
 
 		
-		//	R/O Check - Product/Warehouse Change
+		//	R/O Check - Product/Warehouse Change/Attribute set instance
 		if (!newRecord 
-			&& (is_ValueChanged("M_Product_ID") || is_ValueChanged("M_Warehouse_ID"))) 
+			&& (is_ValueChanged("M_Product_ID") || is_ValueChanged("M_Warehouse_ID") || is_ValueChanged("M_AttributeSetInstance_ID"))) 
 		{
 			if (!canChangeWarehouse())
 				return false;
diff -r 647aaf1d98a9 -r 53143fe16a09 idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java	gio mar 21 17:04:30 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java	ven mar 22 17:39:40 2019 +0100
@@ -3,19 +3,19 @@
  * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
  * This program is free software; you can redistribute it and/or modify it    *
  * under the terms version 2 of the GNU General Public License as published   *
- * by the Free Software Foundation. This program is distributed in the hope   *
- * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
- * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
- * See the GNU General Public License for more details.                       *
- * You should have received a copy of the GNU General Public License along    *
- * with this program; if not, write to the Free Software Foundation, Inc.,    *
- * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
- * For the text or an alternative of this public license, you may reach us    *
- * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
- * or via info@compiere.org or http://www.compiere.org/license.html           *
- *****************************************************************************/
-package org.compiere.model;
-
+ * by the Free Software Foundation. This program is distributed in the hope   *
+ * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
+ * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
+ * See the GNU General Public License for more details.                       *
+ * You should have received a copy of the GNU General Public License along    *
+ * with this program; if not, write to the Free Software Foundation, Inc.,    *
+ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
+ * For the text or an alternative of this public license, you may reach us    *
+ * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
+ * or via info@compiere.org or http://www.compiere.org/license.html           *
+ *****************************************************************************/
+package org.compiere.model;
+
 import java.io.InputStream;
 import java.math.BigDecimal;
 import java.net.HttpURLConnection;
@@ -44,13 +44,13 @@
 import org.compiere.util.Ini;
 import org.compiere.util.Trx;
 import org.compiere.util.Util;
-
-/**
- *	Sequence Model.
- *	@see org.compiere.process.SequenceCheck
- *  @author Jorg Janke
- *  @version $Id: MSequence.java,v 1.3 2006/07/30 00:58:04 jjanke Exp $
- */
+
+/**
+ *	Sequence Model.
+ *	@see org.compiere.process.SequenceCheck
+ *  @author Jorg Janke
+ *  @version $Id: MSequence.java,v 1.3 2006/07/30 00:58:04 jjanke Exp $
+ */
 public class MSequence extends X_AD_Sequence
 {
 	/**
@@ -74,20 +74,20 @@
 	}
 
 	/**
-	 *
-	 *	Get next number for Key column = 0 is Error.
-	 *  @param AD_Client_ID client
-	 *  @param TableName table name
-	 * 	@param trxName deprecated (NOT USED!!)
-	 *  @return next no or (-1=not found, -2=error)
+	 *
+	 *	Get next number for Key column = 0 is Error.
+	 *  @param AD_Client_ID client
+	 *  @param TableName table name
+	 * 	@param trxName deprecated (NOT USED!!)
+	 *  @return next no or (-1=not found, -2=error)
 	 *  
 	 *  WARNING!! This method doesn't take into account the native sequence setting, it's just to be called from DB.getNextID()
 	 *  
 	 *  @deprecated please use DB.getNextID (int, String, String)
-	 */
-	public static int getNextID (int AD_Client_ID, String TableName, String trxName)
-	{
-		if (TableName == null || TableName.length() == 0)
+	 */
+	public static int getNextID (int AD_Client_ID, String TableName, String trxName)
+	{
+		if (TableName == null || TableName.length() == 0)
 			throw new IllegalArgumentException("TableName missing");
 
 		int retValue = -1;
@@ -140,9 +140,9 @@
 		for (int i = 0; i < 3; i++)
 		{
 			try
-			{
-				conn = DB.getConnectionID();
-				//	Error
+			{
+				conn = DB.getConnectionID();
+				//	Error
 				if (conn == null)
 					return -1;
 
@@ -154,18 +154,18 @@
 				{
 					pstmt.setQueryTimeout(QUERY_TIME_OUT);
 				}
-				rs = pstmt.executeQuery();
+				rs = pstmt.executeQuery();
 				if (s_log.isLoggable(Level.FINEST)) s_log.finest("AC=" + conn.getAutoCommit() + ", RO=" + conn.isReadOnly()
 					+ " - Isolation=" + conn.getTransactionIsolation() + "(" + Connection.TRANSACTION_READ_COMMITTED
 					+ ") - RSType=" + pstmt.getResultSetType() + "(" + ResultSet.TYPE_SCROLL_SENSITIVE
 					+ "), RSConcur=" + pstmt.getResultSetConcurrency() + "(" + ResultSet.CONCUR_UPDATABLE
 					+ ")");
-				if (rs.next())
+				if (rs.next())
 				{
 
 					// Get the table
 					MTable table = MTable.get(Env.getCtx(), TableName);
-
+
 					int AD_Sequence_ID = rs.getInt(4);
 					boolean gotFromHTTP = false;
 
@@ -248,25 +248,25 @@
 							DB.close(updateSQL);
 							updateSQL = null;
 						}
-					}
+					}
 
-					//if (trx == null)
-					conn.commit();
-				}
-				else
-					s_log.severe ("No record found - " + TableName);
+					//if (trx == null)
+					conn.commit();
+				}
+				else
+					s_log.severe ("No record found - " + TableName);
 
-				//
-				break;		//	EXIT
-			}
-			catch (Exception e)
-			{
-				s_log.log(Level.SEVERE, TableName + " - " + e.getMessage(), e);
+				//
+				break;		//	EXIT
+			}
+			catch (Exception e)
+			{
+				s_log.log(Level.SEVERE, TableName + " - " + e.getMessage(), e);
 				try
 				{
 					if (conn != null)
 						conn.rollback();
-				} catch (SQLException e1) { }
+				} catch (SQLException e1) { }
 			}
 			finally
 			{
@@ -280,15 +280,15 @@
 					} catch (SQLException e) {}
 					conn = null;
 				}
-			}
-			Thread.yield();		//	give it time
-		}
-
-
+			}
+			Thread.yield();		//	give it time
+		}
+
+
 		//if (s_log.isLoggable(Level.FINEST)) s_log.finest (retValue + " - Table=" + TableName + " [" + trx + "]");
-		return retValue;
-	}	//	getNextID
-
+		return retValue;
+	}	//	getNextID
+
 	/**************************************************************************
 	 * 	Get Document No from table
 	 *	@param AD_Client_ID client
@@ -300,17 +300,17 @@
 	{
 		return getDocumentNo(AD_Client_ID, TableName, trxName, null);
 
-	}
-	/**************************************************************************
+	}
+	/**************************************************************************
 	 * 	Get Document No from table (when the document doesn't have a c_doctype)
-	 *	@param AD_Client_ID client
-	 *	@param TableName table name
+	 *	@param AD_Client_ID client
+	 *	@param TableName table name
 	 * 	@param trxName optional Transaction Name
 	 *  @param PO - used to get the date, org and parse context variables
-	 *	@return document no or null
-	 */
-	public static String getDocumentNo (int AD_Client_ID, String TableName, String trxName, PO po)
-	{
+	 *	@return document no or null
+	 */
+	public static String getDocumentNo (int AD_Client_ID, String TableName, String trxName, PO po)
+	{
 		if (TableName == null || TableName.length() == 0)
 			throw new IllegalArgumentException("TableName missing");
 
@@ -774,35 +774,35 @@
 		return getDocumentNo(C_DocType_ID, trxName, definite, null);
 	}
 
-	/**
-	 * 	Get Document No based on Document Type
-	 *	@param C_DocType_ID document type
-	 * 	@param trxName optional Transaction Name
+	/**
+	 * 	Get Document No based on Document Type
+	 *	@param C_DocType_ID document type
+	 * 	@param trxName optional Transaction Name
 	 *  @param definite asking for a definitive or temporary sequence
 	 *  @param po
-	 *	@return document no or null
-	 */
-	public static String getDocumentNo (int C_DocType_ID, String trxName, boolean definite, PO po)
-	{
-		if (C_DocType_ID == 0)
-		{
-			s_log.severe ("C_DocType_ID=0");
-			return null;
+	 *	@return document no or null
+	 */
+	public static String getDocumentNo (int C_DocType_ID, String trxName, boolean definite, PO po)
+	{
+		if (C_DocType_ID == 0)
+		{
+			s_log.severe ("C_DocType_ID=0");
+			return null;
 		}
 
-		MDocType dt = MDocType.get (Env.getCtx(), C_DocType_ID);	//	wrong for SERVER, but r/o
-		if (dt != null && !dt.isDocNoControlled())
-		{
+		MDocType dt = MDocType.get (Env.getCtx(), C_DocType_ID);	//	wrong for SERVER, but r/o
+		if (dt != null && !dt.isDocNoControlled())
+		{
 			if (s_log.isLoggable(Level.FINER)) s_log.finer("DocType_ID=" + C_DocType_ID + " Not DocNo controlled");
-			return null;
+			return null;
 		}
 		if (definite && ! dt.isOverwriteSeqOnComplete()) {
 			s_log.warning("DocType_ID=" + C_DocType_ID + " Not Sequence Overwrite on Complete");
 			return null;
-		}
-		if (dt == null || dt.getDocNoSequence_ID() == 0)
-		{
-			s_log.warning ("No Sequence for DocType - " + dt);
+		}
+		if (dt == null || dt.getDocNoSequence_ID() == 0)
+		{
+			s_log.warning ("No Sequence for DocType - " + dt);
 			return null;
 		}
 		if (definite && dt.getDefiniteSequence_ID() == 0)
@@ -817,82 +817,82 @@
 			s_log.log(LOGLEVEL, "DocType_ID=" + C_DocType_ID + " [" + trxName + "]");
 		
 		return getDocumentNoFromSeq(seq, trxName, po);
-	}	//	getDocumentNo
-
-
-	/**************************************************************************
-	 *	Check/Initialize Client DocumentNo/Value Sequences
-	 *	@param ctx context
-	 *	@param AD_Client_ID client
-	 *	@param trxName transaction
-	 *	@return true if no error
-	 */
-	public static boolean checkClientSequences (Properties ctx, int AD_Client_ID, String trxName)
-	{
-		String sql = "SELECT TableName "
-			+ "FROM AD_Table t "
-			+ "WHERE IsActive='Y' AND IsView='N'"
-			//	Get all Tables with DocumentNo or Value
-			+ " AND AD_Table_ID IN "
-				+ "(SELECT AD_Table_ID FROM AD_Column "
-				+ "WHERE ColumnName = 'DocumentNo' OR ColumnName = 'Value')"
-			//	Ability to run multiple times
-			+ " AND 'DocumentNo_' || TableName NOT IN "
-				+ "(SELECT Name FROM AD_Sequence s "
-				+ "WHERE s.AD_Client_ID=?)";
-		int counter = 0;
-		boolean success = true;
-		//
+	}	//	getDocumentNo
+
+
+	/**************************************************************************
+	 *	Check/Initialize Client DocumentNo/Value Sequences
+	 *	@param ctx context
+	 *	@param AD_Client_ID client
+	 *	@param trxName transaction
+	 *	@return true if no error
+	 */
+	public static boolean checkClientSequences (Properties ctx, int AD_Client_ID, String trxName)
+	{
+		String sql = "SELECT TableName "
+			+ "FROM AD_Table t "
+			+ "WHERE IsActive='Y' AND IsView='N'"
+			//	Get all Tables with DocumentNo or Value
+			+ " AND AD_Table_ID IN "
+				+ "(SELECT AD_Table_ID FROM AD_Column "
+				+ "WHERE ColumnName = 'DocumentNo' OR ColumnName = 'Value')"
+			//	Ability to run multiple times
+			+ " AND 'DocumentNo_' || TableName NOT IN "
+				+ "(SELECT Name FROM AD_Sequence s "
+				+ "WHERE s.AD_Client_ID=?)";
+		int counter = 0;
+		boolean success = true;
+		//
 		PreparedStatement pstmt = null;
-		ResultSet rs = null;
-		try
-		{
-			pstmt = DB.prepareStatement(sql, trxName);
-			pstmt.setInt(1, AD_Client_ID);
-			rs = pstmt.executeQuery();
-			while (rs.next())
-			{
-				String tableName = rs.getString(1);
+		ResultSet rs = null;
+		try
+		{
+			pstmt = DB.prepareStatement(sql, trxName);
+			pstmt.setInt(1, AD_Client_ID);
+			rs = pstmt.executeQuery();
+			while (rs.next())
+			{
+				String tableName = rs.getString(1);
 				if (s_log.isLoggable(Level.FINE)) s_log.fine("Add: " + tableName);
-				MSequence seq = new MSequence (ctx, AD_Client_ID, tableName, trxName);
-				if (seq.save())
-					counter++;
-				else
-				{
-					s_log.severe ("Not created - AD_Client_ID=" + AD_Client_ID
-						+ " - "  + tableName);
-					success = false;
-				}
-			}
-		}
-		catch (Exception e)
-		{
-			s_log.log(Level.SEVERE, sql, e);
-		}
+				MSequence seq = new MSequence (ctx, AD_Client_ID, tableName, trxName);
+				if (seq.save())
+					counter++;
+				else
+				{
+					s_log.severe ("Not created - AD_Client_ID=" + AD_Client_ID
+						+ " - "  + tableName);
+					success = false;
+				}
+			}
+		}
+		catch (Exception e)
+		{
+			s_log.log(Level.SEVERE, sql, e);
+		}
 		finally
 		{
 			DB.close(rs, pstmt);
 			rs = null;
 			pstmt = null;
-		}
+		}
 		if (s_log.isLoggable(Level.INFO)) s_log.info ("AD_Client_ID=" + AD_Client_ID
-			+ " - created #" + counter
-			+ " - success=" + success);
-		return success;
-	}	//	checkClientSequences
-
-
+			+ " - created #" + counter
+			+ " - success=" + success);
+		return success;
+	}	//	checkClientSequences
+
+
 	public static boolean createTableSequence (Properties ctx, String TableName, String trxName) {
 		return createTableSequence (ctx, TableName, trxName, true);
 	}
 
-	/**
-	 * 	Create Table ID Sequence
-	 * 	@param ctx context
-	 * 	@param TableName table name
-	 *	@param trxName transaction
-	 * 	@return true if created
-	 */
+	/**
+	 * 	Create Table ID Sequence
+	 * 	@param ctx context
+	 * 	@param TableName table name
+	 *	@param trxName transaction
+	 * 	@return true if created
+	 */
 	public static boolean createTableSequence (Properties ctx, String TableName, String trxName, boolean tableID)
 	{
 		boolean SYSTEM_NATIVE_SEQUENCE = MSysConfig.getBooleanValue(MSysConfig.SYSTEM_NATIVE_SEQUENCE,false);
@@ -931,10 +931,10 @@
 		}
 		seq.setIsTableID(tableID);
 		seq.saveEx();
-
+
 		return true;
-	}	//	createTableSequence
-
+	}	//	createTableSequence
+
 
 	/**
 	 * 	Get Sequence
@@ -953,217 +953,223 @@
 		return get (ctx, tableName, trxName, true);
 	}
 
-	/**
-	 * 	Get Sequence
-	 *	@param ctx context
+	/**
+	 * 	Get Sequence
+	 *	@param ctx context
 	 *	@param tableName table name
-	 *  @param trxName optional transaction name
+	 *  @param trxName optional transaction name
 	 *  @param tableID
-	 *	@return Sequence
-	 */
+	 *	@return Sequence
+	 */
 	public static MSequence get (Properties ctx, String tableName, String trxName, boolean tableID)
 	{
 		if (! tableID) {
 			tableName = PREFIX_DOCSEQ + tableName;
 		}
-
-		String sql = "SELECT * FROM AD_Sequence "
-			+ "WHERE UPPER(Name)=?"
+
+		String sql = "SELECT * FROM AD_Sequence "
+			+ "WHERE UPPER(Name)=?"
 			+ " AND IsTableID=?";
 		if (! tableID)
 			sql = sql + " AND AD_Client_ID=?";
-		MSequence retValue = null;
+		MSequence retValue = null;
 		PreparedStatement pstmt = null;
-		ResultSet rs = null;
-		try
-		{
-			pstmt = DB.prepareStatement (sql, trxName);
+		ResultSet rs = null;
+		try
+		{
+			pstmt = DB.prepareStatement (sql, trxName);
 			pstmt.setString(1, tableName.toUpperCase());
 			pstmt.setString(2, ( tableID ? "Y" : "N" ) );
 			if (! tableID)
 				pstmt.setInt (3, Env.getAD_Client_ID(Env.getCtx()));
 			rs = pstmt.executeQuery();
-			if (rs.next ())
-				retValue = new MSequence (ctx, rs, trxName);
-			if (rs.next())
-				s_log.log(Level.SEVERE, "More then one sequence for " + tableName);
-		}
-		catch (Exception e)
-		{
-			throw new DBException(e);
-		}
+			if (rs.next ())
+				retValue = new MSequence (ctx, rs, trxName);
+			if (rs.next())
+				s_log.log(Level.SEVERE, "More then one sequence for " + tableName);
+		}
+		catch (Exception e)
+		{
+			throw new DBException(e);
+		}
 		finally
 		{
 			DB.close(rs, pstmt);
 			rs = null;
 			pstmt = null;
-		}
-		return retValue;
-	}	//	get
-
-	/**	Sequence for Table Document No's	*/
-	private static final String	PREFIX_DOCSEQ = "DocumentNo_";
-	/**	Start Number			*/
+		}
+		return retValue;
+	}	//	get
+
+	/**	Sequence for Table Document No's	*/
+	private static final String	PREFIX_DOCSEQ = "DocumentNo_";
+	/**	Start Number			*/
 	public static final int		INIT_NO = 1000000;	//	1M
-	/**	Start System Number		*/
-	// public static final int		INIT_SYS_NO = 100; // start number for Compiere
+	/**	Start System Number		*/
+	// public static final int		INIT_SYS_NO = 100; // start number for Compiere
 	// public static final int		INIT_SYS_NO = 50000;   // start number for Adempiere
 	public static final int		INIT_SYS_NO = 200000;   // start number for iDempiere
-	/** Static Logger			*/
-	private static CLogger 		s_log = CLogger.getCLogger(MSequence.class);
-
-
-	/**************************************************************************
-	 *	Standard Constructor
-	 *	@param ctx context
-	 *	@param AD_Sequence_ID id
-	 *	@param trxName transaction
-	 */
-	public MSequence (Properties ctx, int AD_Sequence_ID, String trxName)
-	{
-		super(ctx, AD_Sequence_ID, trxName);
-		if (AD_Sequence_ID == 0)
-		{
-		//	setName (null);
-			//
-			setIsTableID(false);
-			setStartNo (INIT_NO);
-			setCurrentNext (INIT_NO);
-			setCurrentNextSys (INIT_SYS_NO);
-			setIncrementNo (1);
-			setIsAutoSequence (true);
-			setIsAudited(false);
-			setStartNewYear(false);
-		}
-	}	//	MSequence
-
-	/**
-	 * 	Load Constructor
-	 *	@param ctx context
-	 *	@param rs result set
-	 *	@param trxName transaction
-	 */
-	public MSequence (Properties ctx, ResultSet rs, String trxName)
-	{
-		super(ctx, rs, trxName);
-	}	//	MSequence
-
-	/**
-	 * 	New Document Sequence Constructor
-	 *	@param ctx context
-	 *	@param AD_Client_ID owner
-	 *	@param tableName name
-	 *	@param trxName transaction
-	 */
-	public MSequence (Properties ctx, int AD_Client_ID, String tableName, String trxName)
-	{
-		this (ctx, 0, trxName);
-		setClientOrg(AD_Client_ID, 0);			//	Client Ownership
-		setName(PREFIX_DOCSEQ + tableName);
-		setDescription("DocumentNo/Value for Table " + tableName);
-	}	//	MSequence;
-
-	/**
-	 * 	New Document Sequence Constructor
-	 *	@param ctx context
-	 *	@param AD_Client_ID owner
-	 *	@param sequenceName name
-	 *	@param StartNo start
-	 *	@param trxName trx
-	 */
-	public MSequence (Properties ctx, int AD_Client_ID, String sequenceName, int StartNo, String trxName)
-	{
-		this (ctx, 0, trxName);
-		setClientOrg(AD_Client_ID, 0);			//	Client Ownership
-		setName(sequenceName);
-		setDescription(sequenceName);
-		setStartNo(StartNo);
-		setCurrentNext(StartNo);
-		setCurrentNextSys(StartNo/10);
-	}	//	MSequence;
-
-
-	/**************************************************************************
-	 * 	Get Next No and increase current next
-	 *	@return next no to use
-	 */
-	public int getNextID()
-	{
-		int retValue = getCurrentNext();
+	/** Static Logger			*/
+	private static CLogger 		s_log = CLogger.getCLogger(MSequence.class);
+
+
+	/**************************************************************************
+	 *	Standard Constructor
+	 *	@param ctx context
+	 *	@param AD_Sequence_ID id
+	 *	@param trxName transaction
+	 */
+	public MSequence (Properties ctx, int AD_Sequence_ID, String trxName)
+	{
+		super(ctx, AD_Sequence_ID, trxName);
+		if (AD_Sequence_ID == 0)
+		{
+		//	setName (null);
+			//
+			setIsTableID(false);
+			setStartNo (INIT_NO);
+			setCurrentNext (INIT_NO);
+			setCurrentNextSys (INIT_SYS_NO);
+			setIncrementNo (1);
+			setIsAutoSequence (true);
+			setIsAudited(false);
+			setStartNewYear(false);
+		}
+	}	//	MSequence
+
+	/**
+	 * 	Load Constructor
+	 *	@param ctx context
+	 *	@param rs result set
+	 *	@param trxName transaction
+	 */
+	public MSequence (Properties ctx, ResultSet rs, String trxName)
+	{
+		super(ctx, rs, trxName);
+	}	//	MSequence
+
+	/**
+	 * 	New Document Sequence Constructor
+	 *	@param ctx context
+	 *	@param AD_Client_ID owner
+	 *	@param tableName name
+	 *	@param trxName transaction
+	 */
+	public MSequence (Properties ctx, int AD_Client_ID, String tableName, String trxName)
+	{
+		this (ctx, 0, trxName);
+		setClientOrg(AD_Client_ID, 0);			//	Client Ownership
+		setName(PREFIX_DOCSEQ + tableName);
+		setDescription("DocumentNo/Value for Table " + tableName);
+	}	//	MSequence;
+
+	/**
+	 * 	New Document Sequence Constructor
+	 *	@param ctx context
+	 *	@param AD_Client_ID owner
+	 *	@param sequenceName name
+	 *	@param StartNo start
+	 *	@param trxName trx
+	 */
+	public MSequence (Properties ctx, int AD_Client_ID, String sequenceName, int StartNo, String trxName)
+	{
+		this (ctx, 0, trxName);
+		setClientOrg(AD_Client_ID, 0);			//	Client Ownership
+		setName(sequenceName);
+		setDescription(sequenceName);
+		setStartNo(StartNo);
+		setCurrentNext(StartNo);
+		setCurrentNextSys(StartNo/10);
+	}	//	MSequence;
+
+
+	/**************************************************************************
+	 * 	Get Next No and increase current next
+	 *	@return next no to use
+	 */
+	public int getNextID()
+	{
+		int retValue = getCurrentNext();
 		if (! (MSysConfig.getBooleanValue(MSysConfig.SYSTEM_NATIVE_SEQUENCE,false) && isTableID())) {
 			setCurrentNext(retValue + getIncrementNo());
-		}
-		return retValue;
-	}	//	getNextNo
-
-	/**
-	 * 	Validate Table Sequence Values
-	 *	@return true if updated
-	 */
+		}
+		return retValue;
+	}	//	getNextNo
+
 	public String validateTableIDValue()
-	{
-		if (!isTableID())
+	{
+		return validateTableIDValue(null);
+	}
+
+	/**
+	 * 	Validate Table Sequence Values
+	 *  trxName the Transaction
+	 *	@return true if updated
+	 */
+	public String validateTableIDValue(String trxName)
+	{
+		if (!isTableID())
 			return null;
-		String tableName = getName();
-		int AD_Column_ID = DB.getSQLValue(null, "SELECT MAX(c.AD_Column_ID) "
-			+ "FROM AD_Table t"
-			+ " INNER JOIN AD_Column c ON (t.AD_Table_ID=c.AD_Table_ID) "
-			+ "WHERE t.TableName='" + tableName + "'"
+		String tableName = getName();
+		int AD_Column_ID = DB.getSQLValue(trxName, "SELECT MAX(c.AD_Column_ID) "
+			+ "FROM AD_Table t"
+			+ " INNER JOIN AD_Column c ON (t.AD_Table_ID=c.AD_Table_ID) "
+			+ "WHERE t.TableName='" + tableName + "'"
 			+ " AND t.IsView='N'" // ignore for views -- IDEMPIERE-2513
-			+ " AND c.ColumnName='" + tableName + "_ID'");
-		if (AD_Column_ID <= 0)
+			+ " AND c.ColumnName='" + tableName + "_ID'");
+		if (AD_Column_ID <= 0)
 			return null;
-		//
-		MSystem system = MSystem.get(getCtx());
-		int IDRangeEnd = 0;
-		if (system.getIDRangeEnd() != null)
-			IDRangeEnd = system.getIDRangeEnd().intValue();
+		//
+		MSystem system = MSystem.get(getCtx());
+		int IDRangeEnd = 0;
+		if (system.getIDRangeEnd() != null)
+			IDRangeEnd = system.getIDRangeEnd().intValue();
 
 		String changeMsg = null;
-		String info = null;
-
-		//	Current Next
-		String sql = "SELECT MAX(" + tableName + "_ID) FROM " + tableName;
-		if (IDRangeEnd > 0)
-			sql += " WHERE " + tableName + "_ID < " + IDRangeEnd;
-		int maxTableID = DB.getSQLValue(null, sql);
-		if (maxTableID < INIT_NO)
-			maxTableID = INIT_NO - 1;
+		String info = null;
+
+		//	Current Next
+		String sql = "SELECT MAX(" + tableName + "_ID) FROM " + tableName;
+		if (IDRangeEnd > 0)
+			sql += " WHERE " + tableName + "_ID < " + IDRangeEnd;
+		int maxTableID = DB.getSQLValue(trxName, sql);
+		if (maxTableID < INIT_NO)
+			maxTableID = INIT_NO - 1;
 		maxTableID++;		//	Next
 		
 		int currentNextValue = getCurrentNext();
 		if (currentNextValue < maxTableID)
-		{
-			setCurrentNext(maxTableID);
-			info = "CurrentNext=" + maxTableID;
+		{
+			setCurrentNext(maxTableID);
+			info = "CurrentNext=" + maxTableID;
 			changeMsg = getName() + " ID  " + currentNextValue + " -> " + maxTableID;
-		}
-
-		//	Get Max System_ID used in Table
-		sql = "SELECT MAX(" + tableName + "_ID) FROM " + tableName
-			+ " WHERE " + tableName + "_ID < " + INIT_NO;
-		int maxTableSysID = DB.getSQLValue(null, sql);
-		if (maxTableSysID <= 0)
-			maxTableSysID = INIT_SYS_NO;
+		}
+
+		//	Get Max System_ID used in Table
+		sql = "SELECT MAX(" + tableName + "_ID) FROM " + tableName
+			+ " WHERE " + tableName + "_ID < " + INIT_NO;
+		int maxTableSysID = DB.getSQLValue(trxName, sql);
+		if (maxTableSysID <= 0)
+			maxTableSysID = INIT_SYS_NO;
 		int currentNextSysValue = getCurrentNextSys();
 		if (currentNextSysValue < maxTableSysID){
-			setCurrentNextSys(maxTableSysID);
-			if (info == null)
-				info = "CurrentNextSys=" + maxTableSysID;
-			else
-				info += " - CurrentNextSys=" + maxTableSysID;
+			setCurrentNextSys(maxTableSysID);
+			if (info == null)
+				info = "CurrentNextSys=" + maxTableSysID;
+			else
+				info += " - CurrentNextSys=" + maxTableSysID;
 		
 			if (changeMsg == null) 
 				changeMsg = getName() + " Sys " + currentNextSysValue + " -> " + maxTableSysID;
 			else  
 				changeMsg += " - " +getName() + " Sys " + currentNextSysValue + " -> " + maxTableSysID;	
-		}
-		if (info != null)
+		}
+		if (info != null)
 			if (log.isLoggable(Level.FINE)) log.fine(getName() + " - " + info);
 		
 		return changeMsg;
-	}	//	validate
-
+	}	//	validate
+
 	@Override
 	public int getCurrentNext() {
 		if (MSysConfig.getBooleanValue(MSysConfig.SYSTEM_NATIVE_SEQUENCE,false) && isTableID()){
@@ -1185,9 +1191,9 @@
 			super.setCurrentNext(CurrentNext);			
 		}
 	}
-	/**************************************************************************
-	 *	Test
-	 *	@param args ignored
+	/**************************************************************************
+	 *	Test
+	 *	@param args ignored
 	 */
 	static public void main (String[] args)
 	{
@@ -1198,79 +1204,79 @@
 		CLogMgt.setLevel(Level.SEVERE);
 		CLogMgt.setLoggerLevel(Level.SEVERE, null);
 		s_list = new Vector<Integer>(1000);
-
-		/**	Lock Test **
-		String trxName = "test";
-		System.out.println(DB.getDocumentNo(115, trxName));
-		System.out.println(DB.getDocumentNo(116, trxName));
-		System.out.println(DB.getDocumentNo(117, trxName));
-		System.out.println(DB.getDocumentNo(118, trxName));
-		System.out.println(DB.getDocumentNo(118, trxName));
-		System.out.println(DB.getDocumentNo(117, trxName));
-
-		trxName = "test1";
-		System.out.println(DB.getDocumentNo(115, trxName));	//	hangs here as supposed
-		System.out.println(DB.getDocumentNo(116, trxName));
-		System.out.println(DB.getDocumentNo(117, trxName));
-		System.out.println(DB.getDocumentNo(118, trxName));
-
-
-
-
-
-		/** **/
-
-		/** Time Test	*/
-		long time = System.currentTimeMillis();
-		Thread[] threads = new Thread[10];
-		for (int i = 0; i < 10; i++)
-		{
-			Runnable r = new GetIDs(i);
-			threads[i] = new Thread(r);
-			threads[i].start();
-		}
-		for (int i = 0; i < 10; i++)
-		{
-			try
-			{
-				threads[i].join();
-			}
-			catch (InterruptedException e)
-			{
-			}
-		}
-		time = System.currentTimeMillis() - time;
-
-		System.out.println("-------------------------------------------");
-		System.out.println("Size=" + s_list.size() + " (should be 1000)");
-		Integer[] ia = new Integer[s_list.size()];
-		s_list.toArray(ia);
-		Arrays.sort(ia);
-		Integer last = null;
-		int duplicates = 0;
-		for (int i = 0; i < ia.length; i++)
-		{
-			if (last != null)
-			{
-				if (last.compareTo(ia[i]) == 0)
-				{
-				//	System.out.println(i + ": " + ia[i]);
-					duplicates++;
-				}
-			}
-			last = ia[i];
-		}
-		System.out.println("-------------------------------------------");
-		System.out.println("Size=" + s_list.size() + " (should be 1000)");
-		System.out.println("Duplicates=" + duplicates);
-		System.out.println("Time (ms)=" + time + " - " + ((float)time/s_list.size()) + " each" );
-		System.out.println("-------------------------------------------");
-
-
-
-		/** **
-		try
-		{
+
+		/**	Lock Test **
+		String trxName = "test";
+		System.out.println(DB.getDocumentNo(115, trxName));
+		System.out.println(DB.getDocumentNo(116, trxName));
+		System.out.println(DB.getDocumentNo(117, trxName));
+		System.out.println(DB.getDocumentNo(118, trxName));
+		System.out.println(DB.getDocumentNo(118, trxName));
+		System.out.println(DB.getDocumentNo(117, trxName));
+
+		trxName = "test1";
+		System.out.println(DB.getDocumentNo(115, trxName));	//	hangs here as supposed
+		System.out.println(DB.getDocumentNo(116, trxName));
+		System.out.println(DB.getDocumentNo(117, trxName));
+		System.out.println(DB.getDocumentNo(118, trxName));
+
+
+
+
+
+		/** **/
+
+		/** Time Test	*/
+		long time = System.currentTimeMillis();
+		Thread[] threads = new Thread[10];
+		for (int i = 0; i < 10; i++)
+		{
+			Runnable r = new GetIDs(i);
+			threads[i] = new Thread(r);
+			threads[i].start();
+		}
+		for (int i = 0; i < 10; i++)
+		{
+			try
+			{
+				threads[i].join();
+			}
+			catch (InterruptedException e)
+			{
+			}
+		}
+		time = System.currentTimeMillis() - time;
+
+		System.out.println("-------------------------------------------");
+		System.out.println("Size=" + s_list.size() + " (should be 1000)");
+		Integer[] ia = new Integer[s_list.size()];
+		s_list.toArray(ia);
+		Arrays.sort(ia);
+		Integer last = null;
+		int duplicates = 0;
+		for (int i = 0; i < ia.length; i++)
+		{
+			if (last != null)
+			{
+				if (last.compareTo(ia[i]) == 0)
+				{
+				//	System.out.println(i + ": " + ia[i]);
+					duplicates++;
+				}
+			}
+			last = ia[i];
+		}
+		System.out.println("-------------------------------------------");
+		System.out.println("Size=" + s_list.size() + " (should be 1000)");
+		System.out.println("Duplicates=" + duplicates);
+		System.out.println("Time (ms)=" + time + " - " + ((float)time/s_list.size()) + " each" );
+		System.out.println("-------------------------------------------");
+
+
+
+		/** **
+		try
+		{
 			int retValue = -1;
 			Connection conn = DB.getConnectionRW ();
 		//	DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
@@ -1278,144 +1284,144 @@
 
 			conn.setAutoCommit(false);
 			String sql = "SELECT CurrentNext, CurrentNextSys, IncrementNo "
-				+ "FROM AD_Sequence "
-				+ "WHERE Name='AD_Sequence' ";
-			sql += "FOR UPDATE";
-			//	creates ORA-00907: missing right parenthesis
-		//	sql += "FOR UPDATE OF CurrentNext, CurrentNextSys";
-
-
-			PreparedStatement pstmt = conn.prepareStatement(sql,
-				ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
-			ResultSet rs = pstmt.executeQuery();
-			System.out.println("AC=" + conn.getAutoCommit() + ", RO=" + conn.isReadOnly()
-				+ " - Isolation=" + conn.getTransactionIsolation() + "(" + Connection.TRANSACTION_READ_COMMITTED
-				+ ") - RSType=" + pstmt.getResultSetType() + "(" + ResultSet.TYPE_SCROLL_SENSITIVE
-				+ "), RSConcur=" + pstmt.getResultSetConcurrency() + "(" + ResultSet.CONCUR_UPDATABLE
-				+ ")");
-
-			if (rs.next())
-			{
-				int IncrementNo = rs.getInt(3);
-				retValue = rs.getInt(1);
-				rs.updateInt(1, retValue + IncrementNo);
-				rs.updateRow();
-			}
-			else
-				s_log.severe ("no record found");
-			rs.close();
-			pstmt.close();
-			conn.commit();
-			conn.close();
-			//
-			System.out.println("Next=" + retValue);
-
-		}
-		catch (Exception e)
-		{
-			e.printStackTrace ();
-		}
-
-		System.exit(0);
-
-		/** **
-
-		int AD_Client_ID = 0;
-		int C_DocType_ID = 115;	//	GL
-		String TableName = "C_Invoice";
-		String trxName = "x";
-		Trx trx = Trx.get(trxName, true);
-
-		System.out.println ("none " + getNextID (0, "Test"));
-		System.out.println ("----------------------------------------------");
-		System.out.println ("trx1 " + getNextID (0, "Test"));
-		System.out.println ("trx2 " + getNextID (0, "Test"));
-	//	trx.rollback();
-		System.out.println ("trx3 " + getNextID (0, "Test"));
-	//	trx.commit();
-		System.out.println ("trx4 " + getNextID (0, "Test"));
-	//	trx.rollback();
-	//	trx.close();
-		System.out.println ("----------------------------------------------");
-		System.out.println ("none " + getNextID (0, "Test"));
-		System.out.println ("==============================================");
-
-
-		trx = Trx.get(trxName, true);
-		System.out.println ("none " + getDocumentNo(AD_Client_ID, TableName, null));
-		System.out.println ("----------------------------------------------");
-		System.out.println ("trx1 " + getDocumentNo(AD_Client_ID, TableName, trxName));
-		System.out.println ("trx2 " + getDocumentNo(AD_Client_ID, TableName, trxName));
-		trx.rollback();
-		System.out.println ("trx3 " + getDocumentNo(AD_Client_ID, TableName, trxName));
-		trx.commit();
-		System.out.println ("trx4 " + getDocumentNo(AD_Client_ID, TableName, trxName));
-		trx.rollback();
-		trx.close();
-		System.out.println ("----------------------------------------------");
-		System.out.println ("none " + getDocumentNo(AD_Client_ID, TableName, null));
-		System.out.println ("==============================================");
-
-
-		trx = Trx.get(trxName, true);
-		System.out.println ("none " + getDocumentNo(C_DocType_ID, null));
-		System.out.println ("----------------------------------------------");
-		System.out.println ("trx1 " + getDocumentNo(C_DocType_ID, trxName));
-		System.out.println ("trx2 " + getDocumentNo(C_DocType_ID, trxName));
-		trx.rollback();
-		System.out.println ("trx3 " + getDocumentNo(C_DocType_ID, trxName));
-		trx.commit();
-		System.out.println ("trx4 " + getDocumentNo(C_DocType_ID, trxName));
-		trx.rollback();
-		trx.close();
-		System.out.println ("----------------------------------------------");
-		System.out.println ("none " + getDocumentNo(C_DocType_ID, null));
-		System.out.println ("==============================================");
-		/** **/
-	}	//	main
-
-	/** Test		*/
-	private static Vector<Integer> s_list = null;
-
-	/**
-	 * 	Test Sequence - Get IDs
-	 *
-	 *  @author Jorg Janke
-	 *  @version $Id: MSequence.java,v 1.3 2006/07/30 00:58:04 jjanke Exp $
-	 */
-	public static class GetIDs implements Runnable
-	{
-		/**
-		 * 	Get IDs
-		 *	@param i
-		 */
-		public GetIDs (int i)
-		{
-			m_i = i;
-		}
+				+ "FROM AD_Sequence "
+				+ "WHERE Name='AD_Sequence' ";
+			sql += "FOR UPDATE";
+			//	creates ORA-00907: missing right parenthesis
+		//	sql += "FOR UPDATE OF CurrentNext, CurrentNextSys";
+
+
+			PreparedStatement pstmt = conn.prepareStatement(sql,
+				ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
+			ResultSet rs = pstmt.executeQuery();
+			System.out.println("AC=" + conn.getAutoCommit() + ", RO=" + conn.isReadOnly()
+				+ " - Isolation=" + conn.getTransactionIsolation() + "(" + Connection.TRANSACTION_READ_COMMITTED
+				+ ") - RSType=" + pstmt.getResultSetType() + "(" + ResultSet.TYPE_SCROLL_SENSITIVE
+				+ "), RSConcur=" + pstmt.getResultSetConcurrency() + "(" + ResultSet.CONCUR_UPDATABLE
+				+ ")");
+
+			if (rs.next())
+			{
+				int IncrementNo = rs.getInt(3);
+				retValue = rs.getInt(1);
+				rs.updateInt(1, retValue + IncrementNo);
+				rs.updateRow();
+			}
+			else
+				s_log.severe ("no record found");
+			rs.close();
+			pstmt.close();
+			conn.commit();
+			conn.close();
+			//
+			System.out.println("Next=" + retValue);
+
+		}
+		catch (Exception e)
+		{
+			e.printStackTrace ();
+		}
+
+		System.exit(0);
+
+		/** **
+
+		int AD_Client_ID = 0;
+		int C_DocType_ID = 115;	//	GL
+		String TableName = "C_Invoice";
+		String trxName = "x";
+		Trx trx = Trx.get(trxName, true);
+
+		System.out.println ("none " + getNextID (0, "Test"));
+		System.out.println ("----------------------------------------------");
+		System.out.println ("trx1 " + getNextID (0, "Test"));
+		System.out.println ("trx2 " + getNextID (0, "Test"));
+	//	trx.rollback();
+		System.out.println ("trx3 " + getNextID (0, "Test"));
+	//	trx.commit();
+		System.out.println ("trx4 " + getNextID (0, "Test"));
+	//	trx.rollback();
+	//	trx.close();
+		System.out.println ("----------------------------------------------");
+		System.out.println ("none " + getNextID (0, "Test"));
+		System.out.println ("==============================================");
+
+
+		trx = Trx.get(trxName, true);
+		System.out.println ("none " + getDocumentNo(AD_Client_ID, TableName, null));
+		System.out.println ("----------------------------------------------");
+		System.out.println ("trx1 " + getDocumentNo(AD_Client_ID, TableName, trxName));
+		System.out.println ("trx2 " + getDocumentNo(AD_Client_ID, TableName, trxName));
+		trx.rollback();
+		System.out.println ("trx3 " + getDocumentNo(AD_Client_ID, TableName, trxName));
+		trx.commit();
+		System.out.println ("trx4 " + getDocumentNo(AD_Client_ID, TableName, trxName));
+		trx.rollback();
+		trx.close();
+		System.out.println ("----------------------------------------------");
+		System.out.println ("none " + getDocumentNo(AD_Client_ID, TableName, null));
+		System.out.println ("==============================================");
+
+
+		trx = Trx.get(trxName, true);
+		System.out.println ("none " + getDocumentNo(C_DocType_ID, null));
+		System.out.println ("----------------------------------------------");
+		System.out.println ("trx1 " + getDocumentNo(C_DocType_ID, trxName));
+		System.out.println ("trx2 " + getDocumentNo(C_DocType_ID, trxName));
+		trx.rollback();
+		System.out.println ("trx3 " + getDocumentNo(C_DocType_ID, trxName));
+		trx.commit();
+		System.out.println ("trx4 " + getDocumentNo(C_DocType_ID, trxName));
+		trx.rollback();
+		trx.close();
+		System.out.println ("----------------------------------------------");
+		System.out.println ("none " + getDocumentNo(C_DocType_ID, null));
+		System.out.println ("==============================================");
+		/** **/
+	}	//	main
+
+	/** Test		*/
+	private static Vector<Integer> s_list = null;
+
+	/**
+	 * 	Test Sequence - Get IDs
+	 *
+	 *  @author Jorg Janke
+	 *  @version $Id: MSequence.java,v 1.3 2006/07/30 00:58:04 jjanke Exp $
+	 */
+	public static class GetIDs implements Runnable
+	{
+		/**
+		 * 	Get IDs
+		 *	@param i
+		 */
+		public GetIDs (int i)
+		{
+			m_i = i;
+		}
 		@SuppressWarnings("unused")
-		private int m_i;
-
-		/**
-		 * 	Run
-		 */
-		public void run()
-		{
-			for (int i = 0; i < 100; i++)
-			{
-				try
-				{
-					int no = DB.getNextID(0, "Test", null);
-					s_list.add(Integer.valueOf(no));
-				//	System.out.println("#" + m_i + ": " + no);
-				}
-				catch (Exception e)
-				{
-					System.err.println(e.getMessage());
-				}
-			}
-		}
-	}	//	GetIDs
+		private int m_i;
+
+		/**
+		 * 	Run
+		 */
+		public void run()
+		{
+			for (int i = 0; i < 100; i++)
+			{
+				try
+				{
+					int no = DB.getNextID(0, "Test", null);
+					s_list.add(Integer.valueOf(no));
+				//	System.out.println("#" + m_i + ": " + no);
+				}
+				catch (Exception e)
+				{
+					System.err.println(e.getMessage());
+				}
+			}
+		}
+	}	//	GetIDs
 
 	/**
 	 *	Get next number for Key column
@@ -1437,7 +1443,7 @@
 		return getNextID_HTTP(TableName, website, prm_USER,
 				prm_PASSWORD, prm_TABLE, prm_ALTKEY, prm_COMMENT, prm_PROJECT);
 	}
-
+
 	/**
 	 *	Get next number for Key column
 	 *  @param AD_Client_ID client

```

------

### P1156 Report finanziari financial / CUBE #Patch Data : 2019-03-21

Descrizione : Alert per ricordare di valorizzare le linee_schedulazione scadenze; messaggio
   visualizzato al bottone processo "Valida"

Classe Java : MPaymentTerm.java

```
diff -r 5915af8aaf07 -r 647aaf1d98a9 idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java	gio mar 21 11:56:42 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java	gio mar 21 17:04:30 2019 +0100
@@ -138,8 +138,11 @@
 		getSchedule(true);
 		if (m_schedule.length == 0)
 		{
-			if (! isValid())
-				setIsValid(true);
+			// iDempiereConsulting __ 21/03/2019 -- Termini di pagamento con schedulazione SEMPRE da valorizzare. Alert per client
+//			if (! isValid())
+//				setIsValid(true);   
+			validMsg = " Attenzione: per la fatturazione elettronica è necessario che le linee di schedulazione scadenza siano valorizzati";
+			// iDempiereConsulting __ 21/03/2019 ---- END
 			return validMsg;
 		}
 		// Allow schedules with just one record

```

------

### P1236 fatt elettronica  add org @andreabellotto #Patch Data : 2019-03-13

Descrizione : Modifiche per gestioni messaggi

Classe Java : PromotionRule.java

```
diff -r cf1e88857d7a -r 0f6a01d98500 idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java	ven mar 08 15:53:28 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java	mer mar 13 16:50:54 2019 +0100
@@ -50,6 +50,7 @@
 import org.compiere.model.X_M_ProductPriceVendorBreak;
 import org.compiere.util.DB;
 import org.compiere.util.Env;
+import org.compiere.util.Msg;
 
 /**
  *
@@ -645,7 +646,7 @@
 							nol.setC_Campaign_ID(tmp_line.getC_Campaign_ID());
 						}
 						if (!nol.save())
-							throw new AdempiereException("Failed to add CONAI line to order");
+							throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_order"));
 						
 					}
 				}
@@ -682,7 +683,7 @@
 			priceList = prodPrice2.getPriceList();
 		}
 		else
-			throw new AdempiereException("Failed to add CONAI line to order: No Price for "+product_CONAI.getName());
+			throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_OrderProduct")+product_CONAI.getName()); //LIT_CONAI_OrderProduct
 		
 		//iDempiereConsulting __ 09/10/2018 -- Calcolo o no dell'IVA a livello riga promozione/CONAI
 		if(isVATCalcLine && oLine != null)
@@ -723,7 +724,7 @@
 		}
 		else {
 			if (!nol.save())
-				throw new AdempiereException("Failed to add CONAI line to order");
+				throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_order"));
 			}
 	}
 
@@ -763,7 +764,7 @@
 			nol.setC_Campaign_ID(promotion.getC_Campaign_ID());
 		}
 		if (!nol.save())
-			throw new AdempiereException("Failed to add discount line to order");
+			throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_discount"));
 	}
 
 	/**
diff -r cf1e88857d7a -r 0f6a01d98500 idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRuleInvoice.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRuleInvoice.java	ven mar 08 15:53:28 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRuleInvoice.java	mer mar 13 16:50:54 2019 +0100
@@ -50,6 +50,7 @@
 import org.compiere.model.X_M_ProductPriceVendorBreak;
 import org.compiere.util.DB;
 import org.compiere.util.Env;
+import org.compiere.util.Msg;
 
 /**
  *
@@ -640,7 +641,7 @@
 							nil.setC_Campaign_ID(tmp_line.getC_Campaign_ID());
 						}
 						if (!nil.save())
-							throw new AdempiereException("Failed to add CONAI line to invoice");
+							throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_invoice"));
 					}
 				}
 			}
@@ -677,7 +678,7 @@
 			priceList = prodPrice2.getPriceList();
 		}
 		else
-			throw new AdempiereException("Failed to add CONAI line to invoice: No Price for "+product_CONAI.getName());
+			throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_OrderProduct")+product_CONAI.getName());//LIT_CONAI_OrderProduct
 
 		//iDempiereConsulting __ 09/10/2018 -- Calcolo o no dell'IVA a livello riga promozione/CONAI
 		if(isVATCalcLine && iLine != null)
@@ -718,7 +719,7 @@
 		}
 		else {
 			if (!nil.save())
-				throw new AdempiereException("Failed to add CONAI line to invoice");
+				throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_invoice"));
 		}
 	}
 
@@ -759,7 +760,7 @@
 			nil.setC_Campaign_ID(promotion.getC_Campaign_ID());
 		}
 		if (!nil.save())
-			throw new AdempiereException("Failed to add discount line to invoice");
+			throw new AdempiereException(Msg.getMsg(Env.getCtx(), "LIT_CONAI_discount"));
 	}
 
 	/**

```

------

### P0367 Plugin #IC Resource Attendance - Rilevamento Ore #Patch Data : 2019-02-25

Descrizione : aggiornata classe UpdatePriceMarkup perchè metodo deprecato e quindi utilizzata nuova funzionalità

Classe Java : UpdatePriceMarkup.java

```
diff -r 754d025170c0 -r 0270153565b3 idIta.modification.org.adempiere.base/src/org/adempiere/process/UpdatePriceMarkup.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/process/UpdatePriceMarkup.java	ven feb 22 18:11:59 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/process/UpdatePriceMarkup.java	lun feb 25 09:13:44 2019 +0100
@@ -15,6 +15,7 @@
 
 
 import java.math.BigDecimal;
+import java.math.RoundingMode;
 import java.sql.Timestamp;
 import java.time.LocalDate;
 import java.util.List;
@@ -140,7 +141,7 @@
 									priceList_upd = prodPricePurchase[0].getPriceLimit();
 								
 								calc = priceList_upd.add(priceList_upd.multiply(rateMarkup.divide(Env.ONEHUNDRED)));
-								calc = calc.setScale(2, BigDecimal.ROUND_HALF_UP);
+								calc = calc.setScale(2, RoundingMode.HALF_UP);
 								if(calc.compareTo(prodPriceSale[0].getPriceList())!=0){
 									goToSave = true;
 									prodPriceSale[0].setPriceList(calc);
@@ -160,7 +161,7 @@
 									priceStd_upd = prodPricePurchase[0].getPriceLimit();
 								
 								calc = priceStd_upd.add(priceStd_upd.multiply(rateMarkup.divide(Env.ONEHUNDRED)));
-								calc= calc.setScale(2, BigDecimal.ROUND_HALF_UP);
+								calc = calc.setScale(2, RoundingMode.HALF_UP);
 								
 								if(calc.compareTo(prodPriceSale[0].getPriceStd())!=0){
 									goToSave = true;
@@ -181,7 +182,7 @@
 									priceLimit_upd = prodPricePurchase[0].getPriceLimit();
 								
 								calc = priceLimit_upd.add(priceLimit_upd.multiply(rateMarkup.divide(Env.ONEHUNDRED)));
-								calc= calc.setScale(2, BigDecimal.ROUND_HALF_UP);
+								calc = calc.setScale(2, RoundingMode.HALF_UP);
 								
 								if(calc.compareTo(prodPriceSale[0].getPriceLimit())!=0){
 									goToSave = true;

```

------

### P1133 BS IDempiere implementazione #Patch Data : 2019-02-01

Descrizione : aggiornato UpdatePriceMarkup che causava 2 errori (arrotondamento + array vuoto)

Classe Java : UpdatePriceMarkup.java

```
diff -r 0652d754898d -r c78f9778472a idIta.modification.org.adempiere.base/src/org/adempiere/process/UpdatePriceMarkup.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/process/UpdatePriceMarkup.java	ven feb 01 14:25:24 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/process/UpdatePriceMarkup.java	ven feb 01 17:17:23 2019 +0100
@@ -107,6 +107,8 @@
 							.first();
 					if(priceListPurchase!=null){
 						MProductPrice[] prodPriceSale = priceListSale.getPriceListVersion(new Timestamp(System.currentTimeMillis())).getProductPrice(" AND M_Product_ID="+mProduct.getM_Product_ID());
+						if (prodPriceSale==null || prodPriceSale.length==0) 
+							continue;
 						
 						MProductPrice[] prodPricePurchase = priceListPurchase.getPriceListVersion(new Timestamp(System.currentTimeMillis())).getProductPrice(" AND M_Product_ID="+mProduct.getM_Product_ID());
 //						for (MProductPrice mProdPrice_tmp : prodPricePurchase) {
@@ -137,8 +139,8 @@
 								else if(listPriceFrom.equals(MLITGroupMarkupLine.LIT_LISTPRICEFROM_LimitPOPrice))
 									priceList_upd = prodPricePurchase[0].getPriceLimit();
 								
-								calc = priceList_upd.add(priceList_upd.multiply(rateMarkup.divide(Env.ONEHUNDRED))).setScale(2);
-								
+								calc = priceList_upd.add(priceList_upd.multiply(rateMarkup.divide(Env.ONEHUNDRED)));
+								calc = calc.setScale(2, BigDecimal.ROUND_HALF_UP);
 								if(calc.compareTo(prodPriceSale[0].getPriceList())!=0){
 									goToSave = true;
 									prodPriceSale[0].setPriceList(calc);
@@ -157,7 +159,8 @@
 								else if(stdPriceFrom.equals(MLITGroupMarkupLine.LIT_STANDARDPRICEFROM_LimitPOPrice))
 									priceStd_upd = prodPricePurchase[0].getPriceLimit();
 								
-								calc = priceStd_upd.add(priceStd_upd.multiply(rateMarkup.divide(Env.ONEHUNDRED))).setScale(2);
+								calc = priceStd_upd.add(priceStd_upd.multiply(rateMarkup.divide(Env.ONEHUNDRED)));
+								calc= calc.setScale(2, BigDecimal.ROUND_HALF_UP);
 								
 								if(calc.compareTo(prodPriceSale[0].getPriceStd())!=0){
 									goToSave = true;
@@ -177,7 +180,8 @@
 								else if(limitPriceFrom.equals(MLITGroupMarkupLine.LIT_LIMITPRICEFROM_LimitPOPrice))
 									priceLimit_upd = prodPricePurchase[0].getPriceLimit();
 								
-								calc = priceLimit_upd.add(priceLimit_upd.multiply(rateMarkup.divide(Env.ONEHUNDRED))).setScale(2);
+								calc = priceLimit_upd.add(priceLimit_upd.multiply(rateMarkup.divide(Env.ONEHUNDRED)));
+								calc= calc.setScale(2, BigDecimal.ROUND_HALF_UP);
 								
 								if(calc.compareTo(prodPriceSale[0].getPriceLimit())!=0){
 									goToSave = true;

```

------

### P0639 Core iDempiere: avanzamento versione iDempiere x.y + Eclipse #Patch Data : 2019-02-01

Descrizione : Move to openJDK 11 and Maven for 6.2 . Update POM

Classe Java : nothing

```
diff -r 9ed8b8cbd8e0 -r f07fa57bc623 idIta.modification.org.adempiere.base/.settings/org.eclipse.core.resources.prefs
--- a/idIta.modification.org.adempiere.base/.settings/org.eclipse.core.resources.prefs	ven feb 01 14:59:06 2019 +0100
+++ /dev/null	gio gen 01 00:00:00 1970 +0000
@@ -1,2 +0,0 @@
-eclipse.preferences.version=1
-encoding/<project>=UTF-8
diff -r 9ed8b8cbd8e0 -r f07fa57bc623 idIta.modification.org.adempiere.base/pom.xml
--- a/idIta.modification.org.adempiere.base/pom.xml	ven feb 01 14:59:06 2019 +0100
+++ b/idIta.modification.org.adempiere.base/pom.xml	ven feb 01 15:22:08 2019 +0100
@@ -1,12 +1,50 @@
 <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
+  <groupId>org.idempiere</groupId>
   <artifactId>idIta.modification.org.adempiere.base</artifactId>
   <packaging>eclipse-plugin</packaging>
-  <name>idIta.modification.org.adempiere.base</name>
+  <version>6.2.0-SNAPSHOT</version>
+<!--
   <parent>
-    <groupId>org.idempiere</groupId>
-	<artifactId>org.idempiere.parent</artifactId>
-	<version>6.2.0-SNAPSHOT</version>
-	<relativePath>../../idempiere-italia/org.idempiere.parent/pom.xml</relativePath>
-    </parent>
+		<groupId>org.idempiere</groupId>
+		<artifactId>org.idempiere.parent</artifactId>
+		<version>6.2.0-SNAPSHOT</version>
+		<relativePath>../../idempiere-italia/org.idempiere.parent/pom.xml</relativePath>
+	</parent>
+
+
+  <build>
+    <sourceDirectory>src</sourceDirectory>
+    <plugins>
+      <plugin>
+        <artifactId>maven-compiler-plugin</artifactId>
+        <version>3.8.0</version>
+        <configuration>
+          <release>10</release>
+        </configuration>
+      </plugin>
+    </plugins>
+  </build>
+ -->
+	<repositories>
+		<!-- add Mars repository to resolve dependencies -->
+		<repository>
+			<id>idempiereP2</id>
+			<layout>p2</layout>
+			<url>file:///opt/repos/idempiere-italia/org.idempiere.p2/target/repository/</url>
+		</repository>
+	</repositories>
+
+	<build>
+		<plugins>
+			<plugin>
+				<!-- enable tycho build extension -->
+				<groupId>org.eclipse.tycho</groupId>
+				<artifactId>tycho-maven-plugin</artifactId>
+				<version>1.3.0</version>
+				<extensions>true</extensions>
+			</plugin>
+		</plugins>
+	</build>
+ 
 </project>
\ No newline at end of file

```

------

### P1191 Riapertura "Seleziona Fatture per Pagamento" #Patch Data : 2019-01-31

Descrizione : Move to openJDK 11 and Maven for 6.2

Classe Java : Doc_Invoice.java

```
diff -r cb878010ea77 -r d9f91d94f656 idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	mar gen 29 12:57:08 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	gio gen 31 10:58:43 2019 +0100
@@ -420,16 +420,6 @@
 					serviceAmt = serviceAmt.add(amt);
 				}
 			}
-			//  Set Locations
-			FactLine[] fLines = fact.getLines();
-			for (int i = 0; i < fLines.length; i++)
-			{
-				if (fLines[i] != null)
-				{
-					fLines[i].setLocationFromOrg(fLines[i].getAD_Org_ID(), true);      //  from Loc
-					fLines[i].setLocationFromBPartner(getC_BPartner_Location_ID(), false);  //  to Loc
-				}
-			}
 
 			//  Receivables     DR
 			int receivables_ID = getValidCombination_ID(Doc.ACCTTYPE_C_Receivable, as);
@@ -451,6 +441,17 @@
 			if (serviceAmt.signum() != 0)
 				fact.createLine(null, MAccount.get(getCtx(), receivablesServices_ID),
 					getC_Currency_ID(), serviceAmt, null);
+
+			//  Set Locations
+			FactLine[] fLines = fact.getLines();
+			for (int i = 0; i < fLines.length; i++)
+			{
+				if (fLines[i] != null)
+				{
+					fLines[i].setLocationFromOrg(fLines[i].getAD_Org_ID(), true);      //  from Loc
+					fLines[i].setLocationFromBPartner(getC_BPartner_Location_ID(), false);  //  to Loc
+				}
+			}
 		}
 		//  ARC
 		else if (getDocumentType().equals(DOCTYPE_ARCredit))
@@ -501,16 +502,6 @@
 					serviceAmt = serviceAmt.add(amt);
 				}
 			}
-			//  Set Locations
-			FactLine[] fLines = fact.getLines();
-			for (int i = 0; i < fLines.length; i++)
-			{
-				if (fLines[i] != null)
-				{
-					fLines[i].setLocationFromOrg(fLines[i].getAD_Org_ID(), true);      //  from Loc
-					fLines[i].setLocationFromBPartner(getC_BPartner_Location_ID(), false);  //  to Loc
-				}
-			}
 			//  Receivables             CR
 			int receivables_ID = getValidCombination_ID (Doc.ACCTTYPE_C_Receivable, as);
 			int receivablesServices_ID = getValidCombination_ID (Doc.ACCTTYPE_C_Receivable_Services, as);
@@ -531,6 +522,17 @@
 			if (serviceAmt.signum() != 0)
 				fact.createLine(null, MAccount.get(getCtx(), receivablesServices_ID),
 					getC_Currency_ID(), null, serviceAmt);
+
+			//  Set Locations
+			FactLine[] fLines = fact.getLines();
+			for (int i = 0; i < fLines.length; i++)
+			{
+				if (fLines[i] != null)
+				{
+					fLines[i].setLocationFromOrg(fLines[i].getAD_Org_ID(), true);      //  from Loc
+					fLines[i].setLocationFromBPartner(getC_BPartner_Location_ID(), false);  //  to Loc
+				}
+			}
 		}
 
 		//  ** API
@@ -636,16 +638,6 @@
 							line.getDescription(), getTrxName());
 				}
 			}
-			//  Set Locations
-			FactLine[] fLines = fact.getLines();
-			for (int i = 0; i < fLines.length; i++)
-			{
-				if (fLines[i] != null)
-				{
-					fLines[i].setLocationFromBPartner(getC_BPartner_Location_ID(), true);  //  from Loc
-					fLines[i].setLocationFromOrg(fLines[i].getAD_Org_ID(), false);    //  to Loc
-				}
-			}
 
 			//  Liability               CR
 			int payables_ID = getValidCombination_ID (Doc.ACCTTYPE_V_Liability, as);
@@ -667,6 +659,18 @@
 			if (serviceAmt.signum() != 0)
 				fact.createLine(null, MAccount.get(getCtx(), payablesServices_ID),
 					getC_Currency_ID(), null, serviceAmt);
+
+			//  Set Locations
+			FactLine[] fLines = fact.getLines();
+			for (int i = 0; i < fLines.length; i++)
+			{
+				if (fLines[i] != null)
+				{
+					fLines[i].setLocationFromBPartner(getC_BPartner_Location_ID(), true);  //  from Loc
+					fLines[i].setLocationFromOrg(fLines[i].getAD_Org_ID(), false);    //  to Loc
+				}
+			}
+
 			//
 			updateProductPO(as);	//	Only API
 		}
@@ -741,16 +745,7 @@
 							line.getDescription(), getTrxName());
 				}
 			}
-			//  Set Locations
-			FactLine[] fLines = fact.getLines();
-			for (int i = 0; i < fLines.length; i++)
-			{
-				if (fLines[i] != null)
-				{
-					fLines[i].setLocationFromBPartner(getC_BPartner_Location_ID(), true);  //  from Loc
-					fLines[i].setLocationFromOrg(fLines[i].getAD_Org_ID(), false);    //  to Loc
-				}
-			}
+
 			//  Liability       DR
 			int payables_ID = getValidCombination_ID (Doc.ACCTTYPE_V_Liability, as);
 			int payablesServices_ID = getValidCombination_ID (Doc.ACCTTYPE_V_Liability_Services, as);
@@ -771,6 +766,17 @@
 			if (serviceAmt.signum() != 0)
 				fact.createLine(null, MAccount.get(getCtx(), payablesServices_ID),
 					getC_Currency_ID(), serviceAmt, null);
+
+			//  Set Locations
+			FactLine[] fLines = fact.getLines();
+			for (int i = 0; i < fLines.length; i++)
+			{
+				if (fLines[i] != null)
+				{
+					fLines[i].setLocationFromBPartner(getC_BPartner_Location_ID(), true);  //  from Loc
+					fLines[i].setLocationFromOrg(fLines[i].getAD_Org_ID(), false);    //  to Loc
+				}
+			}
 		}
 		else
 		{
diff -r cb878010ea77 -r d9f91d94f656 idIta.modification.org.adempiere.base/src/org/compiere/model/GridTab.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/GridTab.java	mar gen 29 12:57:08 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/GridTab.java	gio gen 31 10:58:43 2019 +0100
@@ -2888,6 +2888,11 @@
 					}
 	
 					ScriptEngine engine = rule.getScriptEngine();
+					if (engine == null) {
+						retValue = 	"Callout Invalid, engine not found: " + rule.getEngineName();
+						log.log(Level.SEVERE, retValue);
+						return retValue;
+					}
 	
 					// Window context are    W_
 					// Login context  are    G_
@@ -3326,7 +3331,7 @@
 	{
 		return m_vo.AD_Process_UU;
 	}
-	
+
 	public boolean isUpdateWindowContext() 
 	{
 		return m_updateWindowContext ;
diff -r cb878010ea77 -r d9f91d94f656 idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java	mar gen 29 12:57:08 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java	gio gen 31 10:58:43 2019 +0100
@@ -17,6 +17,7 @@
 package org.compiere.model;
 
 import java.math.BigDecimal;
+import java.math.RoundingMode;
 import java.sql.ResultSet;
 import java.util.List;
 import java.util.Properties;
@@ -293,7 +294,7 @@
 		if (M_Locator_ID < 0)
 			throw new IllegalArgumentException ("M_Locator_ID is mandatory.");
 		//	set to 0 explicitly to reset
-		set_Value (COLUMNNAME_M_Locator_ID, new Integer(M_Locator_ID));
+		set_Value (COLUMNNAME_M_Locator_ID, Integer.valueOf(M_Locator_ID));
 	}	//	setM_Locator_ID
 
 	/**
@@ -345,7 +346,7 @@
 		if (QtyEntered != null && getC_UOM_ID() != 0)
 		{
 			int precision = MUOM.getPrecision(getCtx(), getC_UOM_ID());
-			QtyEntered = QtyEntered.setScale(precision, BigDecimal.ROUND_HALF_UP);
+			QtyEntered = QtyEntered.setScale(precision, RoundingMode.HALF_UP);
 		}
 		super.setQtyEntered (QtyEntered);
 	}	//	setQtyEntered
@@ -360,7 +361,7 @@
 		if (MovementQty != null && product != null)
 		{
 			int precision = product.getUOMPrecision();
-			MovementQty = MovementQty.setScale(precision, BigDecimal.ROUND_HALF_UP);
+			MovementQty = MovementQty.setScale(precision, RoundingMode.HALF_UP);
 		}
 		super.setMovementQty(MovementQty);
 	}	//	setMovementQty
diff -r cb878010ea77 -r d9f91d94f656 idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	mar gen 29 12:57:08 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	gio gen 31 10:58:43 2019 +0100
@@ -741,7 +741,19 @@
 	 * 	@param setOrder set order links
 	 *	@return number of lines copied
 	 */
-	public int copyLinesFrom (MInvoice otherInvoice, boolean counter, boolean setOrder)
+	public int copyLinesFrom (MInvoice otherInvoice, boolean counter, boolean setOrder){
+		return copyLinesFrom (otherInvoice, counter, setOrder, true);
+	}
+
+	/**
+	 * 	Copy Lines From other Invoice.
+	 *	@param otherInvoice invoice
+	 * 	@param counter create counter links
+	 * 	@param setOrder set order links
+	 *  @param copyClientOrg copy also Client and Org
+	 *	@return number of lines copied
+	 */
+	public int copyLinesFrom (MInvoice otherInvoice, boolean counter, boolean setOrder, boolean copyClientOrg)
 	{
 		if (isProcessed() || isPosted() || otherInvoice == null)
 			return 0;
@@ -751,7 +763,7 @@
 		{
 			MInvoiceLine line = new MInvoiceLine (getCtx(), 0, get_TrxName());
 			MInvoiceLine fromLine = fromLines[i];
-			if (counter)	//	header
+			if (counter || !copyClientOrg)	//	header
 				PO.copyValues (fromLine, line, getAD_Client_ID(), getAD_Org_ID());
 			else
 				PO.copyValues (fromLine, line, fromLine.getAD_Client_ID(), fromLine.getAD_Org_ID());
@@ -1904,7 +1916,7 @@
 							return DocAction.STATUS_Invalid;
 						}
 						matchPO++;
-						if (!po.isPosted() && po.getM_InOutLine_ID() > 0) // match po don't post if receipt is not assigned, and it doesn't create avg po record
+						if (!po.isPosted())
 							addDocsPostProcess(po);
 						
 						MMatchInv[] matchInvoices = MMatchInv.getInvoiceLine(getCtx(), line.getC_InvoiceLine_ID(), get_TrxName());
diff -r cb878010ea77 -r d9f91d94f656 idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoiceLine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoiceLine.java	mar gen 29 12:57:08 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoiceLine.java	gio gen 31 10:58:43 2019 +0100
@@ -17,6 +17,7 @@
 package org.compiere.model;
 
 import java.math.BigDecimal;
+import java.math.RoundingMode;
 import java.sql.PreparedStatement;
 import java.sql.ResultSet;
 import java.sql.Timestamp;
@@ -192,7 +193,7 @@
 		m_C_BPartner_ID = invoice.getC_BPartner_ID();
 		m_C_BPartner_Location_ID = invoice.getC_BPartner_Location_ID();
 		m_IsSOTrx = invoice.isSOTrx();
-		m_precision = new Integer(invoice.getPrecision());
+		m_precision = Integer.valueOf(invoice.getPrecision());
 	}	//	setOrder
 
 	/**
@@ -355,7 +356,7 @@
 	public void setM_AttributeSetInstance_ID (int M_AttributeSetInstance_ID)
 	{
 		if (M_AttributeSetInstance_ID == 0)		//	 0 is valid ID
-			set_Value("M_AttributeSetInstance_ID", new Integer(0));
+			set_Value("M_AttributeSetInstance_ID", Integer.valueOf(0));
 		else
 			super.setM_AttributeSetInstance_ID (M_AttributeSetInstance_ID);
 	}	//	setM_AttributeSetInstance_ID
@@ -399,7 +400,7 @@
 			setPriceEntered(getPriceActual());
 		else
 			setPriceEntered(getPriceActual().multiply(getQtyInvoiced()
-				.divide(getQtyEntered(), 6, BigDecimal.ROUND_HALF_UP)));	//	precision
+				.divide(getQtyEntered(), 6, RoundingMode.HALF_UP)));	//	precision
 		//
 		if (getC_UOM_ID() == 0)
 			setC_UOM_ID(m_productPricing.getC_UOM_ID());
@@ -488,7 +489,7 @@
 		BigDecimal bd = getPriceActual().multiply(getQtyInvoiced());
 		int precision = getPrecision();
 		if (bd.scale() > precision)
-			bd = bd.setScale(precision, BigDecimal.ROUND_HALF_UP);
+			bd = bd.setScale(precision, RoundingMode.HALF_UP);
 		super.setLineNetAmt (bd);
 	}	//	setLineNetAmt
 	/**
@@ -540,7 +541,7 @@
 		if (QtyEntered != null && getC_UOM_ID() != 0)
 		{
 			int precision = MUOM.getPrecision(getCtx(), getC_UOM_ID());
-			QtyEntered = QtyEntered.setScale(precision, BigDecimal.ROUND_HALF_UP);
+			QtyEntered = QtyEntered.setScale(precision, RoundingMode.HALF_UP);
 		}
 		super.setQtyEntered (QtyEntered);
 	}	//	setQtyEntered
@@ -555,7 +556,7 @@
 		if (QtyInvoiced != null && product != null)
 		{
 			int precision = product.getUOMPrecision();
-			QtyInvoiced = QtyInvoiced.setScale(precision, BigDecimal.ROUND_HALF_UP);
+			QtyInvoiced = QtyInvoiced.setScale(precision, RoundingMode.HALF_UP);
 		}
 		super.setQtyInvoiced(QtyInvoiced);
 	}	//	setQtyInvoiced
@@ -792,7 +793,7 @@
 			log.warning("getPrecision = " + i + " - set to 2");
 			i = 2;
 		}
-		m_precision = new Integer(i);
+		m_precision = Integer.valueOf(i);
 		return m_precision.intValue();
 	}	//	getPrecision
 
diff -r cb878010ea77 -r d9f91d94f656 idIta.modification.org.adempiere.base/src/org/compiere/model/MOrder.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MOrder.java	mar gen 29 12:57:08 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MOrder.java	gio gen 31 10:58:43 2019 +0100
@@ -808,7 +808,7 @@
 			+" WHERE iol.M_InOut_ID=M_InOut.M_InOut_ID"
 			+" AND iol.C_OrderLine_ID=ol.C_OrderLine_ID"
 			+" AND ol.C_Order_ID=?)";
-		List<MInvoice> list = new Query(getCtx(), I_M_InOut.Table_Name, whereClause, get_TrxName())
+		List<MInOut> list = new Query(getCtx(), MInOut.Table_Name, whereClause, get_TrxName())
 									.setParameters(get_ID())
 									.setOrderBy("M_InOut_ID DESC")
 									.list();

```

------

### P0701 Provvigioni + Plugin #IC #Patch Data : 2019-01-10

Descrizione : Move to openJDK 11 and Maven 6.1/6.2

Classe Java : nothing

```
diff -r c8ad95bc8d60 -r 916e55716a81 idIta.modification.org.adempiere.base/META-INF/MANIFEST.MF
--- a/idIta.modification.org.adempiere.base/META-INF/MANIFEST.MF	gio gen 10 17:32:03 2019 +0100
+++ b/idIta.modification.org.adempiere.base/META-INF/MANIFEST.MF	gio gen 10 18:11:22 2019 +0100
@@ -2,6 +2,6 @@
 Bundle-ManifestVersion: 2
 Bundle-Name: idIta.modification.org.adempiere.base
 Bundle-SymbolicName: idIta.modification.org.adempiere.base;singleton:=true
-Bundle-Version: 6.1.0.qualifier
+Bundle-Version: 6.2.0.qualifier
 Fragment-Host: org.adempiere.base;bundle-version="6.1.0"
 Automatic-Module-Name: idIta.modification.org.adempiere.base
diff -r c8ad95bc8d60 -r 916e55716a81 idIta.modification.org.adempiere.base/build.properties
--- a/idIta.modification.org.adempiere.base/build.properties	gio gen 10 17:32:03 2019 +0100
+++ b/idIta.modification.org.adempiere.base/build.properties	gio gen 10 18:11:22 2019 +0100
@@ -1,5 +1,4 @@
 bin.includes = META-INF/,\
-               bin/,\
                idIta.modification.org.adempiere.base.jar,\
                src/
 jars.compile.order = idIta.modification.org.adempiere.base.jar
diff -r c8ad95bc8d60 -r 916e55716a81 idIta.modification.org.adempiere.base/pom.xml
--- a/idIta.modification.org.adempiere.base/pom.xml	gio gen 10 17:32:03 2019 +0100
+++ b/idIta.modification.org.adempiere.base/pom.xml	gio gen 10 18:11:22 2019 +0100
@@ -6,7 +6,7 @@
   <parent>
     <groupId>org.idempiere</groupId>
 	<artifactId>org.idempiere.parent</artifactId>
-	<version>6.1.0-SNAPSHOT</version>
+	<version>6.2.0-SNAPSHOT</version>
 	<relativePath>../../idempiere-italia/org.idempiere.parent/pom.xml</relativePath>
     </parent>
 </project>
\ No newline at end of file

```

------

### P0701 Provvigioni + Plugin #IC #Patch Data : 2019-01-10

Descrizione : Merge from 5.1 

Classe Java : Doc_Invoice.java

```
diff -r e3e19d902c21 -r c8ad95bc8d60 idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	gio gen 10 14:40:11 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	gio gen 10 17:32:03 2019 +0100
@@ -611,7 +611,7 @@
 							taxLine = new MTax(getCtx(), doctax_.getC_Tax_ID(), null);
 							cTaxParentID = taxLine.getParent_Tax_ID();
 							if(line.getC_Tax_ID()==cTaxParentID) {
-								amt = amt.add((doctax_.getAmount().divide(doctax_.getTaxBaseAmt())).multiply(line.getAmtSource())); //OK  update
+								amt = amt.add((doctax_.getAmount().divide(doctax_.getTaxBaseAmt(),12,RoundingMode.HALF_UP)).multiply(line.getAmtSource())); //OK  update
 //								break;
 							} 
 						}
diff -r e3e19d902c21 -r c8ad95bc8d60 idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java	gio gen 10 14:40:11 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java	gio gen 10 17:32:03 2019 +0100
@@ -405,6 +405,10 @@
 		setC_Project_ID(order.getC_Project_ID());
 		setDateOrdered(order.getDateOrdered());
 		setDescription(order.getDescription());
+		//iDempiereConsulting __29/11/2018 --- Copy field "Note"(Nota) - "PrivateNote"(Nota Video)
+		set_ValueNoCheck("Note", order.get_Value("Note"));
+		set_ValueNoCheck("PrivateNote", order.get_Value("PrivateNote"));
+		//iDempiereConsulting __29/11/2018 -------
 		setPOReference(order.getPOReference());
 		setSalesRep_ID(order.getSalesRep_ID());
 		setAD_OrgTrx_ID(order.getAD_OrgTrx_ID());
@@ -465,6 +469,10 @@
 		setC_Project_ID(invoice.getC_Project_ID());
 		setDateOrdered(invoice.getDateOrdered());
 		setDescription(invoice.getDescription());
+		//iDempiereConsulting __29/11/2018 --- Copy field "Note"(Nota) - "PrivateNote"(Nota Video)
+		set_ValueNoCheck("Note", invoice.get_Value("Note"));
+		set_ValueNoCheck("PrivateNote", invoice.get_Value("PrivateNote"));
+		//iDempiereConsulting __29/11/2018 -------
 		setPOReference(invoice.getPOReference());
 		setAD_OrgTrx_ID(invoice.getAD_OrgTrx_ID());
 		setUser1_ID(invoice.getUser1_ID());
@@ -530,6 +538,10 @@
 		setC_Project_ID(original.getC_Project_ID());
 		setDateOrdered(original.getDateOrdered());
 		setDescription(original.getDescription());
+		//iDempiereConsulting __29/11/2018 --- Copy field "Note"(Nota) - "PrivateNote"(Nota Video)
+		set_ValueNoCheck("Note", original.get_Value("Note"));
+		set_ValueNoCheck("PrivateNote", original.get_Value("PrivateNote"));
+		//iDempiereConsulting __29/11/2018 -------
 		setPOReference(original.getPOReference());
 		setSalesRep_ID(original.getSalesRep_ID());
 		setAD_OrgTrx_ID(original.getAD_OrgTrx_ID());
@@ -1690,6 +1702,27 @@
 		MInOut dropShipment = createDropShipment();
 		if (dropShipment != null)
 			info.append(" - @DropShipment@: @M_InOut_ID@=").append(dropShipment.getDocumentNo());
+		
+		//iDempiereConsulting __ 28/11/2018 -- Per gestione eccedenze di quantità 
+		if(isSOTrx()) {
+			MInOutLine[] lines_tmp = getLines(true);
+			MOrderLine line_order = null;
+			for (MInOutLine outLine : lines_tmp) {
+				line_order = new MOrderLine (getCtx(), outLine.getC_OrderLine_ID(), get_TrxName());
+				
+				BigDecimal old = line_order.getQtyOrdered();
+				if (old.compareTo(line_order.getQtyDelivered()) == -1)
+				{
+					line_order.setQtyLostSales(line_order.getQtyOrdered().subtract(line_order.getQtyDelivered()));
+					line_order.setQtyOrdered(line_order.getQtyDelivered());
+					
+					line_order.saveEx(get_TrxName());
+				}
+			}
+		}
+		//iDempiereConsulting __ 28/11/2018 --------
+		
+		
 		//	User Validation
 		String valid = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_AFTER_COMPLETE);
 		if (valid != null)
diff -r e3e19d902c21 -r c8ad95bc8d60 idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java
--- /dev/null	gio gen 01 00:00:00 1970 +0000
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java	gio gen 10 17:32:03 2019 +0100
@@ -0,0 +1,764 @@
+/******************************************************************************
+ * Product: Adempiere ERP & CRM Smart Business Solution                       *
+ * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
+ * This program is free software; you can redistribute it and/or modify it    *
+ * under the terms version 2 of the GNU General Public License as published   *
+ * by the Free Software Foundation. This program is distributed in the hope   *
+ * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
+ * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
+ * See the GNU General Public License for more details.                       *
+ * You should have received a copy of the GNU General Public License along    *
+ * with this program; if not, write to the Free Software Foundation, Inc.,    *
+ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
+ * For the text or an alternative of this public license, you may reach us    *
+ * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
+ * or via info@compiere.org or http://www.compiere.org/license.html           *
+ *****************************************************************************/
+package org.compiere.model;
+
+import java.math.BigDecimal;
+import java.sql.ResultSet;
+import java.util.List;
+import java.util.Properties;
+
+import org.adempiere.exceptions.FillMandatoryException;
+import org.adempiere.exceptions.WarehouseLocatorConflictException;
+import org.compiere.util.DB;
+import org.compiere.util.Env;
+import org.compiere.util.Msg;
+import org.compiere.util.Util;
+
+/**
+ * 	InOut Line
+ *
+ *  @author Jorg Janke
+ *  @version $Id: MInOutLine.java,v 1.5 2006/07/30 00:51:03 jjanke Exp $
+ *
+ *  @author Teo Sarca, www.arhipac.ro
+ *  		<li>BF [ 2784194 ] Check Warehouse-Locator conflict
+ *  			https://sourceforge.net/tracker/?func=detail&aid=2784194&group_id=176962&atid=879332
+ */
+public class MInOutLine extends X_M_InOutLine
+{
+	/**
+	 *
+	 */
+	private static final long serialVersionUID = 8630611882798722864L;
+
+	/**
+	 * 	Get Ship lines Of Order Line
+	 *	@param ctx context
+	 *	@param C_OrderLine_ID line
+	 *	@param where optional addition where clause
+	 *  @param trxName transaction
+	 *	@return array of receipt lines
+	 */
+	public static MInOutLine[] getOfOrderLine (Properties ctx,
+		int C_OrderLine_ID, String where, String trxName)
+	{
+		String whereClause = "C_OrderLine_ID=?" + (!Util.isEmpty(where, true) ? " AND "+where : "");
+		List<MInOutLine> list = new Query(ctx, Table_Name, whereClause, trxName)
+									.setParameters(C_OrderLine_ID)
+									.list();
+		return list.toArray (new MInOutLine[list.size()]);
+	}	//	getOfOrderLine
+
+	/**
+	 * 	Get Ship lines Of RMA Line
+	 *	@param ctx context
+	 *	@param M_RMALine_ID line
+	 *	@param where optional addition where clause
+	 *  @param trxName transaction
+	 *	@return array of receipt lines
+	 */
+	public static MInOutLine[] getOfRMALine (Properties ctx,
+		int M_RMALine_ID, String where, String trxName)
+	{
+		String whereClause = "M_RMALine_ID=? " + (!Util.isEmpty(where, true) ? " AND "+where : "");
+		List<MInOutLine> list = new Query(ctx, Table_Name, whereClause, trxName)
+									.setParameters(M_RMALine_ID)
+									.list();
+		return list.toArray (new MInOutLine[list.size()]);
+	}	//	getOfRMALine
+
+	/**
+	 * 	Get Ship lines Of Order Line
+	 *	@param ctx context
+	 *	@param C_OrderLine_ID line
+	 *  @param trxName transaction
+	 *	@return array of receipt lines2
+	 */
+	public static MInOutLine[] get (Properties ctx, int C_OrderLine_ID, String trxName)
+	{
+		return getOfOrderLine(ctx, C_OrderLine_ID, null, trxName);
+	}	//	get
+
+
+	/**************************************************************************
+	 * 	Standard Constructor
+	 *	@param ctx context
+	 *	@param M_InOutLine_ID id
+	 *	@param trxName trx name
+	 */
+	public MInOutLine (Properties ctx, int M_InOutLine_ID, String trxName)
+	{
+		super (ctx, M_InOutLine_ID, trxName);
+		if (M_InOutLine_ID == 0)
+		{
+		//	setLine (0);
+		//	setM_Locator_ID (0);
+		//	setC_UOM_ID (0);
+		//	setM_Product_ID (0);
+			setM_AttributeSetInstance_ID(0);
+		//	setMovementQty (Env.ZERO);
+			setConfirmedQty(Env.ZERO);
+			setPickedQty(Env.ZERO);
+			setScrappedQty(Env.ZERO);
+			setTargetQty(Env.ZERO);
+			setIsInvoiced (false);
+			setIsDescription (false);
+		}
+	}	//	MInOutLine
+
+	/**
+	 *  Load Constructor
+	 *  @param ctx context
+	 *  @param rs result set record
+	 *  @param trxName transaction
+	 */
+	public MInOutLine (Properties ctx, ResultSet rs, String trxName)
+	{
+		super(ctx, rs, trxName);
+	}	//	MInOutLine
+
+	/**
+	 *  Parent Constructor
+	 *  @param inout parent
+	 */
+	public MInOutLine (MInOut inout)
+	{
+		this (inout.getCtx(), 0, inout.get_TrxName());
+		setClientOrg (inout);
+		setM_InOut_ID (inout.getM_InOut_ID());
+		setM_Warehouse_ID (inout.getM_Warehouse_ID());
+		setC_Project_ID(inout.getC_Project_ID());
+		m_parent = inout;
+	}	//	MInOutLine
+
+	/**	Product					*/
+	private MProduct 		m_product = null;
+	/** Warehouse				*/
+	private int				m_M_Warehouse_ID = 0;
+	/** Parent					*/
+	private MInOut			m_parent = null;
+
+	/**
+	 * 	Get Parent
+	 *	@return parent
+	 */
+	public MInOut getParent()
+	{
+		if (m_parent == null)
+			m_parent = new MInOut (getCtx(), getM_InOut_ID(), get_TrxName());
+		return m_parent;
+	}	//	getParent
+
+	/**
+	 * 	Set Order Line.
+	 * 	Does not set Quantity!
+	 *	@param oLine order line
+	 *	@param M_Locator_ID locator
+	 * 	@param Qty used only to find suitable locator
+	 */
+	public void setOrderLine (MOrderLine oLine, int M_Locator_ID, BigDecimal Qty)
+	{
+		setC_OrderLine_ID(oLine.getC_OrderLine_ID());
+		setLine(oLine.getLine());
+		setC_UOM_ID(oLine.getC_UOM_ID());
+		MProduct product = oLine.getProduct();
+		if (product == null)
+		{
+			set_ValueNoCheck("M_Product_ID", null);
+			set_ValueNoCheck("M_AttributeSetInstance_ID", null);
+			set_ValueNoCheck("M_Locator_ID", null);
+		}
+		else
+		{
+			setM_Product_ID(oLine.getM_Product_ID());
+			setM_AttributeSetInstance_ID(oLine.getM_AttributeSetInstance_ID());
+			//
+			if (product.isItem())
+			{
+				if (M_Locator_ID == 0)
+					setM_Locator_ID(Qty);	//	requires warehouse, product, asi
+				else
+					setM_Locator_ID(M_Locator_ID);
+			}
+			else
+				set_ValueNoCheck("M_Locator_ID", null);
+			
+			//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+			set_ValueNoCheck("Name", oLine.get_Value("Name"));
+			set_ValueNoCheck("Description", oLine.get_Value("Description"));
+			set_ValueNoCheck("Help", oLine.get_Value("Help"));
+			//---
+		}
+		setC_Charge_ID(oLine.getC_Charge_ID());
+		setDescription(oLine.getDescription());
+		setIsDescription(oLine.isDescription());
+		//
+		setC_Project_ID(oLine.getC_Project_ID());
+		setC_ProjectPhase_ID(oLine.getC_ProjectPhase_ID());
+		setC_ProjectTask_ID(oLine.getC_ProjectTask_ID());
+		setC_Activity_ID(oLine.getC_Activity_ID());
+		setC_Campaign_ID(oLine.getC_Campaign_ID());
+		setAD_OrgTrx_ID(oLine.getAD_OrgTrx_ID());
+		setUser1_ID(oLine.getUser1_ID());
+		setUser2_ID(oLine.getUser2_ID());
+	}	//	setOrderLine
+
+	/**
+	 * 	Set Invoice Line.
+	 * 	Does not set Quantity!
+	 *	@param iLine invoice line
+	 *	@param M_Locator_ID locator
+	 *	@param Qty qty only fo find suitable locator
+	 */
+	public void setInvoiceLine (MInvoiceLine iLine, int M_Locator_ID, BigDecimal Qty)
+	{
+		setC_OrderLine_ID(iLine.getC_OrderLine_ID());
+		setLine(iLine.getLine());
+		setC_UOM_ID(iLine.getC_UOM_ID());
+		int M_Product_ID = iLine.getM_Product_ID();
+		if (M_Product_ID == 0)
+		{
+			set_ValueNoCheck("M_Product_ID", null);
+			set_ValueNoCheck("M_Locator_ID", null);
+			set_ValueNoCheck("M_AttributeSetInstance_ID", null);
+		}
+		else
+		{
+			setM_Product_ID(M_Product_ID);
+			setM_AttributeSetInstance_ID(iLine.getM_AttributeSetInstance_ID());
+			if (M_Locator_ID == 0)
+				setM_Locator_ID(Qty);	//	requires warehouse, product, asi
+			else
+				setM_Locator_ID(M_Locator_ID);
+			
+			//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+			setOtherDataProduct(M_Product_ID);
+			//----
+		}
+		setC_Charge_ID(iLine.getC_Charge_ID());
+		setDescription(iLine.getDescription());
+		setIsDescription(iLine.isDescription());
+		//
+		setC_Project_ID(iLine.getC_Project_ID());
+		setC_ProjectPhase_ID(iLine.getC_ProjectPhase_ID());
+		setC_ProjectTask_ID(iLine.getC_ProjectTask_ID());
+		setC_Activity_ID(iLine.getC_Activity_ID());
+		setC_Campaign_ID(iLine.getC_Campaign_ID());
+		setAD_OrgTrx_ID(iLine.getAD_OrgTrx_ID());
+		setUser1_ID(iLine.getUser1_ID());
+		setUser2_ID(iLine.getUser2_ID());
+	}	//	setInvoiceLine
+
+	/**
+	 * 	Get Warehouse
+	 *	@return Returns the m_Warehouse_ID.
+	 */
+	public int getM_Warehouse_ID()
+	{
+		if (m_M_Warehouse_ID == 0)
+			m_M_Warehouse_ID = getParent().getM_Warehouse_ID();
+		return m_M_Warehouse_ID;
+	}	//	getM_Warehouse_ID
+
+	/**
+	 * 	Set Warehouse
+	 *	@param warehouse_ID The m_Warehouse_ID to set.
+	 */
+	public void setM_Warehouse_ID (int warehouse_ID)
+	{
+		m_M_Warehouse_ID = warehouse_ID;
+	}	//	setM_Warehouse_ID
+
+	/**
+	 * 	Set M_Locator_ID
+	 *	@param M_Locator_ID id
+	 */
+	@Override
+	public void setM_Locator_ID (int M_Locator_ID)
+	{
+		if (M_Locator_ID < 0)
+			throw new IllegalArgumentException ("M_Locator_ID is mandatory.");
+		//	set to 0 explicitly to reset
+		set_Value (COLUMNNAME_M_Locator_ID, new Integer(M_Locator_ID));
+	}	//	setM_Locator_ID
+
+	/**
+	 * 	Set (default) Locator based on qty.
+	 * 	@param Qty quantity
+	 * 	Assumes Warehouse is set
+	 */
+	public void setM_Locator_ID(BigDecimal Qty)
+	{
+		//	Locator established
+		if (getM_Locator_ID() != 0)
+			return;
+		//	No Product
+		if (getM_Product_ID() == 0)
+		{
+			set_ValueNoCheck(COLUMNNAME_M_Locator_ID, null);
+			return;
+		}
+
+		//	Get existing Location
+		int M_Locator_ID = MStorageOnHand.getM_Locator_ID (getM_Warehouse_ID(),
+				getM_Product_ID(), getM_AttributeSetInstance_ID(),
+				Qty, get_TrxName());
+		//	Get default Location
+		if (M_Locator_ID == 0)
+		{
+			MWarehouse wh = MWarehouse.get(getCtx(), getM_Warehouse_ID());
+			M_Locator_ID = wh.getDefaultLocator().getM_Locator_ID();
+		}
+		setM_Locator_ID(M_Locator_ID);
+	}	//	setM_Locator_ID
+
+	/**
+	 * 	Set Movement/Movement Qty
+	 *	@param Qty Entered/Movement Qty
+	 */
+	public void setQty (BigDecimal Qty)
+	{
+		setQtyEntered(Qty);
+		setMovementQty(getQtyEntered());
+	}	//	setQtyInvoiced
+
+	/**
+	 * 	Set Qty Entered - enforce entered UOM
+	 *	@param QtyEntered
+	 */
+	public void setQtyEntered (BigDecimal QtyEntered)
+	{
+		if (QtyEntered != null && getC_UOM_ID() != 0)
+		{
+			int precision = MUOM.getPrecision(getCtx(), getC_UOM_ID());
+			QtyEntered = QtyEntered.setScale(precision, BigDecimal.ROUND_HALF_UP);
+		}
+		super.setQtyEntered (QtyEntered);
+	}	//	setQtyEntered
+
+	/**
+	 * 	Set Movement Qty - enforce Product UOM
+	 *	@param MovementQty
+	 */
+	public void setMovementQty (BigDecimal MovementQty)
+	{
+		MProduct product = getProduct();
+		if (MovementQty != null && product != null)
+		{
+			int precision = product.getUOMPrecision();
+			MovementQty = MovementQty.setScale(precision, BigDecimal.ROUND_HALF_UP);
+		}
+		super.setMovementQty(MovementQty);
+	}	//	setMovementQty
+
+	/**
+	 * 	Get Product
+	 *	@return product or null
+	 */
+	public MProduct getProduct()
+	{
+		if (m_product == null && getM_Product_ID() != 0)
+			m_product = MProduct.get (getCtx(), getM_Product_ID());
+		return m_product;
+	}	//	getProduct
+
+	/**
+	 * 	Set Product
+	 *	@param product product
+	 */
+	public void setProduct (MProduct product)
+	{
+		m_product = product;
+		if (m_product != null)
+		{
+			setM_Product_ID(m_product.getM_Product_ID());
+			setC_UOM_ID (m_product.getC_UOM_ID());
+			
+			//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+			setOtherDataProduct(m_product.getM_Product_ID());
+			//---
+		}
+		else
+		{
+			setM_Product_ID(0);
+			setC_UOM_ID (0);
+		}
+		setM_AttributeSetInstance_ID(0);
+	}	//	setProduct
+
+	/**
+	 * 	Set M_Product_ID
+	 *	@param M_Product_ID product
+	 *	@param setUOM also set UOM from product
+	 */
+	public void setM_Product_ID (int M_Product_ID, boolean setUOM)
+	{
+		if (setUOM)
+			setProduct(MProduct.get(getCtx(), M_Product_ID));
+		//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+		//else
+		else {
+			super.setM_Product_ID (M_Product_ID);
+			setOtherDataProduct(M_Product_ID);
+		}
+		//iDempiereConsulting __29/11/2018 -------
+		setM_AttributeSetInstance_ID(0);
+	}	//	setM_Product_ID
+
+	/**
+	 * 	Set Product and UOM
+	 *	@param M_Product_ID product
+	 *	@param C_UOM_ID uom
+	 */
+	public void setM_Product_ID (int M_Product_ID, int C_UOM_ID)
+	{
+		if (M_Product_ID != 0)
+			super.setM_Product_ID (M_Product_ID);
+		super.setC_UOM_ID(C_UOM_ID);
+		setM_AttributeSetInstance_ID(0);
+		m_product = null;
+		
+		//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+		setOtherDataProduct(getM_Product_ID());
+		//---
+	}	//	setM_Product_ID
+
+	/**
+	 * 	Add to Description
+	 *	@param description text
+	 */
+	public void addDescription (String description)
+	{
+		String desc = getDescription();
+		if (desc == null)
+			setDescription(description);
+		else{
+			StringBuilder msgd = new StringBuilder(desc).append(" | ").append(description);
+			setDescription(msgd.toString());
+		}	
+	}	//	addDescription
+
+	/**
+	 * 	Get C_Project_ID
+	 *	@return project
+	 */
+	public int getC_Project_ID()
+	{
+		int ii = super.getC_Project_ID ();
+		if (ii == 0)
+			ii = getParent().getC_Project_ID();
+		return ii;
+	}	//	getC_Project_ID
+
+	/**
+	 * 	Get C_Activity_ID
+	 *	@return Activity
+	 */
+	public int getC_Activity_ID()
+	{
+		int ii = super.getC_Activity_ID ();
+		if (ii == 0)
+			ii = getParent().getC_Activity_ID();
+		return ii;
+	}	//	getC_Activity_ID
+
+	/**
+	 * 	Get C_Campaign_ID
+	 *	@return Campaign
+	 */
+	public int getC_Campaign_ID()
+	{
+		int ii = super.getC_Campaign_ID ();
+		if (ii == 0)
+			ii = getParent().getC_Campaign_ID();
+		return ii;
+	}	//	getC_Campaign_ID
+
+	/**
+	 * 	Get User2_ID
+	 *	@return User2
+	 */
+	public int getUser1_ID ()
+	{
+		int ii = super.getUser1_ID ();
+		if (ii == 0)
+			ii = getParent().getUser1_ID();
+		return ii;
+	}	//	getUser1_ID
+
+	/**
+	 * 	Get User2_ID
+	 *	@return User2
+	 */
+	public int getUser2_ID ()
+	{
+		int ii = super.getUser2_ID ();
+		if (ii == 0)
+			ii = getParent().getUser2_ID();
+		return ii;
+	}	//	getUser2_ID
+
+	/**
+	 * 	Get AD_OrgTrx_ID
+	 *	@return trx org
+	 */
+	public int getAD_OrgTrx_ID()
+	{
+		int ii = super.getAD_OrgTrx_ID();
+		if (ii == 0)
+			ii = getParent().getAD_OrgTrx_ID();
+		return ii;
+	}	//	getAD_OrgTrx_ID
+
+	/**************************************************************************
+	 * 	Before Save
+	 *	@param newRecord new
+	 *	@return save
+	 */
+	protected boolean beforeSave (boolean newRecord)
+	{
+		log.fine("");
+		if (newRecord && getParent().isComplete()) {
+			log.saveError("ParentComplete", Msg.translate(getCtx(), "M_InOutLine"));
+			return false;
+		}
+		// Locator is mandatory if no charge is defined - teo_sarca BF [ 2757978 ]
+		if(getProduct() != null && MProduct.PRODUCTTYPE_Item.equals(getProduct().getProductType()))
+		{
+			if (getM_Locator_ID() <= 0 && getC_Charge_ID() <= 0)
+			{
+				throw new FillMandatoryException(COLUMNNAME_M_Locator_ID);
+			}
+		}
+
+		//	Get Line No
+		if (getLine() == 0)
+		{
+			String sql = "SELECT COALESCE(MAX(Line),0)+10 FROM M_InOutLine WHERE M_InOut_ID=?";
+			int ii = DB.getSQLValueEx (get_TrxName(), sql, getM_InOut_ID());
+			setLine (ii);
+		}
+		//	UOM
+		if (getC_UOM_ID() == 0)
+			setC_UOM_ID (Env.getContextAsInt(getCtx(), "#C_UOM_ID"));
+		if (getC_UOM_ID() == 0)
+		{
+			int C_UOM_ID = MUOM.getDefault_UOM_ID(getCtx());
+			if (C_UOM_ID > 0)
+				setC_UOM_ID (C_UOM_ID);
+		}
+		//	Qty Precision
+		if (newRecord || is_ValueChanged("QtyEntered"))
+			setQtyEntered(getQtyEntered());
+		if (newRecord || is_ValueChanged("MovementQty"))
+			setMovementQty(getMovementQty());
+
+		//	Order/RMA Line
+		if (getC_OrderLine_ID() == 0 && getM_RMALine_ID() == 0)
+		{
+			if (getParent().isSOTrx())
+			{
+				log.saveError("FillMandatory", Msg.translate(getCtx(), "C_Order_ID"));
+				return false;
+			}
+		}
+
+		// Validate Locator/Warehouse - teo_sarca, BF [ 2784194 ]
+		if (getM_Locator_ID() > 0)
+		{
+			MLocator locator = MLocator.get(getCtx(), getM_Locator_ID());
+			if (getM_Warehouse_ID() != locator.getM_Warehouse_ID())
+			{
+				throw new WarehouseLocatorConflictException(
+						MWarehouse.get(getCtx(), getM_Warehouse_ID()),
+						locator,
+						getLine());
+			}
+
+	        // IDEMPIERE-2668
+			if (MInOut.MOVEMENTTYPE_CustomerShipment.equals(getParent().getMovementType())) {
+	        	if (locator.getM_LocatorType_ID() > 0) {
+	        		MLocatorType lt = MLocatorType.get(getCtx(), locator.getM_LocatorType_ID());
+	        		if (! lt.isAvailableForShipping()) {
+	    				log.saveError("Error", Msg.translate(getCtx(), "LocatorNotAvailableForShipping"));
+	    				return false;
+	        		}
+	        	}
+	        }
+	        
+		}
+		I_M_AttributeSet attributeset = null;
+		if (getM_Product_ID() > 0)
+			attributeset = MProduct.get(getCtx(), getM_Product_ID()).getM_AttributeSet();
+		boolean isAutoGenerateLot = false;
+		if (attributeset != null)
+			isAutoGenerateLot = attributeset.isAutoGenerateLot();
+		if (getReversalLine_ID() == 0 && !getParent().isSOTrx() && !getParent().getMovementType().equals(MInOut.MOVEMENTTYPE_VendorReturns) && isAutoGenerateLot
+				&& getM_AttributeSetInstance_ID() == 0)
+		{
+			MAttributeSetInstance asi = MAttributeSetInstance.generateLot(getCtx(), (MProduct)getM_Product(), get_TrxName());
+			setM_AttributeSetInstance_ID(asi.getM_AttributeSetInstance_ID());
+		}
+	//	if (getC_Charge_ID() == 0 && getM_Product_ID() == 0)
+	//		;
+
+		/**	 Qty on instance ASI
+		if (getM_AttributeSetInstance_ID() != 0)
+		{
+			MProduct product = getProduct();
+			int M_AttributeSet_ID = product.getM_AttributeSet_ID();
+			boolean isInstance = M_AttributeSet_ID != 0;
+			if (isInstance)
+			{
+				MAttributeSet mas = MAttributeSet.get(getCtx(), M_AttributeSet_ID);
+				isInstance = mas.isInstanceAttribute();
+			}
+			//	Max
+			if (isInstance)
+			{
+				MStorage storage = MStorage.get(getCtx(), getM_Locator_ID(),
+					getM_Product_ID(), getM_AttributeSetInstance_ID(), get_TrxName());
+				if (storage != null)
+				{
+					BigDecimal qty = storage.getQtyOnHand();
+					if (getMovementQty().compareTo(qty) > 0)
+					{
+						log.warning("Qty - Stock=" + qty + ", Movement=" + getMovementQty());
+						log.saveError("QtyInsufficient", "=" + qty);
+						return false;
+					}
+				}
+			}
+		}	/**/
+
+		/* Carlos Ruiz - globalqss
+		 * IDEMPIERE-178 Orders and Invoices must disallow amount lines without product/charge
+		 */
+		if (getParent().getC_DocType().isChargeOrProductMandatory()) {
+			if (getC_Charge_ID() == 0 && getM_Product_ID() == 0) {
+				log.saveError("FillMandatory", Msg.translate(getCtx(), "ChargeOrProductMandatory"));
+				return false;
+			}
+		}
+		
+		return true;
+	}	//	beforeSave
+
+	/**
+	 * 	Before Delete
+	 *	@return true if drafted
+	 */
+	protected boolean beforeDelete ()
+	{
+		if (getParent().getDocStatus().equals(MInOut.DOCSTATUS_Drafted))
+			return true;
+		log.saveError("Error", Msg.getMsg(getCtx(), "CannotDelete"));
+		return false;
+	}	//	beforeDelete
+
+	/**
+	 * 	String Representation
+	 *	@return info
+	 */
+	public String toString ()
+	{
+		StringBuilder sb = new StringBuilder ("MInOutLine[").append (get_ID())
+			.append(",M_Product_ID=").append(getM_Product_ID())
+			.append(",QtyEntered=").append(getQtyEntered())
+			.append(",MovementQty=").append(getMovementQty())
+			.append(",M_AttributeSetInstance_ID=").append(getM_AttributeSetInstance_ID())
+			.append ("]");
+		return sb.toString ();
+	}	//	toString
+
+	/**
+	 * 	Get Base value for Cost Distribution
+	 *	@param CostDistribution cost Distribution
+	 *	@return base number
+	 */
+	public BigDecimal getBase (String CostDistribution)
+	{
+		if (MLandedCost.LANDEDCOSTDISTRIBUTION_Costs.equals(CostDistribution))
+		{
+			MInvoiceLine m_il = MInvoiceLine.getOfInOutLine(this);
+			if (m_il == null)
+			{
+				m_il = MInvoiceLine.getOfInOutLineFromMatchInv(this);
+				if (m_il == null)
+				{
+					log.severe("No Invoice Line for: " + this.toString());
+					return Env.ZERO;
+				}
+			}
+			return this.getMovementQty().multiply(m_il.getPriceActual());  // Actual delivery
+		}
+		else if (MLandedCost.LANDEDCOSTDISTRIBUTION_Line.equals(CostDistribution))
+			return Env.ONE;
+		else if (MLandedCost.LANDEDCOSTDISTRIBUTION_Quantity.equals(CostDistribution))
+			return getMovementQty();
+		else if (MLandedCost.LANDEDCOSTDISTRIBUTION_Volume.equals(CostDistribution))
+		{
+			MProduct product = getProduct();
+			if (product == null)
+			{
+				log.severe("No Product");
+				return Env.ZERO;
+			}
+			return getMovementQty().multiply(product.getVolume());
+		}
+		else if (MLandedCost.LANDEDCOSTDISTRIBUTION_Weight.equals(CostDistribution))
+		{
+			MProduct product = getProduct();
+			if (product == null)
+			{
+				log.severe("No Product");
+				return Env.ZERO;
+			}
+			return getMovementQty().multiply(product.getWeight());
+		}
+		//
+		log.severe("Invalid Criteria: " + CostDistribution);
+		return Env.ZERO;
+	}	//	getBase
+
+	public boolean sameOrderLineUOM()
+	{
+		if (getC_OrderLine_ID() <= 0)
+			return false;
+
+		MOrderLine oLine = new MOrderLine(getCtx(), getC_OrderLine_ID(), get_TrxName());
+
+		if (oLine.getC_UOM_ID() != getC_UOM_ID())
+			return false;
+
+		// inout has orderline and both has the same UOM
+		return true;
+	}
+	
+	// iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+	private void setOtherDataProduct(int M_Product_ID) {
+		if(M_Product_ID>0) {
+			MProduct prd = new MProduct(p_ctx, M_Product_ID, null);
+			set_ValueNoCheck("Name", prd.get_Value("Name"));
+			set_ValueNoCheck("Description", prd.get_Value("Description"));
+			set_ValueNoCheck("Help", prd.get_Value("Help"));
+			prd = null;
+		}
+	}
+	// iDempiereConsulting __29/11/2018 ------
+
+}	//	MInOutLine
diff -r e3e19d902c21 -r c8ad95bc8d60 idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	gio gen 10 14:40:11 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	gio gen 10 17:32:03 2019 +0100
@@ -507,6 +507,10 @@
 		setC_PaymentTerm_ID(order.getC_PaymentTerm_ID());
 		setPOReference(order.getPOReference());
 		setDescription(order.getDescription());
+		//iDempiereConsulting __29/11/2018 --- Copy field "Note"(Nota) - "PrivateNote"(Nota Video)
+		set_ValueNoCheck("Note", order.get_Value("Note"));
+		set_ValueNoCheck("PrivateNote", order.get_Value("PrivateNote"));
+		//iDempiereConsulting __29/11/2018 -------
 		setDateOrdered(order.getDateOrdered());
 		//
 		setAD_OrgTrx_ID(order.getAD_OrgTrx_ID());
@@ -537,6 +541,10 @@
 		//
 		setPOReference(ship.getPOReference());
 		setDescription(ship.getDescription());
+		//iDempiereConsulting __29/11/2018 --- Copy field "Note"(Nota) - "PrivateNote"(Nota Video)
+		set_ValueNoCheck("Note", ship.get_Value("Note"));
+		set_ValueNoCheck("PrivateNote", ship.get_Value("PrivateNote"));
+		//iDempiereConsulting __29/11/2018 -------
 		setDateOrdered(ship.getDateOrdered());
 		//
 		setAD_OrgTrx_ID(ship.getAD_OrgTrx_ID());
diff -r e3e19d902c21 -r c8ad95bc8d60 idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoiceLine.java
--- /dev/null	gio gen 01 00:00:00 1970 +0000
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoiceLine.java	gio gen 10 17:32:03 2019 +0100
@@ -0,0 +1,1370 @@
+/******************************************************************************
+ * Product: Adempiere ERP & CRM Smart Business Solution                       *
+ * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
+ * This program is free software; you can redistribute it and/or modify it    *
+ * under the terms version 2 of the GNU General Public License as published   *
+ * by the Free Software Foundation. This program is distributed in the hope   *
+ * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
+ * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
+ * See the GNU General Public License for more details.                       *
+ * You should have received a copy of the GNU General Public License along    *
+ * with this program; if not, write to the Free Software Foundation, Inc.,    *
+ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
+ * For the text or an alternative of this public license, you may reach us    *
+ * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
+ * or via info@compiere.org or http://www.compiere.org/license.html           *
+ *****************************************************************************/
+package org.compiere.model;
+
+import java.math.BigDecimal;
+import java.sql.PreparedStatement;
+import java.sql.ResultSet;
+import java.sql.Timestamp;
+import java.util.ArrayList;
+import java.util.List;
+import java.util.Properties;
+import java.util.logging.Level;
+
+import org.adempiere.base.Core;
+import org.adempiere.base.IProductPricing;
+import org.adempiere.exceptions.AdempiereException;
+import org.adempiere.model.ITaxProvider;
+import org.compiere.util.CLogger;
+import org.compiere.util.DB;
+import org.compiere.util.Env;
+import org.compiere.util.Msg;
+
+
+/**
+ *	Invoice Line Model
+ *
+ *  @author Jorg Janke
+ *  @version $Id: MInvoiceLine.java,v 1.5 2006/07/30 00:51:03 jjanke Exp $
+ * 
+ * @author Teo Sarca, www.arhipac.ro
+ * 			<li>BF [ 2804142 ] MInvoice.setRMALine should work only for CreditMemo invoices
+ * 				https://sourceforge.net/tracker/?func=detail&aid=2804142&group_id=176962&atid=879332
+ * @author red1 FR: [ 2214883 ] Remove SQL code and Replace for Query
+ */
+public class MInvoiceLine extends X_C_InvoiceLine
+{
+	/**
+	 * 
+	 */
+	private static final long serialVersionUID = -1590896898028805978L;
+
+	/**
+	 * 	Get Invoice Line referencing InOut Line
+	 *	@param sLine shipment line
+	 *	@return (first) invoice line
+	 */
+	public static MInvoiceLine getOfInOutLine (MInOutLine sLine)
+	{
+		if (sLine == null)
+			return null;
+		final String whereClause = I_M_InOutLine.COLUMNNAME_M_InOutLine_ID+"=?";
+		List<MInvoiceLine> list = new Query(sLine.getCtx(),I_C_InvoiceLine.Table_Name,whereClause,sLine.get_TrxName())
+		.setParameters(sLine.getM_InOutLine_ID())
+		.list();
+		
+		MInvoiceLine retValue = null;
+		if (list.size() > 0) {
+			retValue = list.get(0);
+			if (list.size() > 1)
+				s_log.warning("More than one C_InvoiceLine of " + sLine);
+		}
+
+		return retValue;
+	}	//	getOfInOutLine
+
+	/**
+	 * 	Get Invoice Line referencing InOut Line - from MatchInv
+	 *	@param sLine shipment line
+	 *	@return (first) invoice line
+	 */
+	public static MInvoiceLine getOfInOutLineFromMatchInv(MInOutLine sLine) {
+		if (sLine == null)
+			return null;
+		final String whereClause = "C_InvoiceLine_ID IN (SELECT C_InvoiceLine_ID FROM M_MatchInv WHERE M_InOutLine_ID=?)";
+		List<MInvoiceLine> list = new Query(sLine.getCtx(),I_C_InvoiceLine.Table_Name,whereClause,sLine.get_TrxName())
+		.setParameters(sLine.getM_InOutLine_ID())
+		.list();
+		
+		MInvoiceLine retValue = null;
+		if (list.size() > 0) {
+			retValue = list.get(0);
+			if (list.size() > 1)
+				s_log.warning("More than one C_InvoiceLine of " + sLine);
+		}
+
+		return retValue;
+	}
+
+	/**	Static Logger	*/
+	protected static CLogger	s_log	= CLogger.getCLogger (MInvoiceLine.class);
+
+	/** Tax							*/
+	protected MTax 		m_tax = null;
+	
+	
+	/**************************************************************************
+	 * 	Invoice Line Constructor
+	 * 	@param ctx context
+	 * 	@param C_InvoiceLine_ID invoice line or 0
+	 * 	@param trxName transaction name
+	 */
+	public MInvoiceLine (Properties ctx, int C_InvoiceLine_ID, String trxName)
+	{
+		super (ctx, C_InvoiceLine_ID, trxName);
+		if (C_InvoiceLine_ID == 0)
+		{
+			setIsDescription(false);
+			setIsPrinted (true);
+			setLineNetAmt (Env.ZERO);
+			setPriceEntered (Env.ZERO);
+			setPriceActual (Env.ZERO);
+			setPriceLimit (Env.ZERO);
+			setPriceList (Env.ZERO);
+			setM_AttributeSetInstance_ID(0);
+			setTaxAmt(Env.ZERO);
+			//
+			setQtyEntered(Env.ZERO);
+			setQtyInvoiced(Env.ZERO);
+		}
+	}	//	MInvoiceLine
+
+	/**
+	 * 	Parent Constructor
+	 * 	@param invoice parent
+	 */
+	public MInvoiceLine (MInvoice invoice)
+	{
+		this (invoice.getCtx(), 0, invoice.get_TrxName());
+		if (invoice.get_ID() == 0)
+			throw new IllegalArgumentException("Header not saved");
+		setClientOrg(invoice.getAD_Client_ID(), invoice.getAD_Org_ID());
+		setC_Invoice_ID (invoice.getC_Invoice_ID());
+		setInvoice(invoice);
+	}	//	MInvoiceLine
+
+
+	/**
+	 *  Load Constructor
+	 *  @param ctx context
+	 *  @param rs result set record
+	 *  @param trxName transaction
+	 */
+	public MInvoiceLine (Properties ctx, ResultSet rs, String trxName)
+	{
+		super(ctx, rs, trxName);
+	}	//	MInvoiceLine
+
+	protected int			m_M_PriceList_ID = 0;
+	protected Timestamp	m_DateInvoiced = null;
+	protected int			m_C_BPartner_ID = 0;
+	protected int			m_C_BPartner_Location_ID = 0;
+	protected boolean		m_IsSOTrx = true;
+	protected boolean		m_priceSet = false;
+	protected MProduct	m_product = null;
+	/**	Charge					*/
+	protected MCharge 		m_charge = null;
+	
+	/**	Cached Name of the line		*/
+	protected String		m_name = null;
+	/** Cached Precision			*/
+	protected Integer		m_precision = null;
+	/** Product Pricing				*/
+	protected IProductPricing	m_productPricing = null;
+	/** Parent						*/
+	protected MInvoice	m_parent = null;
+
+	/**
+	 * 	Set Defaults from Order.
+	 * 	Called also from copy lines from invoice
+	 * 	Does not set Parent !!
+	 * 	@param invoice invoice
+	 */
+	public void setInvoice (MInvoice invoice)
+	{
+		m_parent = invoice;
+		m_M_PriceList_ID = invoice.getM_PriceList_ID();
+		m_DateInvoiced = invoice.getDateInvoiced();
+		m_C_BPartner_ID = invoice.getC_BPartner_ID();
+		m_C_BPartner_Location_ID = invoice.getC_BPartner_Location_ID();
+		m_IsSOTrx = invoice.isSOTrx();
+		m_precision = new Integer(invoice.getPrecision());
+	}	//	setOrder
+
+	/**
+	 * 	Get Parent
+	 *	@return parent
+	 */
+	public MInvoice getParent()
+	{
+		if (m_parent == null)
+			m_parent = new MInvoice(getCtx(), getC_Invoice_ID(), get_TrxName());
+		return m_parent;
+	}	//	getParent
+
+	/**
+	 * 	Set values from Order Line.
+	 * 	Does not set quantity!
+	 *	@param oLine line
+	 */
+	public void setOrderLine (MOrderLine oLine)
+	{
+		setC_OrderLine_ID(oLine.getC_OrderLine_ID());
+		//
+		setLine(oLine.getLine());
+		setIsDescription(oLine.isDescription());
+		setDescription(oLine.getDescription());
+		//
+		if(oLine.getM_Product_ID() == 0)
+		setC_Charge_ID(oLine.getC_Charge_ID());
+		//
+		setM_Product_ID(oLine.getM_Product_ID());
+		setM_AttributeSetInstance_ID(oLine.getM_AttributeSetInstance_ID());
+		setS_ResourceAssignment_ID(oLine.getS_ResourceAssignment_ID());
+		setC_UOM_ID(oLine.getC_UOM_ID());
+		//
+		setPriceEntered(oLine.getPriceEntered());
+		setPriceActual(oLine.getPriceActual());
+		setPriceLimit(oLine.getPriceLimit());
+		setPriceList(oLine.getPriceList());
+		//
+		setC_Tax_ID(oLine.getC_Tax_ID());
+		setLineNetAmt(oLine.getLineNetAmt());
+		//
+		setC_Project_ID(oLine.getC_Project_ID());
+		setC_ProjectPhase_ID(oLine.getC_ProjectPhase_ID());
+		setC_ProjectTask_ID(oLine.getC_ProjectTask_ID());
+		setC_Activity_ID(oLine.getC_Activity_ID());
+		setC_Campaign_ID(oLine.getC_Campaign_ID());
+		setAD_OrgTrx_ID(oLine.getAD_OrgTrx_ID());
+		setUser1_ID(oLine.getUser1_ID());
+		setUser2_ID(oLine.getUser2_ID());
+		//
+		setRRAmt(oLine.getRRAmt());
+		setRRStartDate(oLine.getRRStartDate());
+		
+		// iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+		set_ValueNoCheck("Name", oLine.get_Value("Name"));
+		set_ValueNoCheck("Description", oLine.get_Value("Description"));
+		set_ValueNoCheck("Help", oLine.get_Value("Help"));
+		//---
+	}	//	setOrderLine
+
+	/**
+	 * 	Set values from Shipment Line.
+	 * 	Does not set quantity!
+	 *	@param sLine ship line
+	 */
+	public void setShipLine (MInOutLine sLine)
+	{
+		setM_InOutLine_ID(sLine.getM_InOutLine_ID());
+		setC_OrderLine_ID(sLine.getC_OrderLine_ID());
+		// Set RMALine ID if shipment/receipt is based on RMA Doc
+        setM_RMALine_ID(sLine.getM_RMALine_ID());
+
+		//
+		setLine(sLine.getLine());
+		setIsDescription(sLine.isDescription());
+		setDescription(sLine.getDescription());
+		//
+		setM_Product_ID(sLine.getM_Product_ID());
+		if (sLine.sameOrderLineUOM() || getProduct() == null)
+			setC_UOM_ID(sLine.getC_UOM_ID());
+		else
+			// use product UOM if the shipment hasn't the same uom than the order
+			setC_UOM_ID(getProduct().getC_UOM_ID());
+		setM_AttributeSetInstance_ID(sLine.getM_AttributeSetInstance_ID());
+	//	setS_ResourceAssignment_ID(sLine.getS_ResourceAssignment_ID());
+		if(getM_Product_ID() == 0)
+		    setC_Charge_ID(sLine.getC_Charge_ID());
+		//
+		int C_OrderLine_ID = sLine.getC_OrderLine_ID();
+		if (C_OrderLine_ID != 0)
+		{
+			MOrderLine oLine = new MOrderLine (getCtx(), C_OrderLine_ID, get_TrxName());
+			setS_ResourceAssignment_ID(oLine.getS_ResourceAssignment_ID());
+			//
+			if (sLine.sameOrderLineUOM())
+				setPriceEntered(oLine.getPriceEntered());
+			else
+				setPriceEntered(oLine.getPriceActual());
+			setPriceActual(oLine.getPriceActual());
+			setPriceLimit(oLine.getPriceLimit());
+			setPriceList(oLine.getPriceList());
+			//
+			setC_Tax_ID(oLine.getC_Tax_ID());
+			setLineNetAmt(oLine.getLineNetAmt());
+			setC_Project_ID(oLine.getC_Project_ID());
+		}
+		// Check if shipment line is based on RMA
+        else if (sLine.getM_RMALine_ID() != 0)
+        {
+        	// Set Pricing details from the RMA Line on which it is based
+            MRMALine rmaLine = new MRMALine(getCtx(), sLine.getM_RMALine_ID(), get_TrxName());
+
+            setPrice();
+            setPrice(rmaLine.getAmt());
+            setC_Tax_ID(rmaLine.getC_Tax_ID());
+            setLineNetAmt(rmaLine.getLineNetAmt());
+        }
+		else
+		{
+			setPrice();
+			setTax();
+		}
+		//
+		setC_Project_ID(sLine.getC_Project_ID());
+		setC_ProjectPhase_ID(sLine.getC_ProjectPhase_ID());
+		setC_ProjectTask_ID(sLine.getC_ProjectTask_ID());
+		setC_Activity_ID(sLine.getC_Activity_ID());
+		setC_Campaign_ID(sLine.getC_Campaign_ID());
+		setAD_OrgTrx_ID(sLine.getAD_OrgTrx_ID());
+		setUser1_ID(sLine.getUser1_ID());
+		setUser2_ID(sLine.getUser2_ID());
+		
+		// iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+		set_ValueNoCheck("Name", sLine.get_Value("Name"));
+		set_ValueNoCheck("Description", sLine.get_Value("Description"));
+		set_ValueNoCheck("Help", sLine.get_Value("Help"));
+		//---
+	}	//	setShipLine
+
+	/**
+	 * 	Add to Description
+	 *	@param description text
+	 */
+	public void addDescription (String description)
+	{
+		String desc = getDescription();
+		if (desc == null)
+			setDescription(description);
+		else{
+			StringBuilder msgd = new StringBuilder(desc).append(" | ").append(description);
+			setDescription(msgd.toString());
+		}	
+	}	//	addDescription
+
+	/**
+	 * 	Set M_AttributeSetInstance_ID
+	 *	@param M_AttributeSetInstance_ID id
+	 */
+	public void setM_AttributeSetInstance_ID (int M_AttributeSetInstance_ID)
+	{
+		if (M_AttributeSetInstance_ID == 0)		//	 0 is valid ID
+			set_Value("M_AttributeSetInstance_ID", new Integer(0));
+		else
+			super.setM_AttributeSetInstance_ID (M_AttributeSetInstance_ID);
+	}	//	setM_AttributeSetInstance_ID
+
+
+	/**************************************************************************
+	 * 	Set Price for Product and PriceList.
+	 * 	Uses standard SO price list of not set by invoice constructor
+	 */
+	public void setPrice()
+	{
+		if (getM_Product_ID() == 0 || isDescription())
+			return;
+		if (m_M_PriceList_ID == 0 || m_C_BPartner_ID == 0)
+			setInvoice(getParent());
+		if (m_M_PriceList_ID == 0 || m_C_BPartner_ID == 0)
+			throw new IllegalStateException("setPrice - PriceList unknown!");
+		setPrice (m_M_PriceList_ID, m_C_BPartner_ID);
+	}	//	setPrice
+
+	/**
+	 * 	Set Price for Product and PriceList
+	 * 	@param M_PriceList_ID price list
+	 * 	@param C_BPartner_ID business partner
+	 */
+	public void setPrice (int M_PriceList_ID, int C_BPartner_ID)
+	{
+		if (getM_Product_ID() == 0 || isDescription())
+			return;
+		//
+		if (log.isLoggable(Level.FINE)) log.fine("M_PriceList_ID=" + M_PriceList_ID);
+		m_productPricing = Core.getProductPricing();
+		m_productPricing.setInvoiceLine(this, get_TrxName());
+		m_productPricing.setM_PriceList_ID(M_PriceList_ID);
+		//
+		setPriceActual (m_productPricing.getPriceStd());
+		setPriceList (m_productPricing.getPriceList());
+		setPriceLimit (m_productPricing.getPriceLimit());
+		//
+		if (getQtyEntered().compareTo(getQtyInvoiced()) == 0)
+			setPriceEntered(getPriceActual());
+		else
+			setPriceEntered(getPriceActual().multiply(getQtyInvoiced()
+				.divide(getQtyEntered(), 6, BigDecimal.ROUND_HALF_UP)));	//	precision
+		//
+		if (getC_UOM_ID() == 0)
+			setC_UOM_ID(m_productPricing.getC_UOM_ID());
+		//
+		m_priceSet = true;
+	}	//	setPrice
+
+	/**
+	 * 	Set Price Entered/Actual.
+	 * 	Use this Method if the Line UOM is the Product UOM
+	 *	@param PriceActual price
+	 */
+	public void setPrice (BigDecimal PriceActual)
+	{
+		setPriceEntered(PriceActual);
+		setPriceActual (PriceActual);
+	}	//	setPrice
+
+	/**
+	 * 	Set Price Actual.
+	 * 	(actual price is not updateable)
+	 *	@param PriceActual actual price
+	 */
+	public void setPriceActual (BigDecimal PriceActual)
+	{
+		if (PriceActual == null)
+			throw new IllegalArgumentException ("PriceActual is mandatory");
+		set_ValueNoCheck("PriceActual", PriceActual);
+	}	//	setPriceActual
+
+
+	/**
+	 *	Set Tax - requires Warehouse
+	 *	@return true if found
+	 */
+	public boolean setTax()
+	{
+		if (isDescription())
+			return true;
+		//
+		int M_Warehouse_ID = Env.getContextAsInt(getCtx(), "#M_Warehouse_ID");
+		//
+		int C_Tax_ID = Tax.get(getCtx(), getM_Product_ID(), getC_Charge_ID() , m_DateInvoiced, m_DateInvoiced,
+			getAD_Org_ID(), M_Warehouse_ID,
+			m_C_BPartner_Location_ID,		//	should be bill to
+			m_C_BPartner_Location_ID, m_IsSOTrx, get_TrxName());
+		if (C_Tax_ID == 0)
+		{
+			log.log(Level.SEVERE, "No Tax found");
+			return false;
+		}
+		setC_Tax_ID (C_Tax_ID);
+		return true;
+	}	//	setTax
+
+
+	/**
+	 * 	Calculate Tax Amt.
+	 * 	Assumes Line Net is calculated
+	 */
+	public void setTaxAmt ()
+	{
+		BigDecimal TaxAmt = Env.ZERO;
+		if (getC_Tax_ID() == 0)
+			return;
+		setLineNetAmt();
+		MTax tax = MTax.get (getCtx(), getC_Tax_ID());
+		if (tax.isDocumentLevel() && m_IsSOTrx)		//	AR Inv Tax
+			return;
+		//
+		TaxAmt = tax.calculateTax(getLineNetAmt(), isTaxIncluded(), getPrecision());
+		if (isTaxIncluded())
+			setLineTotalAmt(getLineNetAmt());
+		else
+			setLineTotalAmt(getLineNetAmt().add(TaxAmt));
+		super.setTaxAmt (TaxAmt);
+	}	//	setTaxAmt
+
+	/**
+	 * 	Calculate Extended Amt.
+	 * 	May or may not include tax
+	 */
+	public void setLineNetAmt ()
+	{
+		//	Calculations & Rounding
+		BigDecimal bd = getPriceActual().multiply(getQtyInvoiced());
+		int precision = getPrecision();
+		if (bd.scale() > precision)
+			bd = bd.setScale(precision, BigDecimal.ROUND_HALF_UP);
+		super.setLineNetAmt (bd);
+	}	//	setLineNetAmt
+	/**
+	 * 	Get Charge
+	 *	@return product or null
+	 */
+	public MCharge getCharge()
+	{
+		if (m_charge == null && getC_Charge_ID() != 0)
+			m_charge =  MCharge.get (getCtx(), getC_Charge_ID());
+		return m_charge;
+	}
+	/**
+	 * 	Get Tax
+	 *	@return tax
+	 */
+	protected MTax getTax()
+	{
+		if (m_tax == null)
+			m_tax = MTax.get(getCtx(), getC_Tax_ID());
+		return m_tax;
+	}	//	getTax
+
+	/**
+	 * 	Set Qty Invoiced/Entered.
+	 *	@param Qty Invoiced/Ordered
+	 */
+	public void setQty (int Qty)
+	{
+		setQty(new BigDecimal(Qty));
+	}	//	setQtyInvoiced
+
+	/**
+	 * 	Set Qty Invoiced
+	 *	@param Qty Invoiced/Entered
+	 */
+	public void setQty (BigDecimal Qty)
+	{
+		setQtyEntered(Qty);
+		setQtyInvoiced(getQtyEntered());
+	}	//	setQtyInvoiced
+
+	/**
+	 * 	Set Qty Entered - enforce entered UOM
+	 *	@param QtyEntered
+	 */
+	public void setQtyEntered (BigDecimal QtyEntered)
+	{
+		if (QtyEntered != null && getC_UOM_ID() != 0)
+		{
+			int precision = MUOM.getPrecision(getCtx(), getC_UOM_ID());
+			QtyEntered = QtyEntered.setScale(precision, BigDecimal.ROUND_HALF_UP);
+		}
+		super.setQtyEntered (QtyEntered);
+	}	//	setQtyEntered
+
+	/**
+	 * 	Set Qty Invoiced - enforce Product UOM
+	 *	@param QtyInvoiced
+	 */
+	public void setQtyInvoiced (BigDecimal QtyInvoiced)
+	{
+		MProduct product = getProduct();
+		if (QtyInvoiced != null && product != null)
+		{
+			int precision = product.getUOMPrecision();
+			QtyInvoiced = QtyInvoiced.setScale(precision, BigDecimal.ROUND_HALF_UP);
+		}
+		super.setQtyInvoiced(QtyInvoiced);
+	}	//	setQtyInvoiced
+
+	/**
+	 * 	Set Product
+	 *	@param product product
+	 */
+	public void setProduct (MProduct product)
+	{
+		m_product = product;
+		if (m_product != null)
+		{
+			setM_Product_ID(m_product.getM_Product_ID());
+			setC_UOM_ID (m_product.getC_UOM_ID());
+			
+			// iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+			setOtherDataProduct(getM_Product_ID());
+			//---
+		}
+		else
+		{
+			setM_Product_ID(0);
+			setC_UOM_ID (0);
+		}
+		setM_AttributeSetInstance_ID(0);
+	}	//	setProduct
+
+
+	/**
+	 * 	Set M_Product_ID
+	 *	@param M_Product_ID product
+	 *	@param setUOM set UOM from product
+	 */
+	public void setM_Product_ID (int M_Product_ID, boolean setUOM)
+	{
+		if (setUOM)
+			setProduct(MProduct.get(getCtx(), M_Product_ID));
+		else
+			super.setM_Product_ID (M_Product_ID);
+		setM_AttributeSetInstance_ID(0);
+		
+		// iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+		setOtherDataProduct(M_Product_ID);
+		//---
+	}	//	setM_Product_ID
+
+	/**
+	 * 	Set Product and UOM
+	 *	@param M_Product_ID product
+	 *	@param C_UOM_ID uom
+	 */
+	public void setM_Product_ID (int M_Product_ID, int C_UOM_ID)
+	{
+		super.setM_Product_ID (M_Product_ID);
+		super.setC_UOM_ID(C_UOM_ID);
+		setM_AttributeSetInstance_ID(0);
+		
+		// iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+		setOtherDataProduct(M_Product_ID);
+		//---
+	}	//	setM_Product_ID
+
+	/**
+	 * 	Get Product
+	 *	@return product or null
+	 */
+	public MProduct getProduct()
+	{
+		if (m_product == null && getM_Product_ID() != 0)
+			m_product =  MProduct.get (getCtx(), getM_Product_ID());
+		return m_product;
+	}	//	getProduct
+
+	/**
+	 * 	Get C_Project_ID
+	 *	@return project
+	 */
+	public int getC_Project_ID()
+	{
+		int ii = super.getC_Project_ID ();
+		if (ii == 0)
+			ii = getParent().getC_Project_ID();
+		return ii;
+	}	//	getC_Project_ID
+
+	/**
+	 * 	Get C_Activity_ID
+	 *	@return Activity
+	 */
+	public int getC_Activity_ID()
+	{
+		int ii = super.getC_Activity_ID ();
+		if (ii == 0)
+			ii = getParent().getC_Activity_ID();
+		return ii;
+	}	//	getC_Activity_ID
+
+	/**
+	 * 	Get C_Campaign_ID
+	 *	@return Campaign
+	 */
+	public int getC_Campaign_ID()
+	{
+		int ii = super.getC_Campaign_ID ();
+		if (ii == 0)
+			ii = getParent().getC_Campaign_ID();
+		return ii;
+	}	//	getC_Campaign_ID
+
+	/**
+	 * 	Get User2_ID
+	 *	@return User2
+	 */
+	public int getUser1_ID ()
+	{
+		int ii = super.getUser1_ID ();
+		if (ii == 0)
+			ii = getParent().getUser1_ID();
+		return ii;
+	}	//	getUser1_ID
+
+	/**
+	 * 	Get User2_ID
+	 *	@return User2
+	 */
+	public int getUser2_ID ()
+	{
+		int ii = super.getUser2_ID ();
+		if (ii == 0)
+			ii = getParent().getUser2_ID();
+		return ii;
+	}	//	getUser2_ID
+
+	/**
+	 * 	Get AD_OrgTrx_ID
+	 *	@return trx org
+	 */
+	public int getAD_OrgTrx_ID()
+	{
+		int ii = super.getAD_OrgTrx_ID();
+		if (ii == 0)
+			ii = getParent().getAD_OrgTrx_ID();
+		return ii;
+	}	//	getAD_OrgTrx_ID
+
+	/**
+	 * 	String Representation
+	 *	@return info
+	 */
+	public String toString ()
+	{
+		StringBuilder sb = new StringBuilder ("MInvoiceLine[")
+			.append(get_ID()).append(",").append(getLine())
+			.append(",QtyInvoiced=").append(getQtyInvoiced())
+			.append(",LineNetAmt=").append(getLineNetAmt())
+			.append ("]");
+		return sb.toString ();
+	}	//	toString
+
+	/**
+	 * 	Get (Product/Charge) Name
+	 * 	@return name
+	 */
+	public String getName ()
+	{
+		if (m_name == null)
+		{
+			String sql = "SELECT COALESCE (p.Name, c.Name) "
+				+ "FROM C_InvoiceLine il"
+				+ " LEFT OUTER JOIN M_Product p ON (il.M_Product_ID=p.M_Product_ID)"
+				+ " LEFT OUTER JOIN C_Charge C ON (il.C_Charge_ID=c.C_Charge_ID) "
+				+ "WHERE C_InvoiceLine_ID=?";
+			PreparedStatement pstmt = null;
+			ResultSet rs = null;
+			try
+			{
+				pstmt = DB.prepareStatement(sql, get_TrxName());
+				pstmt.setInt(1, getC_InvoiceLine_ID());
+				rs = pstmt.executeQuery();
+				if (rs.next())
+					m_name = rs.getString(1);
+				if (m_name == null)
+					m_name = "??";
+			}
+			catch (Exception e)
+			{
+				log.log(Level.SEVERE, "getName", e);
+			}
+			finally
+			{
+				DB.close(rs, pstmt);
+				rs = null;
+				pstmt = null;
+			}
+		}
+		return m_name;
+	}	//	getName
+
+	/**
+	 * 	Set Temporary (cached) Name
+	 * 	@param tempName Cached Name
+	 */
+	public void setName (String tempName)
+	{
+		m_name = tempName;
+	}	//	setName
+
+	/**
+	 * 	Get Description Text.
+	 * 	For jsp access (vs. isDescription)
+	 *	@return description
+	 */
+	public String getDescriptionText()
+	{
+		return super.getDescription();
+	}	//	getDescriptionText
+
+	/**
+	 * 	Get Currency Precision
+	 *	@return precision
+	 */
+	public int getPrecision()
+	{
+		if (m_precision != null)
+			return m_precision.intValue();
+
+		String sql = "SELECT c.StdPrecision "
+			+ "FROM C_Currency c INNER JOIN C_Invoice x ON (x.C_Currency_ID=c.C_Currency_ID) "
+			+ "WHERE x.C_Invoice_ID=?";
+		int i = DB.getSQLValue(get_TrxName(), sql, getC_Invoice_ID());
+		if (i < 0)
+		{
+			log.warning("getPrecision = " + i + " - set to 2");
+			i = 2;
+		}
+		m_precision = new Integer(i);
+		return m_precision.intValue();
+	}	//	getPrecision
+
+	/**
+	 *	Is Tax Included in Amount
+	 *	@return true if tax is included
+	 */
+	public boolean isTaxIncluded()
+	{
+		if (m_M_PriceList_ID == 0)
+		{
+			m_M_PriceList_ID = DB.getSQLValue(get_TrxName(),
+				"SELECT M_PriceList_ID FROM C_Invoice WHERE C_Invoice_ID=?",
+				getC_Invoice_ID());
+		}
+		MPriceList pl = MPriceList.get(getCtx(), m_M_PriceList_ID, get_TrxName());
+		return pl.isTaxIncluded();
+	}	//	isTaxIncluded
+
+
+	/**************************************************************************
+	 * 	Before Save
+	 *	@param newRecord
+	 *	@return true if save
+	 */
+	protected boolean beforeSave (boolean newRecord)
+	{
+		if (log.isLoggable(Level.FINE)) log.fine("New=" + newRecord);
+		boolean parentComplete = getParent().isComplete();
+		boolean isReversal = getParent().isReversal();
+		if (newRecord && parentComplete) {
+			log.saveError("ParentComplete", Msg.translate(getCtx(), "C_InvoiceLine"));
+			return false;
+		}
+		// Re-set invoice header (need to update m_IsSOTrx flag) - phib [ 1686773 ]
+		setInvoice(getParent());
+
+	  if (!parentComplete && !isReversal) {  // do not change things when parent is complete
+		//	Charge
+		if (getC_Charge_ID() != 0)
+		{
+			if (getM_Product_ID() != 0)
+				setM_Product_ID(0);
+		}
+		else	//	Set Product Price
+		{
+			if (!m_priceSet
+				&&  Env.ZERO.compareTo(getPriceActual()) == 0
+				&&  Env.ZERO.compareTo(getPriceList()) == 0)
+				setPrice();
+				// IDEMPIERE-1574 Sales Order Line lets Price under the Price Limit when updating
+				//	Check PriceLimit
+				boolean enforce = m_IsSOTrx && getParent().getM_PriceList().isEnforcePriceLimit();
+				if (enforce && MRole.getDefault().isOverwritePriceLimit())
+					enforce = false;
+				//	Check Price Limit?
+				if (enforce && getPriceLimit() != Env.ZERO
+				  && getPriceActual().compareTo(getPriceLimit()) < 0)
+				{
+					log.saveError("UnderLimitPrice", "PriceEntered=" + getPriceEntered() + ", PriceLimit=" + getPriceLimit()); 
+					return false;
+				}
+				//
+		}
+
+		//	Set Tax
+		if (getC_Tax_ID() == 0)
+			setTax();
+
+		//	Get Line No
+		if (getLine() == 0)
+		{
+			String sql = "SELECT COALESCE(MAX(Line),0)+10 FROM C_InvoiceLine WHERE C_Invoice_ID=?";
+			int ii = DB.getSQLValue (get_TrxName(), sql, getC_Invoice_ID());
+			setLine (ii);
+		}
+		//	UOM
+		if (getC_UOM_ID() == 0)
+		{
+			int C_UOM_ID = MUOM.getDefault_UOM_ID(getCtx());
+			if (C_UOM_ID > 0)
+				setC_UOM_ID (C_UOM_ID);
+		}
+		//	Qty Precision
+		if (newRecord || is_ValueChanged("QtyEntered"))
+			setQtyEntered(getQtyEntered());
+		if (newRecord || is_ValueChanged("QtyInvoiced"))
+			setQtyInvoiced(getQtyInvoiced());
+
+		//	Calculations & Rounding
+		setLineNetAmt();
+		// TaxAmt recalculations should be done if the TaxAmt is zero
+		// or this is an Invoice(Customer) - teo_sarca, globalqss [ 1686773 ]
+		if (m_IsSOTrx || getTaxAmt().compareTo(Env.ZERO) == 0)
+			setTaxAmt();
+		//
+		
+		/* Carlos Ruiz - globalqss
+		 * IDEMPIERE-178 Orders and Invoices must disallow amount lines without product/charge
+		 */
+		if (getParent().getC_DocTypeTarget().isChargeOrProductMandatory()) {
+			if (getC_Charge_ID() == 0 && getM_Product_ID() == 0 && (getPriceEntered().signum() != 0 || getQtyEntered().signum() != 0)) {
+				log.saveError("FillMandatory", Msg.translate(getCtx(), "ChargeOrProductMandatory"));
+				return false;
+			}
+		}
+	  }
+		
+		return true;
+	}	//	beforeSave
+
+	/**
+	 * Recalculate invoice tax
+	 * @param oldTax true if the old C_Tax_ID should be used
+	 * @return true if success, false otherwise
+	 *
+	 * @author teo_sarca [ 1583825 ]
+	 */
+	protected boolean updateInvoiceTax(boolean oldTax) {
+		MInvoiceTax tax = MInvoiceTax.get (this, getPrecision(), oldTax, get_TrxName());
+		if (tax != null) {
+			if (!tax.calculateTaxFromLines())
+				return false;
+		
+			// red1 - solving BUGS #[ 1701331 ] , #[ 1786103 ]
+			if (tax.getTaxAmt().signum() != 0) {
+				if (!tax.save(get_TrxName()))
+					return false;
+			}
+			else {
+				if (!tax.is_new() && !tax.delete(false, get_TrxName()))
+					return false;
+			}
+		}
+		return true;
+	}
+
+	/**
+	 * 	After Save
+	 *	@param newRecord new
+	 *	@param success success
+	 *	@return saved
+	 */
+	protected boolean afterSave (boolean newRecord, boolean success)
+	{
+		if (!success)
+			return success;
+		MTax tax = new MTax(getCtx(), getC_Tax_ID(), get_TrxName());
+        MTaxProvider provider = new MTaxProvider(tax.getCtx(), tax.getC_TaxProvider_ID(), tax.get_TrxName());
+		ITaxProvider calculator = Core.getTaxProvider(provider);
+		if (calculator == null)
+			throw new AdempiereException(Msg.getMsg(getCtx(), "TaxNoProvider"));
+    	return calculator.recalculateTax(provider, this, newRecord);
+	}	//	afterSave
+
+	/**
+	 * 	After Delete
+	 *	@param success success
+	 *	@return deleted
+	 */
+	protected boolean afterDelete (boolean success)
+	{
+		if (!success)
+			return success;
+
+		// reset shipment line invoiced flag
+		if ( getM_InOutLine_ID() > 0 )
+		{
+			MInOutLine sLine = new MInOutLine(getCtx(), getM_InOutLine_ID(), get_TrxName());
+			sLine.setIsInvoiced(false);
+			sLine.saveEx();
+		}
+
+		return updateHeaderTax();
+	}	//	afterDelete
+
+	/**
+	 *	Update Tax & Header
+	 *	@return true if header updated with tax
+	 */
+	public boolean updateHeaderTax()
+	{
+		// Update header only if the document is not processed - teo_sarca BF [ 2317305 ]
+		if (isProcessed() && !is_ValueChanged(COLUMNNAME_Processed))
+			return true;
+
+		//	Recalculate Tax for this Tax
+        MTax tax = new MTax(getCtx(), getC_Tax_ID(), get_TrxName());
+        MTaxProvider provider = new MTaxProvider(tax.getCtx(), tax.getC_TaxProvider_ID(), tax.get_TrxName());
+		ITaxProvider calculator = Core.getTaxProvider(provider);
+		if (calculator == null)
+			throw new AdempiereException(Msg.getMsg(getCtx(), "TaxNoProvider"));
+    	if (!calculator.updateInvoiceTax(provider, this))
+			return false;
+
+		return calculator.updateHeaderTax(provider, this);
+	}	//	updateHeaderTax
+
+
+	/**************************************************************************
+	 * 	Allocate Landed Costs
+	 *	@return error message or ""
+	 */
+	public String allocateLandedCosts()
+	{
+		if (isProcessed())
+			return "Processed";
+		StringBuilder sql = new StringBuilder("DELETE C_LandedCostAllocation WHERE C_InvoiceLine_ID=").append(getC_InvoiceLine_ID());
+		int no = DB.executeUpdate(sql.toString(), get_TrxName());
+		if (no != 0)
+			if (log.isLoggable(Level.INFO)) log.info("Deleted #" + no);
+		MLandedCost[] lcs = MLandedCost.getLandedCosts(this);
+		if (lcs.length == 0)
+			return "";
+
+		int inserted = 0;
+		//	*** Single Criteria ***
+		StringBuilder msgreturn;
+		if (lcs.length == 1)
+		{
+			MLandedCost lc = lcs[0];
+			if (lc.getM_InOut_ID() != 0 && lc.getM_InOutLine_ID() == 0)
+			{
+				//	Create List
+				ArrayList<MInOutLine> list = new ArrayList<MInOutLine>();
+				MInOut ship = new MInOut (getCtx(), lc.getM_InOut_ID(), get_TrxName());
+				MInOutLine[] lines = ship.getLines();
+				for (int i = 0; i < lines.length; i++)
+				{
+					if (lines[i].isDescription() || lines[i].getM_Product_ID() == 0)
+						continue;
+					if (lc.getM_Product_ID() == 0
+						|| lc.getM_Product_ID() == lines[i].getM_Product_ID())
+						list.add(lines[i]);
+				}
+				if (list.size() == 0)
+					return "No Matching Lines (with Product) in Shipment";
+				//	Calculate total & base
+				BigDecimal total = Env.ZERO;
+				for (int i = 0; i < list.size(); i++)
+				{
+					MInOutLine iol = (MInOutLine)list.get(i);
+					total = total.add(iol.getBase(lc.getLandedCostDistribution()));
+				}
+				if (total.signum() == 0){
+					msgreturn = new StringBuilder("Total of Base values is 0 - ").append(lc.getLandedCostDistribution());
+					return msgreturn.toString();
+				}	
+				//	Create Allocations
+				for (int i = 0; i < list.size(); i++)
+				{
+					MInOutLine iol = (MInOutLine)list.get(i);
+					MLandedCostAllocation lca = new MLandedCostAllocation (this, lc.getM_CostElement_ID());
+					lca.setM_Product_ID(iol.getM_Product_ID());
+					lca.setM_InOutLine_ID(iol.getM_InOutLine_ID());
+					lca.setM_AttributeSetInstance_ID(iol.getM_AttributeSetInstance_ID());
+					BigDecimal base = iol.getBase(lc.getLandedCostDistribution());
+					lca.setBase(base);
+					// MZ Goodwill
+					// add set Qty from InOutLine
+					lca.setQty(iol.getMovementQty());
+					// end MZ
+					if (base.signum() != 0)
+					{
+						double result = getLineNetAmt().multiply(base).doubleValue();
+						result /= total.doubleValue();
+						lca.setAmt(result, getParent().getC_Currency().getStdPrecision());
+					}
+					if (!lca.save()){
+						msgreturn = new StringBuilder("Cannot save line Allocation = ").append(lca);
+						return msgreturn.toString();
+					}	
+					inserted++;
+				}
+				if (log.isLoggable(Level.INFO)) log.info("Inserted " + inserted);
+				allocateLandedCostRounding();
+				return "";
+			}
+			//	Single Line
+			else if (lc.getM_InOutLine_ID() != 0)
+			{
+				MInOutLine iol = new MInOutLine (getCtx(), lc.getM_InOutLine_ID(), get_TrxName());
+				if (iol.isDescription() || iol.getM_Product_ID() == 0){
+					msgreturn = new StringBuilder("Invalid Receipt Line - ").append(iol);
+					return msgreturn.toString();
+				}	
+				MLandedCostAllocation lca = new MLandedCostAllocation (this, lc.getM_CostElement_ID());
+				lca.setM_Product_ID(iol.getM_Product_ID());
+				lca.setM_AttributeSetInstance_ID(iol.getM_AttributeSetInstance_ID());
+				lca.setM_InOutLine_ID(iol.getM_InOutLine_ID());
+				BigDecimal base = iol.getBase(lc.getLandedCostDistribution()); 
+				if (base.signum() == 0)
+					return "Base value is 0 - " + lc.getLandedCostDistribution();
+				lca.setBase(base);
+				lca.setAmt(getLineNetAmt());
+				// MZ Goodwill
+				// add set Qty from InOutLine
+				lca.setQty(iol.getMovementQty());
+				// end MZ
+				if (lca.save())
+					return "";
+				msgreturn = new StringBuilder("Cannot save single line Allocation = ").append(lc);
+				return msgreturn.toString();
+			}
+			//	Single Product
+			else if (lc.getM_Product_ID() != 0)
+			{
+				MLandedCostAllocation lca = new MLandedCostAllocation (this, lc.getM_CostElement_ID());
+				lca.setM_Product_ID(lc.getM_Product_ID());	//	No ASI
+				lca.setAmt(getLineNetAmt());
+				if (lc.getLandedCostDistribution().equals(MLandedCost.LANDEDCOSTDISTRIBUTION_Costs))
+				{
+					lca.setBase(getLineNetAmt());
+					lca.setQty(getLineNetAmt());
+				}
+				else
+				{
+					lca.setBase(getQtyInvoiced());
+					lca.setQty(getQtyInvoiced());
+				}
+				if (lca.save())
+					return "";
+				msgreturn = new StringBuilder("Cannot save Product Allocation = ").append(lc);
+				return msgreturn.toString();
+			}
+			else{
+				msgreturn = new StringBuilder("No Reference for ").append(lc);
+				return msgreturn.toString();
+			}	
+		}
+
+		//	*** Multiple Criteria ***
+		String LandedCostDistribution = lcs[0].getLandedCostDistribution();
+		int M_CostElement_ID = lcs[0].getM_CostElement_ID();
+		for (int i = 0; i < lcs.length; i++)
+		{
+			MLandedCost lc = lcs[i];
+			if (!LandedCostDistribution.equals(lc.getLandedCostDistribution()))
+				return "Multiple Landed Cost Rules must have consistent Landed Cost Distribution";
+			if (lc.getM_Product_ID() != 0 && lc.getM_InOut_ID() == 0 && lc.getM_InOutLine_ID() == 0)
+				return "Multiple Landed Cost Rules cannot directly allocate to a Product";
+			if (M_CostElement_ID != lc.getM_CostElement_ID())
+				return "Multiple Landed Cost Rules cannot different Cost Elements";
+		}
+		//	Create List
+		ArrayList<MInOutLine> list = new ArrayList<MInOutLine>();
+		for (int ii = 0; ii < lcs.length; ii++)
+		{
+			MLandedCost lc = lcs[ii];
+			if (lc.getM_InOut_ID() != 0 && lc.getM_InOutLine_ID() == 0)		//	entire receipt
+			{
+				MInOut ship = new MInOut (getCtx(), lc.getM_InOut_ID(), get_TrxName());
+				MInOutLine[] lines = ship.getLines();
+				for (int i = 0; i < lines.length; i++)
+				{
+					if (lines[i].isDescription()		//	decription or no product
+						|| lines[i].getM_Product_ID() == 0)
+						continue;
+					if (lc.getM_Product_ID() == 0		//	no restriction or product match
+						|| lc.getM_Product_ID() == lines[i].getM_Product_ID())
+						list.add(lines[i]);
+				}
+			}
+			else if (lc.getM_InOutLine_ID() != 0)	//	receipt line
+			{
+				MInOutLine iol = new MInOutLine (getCtx(), lc.getM_InOutLine_ID(), get_TrxName());
+				if (!iol.isDescription() && iol.getM_Product_ID() != 0)
+					list.add(iol);
+			}
+		}
+		if (list.size() == 0)
+			return "No Matching Lines (with Product)";
+		//	Calculate total & base
+		BigDecimal total = Env.ZERO;
+		for (int i = 0; i < list.size(); i++)
+		{
+			MInOutLine iol = (MInOutLine)list.get(i);
+			total = total.add(iol.getBase(LandedCostDistribution));
+		}
+		if (total.signum() == 0){
+			msgreturn = new StringBuilder("Total of Base values is 0 - ").append(LandedCostDistribution);
+			return msgreturn.toString();
+		}	
+		//	Create Allocations
+		for (int i = 0; i < list.size(); i++)
+		{
+			MInOutLine iol = (MInOutLine)list.get(i);
+			MLandedCostAllocation lca = new MLandedCostAllocation (this, lcs[0].getM_CostElement_ID());
+			lca.setM_Product_ID(iol.getM_Product_ID());
+			lca.setM_AttributeSetInstance_ID(iol.getM_AttributeSetInstance_ID());
+			lca.setM_InOutLine_ID(iol.getM_InOutLine_ID());
+			BigDecimal base = iol.getBase(LandedCostDistribution);
+			lca.setBase(base);
+			// MZ Goodwill
+			// add set Qty from InOutLine
+			lca.setQty(iol.getMovementQty());
+			// end MZ
+			if (base.signum() != 0)
+			{
+				double result = getLineNetAmt().multiply(base).doubleValue();
+				result /= total.doubleValue();
+				lca.setAmt(result, getParent().getC_Currency().getStdPrecision());
+			}
+			if (!lca.save()){
+				msgreturn = new StringBuilder("Cannot save line Allocation = ").append(lca);
+				return msgreturn.toString();
+			}	
+			inserted++;
+		}
+
+		if (log.isLoggable(Level.INFO)) log.info("Inserted " + inserted);
+		allocateLandedCostRounding();
+		return "";
+	}	//	allocate Costs
+
+	/**
+	 * 	Allocate Landed Cost - Enforce Rounding
+	 */
+	protected void allocateLandedCostRounding()
+	{
+		MLandedCostAllocation[] allocations = MLandedCostAllocation.getOfInvoiceLine(
+			getCtx(), getC_InvoiceLine_ID(), get_TrxName());
+		MLandedCostAllocation largestAmtAllocation = null;
+		BigDecimal allocationAmt = Env.ZERO;
+		for (int i = 0; i < allocations.length; i++)
+		{
+			MLandedCostAllocation allocation = allocations[i];
+			if (largestAmtAllocation == null
+				|| allocation.getAmt().compareTo(largestAmtAllocation.getAmt()) > 0)
+				largestAmtAllocation = allocation;
+			allocationAmt = allocationAmt.add(allocation.getAmt());
+		}
+		BigDecimal difference = getLineNetAmt().subtract(allocationAmt);
+		if (difference.signum() != 0)
+		{
+			largestAmtAllocation.setAmt(largestAmtAllocation.getAmt().add(difference));
+			largestAmtAllocation.saveEx();
+			if (log.isLoggable(Level.CONFIG)) log.config("Difference=" + difference
+				+ ", C_LandedCostAllocation_ID=" + largestAmtAllocation.getC_LandedCostAllocation_ID()
+				+ ", Amt" + largestAmtAllocation.getAmt());
+		}
+	}	//	allocateLandedCostRounding
+
+	// MZ Goodwill
+	/**
+	 * 	Get LandedCost of InvoiceLine
+	 * 	@param whereClause starting with AND
+	 * 	@return landedCost
+	 */
+	public MLandedCost[] getLandedCost (String whereClause)
+	{
+		ArrayList<MLandedCost> list = new ArrayList<MLandedCost>();
+		String sql = "SELECT * FROM C_LandedCost WHERE C_InvoiceLine_ID=? ";
+		if (whereClause != null)
+			sql += whereClause;
+		PreparedStatement pstmt = null;
+		ResultSet rs = null;
+		try
+		{
+			pstmt = DB.prepareStatement(sql, get_TrxName());
+			pstmt.setInt(1, getC_InvoiceLine_ID());
+			rs = pstmt.executeQuery();
+			while (rs.next())
+			{
+				MLandedCost lc = new MLandedCost(getCtx(), rs, get_TrxName());
+				list.add(lc);
+			}
+		}
+		catch (Exception e)
+		{
+			log.log(Level.SEVERE, "getLandedCost", e);
+		}
+		finally
+		{
+			DB.close(rs, pstmt);
+			rs = null;
+			pstmt = null;
+		}
+
+		//
+		MLandedCost[] landedCost = new MLandedCost[list.size()];
+		list.toArray(landedCost);
+		return landedCost;
+	}	//	getLandedCost
+
+	/**
+	 * 	Copy LandedCost From other InvoiceLine.
+	 *	@param otherInvoiceLine invoiceline
+	 *	@return number of lines copied
+	 */
+	public int copyLandedCostFrom (MInvoiceLine otherInvoiceLine)
+	{
+		if (otherInvoiceLine == null)
+			return 0;
+		MLandedCost[] fromLandedCosts = otherInvoiceLine.getLandedCost(null);
+		int count = 0;
+		for (int i = 0; i < fromLandedCosts.length; i++)
+		{
+			MLandedCost landedCost = new MLandedCost (getCtx(), 0, get_TrxName());
+			MLandedCost fromLandedCost = fromLandedCosts[i];
+			PO.copyValues (fromLandedCost, landedCost, fromLandedCost.getAD_Client_ID(), fromLandedCost.getAD_Org_ID());
+			landedCost.setC_InvoiceLine_ID(getC_InvoiceLine_ID());
+			landedCost.set_ValueNoCheck ("C_LandedCost_ID", I_ZERO);	// new
+			if (landedCost.save(get_TrxName()))
+				count++;
+		}
+		if (fromLandedCosts.length != count)
+			log.log(Level.SEVERE, "LandedCost difference - From=" + fromLandedCosts.length + " <> Saved=" + count);
+		return count;
+	}	//	copyLinesFrom
+	// end MZ
+
+	/**
+	 * @param rmaline
+	 */
+	public void setRMALine(MRMALine rmaLine)
+	{
+		// Check if this invoice is CreditMemo - teo_sarca [ 2804142 ]
+		if (!getParent().isCreditMemo())
+		{
+			throw new AdempiereException("InvoiceNotCreditMemo");
+		}
+		setAD_Org_ID(rmaLine.getAD_Org_ID());
+        setM_RMALine_ID(rmaLine.getM_RMALine_ID());
+        setDescription(rmaLine.getDescription());
+        setLine(rmaLine.getLine());
+        setC_Charge_ID(rmaLine.getC_Charge_ID());
+        setM_Product_ID(rmaLine.getM_Product_ID());
+        setC_UOM_ID(rmaLine.getC_UOM_ID());
+        setC_Tax_ID(rmaLine.getC_Tax_ID());
+        setPrice(rmaLine.getAmt());
+        BigDecimal qty = rmaLine.getQty();
+        if (rmaLine.getQtyInvoiced() != null)
+        	qty = qty.subtract(rmaLine.getQtyInvoiced());
+        setQty(qty);
+        setLineNetAmt();
+        setTaxAmt();
+        setLineTotalAmt(rmaLine.getLineNetAmt());
+        setC_Project_ID(rmaLine.getC_Project_ID());
+        setC_Activity_ID(rmaLine.getC_Activity_ID());
+        setC_Campaign_ID(rmaLine.getC_Campaign_ID());
+        
+     // iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+     setOtherDataProduct(getM_Product_ID());
+     //---
+	}
+
+	/**
+	 * @return matched qty
+	 */
+	public BigDecimal getMatchedQty()
+	{
+		String sql = "SELECT COALESCE(SUM("+MMatchInv.COLUMNNAME_Qty+"),0)"
+						+" FROM "+MMatchInv.Table_Name
+						+" WHERE "+MMatchInv.COLUMNNAME_C_InvoiceLine_ID+"=?"
+							+" AND "+MMatchInv.COLUMNNAME_Processed+"=?";
+		return DB.getSQLValueBDEx(get_TrxName(), sql, getC_InvoiceLine_ID(), true);
+	}
+
+	public void clearParent()
+	{
+		this.m_parent = null;
+	}
+
+	
+	// iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+	private void setOtherDataProduct(int M_Product_ID) {
+		MProduct prd = new MProduct(p_ctx, M_Product_ID, null);
+		set_ValueNoCheck("Name", prd.get_Value("Name"));
+		set_ValueNoCheck("Description", prd.get_Value("Description"));
+		set_ValueNoCheck("Help", prd.get_Value("Help"));
+		prd = null;
+	}
+	// iDempiereConsulting __29/11/2018 ------
+}	//	MInvoiceLine
diff -r e3e19d902c21 -r c8ad95bc8d60 idIta.modification.org.adempiere.base/src/org/compiere/model/MOrderLine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MOrderLine.java	gio gen 10 14:40:11 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MOrderLine.java	gio gen 10 17:32:03 2019 +0100
@@ -427,6 +427,10 @@
 		{
 			setM_Product_ID(m_product.getM_Product_ID());
 			setC_UOM_ID (m_product.getC_UOM_ID());
+			
+			//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+			setOtherDataProduct(m_product.getM_Product_ID());
+			//---
 		}
 		else
 		{
@@ -446,8 +450,14 @@
 	{
 		if (setUOM)
 			setProduct(MProduct.get(getCtx(), M_Product_ID));
-		else
+		//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+		//else
+		else {
 			super.setM_Product_ID (M_Product_ID);
+			setOtherDataProduct(M_Product_ID);
+		}
+		//iDempiereConsulting __29/11/2018 -------
+		
 		setM_AttributeSetInstance_ID(0);
 	}	//	setM_Product_ID
 	
@@ -462,6 +472,9 @@
 		if (C_UOM_ID != 0)
 			super.setC_UOM_ID(C_UOM_ID);
 		setM_AttributeSetInstance_ID(0);
+		//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+		setOtherDataProduct(getM_Product_ID());
+		//iDempiereConsulting __29/11/2018 -------
 	}	//	setM_Product_ID
 	
 	
@@ -1150,4 +1163,16 @@
 	{
 		this.m_parent = null;
 	}
+	
+	// iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
+	private void setOtherDataProduct(int M_Product_ID) {
+		if(M_Product_ID>0) {
+			MProduct prd = new MProduct(p_ctx, M_Product_ID, null);
+			set_ValueNoCheck("Name", prd.get_Value("Name"));
+			set_ValueNoCheck("Description", prd.get_Value("Description"));
+			set_ValueNoCheck("Help", prd.get_Value("Help"));
+			prd = null;
+		}
+	}
+	// iDempiereConsulting __29/11/2018 ------
 }	//	MOrderLine
diff -r e3e19d902c21 -r c8ad95bc8d60 idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java	gio gen 10 14:40:11 2019 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java	gio gen 10 17:32:03 2019 +0100
@@ -357,7 +357,7 @@
 		String selectSQL = null;
 		
 		//iDempiereConsulting/CNET __ 05/03/2018 -- Ricerca progressivo mancante del DocumentNO
-		setRecoveryProgressive(seq, trxName, po); //TODO da completare.....
+//		setRecoveryProgressive(seq, null, po); //TODO 07/12/2018 per ora da disabilitare.....
 		String calendarYearMonth = NoYearNorMonth;
 		int docOrg_ID = 0;
 		int next = -1;

```

------

### P1121 Special Editor - Modifica Qtà DDT, errore aggiornamento dati #Patch Data : 2018-12-21

Descrizione : Modifica gestione IVA indetraibile __UPD3

Classe Java : Doc_Invoice.java

```
diff -r e97b3cb10aa5 -r aadf426ae96e idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	gio dic 20 18:18:17 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	ven dic 21 10:05:50 2018 +0100
@@ -611,7 +611,7 @@
 							taxLine = new MTax(getCtx(), doctax_.getC_Tax_ID(), null);
 							cTaxParentID = taxLine.getParent_Tax_ID();
 							if(line.getC_Tax_ID()==cTaxParentID) {
-								amt = amt.add((doctax_.getAmount().divide(doctax_.getTaxBaseAmt(),2,RoundingMode.HALF_UP)).multiply(line.getAmtSource())); //OK  update
+								amt = amt.add((doctax_.getAmount().divide(doctax_.getTaxBaseAmt(),12,RoundingMode.HALF_UP)).multiply(line.getAmtSource())); //OK  update
 //								break;
 							} 
 						}

```

------

### * Data : 2018-12-20

Descrizione : Modifica gestione IVA indetraibile __UPD2

Classe Java : Doc_Invoice.java

 

```
diff -r eca6acb100bb -r 8a63d473bc9b idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	gio dic 20 12:35:39 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	gio dic 20 15:28:30 2018 +0100
@@ -611,7 +611,7 @@
 							taxLine = new MTax(getCtx(), doctax_.getC_Tax_ID(), null);
 							cTaxParentID = taxLine.getParent_Tax_ID();
 							if(line.getC_Tax_ID()==cTaxParentID) {
-								amt = amt.add((doctax_.getAmount().divide(doctax_.getTaxBaseAmt())).multiply(line.getAmtSource())); //OK  update
+								amt = amt.add((doctax_.getAmount().divide(doctax_.getTaxBaseAmt(),2,RoundingMode.HALF_UP)).multiply(line.getAmtSource())); //OK  update
 //								break;
 							} 
 						}

```

------

### P918 Plugin #IC Cod. Fiscale/ P. IVA - bug e correzioni #Patch Data : 2018-12-07

Descrizione : Commentato metodo per recupero buco_docNo

Classe Java : MSequence.java

```
diff -r 977c320df38d -r 2232b20f91f6 idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java	ven dic 07 11:52:47 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java	ven dic 07 12:04:24 2018 +0100
@@ -353,7 +353,7 @@
 		String selectSQL = null;
 		
 		//iDempiereConsulting/CNET __ 05/03/2018 -- Ricerca progressivo mancante del DocumentNO
-		setRecoveryProgressive(seq, null, po); //TODO da completare.....
+//		setRecoveryProgressive(seq, null, po); //TODO 07/12/2018 per ora da disabilitare.....
 		String calendarYearMonth = NoYearNorMonth;
 		int docOrg_ID = 0;
 		int next = -1;

```

------

### P1020 Data Documento su EM + Note su ODV + Copia Description su tu #Patch Data : 2018-11-30

Descrizione : Copy product_field "Name + Description + Help" UPD_2

Classe Java : MInOutLine.java

```
diff -r 12377ec12d5c -r ac4a2285642d idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java	ven nov 30 18:06:21 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOutLine.java	ven nov 30 18:24:40 2018 +0100
@@ -198,7 +198,9 @@
 				set_ValueNoCheck("M_Locator_ID", null);
 			
 			//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
-			setOtherDataProduct(getM_Product_ID());
+			set_ValueNoCheck("Name", oLine.get_Value("Name"));
+			set_ValueNoCheck("Description", oLine.get_Value("Description"));
+			set_ValueNoCheck("Help", oLine.get_Value("Help"));
 			//---
 		}
 		setC_Charge_ID(oLine.getC_Charge_ID());
diff -r 12377ec12d5c -r ac4a2285642d idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoiceLine.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoiceLine.java	ven nov 30 18:06:21 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoiceLine.java	ven nov 30 18:24:40 2018 +0100
@@ -248,7 +248,9 @@
 		setRRStartDate(oLine.getRRStartDate());
 		
 		// iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
-		setOtherDataProduct(getM_Product_ID());
+		set_ValueNoCheck("Name", oLine.get_Value("Name"));
+		set_ValueNoCheck("Description", oLine.get_Value("Description"));
+		set_ValueNoCheck("Help", oLine.get_Value("Help"));
 		//---
 	}	//	setOrderLine
 
@@ -325,7 +327,9 @@
 		setUser2_ID(sLine.getUser2_ID());
 		
 		// iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
-		setOtherDataProduct(getM_Product_ID());
+		set_ValueNoCheck("Name", sLine.get_Value("Name"));
+		set_ValueNoCheck("Description", sLine.get_Value("Description"));
+		set_ValueNoCheck("Help", sLine.get_Value("Help"));
 		//---
 	}	//	setShipLine
 

```

------

### P1020 Data Documento su EM + Note su ODV + Copia Description su tu #Patch Data : 2018-11-30

Descrizione : Copy product_field "Name + Description + Help"

Classe Java : MInOutLine.java

N°stringa : 200

```
//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
			setOtherDataProduct(getM_Product_ID());
			//---
		}
		setC_Charge_ID(oLine.getC_Charge_ID());
		setDescription(oLine.getDescription());
		setIsDescription(oLine.isDescription());
		//
		setC_Project_ID(oLine.getC_Project_ID());
		setC_ProjectPhase_ID(oLine.getC_ProjectPhase_ID());
		setC_ProjectTask_ID(oLine.getC_ProjectTask_ID());
		setC_Activity_ID(oLine.getC_Activity_ID());
		setC_Campaign_ID(oLine.getC_Campaign_ID());
		setAD_OrgTrx_ID(oLine.getAD_OrgTrx_ID());
		setUser1_ID(oLine.getUser1_ID());
		setUser2_ID(oLine.getUser2_ID());
	}	//	setOrderLine

	/**
	 * 	Set Invoice Line.
	 * 	Does not set Quantity!
	 *	@param iLine invoice line
	 *	@param M_Locator_ID locator
	 *	@param Qty qty only fo find suitable locator
	 */
	public void setInvoiceLine (MInvoiceLine iLine, int M_Locator_ID, BigDecimal Qty)
	{
		setC_OrderLine_ID(iLine.getC_OrderLine_ID());
		setLine(iLine.getLine());
		setC_UOM_ID(iLine.getC_UOM_ID());
		int M_Product_ID = iLine.getM_Product_ID();
		if (M_Product_ID == 0)
		{
			set_ValueNoCheck("M_Product_ID", null);
			set_ValueNoCheck("M_Locator_ID", null);
			set_ValueNoCheck("M_AttributeSetInstance_ID", null);
		}
		else
		{
			setM_Product_ID(M_Product_ID);
			setM_AttributeSetInstance_ID(iLine.getM_AttributeSetInstance_ID());
			if (M_Locator_ID == 0)
				setM_Locator_ID(Qty);	//	requires warehouse, product, asi
			else
				setM_Locator_ID(M_Locator_ID);
			
			//iDempiereConsulting __29/11/2018 --- Copy product_field "Name + Description + Help"
```

------

### P1020 Data Documento su EM + Note su ODV + Copia Description su tu #Patch Data : 2018-11-29

Descrizione : Copy field "Note"(Nota) - "PrivateNote"(Nota Video)

Classe Java : MInOut.java

```
diff -r 366a4324cab1 -r 9a9ce36fe0b5 idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java	mer nov 28 15:26:37 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java	gio nov 29 15:20:27 2018 +0100
@@ -401,6 +401,10 @@
 		setC_Project_ID(order.getC_Project_ID());
 		setDateOrdered(order.getDateOrdered());
 		setDescription(order.getDescription());
+		//iDempiereConsulting __29/11/2018 --- Copy field "Note"(Nota) - "PrivateNote"(Nota Video)
+		set_ValueNoCheck("Note", order.get_Value("Note"));
+		set_ValueNoCheck("PrivateNote", order.get_Value("PrivateNote"));
+		//iDempiereConsulting __29/11/2018 -------
 		setPOReference(order.getPOReference());
 		setSalesRep_ID(order.getSalesRep_ID());
 		setAD_OrgTrx_ID(order.getAD_OrgTrx_ID());
@@ -461,6 +465,10 @@
 		setC_Project_ID(invoice.getC_Project_ID());
 		setDateOrdered(invoice.getDateOrdered());
 		setDescription(invoice.getDescription());
+		//iDempiereConsulting __29/11/2018 --- Copy field "Note"(Nota) - "PrivateNote"(Nota Video)
+		set_ValueNoCheck("Note", invoice.get_Value("Note"));
+		set_ValueNoCheck("PrivateNote", invoice.get_Value("PrivateNote"));
+		//iDempiereConsulting __29/11/2018 -------
 		setPOReference(invoice.getPOReference());
 		setAD_OrgTrx_ID(invoice.getAD_OrgTrx_ID());
 		setUser1_ID(invoice.getUser1_ID());
@@ -526,6 +534,10 @@
 		setC_Project_ID(original.getC_Project_ID());
 		setDateOrdered(original.getDateOrdered());
 		setDescription(original.getDescription());
+		//iDempiereConsulting __29/11/2018 --- Copy field "Note"(Nota) - "PrivateNote"(Nota Video)
+		set_ValueNoCheck("Note", original.get_Value("Note"));
+		set_ValueNoCheck("PrivateNote", original.get_Value("PrivateNote"));
+		//iDempiereConsulting __29/11/2018 -------
 		setPOReference(original.getPOReference());
 		setSalesRep_ID(original.getSalesRep_ID());
 		setAD_OrgTrx_ID(original.getAD_OrgTrx_ID());
diff -r 366a4324cab1 -r 9a9ce36fe0b5 idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	mer nov 28 15:26:37 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	gio nov 29 15:20:27 2018 +0100
@@ -507,6 +507,10 @@
 		setC_PaymentTerm_ID(order.getC_PaymentTerm_ID());
 		setPOReference(order.getPOReference());
 		setDescription(order.getDescription());
+		//iDempiereConsulting __29/11/2018 --- Copy field "Note"(Nota) - "PrivateNote"(Nota Video)
+		set_ValueNoCheck("Note", order.get_Value("Note"));
+		set_ValueNoCheck("PrivateNote", order.get_Value("PrivateNote"));
+		//iDempiereConsulting __29/11/2018 -------
 		setDateOrdered(order.getDateOrdered());
 		//
 		setAD_OrgTrx_ID(order.getAD_OrgTrx_ID());
@@ -537,6 +541,10 @@
 		//
 		setPOReference(ship.getPOReference());
 		setDescription(ship.getDescription());
+		//iDempiereConsulting __29/11/2018 --- Copy field "Note"(Nota) - "PrivateNote"(Nota Video)
+		set_ValueNoCheck("Note", ship.get_Value("Note"));
+		set_ValueNoCheck("PrivateNote", ship.get_Value("PrivateNote"));
+		//iDempiereConsulting __29/11/2018 -------
 		setDateOrdered(ship.getDateOrdered());
 		//
 		setAD_OrgTrx_ID(ship.getAD_OrgTrx_ID());

```

------

### P1001043 Errore processo Seleziona fattura per pagamento #Patch Data : 2018-11-28

Descrizione : Gestione eccedenze di quantità non più da callout, ma al COMPLETE di MInOut

Classe Java : MInOut.java

```
diff -r 349601703f38 -r 366a4324cab1 idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java	mer nov 28 14:42:56 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInOut.java	mer nov 28 15:26:37 2018 +0100
@@ -1686,6 +1686,27 @@
 		MInOut dropShipment = createDropShipment();
 		if (dropShipment != null)
 			info.append(" - @DropShipment@: @M_InOut_ID@=").append(dropShipment.getDocumentNo());
+		
+		//iDempiereConsulting __ 28/11/2018 -- Per gestione eccedenze di quantità 
+		if(isSOTrx()) {
+			MInOutLine[] lines_tmp = getLines(true);
+			MOrderLine line_order = null;
+			for (MInOutLine outLine : lines_tmp) {
+				line_order = new MOrderLine (getCtx(), outLine.getC_OrderLine_ID(), get_TrxName());
+				
+				BigDecimal old = line_order.getQtyOrdered();
+				if (old.compareTo(line_order.getQtyDelivered()) == -1)
+				{
+					line_order.setQtyLostSales(line_order.getQtyOrdered().subtract(line_order.getQtyDelivered()));
+					line_order.setQtyOrdered(line_order.getQtyDelivered());
+					
+					line_order.saveEx(get_TrxName());
+				}
+			}
+		}
+		//iDempiereConsulting __ 28/11/2018 --------
+		
+		
 		//	User Validation
 		String valid = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_AFTER_COMPLETE);
 		if (valid != null)

```

------

### P1001026 UPGRADE 6.2 #Patch Data : 2018-11-27

Descrizione : Correzione transaction savePoint

Classe Java : MSequence.java

```
diff -r 3357c53d374b -r 4e1d473c7186 idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java	lun nov 26 11:12:00 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MSequence.java	mar nov 27 08:33:51 2018 +0100
@@ -353,7 +353,7 @@
 		String selectSQL = null;
 		
 		//iDempiereConsulting/CNET __ 05/03/2018 -- Ricerca progressivo mancante del DocumentNO
-		setRecoveryProgressive(seq, trxName, po); //TODO da completare.....
+		setRecoveryProgressive(seq, null, po); //TODO da completare.....
 		String calendarYearMonth = NoYearNorMonth;
 		int docOrg_ID = 0;
 		int next = -1;

```

------

### P1001026 UPGRADE 6.2 #Patch Data : 2018-11-26

Descrizione : Ricalcolo dei termini di pagamento al completamento della Fattura

Classe Java : MInvoice.java

 

```
diff -r 5b276f308bb8 -r 1638a63b7eba idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	lun nov 26 10:25:32 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	lun nov 26 10:27:03 2018 +0100
@@ -247,7 +247,7 @@
 	 */
 	public static MInvoice get (Properties ctx, int C_Invoice_ID)
 	{
-		Integer key = new Integer (C_Invoice_ID);
+		Integer key = Integer.valueOf(C_Invoice_ID);
 		MInvoice retValue = (MInvoice) s_cache.get (key);
 		if (retValue != null)
 			return retValue;
@@ -1047,7 +1047,7 @@
 			}
 		}
 
-		if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID))) {
+		if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID)) && !get_ValueAsBoolean("LIT_isNoCheckPaymentTerm")) {
 			recursiveCall = true;
 			try {
 				MPaymentTerm pt = new MPaymentTerm (getCtx(), getC_PaymentTerm_ID(), get_TrxName());
@@ -1741,6 +1741,12 @@
 
 		// Set the definite document number after completed (if needed)
 		setDefiniteDocumentNo();
+		
+		//iDempiereConsulting __ 16/11/2018 -- Se  "doctype.isOverwriteDateOnComplete()"='Y', allora ricalcolare i paySchedule
+		MDocType d_type = MDocType.get(getCtx(), getC_DocType_ID());
+		if (d_type.isOverwriteDateOnComplete())
+			createPaySchedule();
+		///
 
 		m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_BEFORE_COMPLETE);
 		if (m_processMsg != null)
@@ -2443,12 +2449,19 @@
 				
 				if (mPO[i].getM_InOutLine_ID() == 0)
 				{
-					if (!mPO[i].reverse(reversalDate)) 
+					if(mPO[i].isPosted())
 					{
-						m_processMsg = "Could not Reverse MatchPO";
-						return null;
+						if (!mPO[i].reverse(reversalDate)) 
+						{
+							m_processMsg = "Could not Reverse MatchPO";
+							return null;
+						}
+						addDocsPostProcess(new MMatchPO(Env.getCtx(), mPO[i].getReversal_ID(), get_TrxName()));
+					} 
+					else
+					{
+						mPO[i].deleteEx(true);						
 					}
-					addDocsPostProcess(new MMatchPO(Env.getCtx(), mPO[i].getReversal_ID(), get_TrxName()));
 				}
 				else
 				{
diff -r 5b276f308bb8 -r 1638a63b7eba idIta.modification.org.adempiere.base/src/org/compiere/model/MOrder.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MOrder.java	lun nov 26 10:25:32 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MOrder.java	lun nov 26 10:27:03 2018 +0100
@@ -18,6 +18,7 @@
 
 import java.io.File;
 import java.math.BigDecimal;
+import java.math.RoundingMode;
 import java.sql.ResultSet;
 import java.sql.Timestamp;
 import java.util.Hashtable;
@@ -1091,7 +1092,9 @@
 			}
 		}
 
-		if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID))) {
+		// iDempiereConsulting __ 28/07/2017 -- Check validate automatic payment Term
+		////if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID))) {
+		if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID)) && !get_ValueAsBoolean("LIT_isNoCheckPaymentTerm")) {
 			recursiveCall = true;
 			try {
 				MPaymentTerm pt = new MPaymentTerm (getCtx(), getC_PaymentTerm_ID(), get_TrxName());
@@ -1103,6 +1106,7 @@
 				recursiveCall = false;
 			}
 		}
+		// iDempiereConsulting __ 28/07/2017 ------ 
 
 		return true;
 	}	//	beforeSave
@@ -2186,7 +2190,7 @@
 			if (oLine.getQtyEntered().compareTo(oLine.getQtyOrdered()) != 0)
 				ioLine.setQtyEntered(MovementQty
 					.multiply(oLine.getQtyEntered())
-					.divide(oLine.getQtyOrdered(), 6, BigDecimal.ROUND_HALF_UP));
+					.divide(oLine.getQtyOrdered(), 6, RoundingMode.HALF_UP));
 			if (!ioLine.save(get_TrxName()))
 			{
 				m_processMsg = "Could not create Shipment Line";
@@ -2273,7 +2277,7 @@
 					iLine.setQtyEntered(iLine.getQtyInvoiced());
 				else
 					iLine.setQtyEntered(iLine.getQtyInvoiced().multiply(oLine.getQtyEntered())
-						.divide(oLine.getQtyOrdered(), 12, BigDecimal.ROUND_HALF_UP));
+						.divide(oLine.getQtyOrdered(), 12, RoundingMode.HALF_UP));
 				if (!iLine.save(get_TrxName()))
 				{
 					m_processMsg = "Could not create Invoice Line from Order Line";
diff -r 5b276f308bb8 -r 1638a63b7eba idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java	lun nov 26 10:25:32 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java	lun nov 26 10:27:03 2018 +0100
@@ -429,6 +429,9 @@
 	{
 		//@ iDempiereConsulting __ 24/07/2017 -- Check in payment Term
 		deleteOrderPaySchedule (order.getC_Order_ID(), order.get_TrxName());
+		if(!isAfterDelivery() && !get_ValueAsBoolean("AfterOrder"))
+			return true;
+		
 		//	Create Schedule
 		MOrderPaySchedule ops = null;
 		// iDempiereConsulting __ 31/07/2017 -- Payment term check 'VAT on First due date'

```

------

### P1000975 Termini di pagamento : crea scadenza nell'ordine #Patch Data : 2018-11-19

Descrizione : Ricalcolo dei termini di pagamento al completamento della Fattura

Classe Java : model/MInvoice.java

```
diff -r c3fcc591aa24 -r a1018cdc8020 idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	ven nov 16 16:42:11 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MInvoice.java	lun nov 19 18:56:21 2018 +0100
@@ -1047,7 +1047,7 @@
 			}
 		}
 
-		if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID))) {
+		if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID)) && !get_ValueAsBoolean("LIT_isNoCheckPaymentTerm")) {
 			recursiveCall = true;
 			try {
 				MPaymentTerm pt = new MPaymentTerm (getCtx(), getC_PaymentTerm_ID(), get_TrxName());
@@ -1741,6 +1741,12 @@
 
 		// Set the definite document number after completed (if needed)
 		setDefiniteDocumentNo();
+		
+		//iDempiereConsulting __ 16/11/2018 -- Se  "doctype.isOverwriteDateOnComplete()"='Y', allora ricalcolare i paySchedule
+		MDocType d_type = MDocType.get(getCtx(), getC_DocType_ID());
+		if (d_type.isOverwriteDateOnComplete())
+			createPaySchedule();
+		///
 
 		m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_BEFORE_COMPLETE);
 		if (m_processMsg != null)
diff -r c3fcc591aa24 -r a1018cdc8020 idIta.modification.org.adempiere.base/src/org/compiere/model/MOrder.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MOrder.java	ven nov 16 16:42:11 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MOrder.java	lun nov 19 18:56:21 2018 +0100
@@ -1092,7 +1092,9 @@
 			}
 		}
 
-		if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID))) {
+		// iDempiereConsulting __ 28/07/2017 -- Check validate automatic payment Term
+		////if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID))) {
+		if (! recursiveCall && (!newRecord && is_ValueChanged(COLUMNNAME_C_PaymentTerm_ID)) && !get_ValueAsBoolean("LIT_isNoCheckPaymentTerm")) {
 			recursiveCall = true;
 			try {
 				MPaymentTerm pt = new MPaymentTerm (getCtx(), getC_PaymentTerm_ID(), get_TrxName());
@@ -1104,6 +1106,7 @@
 				recursiveCall = false;
 			}
 		}
+		// iDempiereConsulting __ 28/07/2017 ------ 
 
 		return true;
 	}	//	beforeSave
diff -r c3fcc591aa24 -r a1018cdc8020 idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java	ven nov 16 16:42:11 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/model/MPaymentTerm.java	lun nov 19 18:56:21 2018 +0100
@@ -429,6 +429,9 @@
 	{
 		//@ iDempiereConsulting __ 24/07/2017 -- Check in payment Term
 		deleteOrderPaySchedule (order.getC_Order_ID(), order.get_TrxName());
+		if(!isAfterDelivery() && !get_ValueAsBoolean("AfterOrder"))
+			return true;
+		
 		//	Create Schedule
 		MOrderPaySchedule ops = null;
 		// iDempiereConsulting __ 31/07/2017 -- Payment term check 'VAT on First due date'

```

------

### P1001026 UPGRADE 6.2 #Patch Data : 2018-11-15

Descrizione : aChecchia: Move to openJdk 10

Classe Java : nothing

```
diff -r d9f1e384c8cc -r 78c8312288d0 idIta.modification.org.adempiere.base/META-INF/MANIFEST.MF
--- a/idIta.modification.org.adempiere.base/META-INF/MANIFEST.MF	ven nov 09 18:42:15 2018 +0100
+++ b/idIta.modification.org.adempiere.base/META-INF/MANIFEST.MF	gio nov 15 11:54:03 2018 +0100
@@ -2,5 +2,6 @@
 Bundle-ManifestVersion: 2
 Bundle-Name: idIta.modification.org.adempiere.base
 Bundle-SymbolicName: idIta.modification.org.adempiere.base;singleton:=true
+Require-Capability: osgi.ee;filter:="(&(osgi.ee=JavaSE)(version>=1.10))"
 Bundle-Version: 6.1.0.qualifier
 Fragment-Host: org.adempiere.base;bundle-version="6.1.0"

```

------

### P1001026 UPGRADE 6.2 #Patch Data : 2018-11-09

Descrizione : Modifica gestione IVA indetraibile

Classe Java : Doc_Invoice.java

```
diff -r 34d3917e4213 -r d9f1e384c8cc idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	ven nov 09 18:34:49 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	ven nov 09 18:42:15 2018 +0100
@@ -604,15 +604,17 @@
 						}
 					}
 					// iDempiereConsulting __ 31/05/2018 -- Gestione IVA indetraibile UPD
-					MTax taxLine = null;
-					int cTaxParentID = 0;
-					for (DocTax doctax_ : taxForAggregate) {
-						taxLine = new MTax(getCtx(), doctax_.getC_Tax_ID(), null);
-						cTaxParentID = taxLine.getParent_Tax_ID();
-						if(line.getC_Tax_ID()==cTaxParentID) {
-							amt = amt.add((doctax_.getAmount().divide(doctax_.getTaxBaseAmt())).multiply(line.getAmtSource())); //OK  update
-//							break;
-						} 
+					if(taxForAggregate != null) {
+						MTax taxLine = null;
+						int cTaxParentID = 0;
+						for (DocTax doctax_ : taxForAggregate) {
+							taxLine = new MTax(getCtx(), doctax_.getC_Tax_ID(), null);
+							cTaxParentID = taxLine.getParent_Tax_ID();
+							if(line.getC_Tax_ID()==cTaxParentID) {
+								amt = amt.add((doctax_.getAmount().divide(doctax_.getTaxBaseAmt())).multiply(line.getAmtSource())); //OK  update
+//								break;
+							} 
+						}
 					}
 					
 					//----

```

------

### P1000990 Timbro errore SAVE #Patch Data : 2018-11-05

Descrizione : Modifica gestione IVA indetraibile

Classe Java : Doc_Invoice.java

```
diff -r 21e061fa05b5 -r 31e05d1f63b3 idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java
--- a/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	ven nov 02 12:02:10 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/compiere/acct/Doc_Invoice.java	lun nov 05 10:17:08 2018 +0100
@@ -39,6 +39,7 @@
 import org.compiere.model.MInvoiceLine;
 import org.compiere.model.MLandedCostAllocation;
 import org.compiere.model.MOrderLandedCostAllocation;
+import org.compiere.model.MProduct;
 import org.compiere.model.MTax;
 import org.compiere.model.ProductCost;
 import org.compiere.model.X_M_Cost;
@@ -79,6 +80,10 @@
 	protected boolean			m_allLinesService = true;
 	/** All lines are product item		*/
 	protected boolean			m_allLinesItem = true;
+	
+	// iDempiereConsulting __ 31/05/2018 -- Gestione IVA indetraibile UPD
+	private ArrayList<DocTax>  taxForAggregate = null;
+	//
 
 	/**
 	 *  Load Specific Document Details
@@ -530,9 +535,6 @@
 		//  ** API
 		else if (getDocumentType().equals(DOCTYPE_APInvoice))
 		{
-			// iDempiereConsulting __ 17/05/2017 -- Gestione IVA indetraibile
-			BigDecimal aggregate = Env.ZERO;
-			//
 			BigDecimal grossAmt = getAmount(Doc.AMTTYPE_Gross);
 			BigDecimal serviceAmt = Env.ZERO;
 
@@ -546,7 +548,10 @@
 				FactLine tl = null;
 				if(m_taxes[i].getAPTaxType()==DocTax.ACCTTYPE_TaxExpense)
 				{
-					aggregate =  m_taxes[i].getAmount();
+					if(taxForAggregate==null)
+						taxForAggregate = new ArrayList<DocTax>();
+					
+					taxForAggregate.add(m_taxes[i]);
 				}
 				else
 				{
@@ -558,9 +563,6 @@
 				if (tl != null)
 					tl.setC_Tax_ID(m_taxes[i].getC_Tax_ID());
 			}
-			// iDempiereConsulting __ 31/05/2018 -- Gestione IVA indetraibile UPD
-			boolean isAddAggregate = false;
-			//
 			
 			//  Expense         DR
 			for (int i = 0; i < p_lines.length; i++)
@@ -601,11 +603,18 @@
 						}
 					}
 					// iDempiereConsulting __ 31/05/2018 -- Gestione IVA indetraibile UPD
-					if(!isAddAggregate){
-						amt = amt.add(aggregate); //OK  update
-						isAddAggregate = true;
+					MTax taxLine = null;
+					int cTaxParentID = 0;
+					for (DocTax doctax_ : taxForAggregate) {
+						taxLine = new MTax(getCtx(), doctax_.getC_Tax_ID(), null);
+						cTaxParentID = taxLine.getParent_Tax_ID();
+						if(line.getC_Tax_ID()==cTaxParentID) {
+							amt = amt.add((doctax_.getAmount().divide(doctax_.getTaxBaseAmt())).multiply(line.getAmtSource())); //OK  update
+//							break;
+						} 
 					}
-					//
+					
+					//----
 
 					fact.createLine (line, expense,
 						getC_Currency_ID(), amt, null);

```

------

### PNF730 Plugin Special Editor #IC - DEFAULT #Patch Data : 2018-10-29 

Descrizione : Promotion/CONAI calcolate prima, per includerle nel calcolo delle scadenze

Classe Java : PromotionValidator.java

```
diff -r 1cb2b3a6abcb -r dd1f790a4f89 idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionValidator.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionValidator.java	lun ott 29 12:26:34 2018 +0100
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionValidator.java	lun ott 29 14:57:14 2018 +0100
@@ -39,7 +39,7 @@
 
 	public String docValidate(PO po, int timing) {
 		if (po instanceof MOrder ) {
-			if (timing == TIMING_AFTER_PREPARE) {
+			if (timing == TIMING_BEFORE_PREPARE) {
 				MOrder order = (MOrder) po;
 				try {
 					PromotionRule.applyPromotions(order);
@@ -60,7 +60,7 @@
 		}
 		// iDempiereConsulting __ 14/09/2018 -- Promotion a livello di invoiceLine o livello di Invoice
 		if (po instanceof MInvoice ) {
-			if (timing == TIMING_AFTER_PREPARE) {
+			if (timing == TIMING_BEFORE_PREPARE) {
 				MInvoice invoice = (MInvoice) po;
 				try {
 					PromotionRuleInvoice.applyPromotions(invoice);

```

------

### PNF868 Task Post it - aggiungere where con gestione @@ #Patch Data : 2018-10-10

Descrizione : Promotion_CONAI update_4. Possibilità di calcolo tassa imponibile a livello riga Ordine/Fattura per CONAI

Classe Java : PromotionRule.java

```
diff -r 5a1d7de48d05 -r 3463ac7aea87 idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java	mer ott 10 09:58:44 2018 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRule.java	mer ott 10 11:23:43 2018 +0200
@@ -57,14 +57,25 @@
  */
 public class PromotionRule {
 	
-	private static TreeMap<Integer, List<MOrderLine>> listConsolid = new TreeMap<Integer, List<MOrderLine>>();
+	private static TreeMap<String, List<MOrderLine>> listConsolid = new TreeMap<String, List<MOrderLine>>();
 	private static List<MOrderLine> listCount_ol = null;
+	private static ArrayList<Integer> listTaxID = new ArrayList<Integer>(); // per recupero promotionID+listTAXID
 
 	public static void applyPromotions(MOrder order) throws Exception {
 		// iDempiereConsulting __ 23/05/2018 -- Promotion a livello di orderLine o livello di Order
 		boolean isConsolid;
+		boolean isVATCalcLine = false;
 		boolean isSupplPromotion = false;
 		MOrderLine[] lines_1 = order.getLines();
+		
+		//cacheReset
+		if(listConsolid!=null)
+			listConsolid.clear();
+		if(listCount_ol!=null)
+			listCount_ol.clear();
+		if(listTaxID!=null)
+			listTaxID.clear();
+		//
 
 		Map<Integer, List<Integer>> promotions = null;
 		Map<Integer, BigDecimal> orderLineQty = null;
@@ -202,8 +213,12 @@
 							} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_FlatDiscount)) {
 								discount = pr.getAmount();
 							} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_Percentage)) {
+								//iDempiereConsulting __ 09/10/2018 -- Calcolo o no dell'IVA a livello riga promozione/CONAI
+								//is VAT Calculated Line --- IVA calcolata nella linea
+								isVATCalcLine = pr.get_ValueAsBoolean("LIT_isVATCalcLine");
+								//
+								
 								// iDempiereConsulting __ 11/09/2018 -- Promotion CONAI
-
 								if(pr.get_ValueAsBoolean("LIT_isCalcWeight") && pr.get_ValueAsInt("M_Product_ID")>0) {
 									isConsolid = pr.get_ValueAsBoolean("LIT_isConsolidateLine");
 									BigDecimal promValue = BigDecimal.ZERO;
@@ -230,9 +245,7 @@
 									if (M_ProductPriceVendorBreak_ID > 0)
 										ppvb = new X_M_ProductPriceVendorBreak(Env.getCtx(), M_ProductPriceVendorBreak_ID, null);
 									
-
-									String descrProdOrdLine = mOrderLine.getProduct().getValue()+" ___ "+mOrderLine.getProduct().getName();
-									addCONAILine(order, ppvb, prodPrice, qtyCONAI, product_CONAI, pr.getM_Promotion(), descrProdOrdLine, isConsolid);
+									addCONAILine(order, mOrderLine, ppvb, prodPrice, qtyCONAI, product_CONAI, pr.getM_Promotion(), isVATCalcLine, isConsolid);
 								}
 								else
 									discount = pr.getAmount().divide(Env.ONEHUNDRED).multiply(totalPrice);
@@ -241,7 +254,8 @@
 
 							}
 							if (discount.signum() > 0) {
-								addDiscountLine(order, null, discount, Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+//								addDiscountLine(order, null, discount, Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+								addDiscountLine(order, mOrderLine, discount, Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 							}
 						} else {
 							int M_PromotionDistribution_ID = pr.getM_PromotionDistribution_ID();
@@ -305,9 +319,9 @@
 									if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_Percentage)) {
 										BigDecimal priceActual = mOrderLine.getPriceActual();
 										BigDecimal discount = priceActual.multiply(pr.getAmount().divide(Env.ONEHUNDRED));
-										addDiscountLine(order, mOrderLine, discount, qty, pr.getC_Charge_ID(), pr.getM_Promotion());
+										addDiscountLine(order, mOrderLine, discount, qty, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 									} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_FlatDiscount)) {
-										addDiscountLine(order, mOrderLine, pr.getAmount(), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+										addDiscountLine(order, mOrderLine, pr.getAmount(), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 									} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_AbsoluteAmount)) {
 										BigDecimal priceActual = mOrderLine.getPriceActual();
 										totalPrice = totalPrice.add(priceActual.multiply(qty));
@@ -321,7 +335,7 @@
 							}
 							if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_AbsoluteAmount))  {
 								if (pr.getAmount().compareTo(totalPrice) < 0) {
-									addDiscountLine(order, null, totalPrice.subtract(pr.getAmount()), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+									addDiscountLine(order, null, totalPrice.subtract(pr.getAmount()), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 								}
 							}
 						}
@@ -507,7 +521,7 @@
 							if(pr.get_ValueAsBoolean("LIT_isCalcWithVAT")) 
 								discount = pr.getAmount().divide(Env.ONEHUNDRED).multiply(order.getGrandTotal());
 							// iDempiereConsulting __ 05/09/2018 -- END
-							addDiscountLine(order, null, discount, Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+							addDiscountLine(order, null, discount, Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 						}
 					} else {
 						int M_PromotionDistribution_ID = pr.getM_PromotionDistribution_ID();
@@ -572,9 +586,9 @@
 									if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_Percentage)) {
 										BigDecimal priceActual = ol.getPriceActual();
 										BigDecimal discount = priceActual.multiply(pr.getAmount().divide(Env.ONEHUNDRED));
-										addDiscountLine(order, ol, discount, qty, pr.getC_Charge_ID(), pr.getM_Promotion());
+										addDiscountLine(order, ol, discount, qty, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 									} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_FlatDiscount)) {
-										addDiscountLine(order, ol, pr.getAmount(), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+										addDiscountLine(order, ol, pr.getAmount(), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 									} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_AbsoluteAmount)) {
 										BigDecimal priceActual = ol.getPriceActual();
 										totalPrice = totalPrice.add(priceActual.multiply(qty));
@@ -589,7 +603,7 @@
 						}
 						if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_AbsoluteAmount))  {
 							if (pr.getAmount().compareTo(totalPrice) < 0) {
-								addDiscountLine(order, null, totalPrice.subtract(pr.getAmount()), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+								addDiscountLine(order, null, totalPrice.subtract(pr.getAmount()), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 							}
 						}
 					}
@@ -598,37 +612,42 @@
 			
 			// iDempiereConsulting __ 20/09/2018 -- Promotion CONAI ....consolid
 			if(/*isConsolid &&*/ listConsolid!=null && !listConsolid.isEmpty()) {
-				List<MOrderLine> listOrders = (listConsolid.get(entry.getKey()));
-				MOrderLine tmp_line = listOrders.get(0);
-				BigDecimal priceStd = tmp_line.getPriceEntered();
-				BigDecimal priceList = tmp_line.getPriceList();
-				Integer proID_CONAI = tmp_line.getM_Product_ID();
-				Integer uomID_CONAI = tmp_line.getC_UOM_ID();
-				Function<MOrderLine, BigDecimal> totalMapper = orderLine -> orderLine.getQtyEntered();
-				BigDecimal tot_qty = listOrders.stream().map(totalMapper).reduce(BigDecimal.ZERO, BigDecimal::add);
 				
-				MOrderLine nol = new MOrderLine(order.getCtx(), 0, order.get_TrxName());
-				nol.setC_Order_ID(order.getC_Order_ID());
-				nol.setAD_Org_ID(order.getAD_Org_ID());
-				nol.setOrder(order);
-				nol.setM_Product_ID(proID_CONAI);
-				nol.setC_UOM_ID(uomID_CONAI);
-				nol.setQty(tot_qty);
-				nol.setPriceEntered(priceStd);
-				nol.setPriceActual(priceStd);
-				nol.setPriceList(priceList);
-				nol.setLineNetAmt();
-
-				nol.setDescription(tmp_line.getProduct().getDescription());
-				nol.set_ValueOfColumn("M_Promotion_ID", tmp_line.get_ValueAsInt("M_Promotion_ID"));
-				if (tmp_line.getC_Campaign_ID() > 0) {
-					nol.setC_Campaign_ID(tmp_line.getC_Campaign_ID());
+				for (Integer t_ID : listTaxID) {
+					String sum = entry.getKey().intValue()+"_"+t_ID.intValue();
+					List<MOrderLine> listOrders = (listConsolid.get(sum));
+					if(listOrders != null) {
+						MOrderLine tmp_line = listOrders.get(0);
+						BigDecimal priceStd = tmp_line.getPriceEntered();
+						BigDecimal priceList = tmp_line.getPriceList();
+						Integer proID_CONAI = tmp_line.getM_Product_ID();
+						Integer uomID_CONAI = tmp_line.getC_UOM_ID();
+						Function<MOrderLine, BigDecimal> totalMapper = orderLine -> orderLine.getQtyEntered();
+						BigDecimal tot_qty = listOrders.stream().map(totalMapper).reduce(BigDecimal.ZERO, BigDecimal::add);
+						
+						MOrderLine nol = new MOrderLine(order.getCtx(), 0, order.get_TrxName());
+						nol.setC_Order_ID(order.getC_Order_ID());
+						nol.setAD_Org_ID(order.getAD_Org_ID());
+						nol.setOrder(order);
+						nol.setM_Product_ID(proID_CONAI);
+						nol.setC_UOM_ID(uomID_CONAI);
+						nol.setQty(tot_qty);
+						nol.setC_Tax_ID(tmp_line.getC_Tax_ID());
+						nol.setPriceEntered(priceStd);
+						nol.setPriceActual(priceStd);
+						nol.setPriceList(priceList);
+						nol.setLineNetAmt();
+		
+						nol.setDescription(tmp_line.getProduct().getDescription());
+						nol.set_ValueOfColumn("M_Promotion_ID", tmp_line.get_ValueAsInt("M_Promotion_ID"));
+						if (tmp_line.getC_Campaign_ID() > 0) {
+							nol.setC_Campaign_ID(tmp_line.getC_Campaign_ID());
+						}
+						if (!nol.save())
+							throw new AdempiereException("Failed to add CONAI line to order");
+						
+					}
 				}
-				if (!nol.save())
-					throw new AdempiereException("Failed to add CONAI line to order");
-				
-				listConsolid.clear();
-				listCount_ol.clear();
 			}
 			//
 		}
@@ -636,52 +655,70 @@
 			listConsolid.clear();
 		if(listCount_ol!=null)
 			listCount_ol.clear();
+		if(listTaxID!=null)
+			listTaxID.clear();
 		// iDempiereConsulting __ 23/05/2018 -- END
 	}
 
-	private static void addCONAILine(MOrder order, X_M_ProductPriceVendorBreak prodPriceBreak, MProductPrice prodPrice2, BigDecimal qty,
-			MProduct product_CONAI, I_M_Promotion promotion, String descrFromProd_line, boolean isConsolid) throws Exception{
+	private static void addCONAILine(MOrder order, MOrderLine oLine, X_M_ProductPriceVendorBreak prodPriceBreak, MProductPrice prodPrice2, BigDecimal qty,
+			MProduct product_CONAI, I_M_Promotion promotion, boolean isVATCalcLine, boolean isConsolid) throws Exception{
 		MOrderLine nol = new MOrderLine(order.getCtx(), 0, order.get_TrxName());
 		nol.setC_Order_ID(order.getC_Order_ID());
 		nol.setOrder(order);
 		nol.setM_Product_ID(product_CONAI.getM_Product_ID());
 		nol.setC_UOM_ID(product_CONAI.getC_UOM_ID());
 		nol.setQty(qty);
-
+		
+		BigDecimal priceStd = BigDecimal.ZERO;
+		BigDecimal priceList = BigDecimal.ZERO;
 
 		if(prodPriceBreak!=null) {
-			nol.setPriceEntered(prodPriceBreak.getPriceStd());
-			nol.setPriceActual(prodPriceBreak.getPriceStd());
-			nol.setPriceList(prodPriceBreak.getPriceList());
+			priceStd = prodPriceBreak.getPriceStd();
+			priceList = prodPriceBreak.getPriceList();
 		}
 		else if(prodPrice2!=null) {
-			nol.setPriceEntered(prodPrice2.getPriceStd());
-			nol.setPriceActual(prodPrice2.getPriceStd());
-			nol.setPriceList(prodPrice2.getPriceList());
+			priceStd = prodPrice2.getPriceStd();
+			priceList = prodPrice2.getPriceList();
 		}
 		else
 			throw new AdempiereException("Failed to add CONAI line to order: No Price for "+product_CONAI.getName());
+		
+		//iDempiereConsulting __ 09/10/2018 -- Calcolo o no dell'IVA a livello riga promozione/CONAI
+		if(isVATCalcLine && oLine != null)
+			nol.setC_Tax_ID(oLine.getC_Tax_ID());
+		else
+			nol.setTax();
+		//iDempiereConsulting __ 09/10/2018 -- END
+		
+		nol.setPriceEntered(priceStd);
+		nol.setPriceActual(priceStd);
+		nol.setPriceList(priceList);
 
-		nol.setDiscount();
+//		nol.setDiscount();
 		nol.setLineNetAmt();
 
 		String description = product_CONAI.getName();
 
-		nol.setDescription(description + " --- " + descrFromProd_line);
+		nol.setDescription(description + " --- " + oLine.getProduct().getValue()+" ___ "+oLine.getProduct().getName());
 		nol.set_ValueOfColumn("M_Promotion_ID", promotion.getM_Promotion_ID());
 		if (promotion.getC_Campaign_ID() > 0) {
 			nol.setC_Campaign_ID(promotion.getC_Campaign_ID());
 		}
 
 		if(isConsolid) {
-			if(listConsolid.containsKey(promotion.getM_Promotion_ID())) {
-				(listConsolid.get(promotion.getM_Promotion_ID())).add(nol);
+			String sum = promotion.getM_Promotion_ID()+"_"+nol.getC_Tax_ID(); //key per recupero dati di consolida in unica riga per tasse diverse
+			if(listConsolid.containsKey(sum)) {
+				(listConsolid.get(sum)).add(nol);
 			}
 			else {
 				listCount_ol = new ArrayList<MOrderLine>();
 				listCount_ol.add(nol);
-				listConsolid.put(promotion.getM_Promotion_ID(), listCount_ol);
+				listConsolid.put(sum, listCount_ol);
 			}
+//			if(listTaxID==null)
+//				listTaxID = new ArrayList<Integer>();
+			if(!listTaxID.contains(nol.getC_Tax_ID()))
+				listTaxID.add(nol.getC_Tax_ID());
 		}
 		else {
 			if (!nol.save())
@@ -690,7 +727,7 @@
 	}
 
 	private static void addDiscountLine(MOrder order, MOrderLine ol, BigDecimal discount,
-			BigDecimal qty, int C_Charge_ID, I_M_Promotion promotion) throws Exception {
+			BigDecimal qty, int C_Charge_ID, I_M_Promotion promotion, boolean isVATCalcLine) throws Exception {
 		MOrderLine nol = new MOrderLine(order.getCtx(), 0, order.get_TrxName());
 		nol.setC_Order_ID(order.getC_Order_ID());
 		nol.setOrder(order);
@@ -698,6 +735,12 @@
 		nol.setQty(qty);
 		if (discount.scale() > 2)
 			discount = discount.setScale(2, BigDecimal.ROUND_HALF_UP);
+		
+		//iDempiereConsulting __ 09/10/2018 -- Calcolo o no dell'IVA a livello riga promozione/CONAI
+		if(isVATCalcLine && ol != null) 
+			nol.setC_Tax_ID(ol.getC_Tax_ID());
+		//iDempiereConsulting __ 09/10/2018 -- END
+		
 		nol.setPriceEntered(discount.negate());
 		nol.setPriceActual(discount.negate());
 		if (ol != null && Integer.toString(ol.getLine()).endsWith("0")) {
diff -r 5a1d7de48d05 -r 3463ac7aea87 idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRuleInvoice.java
--- a/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRuleInvoice.java	mer ott 10 09:58:44 2018 +0200
+++ b/idIta.modification.org.adempiere.base/src/org/adempiere/model/PromotionRuleInvoice.java	mer ott 10 11:23:43 2018 +0200
@@ -57,14 +57,25 @@
  */
 public class PromotionRuleInvoice {
 	
-	private static TreeMap<Integer, List<MInvoiceLine>> listConsolid = new TreeMap<Integer, List<MInvoiceLine>>();
+	private static TreeMap<String, List<MInvoiceLine>> listConsolid = new TreeMap<String, List<MInvoiceLine>>();
 	private static List<MInvoiceLine> listCount_il = null;
+	private static ArrayList<Integer> listTaxID = new ArrayList<Integer>(); // per recupero promotionID+listTAXID
 
 	public static void applyPromotions(MInvoice invoice) throws Exception {
 		// iDempiereConsulting __ 23/05/2018 -- Promotion a livello di invoiceLine o livello di Invoice
 		boolean isConsolid;
+		boolean isVATCalcLine = false;
 		boolean isSupplPromotion = false;
 		MInvoiceLine[] lines_1 = invoice.getLines();
+		
+		//cacheReset
+		if(listConsolid!=null)
+			listConsolid.clear();
+		if(listCount_il!=null)
+			listCount_il.clear();
+		if(listTaxID!=null)
+			listTaxID.clear();
+		//
 
 		Map<Integer, List<Integer>> promotions = null;
 		Map<Integer, BigDecimal> invoiceLineQty = null;
@@ -200,8 +211,12 @@
 							} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_FlatDiscount)) {
 								discount = pr.getAmount();
 							} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_Percentage)) {
+								//iDempiereConsulting __ 09/10/2018 -- Calcolo o no dell'IVA a livello riga promozione/CONAI
+								//is VAT Calculated Line --- IVA calcolata nella linea
+								isVATCalcLine = pr.get_ValueAsBoolean("LIT_isVATCalcLine");
+								//
+								
 								// iDempiereConsulting __ 11/09/2018 -- Promotion CONAI
-
 								if(pr.get_ValueAsBoolean("LIT_isCalcWeight") && pr.get_ValueAsInt("M_Product_ID")>0) {
 									isConsolid = pr.get_ValueAsBoolean("LIT_isConsolidateLine");
 									BigDecimal promValue = BigDecimal.ZERO;
@@ -227,10 +242,8 @@
 													new Object[]{priceListVersion.getM_PriceList_Version_ID(), mInvoiceLine.getC_Invoice().getC_BPartner_ID(), M_Product_ID});
 									if (M_ProductPriceVendorBreak_ID > 0)
 										ppvb = new X_M_ProductPriceVendorBreak(Env.getCtx(), M_ProductPriceVendorBreak_ID, null);
-									
 
-									String descrProdInvLine = mInvoiceLine.getProduct().getValue()+" ___ "+mInvoiceLine.getProduct().getName();
-									addCONAILine(invoice, ppvb, prodPrice, qtyCONAI, product_CONAI, pr.getM_Promotion(), descrProdInvLine, isConsolid);
+									addCONAILine(invoice, mInvoiceLine, ppvb, prodPrice, qtyCONAI, product_CONAI, pr.getM_Promotion(), isVATCalcLine, isConsolid);
 								}
 								else
 									discount = pr.getAmount().divide(Env.ONEHUNDRED).multiply(totalPrice);
@@ -239,7 +252,7 @@
 
 							}
 							if (discount.signum() > 0) {
-								addDiscountLine(invoice, null, discount, Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+								addDiscountLine(invoice, mInvoiceLine, discount, Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 							}
 						} else {
 							int M_PromotionDistribution_ID = pr.getM_PromotionDistribution_ID();
@@ -303,9 +316,9 @@
 									if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_Percentage)) {
 										BigDecimal priceActual = mInvoiceLine.getPriceActual();
 										BigDecimal discount = priceActual.multiply(pr.getAmount().divide(Env.ONEHUNDRED));
-										addDiscountLine(invoice, mInvoiceLine, discount, qty, pr.getC_Charge_ID(), pr.getM_Promotion());
+										addDiscountLine(invoice, mInvoiceLine, discount, qty, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 									} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_FlatDiscount)) {
-										addDiscountLine(invoice, mInvoiceLine, pr.getAmount(), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+										addDiscountLine(invoice, mInvoiceLine, pr.getAmount(), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 									} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_AbsoluteAmount)) {
 										BigDecimal priceActual = mInvoiceLine.getPriceActual();
 										totalPrice = totalPrice.add(priceActual.multiply(qty));
@@ -319,7 +332,7 @@
 							}
 							if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_AbsoluteAmount))  {
 								if (pr.getAmount().compareTo(totalPrice) < 0) {
-									addDiscountLine(invoice, null, totalPrice.subtract(pr.getAmount()), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+									addDiscountLine(invoice, null, totalPrice.subtract(pr.getAmount()), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 								}
 							}
 						}
@@ -504,7 +517,7 @@
 							if(pr.get_ValueAsBoolean("LIT_isCalcWithVAT")) 
 								discount = pr.getAmount().divide(Env.ONEHUNDRED).multiply(invoice.getGrandTotal());
 							// iDempiereConsulting __ 05/09/2018 -- END
-							addDiscountLine(invoice, null, discount, Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+							addDiscountLine(invoice, null, discount, Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 						}
 					} else {
 						int M_PromotionDistribution_ID = pr.getM_PromotionDistribution_ID();
@@ -569,9 +582,9 @@
 									if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_Percentage)) {
 										BigDecimal priceActual = il.getPriceActual();
 										BigDecimal discount = priceActual.multiply(pr.getAmount().divide(Env.ONEHUNDRED));
-										addDiscountLine(invoice, il, discount, qty, pr.getC_Charge_ID(), pr.getM_Promotion());
+										addDiscountLine(invoice, il, discount, qty, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 									} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_FlatDiscount)) {
-										addDiscountLine(invoice, il, pr.getAmount(), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+										addDiscountLine(invoice, il, pr.getAmount(), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 									} else if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_AbsoluteAmount)) {
 										BigDecimal priceActual = il.getPriceActual();
 										totalPrice = totalPrice.add(priceActual.multiply(qty));
@@ -586,7 +599,7 @@
 						}
 						if (pr.getRewardType().equals(MPromotionReward.REWARDTYPE_AbsoluteAmount))  {
 							if (pr.getAmount().compareTo(totalPrice) < 0) {
-								addDiscountLine(invoice, null, totalPrice.subtract(pr.getAmount()), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion());
+								addDiscountLine(invoice, null, totalPrice.subtract(pr.getAmount()), Env.ONE, pr.getC_Charge_ID(), pr.getM_Promotion(), isVATCalcLine);
 							}
 						}
 					}
@@ -594,35 +607,41 @@
 			}
 			// iDempiereConsulting __ 20/09/2018 -- Promotion CONAI ....consolid
 			if(/*isConsolid &&*/ listConsolid!=null && !listConsolid.isEmpty()) {
-				List<MInvoiceLine> listInvoices = (listConsolid.get(entry.getKey()));
-				MInvoiceLine tmp_line = listInvoices.get(0);
-				BigDecimal priceStd = tmp_line.getPriceEntered();
-				BigDecimal priceList = tmp_line.getPriceList();
-				Integer proID_CONAI = tmp_line.getM_Product_ID();
-				Integer uomID_CONAI = tmp_line.getC_UOM_ID();
-				Function<MInvoiceLine, BigDecimal> totalMapper = invoiceLine -> invoiceLine.getQtyEntered();
-				BigDecimal tot_qty = listInvoices.stream().map(totalMapper).reduce(BigDecimal.ZERO, BigDecimal::add);
-				
-				MInvoiceLine nil = new MInvoiceLine(invoice.getCtx(), 0, invoice.get_TrxName());
-				nil.setC_Invoice_ID(invoice.getC_Invoice_ID());
-				nil.setAD_Org_ID(invoice.getAD_Org_ID());
-				nil.setInvoice(invoice);
-				nil.setM_Product_ID(proID_CONAI);
-				nil.setC_UOM_ID(uomID_CONAI);
-				nil.setQty(tot_qty);
-				nil.setPriceEntered(priceStd);
-				nil.setPriceActual(priceStd);
-				nil.setPriceList(priceList);
-				nil.setLineNetAmt();
+
+				for (Integer t_ID : listTaxID) {
+					String sum = entry.getKey().intValue()+"_"+t_ID.intValue();
+					List<MInvoiceLine> listInvoices = (listConsolid.get(sum));
+					if(listInvoices != null) {
+						MInvoiceLine tmp_line = listInvoices.get(0);
+						BigDecimal priceStd = tmp_line.getPriceEntered();
+						BigDecimal priceList = tmp_line.getPriceList();
+						Integer proID_CONAI = tmp_line.getM_Product_ID();
+						Integer uomID_CONAI = tmp_line.getC_UOM_ID();
+						Function<MInvoiceLine, BigDecimal> totalMapper = invoiceLine -> invoiceLine.getQtyEntered();
+						BigDecimal tot_qty = listInvoices.stream().map(totalMapper).reduce(BigDecimal.ZERO, BigDecimal::add);
 
-				nil.setDescription(tmp_line.getProduct().getDescription());
-				nil.set_ValueOfColumn("M_Promotion_ID", tmp_line.get_ValueAsInt("M_Promotion_ID"));
-				if (tmp_line.getC_Campaign_ID() > 0) {
-					nil.setC_Campaign_ID(tmp_line.getC_Campaign_ID());
+						MInvoiceLine nil = new MInvoiceLine(invoice.getCtx(), 0, invoice.get_TrxName());
+						nil.setC_Invoice_ID(invoice.getC_Invoice_ID());
+						nil.setAD_Org_ID(invoice.getAD_Org_ID());
+						nil.setInvoice(invoice);
+						nil.setM_Product_ID(proID_CONAI);
+						nil.setC_UOM_ID(uomID_CONAI);
+						nil.setQty(tot_qty);
+						nil.setC_Tax_ID(tmp_line.getC_Tax_ID());
+						nil.setPriceEntered(priceStd);
+						nil.setPriceActual(priceStd);
+						nil.setPriceList(priceList);
+						nil.setLineNetAmt();
+
+						nil.setDescription(tmp_line.getProduct().getDescription());
+						nil.set_ValueOfColumn("M_Promotion_ID", tmp_line.get_ValueAsInt("M_Promotion_ID"));
+						if (tmp_line.getC_Campaign_ID() > 0) {
+							nil.setC_Campaign_ID(tmp_line.getC_Campaign_ID());
+						}
+						if (!nil.save())
+							throw new AdempiereException("Failed to add CONAI line to invoice");
+					}
 				}
-				if (!nil.save())
-					throw new AdempiereException("Failed to add CONAI line to invoice");
-				
 			}
 			//
 		}
@@ -630,11 +649,13 @@
 			listConsolid.clear();
 		if(listCount_il!=null)
 			listCount_il.clear();
+		if(listTaxID!=null)
+			listTaxID.clear();
 		// iDempiereConsulting __ 23/05/2018 -- END
 	}
 
-	private static void addCONAILine(MInvoice invoice, X_M_ProductPriceVendorBreak prodPriceBreak, MProductPrice prodPrice2, BigDecimal qty,
-			MProduct product_CONAI, I_M_Promotion promotion, String descrFromProd_line, boolean isConsolid) throws Exception{
+	private static void addCONAILine(MInvoice invoice, MInvoiceLine iLine, X_M_ProductPriceVendorBreak prodPriceBreak, MProductPrice prodPrice2, BigDecimal qty,
+			MProduct product_CONAI, I_M_Promotion promotion, boolean isVATCalcLine, boolean isConsolid) throws Exception{
 		MInvoiceLine nil = new MInvoiceLine(invoice.getCtx(), 0, invoice.get_TrxName());
 		nil.setC_Invoice_ID(invoice.getC_Invoice_ID());
 		nil.setAD_Org_ID(invoice.getAD_Org_ID());
@@ -643,25 +664,36 @@
 		nil.setC_UOM_ID(product_CONAI.getC_UOM_ID());
 		nil.setQty(qty);
 
+		BigDecimal priceStd = BigDecimal.ZERO;
+		BigDecimal priceList = BigDecimal.ZERO;
 
 		if(prodPriceBreak!=null) {
-			nil.setPriceEntered(prodPriceBreak.getPriceStd());
-			nil.setPriceActual(prodPriceBreak.getPriceStd());
-			nil.setPriceList(prodPriceBreak.getPriceList());
+			priceStd = prodPriceBreak.getPriceStd();
+			priceList = prodPriceBreak.getPriceList();
 		}
 		else if(prodPrice2!=null) {
-			nil.setPriceEntered(prodPrice2.getPriceStd());
-			nil.setPriceActual(prodPrice2.getPriceStd());
-			nil.setPriceList(prodPrice2.getPriceList());
+			priceStd = prodPrice2.getPriceStd();
+			priceList = prodPrice2.getPriceList();
 		}
 		else
 			throw new AdempiereException("Failed to add CONAI line to invoice: No Price for "+product_CONAI.getName());
 
+		//iDempiereConsulting __ 09/10/2018 -- Calcolo o no dell'IVA a livello riga promozione/CONAI
+		if(isVATCalcLine && iLine != null)
+			nil.setC_Tax_ID(iLine.getC_Tax_ID());
+		else
+			nil.setTax();
+		//iDempiereConsulting __ 09/10/2018 -- END
+		
+		nil.setPriceEntered(priceStd);
+		nil.setPriceActual(priceStd);
+		nil.setPriceList(priceList);
+
 		nil.setLineNetAmt();
 
 		String description = product_CONAI.getName();
 
-		nil.setDescription(description + " --- " + descrFromProd_line);
+		nil.setDescription(description + " --- " + iLine.getProduct().getValue()+" ___ "+iLine.getProduct().getName());
 		nil.set_ValueOfColumn("M_Promotion_ID", promotion.getM_Promotion_ID());
 		if (promotion.getC_Campaign_ID() > 0) {
 			nil.setC_Campaign_ID(promotion.getC_Campaign_ID());
@@ -669,14 +701,18 @@
 
 
 		if(isConsolid) {
-			if(listConsolid.containsKey(promotion.getM_Promotion_ID())) {
-				(listConsolid.get(promotion.getM_Promotion_ID())).add(nil);
+			String sum = promotion.getM_Promotion_ID()+"_"+nil.getC_Tax_ID(); //key per recupero dati di consolida in unica riga per tasse diverse
+			if(listConsolid.containsKey(sum)) {
+				(listConsolid.get(sum)).add(nil);
 			}
 			else {
 				listCount_il = new ArrayList<MInvoiceLine>();
 				listCount_il.add(nil);
-				listConsolid.put(promotion.getM_Promotion_ID(), listCount_il);
+				listConsolid.put(sum, listCount_il);
 			}
+			
+			if(!listTaxID.contains(nil.getC_Tax_ID()))
+				listTaxID.add(nil.getC_Tax_ID());
 				
 		}
 		else {
@@ -686,7 +722,7 @@
 	}
 
 	private static void addDiscountLine(MInvoice invoice, MInvoiceLine il, BigDecimal discount,
-			BigDecimal qty, int C_Charge_ID, I_M_Promotion promotion) throws Exception {
+			BigDecimal qty, int C_Charge_ID, I_M_Promotion promotion, boolean isVATCalcLine) throws Exception {
 		MInvoiceLine nil = new MInvoiceLine(invoice.getCtx(), 0, invoice.get_TrxName());
 		nil.setC_Invoice_ID(invoice.getC_Invoice_ID());
 		nil.setAD_Org_ID(invoice.getAD_Org_ID());
@@ -695,6 +731,12 @@
 		nil.setQty(qty);
 		if (discount.scale() > 2)
 			discount = discount.setScale(2, BigDecimal.ROUND_HALF_UP);
+		
+		//iDempiereConsulting __ 09/10/2018 -- Calcolo o no dell'IVA a livello riga promozione/CONAI
+		if(isVATCalcLine && il != null) 
+			nil.setC_Tax_ID(il.getC_Tax_ID());
+		//iDempiereConsulting __ 09/10/2018 -- END
+		
 		nil.setPriceEntered(discount.negate());
 		nil.setPriceActual(discount.negate());
 		if (il != null && Integer.toString(il.getLine()).endsWith("0")) {

```

