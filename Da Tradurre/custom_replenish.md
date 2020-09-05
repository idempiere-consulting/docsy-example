# Plugin CustomReplenish

---

## Descrizione Plugin

---

## Funzionalità supportate

---

## Installazione Plugin

Installare nella console felix il jar reperibile su [https://bitbucket.org/consulnet/idempiere-download idempiere-download]

---

## Parametrizzazione Plugin

---

## Istruzioni Plugin

---

## Documentazione Tecnica Plugin

### Lato java

public BigDecimal getQtyToOrder(MWarehouse wh, X_T_Replenish replenish) {
BigDecimal qtyTOOrder = new BigDecimal(0);
BigDecimal m_qtySoldPeriod = new BigDecimal(0);

        I_T_ReplenishCNET replenishCnet = POWrapper.create(replenish, I_T_ReplenishCNET.class);
        I_M_WarehouseCNET warehouseCnet = POWrapper.create(wh, I_M_WarehouseCNET.class);


​        
    m_qtySoldPeriod = calcQtySoldPeriod(warehouseCnet, replenishCnet);
    replenishCnet.setQtySoldPeriod(m_qtySoldPeriod);
    POWrapper.getPO(replenishCnet).saveEx();


​        
        BigDecimal min = replenishCnet.getLevel_Max().min(replenishCnet.getQtySoldPeriod());
        min = min.subtract(replenishCnet.getQtyOnHand());
        
        qtyTOOrder = min.subtract(replenishCnet.getQtyOrdered());
        
        //POWrapper.getPO(replenishCnet).saveEx();
        
        return qtyTOOrder;
        //return null;
    }

Classe di riferimento : it.cnet.impl.customReplenish.model.Replenish_CNET.java

## Modifiche all'AD

### Tables / Windows esistenti

---------------
 ```
| M_Warehouse 					  |

| nome column                     |

| InventoryTurnoverDays           |
 ```

-------------------
```
| T_Replenish   |

| nome column   |

| QtySoldPeriod |
```

----------------------------------------
```
| Warehouse & Locators TAB> Warehouse  |

| nome field              			   |

| Inventory Turnover Days  			   |
```

### Nuove Tables /Windows

---

## Funzionalità Future

---

## Errori e bug

---