title: "MRP"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 500
pre: "<b></b>"
---



RP.351

Prima fa degli update per evitare incongruenze
UPDATE M_Replenish SET Level_Max = Level_Min WHERE Level_Max < Level_Min
UPDATE M_Product_PO .append(" SET Order_Min = 1 WHERE Order_Min IS NULL OR Order_Min < 1"


## Insert  se ho il fornitore preferenziale


INSERT INTO 
T_Replenish 
(AD_PInstance_ID, M_Warehouse_ID, M_Product_ID, AD_Client_ID, AD_Org_ID, ReplenishType, Level_Min, Level_Max, C_BPartner_ID, Order_Min, Order_Pack, QtyToOrder, ReplenishmentCreate, ParameterDefault, DatePromised) SELECT 1093606, r.M_Warehouse_ID, r.M_Product_ID, r.AD_Client_ID, r.AD_Org_ID, r.ReplenishType, r.Level_Min, r.Level_Max, po.C_BPartner_ID, po.Order_Min, po.Order_Pack, 0, null, lst.LIT_IsScheduledPO||lst.LIT_IsQtyonHand||lst.LIT_IsReserved||lst.LIT_IsOrdered||LIT_IsOrderMin, '2020-10-16 00:00:00.0' 
FROM M_Replenish r INNER JOIN M_Product_PO po ON (r.M_Product_ID=po.M_Product_ID)  INNER JOIN M_Product p ON (p.M_Product_ID=po.M_Product_ID)  LEFT JOIN LIT_MRPStrategy lst ON r.LIT_MRPStrategy_ID = lst.LIT_MRPStrategy_ID WHERE po.IsCurrentVendor='Y' AND r.ReplenishType<>'0' AND po.IsActive='Y' AND r.IsActive='Y' AND r.M_Warehouse_ID=1000000 AND r.M_Product_ID IN (1009879)


## Inserimento se non ho il fornitore preferenziale

INSERT INTO T_Replenish (AD_PInstance_ID, M_Warehouse_ID, M_Product_ID, AD_Client_ID, AD_Org_ID, ReplenishType, Level_Min, Level_Max, C_BPartner_ID, Order_Min, Order_Pack, QtyToOrder, ReplenishmentCreate, ParameterDefault) SELECT 1093611, r.M_Warehouse_ID, r.M_Product_ID, r.AD_Client_ID, r.AD_Org_ID, r.ReplenishType, r.Level_Min, r.Level_Max, 0, 1, 1, 0, null, lst.LIT_IsScheduledPO||lst.LIT_IsQtyonHand||lst.LIT_IsReserved||lst.LIT_IsOrdered||LIT_IsOrderMin FROM M_Replenish r  INNER JOIN M_Product p ON (p.M_Product_ID=r.M_Product_ID)  LEFT JOIN LIT_MRPStrategy lst ON r.LIT_MRPStrategy_ID = lst.LIT_MRPStrategy_ID WHERE r.ReplenishType<>'0' AND r.IsActive='Y' AND r.M_Warehouse_ID=1000000 AND NOT EXISTS (SELECT * FROM T_Replenish t WHERE r.M_Product_ID=t.M_Product_ID AND r.M_Product_ID IN (1002583)) AND r.M_Product_ID IN (1002583)


## Aggiornamento  Qtyonhand 

UPDATE T_Replenish t SET QtyOnHand = (SELECT COALESCE(SUM(QtyOnHand),0) FROM M_StorageOnHand s, M_Locator l WHERE t.M_Product_ID=s.M_Product_ID AND l.M_Locator_ID=s.M_Locator_ID AND l.M_Warehouse_ID=t.M_Warehouse_ID),QtyReserved = COALESCE((SELECT CASE WHEN pl.isendproduct='Y' THEN SUM(pl.MovementQty) ELSE (sum(pl.MovementQty)*-1) END as MovementQty FROM M_Production p INNER JOIN M_ProductionLine pl ON p.M_Production_ID=pl.M_Production_ID INNER JOIN M_Locator loc ON (pl.LIT_M_LocatorFrom_ID=loc.M_Locator_ID) INNER JOIN M_Warehouse wp ON (loc.M_Warehouse_ID=wp.M_Warehouse_ID) WHERE t.M_Product_ID=pl.M_Product_ID AND p.DocStatus='IP' AND p.C_Order_ID IS NULL AND p.DatePromised<='2020-10-16 00:00:00.0'  group by pl.isendproduct),0),QtyOrdered = (SELECT COALESCE(sum(ol.QtyReserved),0) FROM C_Order o INNER JOIN C_OrderLine ol ON (o.C_Order_ID=ol.C_Order_ID) INNER JOIN C_DocType dt ON (o.C_DocType_ID=dt.C_DocType_ID) INNER JOIN M_Warehouse w ON (ol.M_Warehouse_ID=w.M_Warehouse_ID) INNER JOIN C_BPartner bp  ON (o.C_BPartner_ID=bp.C_BPartner_ID) WHERE t.M_Product_ID=ol.M_Product_ID AND ol.QtyReserved<>0 AND t.M_Warehouse_ID=ol.M_Warehouse_ID AND o.IsSOTrx='N' AND ol.DatePromised<='2020-10-16 00:00:00.0') WHERE t.M_Product_ID IN (1002583)


Qtyonhand = 2501  OK
Ordinato  nato 
62406  // 

## Delete inactive M_Product

###  TIPO 1 - 

## TIPO 2 - 

##  		//	Set Minimum / Maximum Maintain Level
		//	X_M_Replenish.REPLENISHTYPE_ReorderBelowMinimumLevel
		sql = new StringBuilder("UPDATE T_Replenish");
		sql.append(" SET QtyToOrder = CASE "
				+ "WHEN  Substr(ParameterDefault,5)='N' and Level_Min  = 0 and order_pack=0 THEN (QtyonHand - QtyReserved + QtyOrdered)*-1 "
				+ "WHEN  Substr(ParameterDefault,5)='N' and Level_Min  > (QtyonHand - QtyReserved + QtyOrdered)*-1  and order_pack=0  THEN Level_min "
				+ "WHEN  Substr(ParameterDefault,5)='N' and Level_Min  > (QtyonHand - QtyReserved + QtyOrdered)*-1  and order_pack>0  THEN order_pack* ceiling(Level_min/Order_pack) "
				+ "WHEN  Substr(ParameterDefault,5)='Y' and Level_Min  = 0 and (QtyonHand - QtyReserved + QtyOrdered)*-1 <  Order_Min and  Order_pack=0 THEN Order_Min "
				+ "WHEN  Substr(ParameterDefault,5)='Y' and Level_Min  = 0 and (QtyonHand - QtyReserved + QtyOrdered)*-1 >= Order_Min and  Order_pack=0 THEN (QtyonHand - QtyReserved + QtyOrdered)*-1 "
				+ "WHEN  Substr(ParameterDefault,5)='Y' and Level_Min  = 0 and (QtyonHand - QtyReserved + QtyOrdered)*-1 <= Order_Min and  Order_pack>0 THEN Order_Min "
				+ "WHEN  Substr(ParameterDefault,5)='Y' and Level_Min  = 0 and (QtyonHand - QtyReserved + QtyOrdered)*-1 >= Order_Min and  Order_pack>0 THEN Order_Min +  order_pack* ceiling(((QtyonHand - QtyReserved + QtyOrdered)*-1-Order_min)/Order_pack) "
				+ "WHEN  Substr(ParameterDefault,5)='Y' and Level_Min  > (QtyonHand - QtyReserved + QtyOrdered)*-1 and Level_min >= Order_Min and Order_pack=0 THEN Level_min "
				+ "WHEN  Substr(ParameterDefault,5)='Y' and Order_Min  > (QtyonHand - QtyReserved + QtyOrdered)*-1 and Level_min <= Order_Min and Order_pack=0 THEN Order_Min "
				+ "WHEN  Substr(ParameterDefault,5)='Y' and Level_Min  > (QtyonHand - QtyReserved + QtyOrdered)*-1 and Level_min >= Order_Min and Order_pack>0 THEN order_pack* ceiling(Level_min/Order_pack) "
				+ "WHEN  Substr(ParameterDefault,5)='Y' and Order_pack > 0 THEN  Order_Min +  order_pack* ceiling(((QtyonHand - QtyReserved + QtyOrdered)*-1-Order_min)/Order_pack)"
				+ "ELSE 0.99 END ");
			sql.append("WHERE ReplenishType='1'"); 
			sql.append(" AND M_Product_ID IN ("+t_Selection_idx+")");
			
			
