---
title: "Row Level Security"

---

# Row Level Security
In questa sezione parliamo di come implementare la sicurezza a livello riga, quindi più granulare di quella classica basata sulle tabelle, in PostgreSQL.

Concetti base:
* database: dobbiamo spiegarlo :-) ?

* utente (user): è colui che si autentica per l'accesso al database, paragonabile agli utenti shell Linux, ogni utente autenticato avrà accesso solo a ciò che crea lui più ciò che altri utenti gli permettono di fare sui propri oggetti (tramite il comando GRANT)

* ruolo (role): è paragonabile ai gruppi shell Linux, o possiamo vederlo in modo aziendale: il dirigente può accedere al PC della sala riunioni mentre i segretari no. Un utente può far parte di uno o più ruoli, in questo modo è facile modificare le autorizzazioni di accesso.

  ^1 (a dirla tutta ruolo ed utente in PostgreSQL sono praticamente la stessa cosa)

  infatti dalla documentazione(SET ROLE -- set the current user  identifier of the current session)

* schema (schema): è paragonabile al concetto delle directory in un file system, è uno "spazio dei nomi" e tutto ciò che vi sta dentro (sotto) ne "eredita" i permessi.


  Il modo classico per separare gli utenti in un database è creare più schemi, uno per ognuno degli utenti, tramite questa procedura, invece, lo schema è unico ma ci saranno delle REGOLE di accesso ai record.

## Procedura
- Loggandoci come postgres (o come abilitato a tale scopo) creiamo gli utenti necessari, ne facciamo 2 a scopo illustrativo, con i due ruoli e lo schema comune:

```
psql -U postgres postgres
CREATE USER user1 LOGIN;
CREATE USER user2 LOGIN;
```
 (il login è per debug, useremo psql per testare il funzionamento)

-   ruoli:
```
CREATE ROLE role1 NOINHERIT;
CREATE ROLE role2 NOINHERIT;
```
( INHERIT  fa in modo di ereditare i permessi di chi usa il comando, NOHINERIT quindi il contrario)

- associamo i ruoli agli utenti (è come se definissimo il loro incarico e quindi limiti e obblighi)
```
 GRANT role1 TO user1;
 GRANT role2 TO user2;
```

- creiamo lo schema:
`CREATE SCHEMA namespace;`
(questo sarà il "contenitore" di tutti gli oggetti del database nel quale è definito)
ora facciamo in modo che entrambi gli utenti (ruoli) usino lo stesso contenitore
- Diamo accesso a questo contenitore per i due ruoli/utenti, senza questo gli utenti non vedrebbero neppure gli oggeti al suo interno:
`GRANT ALL ON SCHEMA namespace TO role1,role2;`
- Definiamo l'ordine di ricerca/uso dei namespace:
```
   ALTER ROLE role1 SET search_path TO namespace, pg_catalog;
   ALTER ROLE role2 SET search_path TO namespace, pg_catalog;
```

- Ora creiamo una tabella di esempio su cui lavoreremo:
```
CREATE TABLE tabella_condivisa (
  campo1 VARCHAR(20),
  campo2 VARCHAR(20) DEFAULT current_user);
```
- inseriamo un paio di righe:
 `INSERT INTO tabella_condivisa VALUES ('prima riga'),('seconda'),('terza');`
- permettiamo ad entrambi gli utenti di accedere alla tabella:
 `GRANT ALL ON tabella_condivisa TO role1,role2;`

- cambiamo utente/ruolo ed inseriamo ancora:
```
SET ROLE role1;
INSERT INTO tabella_condivisa VALUES 
('prima riga uno'),
('seconda uno'),
('terza uno');
```

- cambiamo utente/ruolo di nuovo  ed inseriamo ancora:
```
SET ROLE NONE;
SET ROLE role2;
INSERT INTO tabella_condivisa VALUES 
('prima riga due'),
('seconda due'),
('terza due');
```

Bene, il setup iniziale è pronto: due utenti diversi che accedono alla stessa tabella in cui possono scrivere entrambi ma, allo stato attuale, entrambi accedono a TUTTA la tabella quindi anche ai record dell'atro utente.

Ora creeremo una regola che permetterà solo a chi ha creato il record di leggerla, nel nostro esempio la condizione da soddisfare è assegnare la regola di visibilità all'utente corrispomdente al campo2 della tabella_condivisa:
- abilitiamo la RowLevelSecurity sulla tabella (dall'utente che l'ha creata, cioè postgres):
 `ALTER TABLE tabella_condivisa ENABLE ROW LEVEL SECURITY`
-  creiamo le regole necessarie:
 `CREATE POLICY role1_can_all ON tabella_condivisa TO role1 USING (campo2='user1');`
 `CREATE POLICY role2_can_all ON tabella_condivisa TO role2 USING (campo2='user2');`
- Ora l'utente vedrà solo le "sue" righe:
`SET ROLE role1;`
`SELECT * FROM tabella_condivisa;`
```
select * from tabella_condivisa ;
     campo1     | campo2 
----------------+--------
 prima riga uno | user1
 seconda uno    | user1
 terza uno      | user1
(3 righe)

```
`SET ROLE role2;`
`SELECT * FROM tabella_condivisa;`
```
select * from tabella_condivisa ;
     campo1     | campo2 
----------------+--------
 prima riga due | user2
 seconda due    | user2
 terza due      | user2
(3 righe)

```

# APPENDICE: comandi utili psql

`\d`  mostra i nomi delle tabelle o, se specificata come argomento, i dettagli di una

`\dn+` come sopra ma 