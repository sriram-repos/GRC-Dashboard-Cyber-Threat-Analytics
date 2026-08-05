-- Table: public.dim_ports
-- Contains the ports used for attacks and their corresponding 
-- service names.
-- Used to analyze attacks by ports in the Power BI report.
-- Maps directly to the Port_Id column in Fct_attack_summary

-- DROP TABLE IF EXISTS public.dim_ports;

CREATE TABLE IF NOT EXISTS public.dim_ports
(
    port_id integer NOT NULL,
    service_name character varying(50) COLLATE pg_catalog."default",
    port_category character varying(50) COLLATE pg_catalog."default",
    description character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT dim_ports_pkey PRIMARY KEY (port_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_ports
    OWNER to postgres;