---
title: "Parti di Ricambio"
date: 2020-10-01T18:20:10+02:00
draft: false
weight : 310
pre: "<b></b>"
---

## Maschera speciale PARTI DI RICAMBIO

**Plug-in di riferimento**: it.idIta.impl.LIT_imageMap

### Impostazioni base per corretta gestione della maschera di editor e della maschera di visualizzazione Parti Ricambio

1. Il prodotto deve essere una distinta base
2. Il prodotto deve essere provvista di un'immagine, possibilmente settata nel campo "Immagine Grande" nella maschera PRODOTTO
   {{< figure src="/image/PartiRicambio_1.png"  width="980"  >}}
3. Impostare l'immagine di pin da utilizzare come indicatore delle parti di ricambio. Maschera "Immagine sistema"; il nome è da impostare obbligatoriamente come *LIT_BOMimage*, se no il sistema non lo riconosce.
   {{< figure src="/image/PartiRicambio_2.png"  width="980"  >}}

### Parti di Ricambio --- Editor

Alla prima volta che viene selezionato un prodotto, i pin non sono posizionati nei rispettivi posti. Ogni pin può essere spostato tramite un drag and drop sul posto corrispondente dell'immagine
{{< figure src="/image/PartiRicambio_3.png"  width="980"  >}}

Il posizionamento di ogni pin verrà impostato tramite un refresh del frame dell'immagine
{{< figure src="/image/PartiRicambio_4.png"  width="980"  >}}

Facendo click sx su un pin, si potrà vedere delle informazioni a menu e avere la possibilità di aprire il BOM corrispondente su altra maschera
{{< figure src="/image/PartiRicambio_5.png"  width="980"  >}}

### Parti di Ricambio --- Visualizzatore

Nel visualizzatore si ha la possibilità di verificare i dati corrispondenti (tasto sx su un pin.....) delle parti di ricambio e avere l'eventuale possibilità di modificare i dati corrispondenti del prodotto
{{< figure src="/image/PartiRicambio_6.png"  width="980"  >}}