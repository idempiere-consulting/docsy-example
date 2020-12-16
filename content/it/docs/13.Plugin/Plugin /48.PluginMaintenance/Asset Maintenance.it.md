---
title: "Plugin Maintenance [P.MNT.STD00]"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---




Per iniziare a utilizzare il modulo MP È necessario definire:
       1. un metro
2. un lavoro standard (Standard Job)
3. un record di manutenzione (Maintenance Record)
4. un bene (Asset)
5. un misuratore di risorse (Asset Meter)
6. alcuni registri del misuratore (Meter LOgs)

Inizieremo a definire i primi tre elementi del nostro elenco: un contatore (Meter), un lavoro standard (Standard Job) con un cespite e quindi il record di manutenzione (Maintenance Record).


Record Metro (Meter Record)
Esistono solo due tipi di pianificazione del programma, in base al contatore o al calendario. Il tipo di calendario è singolare e non ha bisogno di alcuna definizione. Il tipo di contatore ha diverse unità di misura, come in questo caso è KM per chilometro.
Con un record misurato semplice, possiamo procedere alla definizione di altri dati del modello. Quindi andiamo al modello di lavoro standard (Standard Job Template).



## Standard Job

Un lavoro standard serve a definire lavori ripetitivi o di routine nella maggior parte degli interventi di manutenzione. Nella prima scheda, definiamo le informazioni dell'intestazione e dobbiamo associarle a un asset. Possiamo farlo da questa scheda con un clic destro sul campo e selezionando Zoom. Questo ci porta automaticamente alla finestra Asset. Di seguito è riportato l'esempio:


## Asset Record (Record di risorse)
Dopo aver definito un Asset, torniamo alla scheda Lavoro standard (Standard Job) e aggiorniamo il campo Asset per la risorsa da visualizzare.
Successivamente andiamo nella Tab sottostante che è la scheda “Task”.


## Standard Job Task (Attività di lavoro standard)
La scheda Task definisce quali task o attività sono necessarie per questo lavoro standard da eseguire. Qui definiremo solo una singola operazione che richiede un'ora per essere eseguita. Ci saranno due risorse che useremo per essa. Vediamo la sezione successiva.


## Job Task Resources (Risorse)
Creiamo due record con due prodotti di tipo Risorsa e aggiungiamo un costo a ciascuna risorsa. Questo completa il nostro esempio di lavoro standard ed è pronto per essere riutilizzato per lavori di manutenzione o ordini di lavoro che fanno riferimento a questo lavoro standard senza ripetere le stesse attività e le relative risorse. Vediamo il primo esempio del suo riutilizzo in un record di manutenzione.
Maintenance Record (record di manutenzione)

Un record di manutenzione è importante a tener traccia del ciclo di manutenzione completo che comprende non solo task e risorse ma anche il tipo di programmazione, se è impostato su Meter o Calendar, e su come è meglio mantenere l'asset con le informazioni di controllo qui e in Asset Meter, che esamineremo in seguito. Qui spieghiamo ogni campo mentre procediamo con il Meter basato su KM e il calendario è ovviamente:
    1. Asset è associato al record Maintenance in modo che le sue attività siano definite per ciascun asset.
    2. Copy From (Processo) assumerà il lavoro standard definito. Fai clic su questo processo dopo aver assegnato una risorsa a questo record. Dopo
aver selezionato il template è possibile esaminare le sottoschede di Attività e Risorse popolate dalla selezione.
    3. Interval viene utilizzato per calcolare il valore della successiva esecuzione di manutenzione. Se è Calendar ProgrammingType, allora è a
valore della data se è Meter ProgrammingType, allora è il valore unitario del contatore. Ad esempio se in Calendar l'intervallo è 10, significa che i successivi 10 giorni dopo ogni esecuzione. Per il nostro Meter, un valore di 100 significherà i prossimi 100 KM.
    4. La Next Maintenance (manutenzione successiva) fornisce il valore KM che si suppone che il compito venga eseguito. Ora è zero come sia nuovo. Lo farà
