---
title: "Plugin ECommerce"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- ListOrders.java !!
- ListProducts.java !!
- Woo_SyncPrice.java 
    - Menu Sincronizzazione Listino di Vendita (WooCommerce)_WooSyncPrice
- Woo_SyncStock.java 
    - Menu Sincronizzazione Giacenza (WooCommerce)_WooSyncStock
- WoocommerceGet.java
    - Menu Sincronizzazione Prodotto (WooCommerce)_Woocommerce
- WooOrders.java
    - Menu Sincronizzazione Ordine di Vendita (Woocommerce)_WooOrder

## Model
- MEcommPayRule.java
    - findByTyper(String, String) : MEcommPayRule
- MWooProducts.java
    - deleteAllWooProduct() : void
    - deleteWooProduct(int) : void
    - selectAllWooProd(): List<MWooProducts>
        
## Infowindow


## Callout
no

## Eventhandler
no
    
    
    
