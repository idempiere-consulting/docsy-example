# Pulizia Database e Performance

1. Entrare su DB via console:
   **psql -d idempiere -U adempiere**

2. Verificare la grandezza delle tabelle tramite la seguente query: 
   **select schemaname as table_schema, relname as table_name, pg_size_pretty(pg_relation_size(relid)) as data_size from pg_catalog.pg_statio_user_tables order by pg_relation_size(relid) desc;**

   In questo modo si potrà avere un elenco di questo genere: 

   ```sql
    table_schema | table_name             | data_size  
   --------------+------------------------+------------
    adempiere    | ad_issue               | 8392 MB
    adempiere    | ad_changelog           | 203 MB
    adempiere    | ad_pinstance_log       | 70 MB
    adempiere    | ad_pinstance           | 41 MB
    adempiere    | ad_package_imp_detail  | 27 MB
    adempiere    | ad_session             | 11 MB
    adempiere    | ad_column              | 9512 kB
    adempiere    | ad_field               | 9432 kB
    adempiere    | ad_field_trl           | 8032 kB
    adempiere    | ad_pinstance_para      | 6344 kB
    adempiere    | fact_acct              | 4312 kB
    adempiere    | ad_column_trl          | 4240 kB
    adempiere    | ad_wf_eventaudit       | 3904 kB
    adempiere    | ad_wf_activity         | 3728 kB
    adempiere    | ad_printformatitem     | 3312 kB
    adempiere    | s_resourceattendance   | 2792 kB
    adempiere    | ad_printformatitem_trl | 2120 kB
    adempiere    | c_orderline            | 1864 kB
    adempiere    | ad_wf_process          | 1816 kB
    adempiere    | fact_acct_summary      | 1712 kB
    adempiere    | c_periodcontrol        | 1608 kB
    adempiere    | ad_element_trl         | 1448 kB
    adempiere    | ad_element             | 1432 kB
    adempiere    | c_invoiceline          | 1392 kB
    adempiere    | lit_hour               | 1352 kB
    adempiere    | c_city                 | 1240 kB
    adempiere    | ad_package_imp_backup  | 1200 kB
    adempiere    | t_selection            | 1168 kB
    adempiere    | c_acctprocessorlog     | 1056 kB
    adempiere    | gl_journalline         | ......... 
   ```

3. La tabella che maggiormente occupa spazio è la AD_Issue: questa tabella raccoglie TUTTE le Exception che si scatenano all'interno di iDempiere; sarebbero all'incirca tutte le informazioni che già vengono scritte su i log del server iDempiere...... ovviamente queste informazioni si possono leggere in modo ordinato sulla window presente su iDempiere a livello System......

4. Iniziare a svuotare la tebella che interessa:
   **delete from ad_issue where created < '2020-03-15';** 
   [condizione Where si può customizzare come si vuole.....]

5. Dopo il comando di DELETE, bisogna riallineare la capacità della tabella:
   VACUUM full verbose ad_issue;

6. Rilanciamo il comando presente al punto (2.) e vedremo il risultato di effettiva pulizia di tabella

7. Se non ci sono altri comandi da lanciare, uscire dalla ***console psql*** con:
   **\q**