controllare i registri del misuratore durante la fase di prognosi, se i registri o le letture del contatore sono stati presi in quella data o dopo
generare un ordine di lavoro (Work Order). In modalità Calendario, questo non viene utilizzato. Avrà il suo campo che vedremo più avanti.
    5. Range è la tolleranza del valore a differire dalla prossima data di manutenzione. Ad esempio, se la data non è dovuta ma l'intervallo viene aggiunto per farlo rientrare nell'intervallo, allora viene impostato anche per un ordine di lavoro (Work Order).
    6. Prom-use è il campo utilizzato per il calcolo dal Meter, basato su questa formula: prom=(lastM-firstM) / (days/(60 * 60 * 24 * 1000)), in cui la differenza tra le letture del contatore superiore e inferiore è suddivisa nei giorni tra loro diviso ulteriormente per i millisecondi. Il valore del Prom si aggiunge all'ultima lettura durante la corsa alla Prognosi.
    7. Date Lasr OT è la data in cui viene elaborato l'ultimo ordine di lavoro (Work Order).
       
Ora cambiamo il tipo di programmazione Maintenance in Calendar.




Ora vediamo che diversi campi diventano attivi e altri vengono rimossi. Questi sono i valori rilevanti per un'attività di manutenzione di tipo Calendario:
    1. L'intervallo come spiegato in precedenza è il numero di giorni in cui la corsa successiva verrà impostata dopo l'ultima corsa.
    2. L'ultima esecuzione della data viene impostata dopo l'elaborazione di un ordine di lavoro generato per la prognosi in base a questo record.
    3. La data di esecuzione successiva viene calcolata durante il processo di ordine di lavoro in base all'intervallo specificato.



## Asset Meter

Ora arriviamo all'impostazione Asset Meter che viene eseguita sotto la maschera degli Asset. Chiamiamo questa scheda Asset Meter:
Questo ha il Meter impostato su KM e l'Amount è già impostato a causa di alcuni record del Log Meter che abbiamo già inserito. Questo è ciò che vedremo in seguito. Asset Meter viene utilizzato anche per il tipo di calendario in cui non è utilizzato il tipo di contatore KM.










## Meter Log
Anche se la finestra Meter LOg è definita sotto la maschera degli Asset associata al proprio Asset Meter, è disponibile anche nella relativa finestra nel sottomenu Work Shop. Il motivo è che il lavoro di routine può essere svolto su base orizzontale nel campo in cui ogni lettura del contatore di risorse viene effettuata in un registro principale da un team dedicato. Pertanto non è necessario esaminare tutti i record di attività che possono contenere informazioni contabili sensibili.











Nel singolo record Meter Log come mostrato di seguito, si noti il campo in basso a destra denominato Asset Meter Search che dispone di un elenco a discesa per selezionare l’asset Meter su cui questo registro è contrassegnato. In tal modo non è necessario aprire questa finestra di registro sotto una gerarchia Asset e Asset Meter. Può quindi stare da solo ed essere taggato separatamente.


La finestra Meter Log viene utilizzata per l'inserimento dei dati delle letture del meter su base regolare in base alla procedura o alla routine del negozio di lavoro.

Qui abbiamo 5 record inseriti su base giornaliera diversa con letture progressive dei contatori. Notare che queste letture sono del KM Meter sotto l'Asset Meter definito in precedenza. E questo è associato al record Maintenance come definito in precedenza, che indica indirettamente qual è il suo ProgrammingType. Dovremo utilizzare prima questi valori sotto il tipo Meter e poi usare il tipo Calendar per vedere come funziona.
Per ottenere alcuni registri, usiamo l'elemento successivo nel nostro menu dei processi.



## Prognosis (Forecast) - Previsione
Gestiremo il processo di prognosi oggi (18 gennaio 2019) e vedremo cosa succederà.
Il campo No di periodi può essere impostato per consentire la generazione di più ordini di lavoro (Work Orders) in un modo previsto in futuro. Pertanto, l'ufficio di gestione che gestisce questo processo ha uno strumento flessibile adatto al suo piano di gestione. Lasciamo il valore a zero e premiamo il pulsante Start. Viene mostrata la seguente risposta:















