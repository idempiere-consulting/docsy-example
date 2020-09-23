# Plugin DashCalendar

---

## Creazione Calendario

Per creazione del calendario su dashboard, segui [[Creazione_Calendario]]

---

## Vista di selezione dati

```
CREATE OR REPLACE VIEW lit_calendar_v AS 
SELECT o.ad_client_id,
o.ad_org_id,
o.salesrep_id AS useraccess,
o.c_order_id AS record_id,
'259'::text AS table_id,
'143'::text AS ad_window_id,
'datepromised'::text AS datefieldname,
'dateordered'::text AS datefieldname2,
o.issotrx,
o.datepromised AS datefrom,
o.datepromised AS dateto,
'12:00:00'::time without time zone AS starttime,
'18:00:00'::time without time zone AS endtime,
o.description AS summary,
'calendarxx'::bpchar AS calendarname,
'red'::bpchar AS headercolor,
'red'::bpchar AS contentcolor
FROM c_order o
WHERE o.docstatus = 'CO'::bpchar AND o.issotrx = 'Y'::bpchar
UNION
SELECT o.ad_client_id,
o.ad_org_id,
o.salesrep_id AS useraccess,
o.c_order_id AS record_id,
'259'::text AS table_id,
'181'::text AS ad_window_id,
'datepromised'::text AS datefieldname,
'dateordered'::text AS datefieldname2,
o.issotrx,
o.datepromised AS datefrom,
o.datepromised AS dateto,
'12:00:00'::time without time zone AS starttime,
'18:00:00'::time without time zone AS endtime,
o.description AS summary,
'calendarxx'::bpchar AS calendarname,
'red'::bpchar AS headercolor,
'red'::bpchar AS contentcolor
FROM c_order o
WHERE o.docstatus = 'CO'::bpchar AND o.issotrx = 'N'::bpchar
UNION
SELECT o.ad_client_id,
o.ad_org_id,
o.salesrep_id AS useraccess,
o.c_invoice_id AS record_id,
'318'::text AS table_id,
'167'::text AS ad_window_id,
'dateinvoiced'::text AS datefieldname,
'dateacct'::text AS datefieldname2,
o.issotrx,
o.dateinvoiced AS datefrom,
o.dateinvoiced AS dateto,
'12:00:00'::time without time zone AS starttime,
'18:00:00'::time without time zone AS endtime,
o.description AS summary,
'calendarxx'::bpchar AS calendarname,
'red'::bpchar AS headercolor,
'red'::bpchar AS contentcolor
FROM c_invoice o
WHERE o.docstatus = 'CO'::bpchar AND o.issotrx = 'Y'::bpchar
UNION
SELECT o.ad_client_id,
o.ad_org_id,
o.salesrep_id AS useraccess,
o.c_invoice_id AS record_id,
'318'::text AS table_id,
'183'::text AS ad_window_id,
'dateinvoiced'::text AS datefieldname,
'dateacct'::text AS datefieldname2,
o.issotrx,
o.dateinvoiced AS datefrom,
o.dateinvoiced AS dateto,
'12:00:00'::time without time zone AS starttime,
'18:00:00'::time without time zone AS endtime,
o.description AS summary,
'calendarxx'::bpchar AS calendarname,
'red'::bpchar AS headercolor,
'red'::bpchar AS contentcolor
FROM c_invoice o
WHERE o.docstatus = 'CO'::bpchar AND o.issotrx = 'N'::bpchar;
ALTER TABLE lit_calendar_v
OWNER TO adempiere;
```