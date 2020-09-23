# OBsolete Plugin UNCENTA POS

---

```
https://www.youtube.com/watch?v=2EFCjT3xrZc&feature=plcp
http://www.adempiere.com/Touchscreen_POS
http://www.tcpos.com/it/
http://wcpos.com/roadmap/version-1-0/
https://squareup.com/global/en/pos
```

Contents  [[hide](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#)] [1 Riferimenti](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Riferimenti)[2 Descrizione Plugin](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Descrizione_Plugin)[3 Funzionalità supportate](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Funzionalit.C3.A0_supportate)[4 Installazione Plugin](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Installazione_Plugin)[5 Parametrizzazione Plugin](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Parametrizzazione_Plugin)[6 Istruzioni Plugin](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Istruzioni_Plugin)[7 Documentazione Tecnica Plugin](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Documentazione_Tecnica_Plugin)[7.1 Modifiche all'AD / Classi Java](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Modifiche_all.27AD_.2F_Classi_Java)[7.1.1 Tables / Windows esistenti](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Tables_.2F_Windows_esistenti)[7.1.2 Nuove Tables /Windows](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Nuove_Tables_.2FWindows)[8 Funzionalità Future](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Funzionalit.C3.A0_Future)[9 Errori e bug](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Errori_e_bug)[10 Analisi Progettuale](http://192.168.178.102/index.php/OBsolete_Plugin_UNCENTA_POS#Analisi_Progettuale)

---

## Riferimenti

- link pubblico  :
- link idempeire italia  :
- link jar  :
- versione idempiere  : idempiere 3.1
- versione zk supportata :

---

## Descrizione Plugin

L'obiettivo è quello di poter integrare il POS con iDempiere

## Funzionalità supportate

---

## Installazione Plugin

---

## Parametrizzazione Plugin

Su applicazione Unicenta: Maintenance > Resources ..... aggiungere voce **openbravo.properties**, con i seguenti dati:

```
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
 <!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
 <properties>     <comment>Openbravo Websevice configuration</comment>
 <entry key="url">http://[url-ServerIDempiere]/ADInterface/services</entry>
 <entry key="id">11</entry>
 <entry key="org">11</entry>
 <entry key="pos">HQ Warehouse</entry>
 <entry key="user">test</entry>
 <entry key="password">adempiere</entry>
 <entry key="queue-host">localhost</entry>
 <entry key="queue-port">61613</entry>
 <entry key="orders-queue">/queue/Orders</entry>
 <entry key="products-queue">/queue/Products</entry>
 <entry key="customers-queue">/queue/Customers</entry>
 </properties>
```

---

## Istruzioni Plugin

---

## Documentazione Tecnica Plugin

Repository:

| PROGETTO                 | SOURCE                                          | DOWNLOAD SOURCE-FORGE                                      |
| ------------------------ | ----------------------------------------------- | ---------------------------------------------------------- |
| POSIntegration-Idempiere | <https://bitbucket.org/ghintech/posintegration> | <https://sourceforge.net/projects/red1/files/UnicentaPOS/> |
| UnicentaPOS              | <https://bitbucket.org/ghintech/unicenta>       | <https://sourceforge.net/projects/red1/files/UnicentaPOS/> |

Forum/descrizione: <http://red1.org/adempiere/viewtopic.php?f=45&t=1825>

---

### Modifiche all'AD / Classi Java

```
UPDATE M_Warehouse SET POS_notsend= 'N' (vedere nota sotto Errori....)
```

#### Tables / Windows esistenti

#### Nuove Tables /Windows

---

## Funzionalità Future

---

## Errori e bug

All'installazione del plug-in "POSIntegration.jar", manca nel 2pack l'update nella Tabella *M_Warehouse* sul campo nuovo "POS_notsend" = 'N'

---

## Analisi Progettuale

Vecchi link....



```
http://wiki.idempiere.org/en/FS_Unicenta_For_Idempiere
http://wiki.idempiere.org/en/How_to_activate_the_POSSync_and_OrderSync_buttons
http://wiki.idempiere.org/en/How_to_add_products_to_the_sales_pannel
```

<http://wiki.idempiere.org/en/Building_iDempiere_without_Eclipse>

<http://sourceforge.net/projects/smart-pos/?source=directory>