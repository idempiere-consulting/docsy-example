select 
bp.name,FrequencyNextDate,
case when
frequencytype='Q' THEN 
FrequencyNextDate+ interval '1 month'
END as test,
frequencytype,

qty*amount 

from c_contract c 
inner join c_contractline cl ON c.c_contract_id = cl.c_contract_id 
inner join c_bpartner bp on c.c_bpartner_id=bp.c_bpartner_id

where c.isactive='Y' and c.issotrx='Y' and c.ad_client_id = 1000006