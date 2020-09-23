# Plugin: Asterisk Integration

---

## link esterni

---

## Riferimenti

- link pubblico  : <https://bitbucket.org/evenos-consulting/org.evenos.asterisk>
- source ling  : <http://wiki.idempiere.org/en/Plugin:_Asterisk_Integration>
- link idempeire italia  :
- link jar  :
- versione idempiere  : idempiere 3.1
- versione zk supportata :



plug-in project: org.evenos.asterisk



- Questo plugin estende iDempiere con un field di tipo editor di telefono.
- Formattazione per i numeri di telefono internazionali.
- Avviare le chiamate dall'interno di iDempiere.
- Hang-up del telefono da dentro iDempiere.
- Funziona con swing e client web.

```
 Questa pagina serve da template per la documentazione dei plugin
```

---

## Descrizione Plugin

---

## Funzionalità supportate

---

## Installazione Plugin

Installare nella console felix il jar reperibile su [idempiere-download](https://bitbucket.org/consulnet/idempiere-download)

---

## Parametrizzazione Plugin

Modificare il riferimento di telefono desiderato o di qualsiasi altro campo stringa in tipo PhoneNumber. Es. modificare la ‘Reference’ della colonna “Phone” sulla tabella AD_User in PhoneNumber

[![Asterisk01.png](http://192.168.178.102/images/1/12/Asterisk01.png)](http://192.168.178.102/index.php/File:Asterisk01.png)

Immettere il nome del server Asterisk, l'utente SIP e la password, il contesto e facoltativo un prefisso telefono nella maschera System.

[![Asterisk02.png](http://192.168.178.102/images/2/2a/Asterisk02.png)](http://192.168.178.102/index.php/File:Asterisk02.png)

Inserire il canale SIP utenti nella maschera User

[![Asterisk03.png](http://192.168.178.102/images/4/44/Asterisk03.png)](http://192.168.178.102/index.php/File:Asterisk03.png)

---

## Istruzioni Plugin

---

## Documentazione Tecnica Plugin

### Modifiche all'AD

```
-----------
| nomeSup |
-----------------------------
| nome | tipo | descrizione | 
-----------------------------
```

#### Tables / Windows esistenti

#### Nuove Tables /Windows

---

## Funzionalità Future

---

## Errori e bug

Installare il 2Pack.zip dalla cartella META-INF (si installa automaticamente al primo avvio del plug-in).

Modificare il riferimento di telefono desiderato o di qualsiasi altro campo stringa in tipo PhoneNumber. Es. modificare la ‘Reference’ della colonna “Phone” sulla tabella AD_User in PhoneNumber

Risultato:

Immettere il nome del server Asterisk, l'utente SIP e la password, il contesto e facoltativo un prefisso telefono nella maschera System.


Inserire il canale SIP utenti nella maschera User

Bisogna avere un server Asterisk funzionante….. Impostando i relativi parametri SIP, permetterà di collegarsi al server Asterisk e avviare la chiamata…

### APPROFONDIRE