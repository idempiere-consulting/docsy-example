SELECT * FROM crosstab('
  
    SELECT
     CASE WHEN i.issotrx=''Y'' THEN
      ''Fatture di Vendita'' 
      ELSE
      ''Fatture di Acquisto''
      END
       as Descrizione,
      date_part(''month'', duedate) AS month,
      sum(dueamt)::integer as Totale
    FROM C_InvoicePaySchedule ips
    inner join c_invoice i on ips.c_invoice_id=i.c_invoice_id
    where ips.ad_client_id=1000006 and ips.ad_org_id=1000006
    GROUP BY duedate,i.issotrx
  
    union 
    SELECT
       Name as Descrizione,
      date_part(''month'', datetrx) AS month,
      sum(linetotalamt)::integer as Totale
    FROM C_cashplanline c
    
    where c.ad_client_id=1000006 and c.ad_org_id=1000006
    GROUP BY c.name,datetrx
    ORDER BY 1,2
  ',
  $$ SELECT m FROM generate_series(1,12) m $$
) AS (
  Descrizione character varying,
  "Jan" int,
  "Feb" int,
  "Mar" int,
  "Apr" int,
  "May" int,
  "Jun" int,
  "Jul" int,
  "Aug" int,
  "Sep" int,
  "Oct" int,
  "Nov" int,
  "Dec" int
  
);

select c.c_contract_id,c.frequencytype,cl.amount from c_contract c inner join c_contractline cl on c.c_contract_id=cl.c_contract_id 
where c.isactive='Y' and c.c_contract_id=1000020

SELECT * FROM generate_series('2008-03-01 00:00'::timestamp,
                              '2008-03-04 12:00', '1 day') as date;


select c.c_contract_id,c.frequencytype,cl.amount from 
(select generate_series('2008-03-01 00:00'::timestamp,
                              '2008-03-04 12:00', '1 day') as test) 
c_contract c inner join c_contractline cl on c.c_contract_id=cl.c_contract_id 


where c.isactive='Y' and c.c_contract_id=1000020

SELECT * FROM generate_series('2008-03-01 00:00'::timestamp,
                              '2008-03-04 12:00', '1 day') as date;       



select 
CASE WHEN c.frequencytype='Q'
THEN
generate_series('2018-01-01 00:00'::timestamp,'2018-12-01 00:00'::timestamp, '1 month') 
else

generate_series('2018-01-01 00:00'::timestamp,'2018-12-01 00:00'::timestamp, '3 month') 
END
AS test,
 c.c_contract_id,c.frequencytype,cl.amount from c_contract c inner join  c_contractline cl on c.c_contract_id=cl.c_contract_id   
 where c.isactive='Y' and c.c_contract_id<1000020


            select frequencytype from c_contract group by frequencytype