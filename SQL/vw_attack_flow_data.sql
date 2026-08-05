-- View: public.vw_attack_flow_data
-- This view is a direct copy of mv_attack_flow_data.
-- This view was created as Power BI do not recognize 
-- materialized view as source object. This view is loaded into 
-- Power BI data model and joined with other dimension tables to 
-- form a star schema model.

-- DROP VIEW public.vw_attack_flow_data;

CREATE OR REPLACE VIEW public.vw_attack_flow_data
 AS
 SELECT report_date,
    report_hour,
    protocol,
    "Port_ID",
    "NIST_Id",
    total_flows,
    attack_count
   FROM mv_attack_flow_data;

ALTER TABLE public.vw_attack_flow_data
    OWNER TO postgres;