## Prognosis Approval (Approvazione della prognosi)
Ora cerchiamo il record di prognosi generato per approvarlo e convertirlo in un ordine di lavoro (Work Order). Andiamo sulla Special Form “Prognosis Approval”
Selezioniamo il record visualizzato che desideriamo approvare. In questo caso ce n'è solo uno. Spuntiamo la casella di controllo Genera OT a sinistra. Quindi in basso premiamo il pulsante Genera OT. La linea di registrazione scompare. Quindi guardiamo la maschera dell'Ordine di lavoro (Work Order).







## Work Order (OT) - Ordine di lavoro
Sotto la finestra Work Order vediamo il lavoro generato pronto per l'attenzione dal personale di bordo campo.
Si noti che la data della transazione è l'ultima voce della data del registro. La descrizione sta anche facendo una schedulazione "in ritardo" a causa del calcolo durante la prognosi in precedenza che prende i valori del record di manutenzione e corrisponde all’ Asset Meter e concludendo che la manutenzione è scaduta. Indica anche che si tratta di un record di manutenzione programmato e non di un ordine di lavoro richiesto. Ora questa finestra è passata al personale di manutenzione per l'elaborazione. Devono passare attraverso ogni attività nella scheda Task e vedere cosa deve essere fatto. Sotto ogni task verranno mostrate le risorse o il personale responsabile o l'attrezzatura o gli ingredienti o gli strumenti necessari per ogni attività.

Se si preme il pulsante Process Now, verrà visualizzato solo lo stato di attività non completata. Quindi è necessario modificare lo stato della scheda Task sottostante.

Sotto la tab Task, il task deve essere modificato per avere il suo stato modificato su Completato prima che l'Ordine possa essere completato. Quindi questo funge da lista di controllo.
Qui cambiamo lo stato a Completato e quindi torniamo alla scheda Ordine per l'azione Process Now. Questa volta quando selezioniamo l'azione Completa cambia lo stato.
Questo conclude un ciclo di esercizio dell'utilizzo del modulo di Manutenzione. Ritorniamo alla maschera di Manutenzione e possiamo vedere che è stata modificata di conseguenza. Il misuratore di risorse rifletterà anche l'ultima lettura che è 300.
Riprovare questo esercizio con un intervallo di 100 e otteniamo la seguente manutenzione successiva come 400.






Puoi provare un altro esercizio usando il tipo Programma a Calendario e impostando la prossima esecuzione della data come oggi, altrimenti la prognosi non troverà nulla da eseguire. Impostiamo anche l'intervallo su 5 giorni e poi lanciamo il processo Prognosis(Forecast)
Quando elaboriamo Prognosis Approval (Approvazione della prognosi) e Generiamo il Work Order OT otteniamo la seguenti  descrizione che deve essere eseguita dal calendario. Dopo averlo elaborato, possiamo controllare il record di manutenzione per vedere l'effetto.


Dopo aver eseguito la prognosi ancora una volta ed elaborato l'ordine di lavoro risultante, abbiamo il seguente risultato nella scheda Manutenzione. Nota che la prossima data di esecuzione è impostata a intervalli di 5 giorni come richiesto.



Quindi vediamo come eseguire Richieste di ordini di lavoro ad-hoc chiamate tramite Request OT (Richiesta OT) nel menu Work Shop.

L'importanza principale in questa maschera è la selezione di un modello di lavoro standard per consentire la generazione finale di un modello di lavoro già pronto simile al processo di prognosi. Da lì l'Ufficio può approvare le Request (richieste) e allo stesso modo si dirigeranno verso la maschera dell'Ordine di lavoro (Work Order) per il completamento.


Cose non disponibili in questo modulo

1. Nessun Report. Alcune Report utili possorebbero essere:
       a. Ordini di lavoro schedulati non completati
       b. Distribuzione di risorse, il loro calendario delle attività derivato dai programmi di Manutenzione pianificati
2. La generazione di fatture interne per convertire l'orario di lavoro in ore retribuite a fini di stipendi e costi.
3. La pulizia dei registri del Meter LOos. Non vengono disattivati o rimossi da ulteriori processi di prognosi simili.

