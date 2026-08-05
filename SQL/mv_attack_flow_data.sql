-- View: public.mv_attack_flow_data
-- This materialized view stores a highly summarized version 
-- from the fact table fct_attack_summary. Around 3.6 million 
-- rows from fct_attack_summary across two years 2017 and 2018 
-- is summarized and compressed to approximately 300 rows.

-- DROP MATERIALIZED VIEW IF EXISTS public.mv_attack_flow_data;

CREATE MATERIALIZED VIEW IF NOT EXISTS public.mv_attack_flow_data
TABLESPACE pg_default
AS
 SELECT fas.report_date,
    fas.report_hour,
    fas.protocol,
    fas."Port_ID",
    fas."NIST_Id",
    count(*) AS total_flows,
    sum(
        CASE
            WHEN fas."NIST_Id" > 1 THEN 1
            ELSE 0
        END) AS attack_count
   FROM fct_attack_summary fas     
  WHERE EXTRACT(year FROM fas.report_date) > '1970'::numeric
  GROUP BY fas.report_date, fas.report_hour, fas.protocol, fas."Port_ID", fas."NIST_Id"
  ORDER BY fas.report_date
WITH DATA;

ALTER TABLE IF EXISTS public.mv_attack_flow_data
    OWNER TO postgres;