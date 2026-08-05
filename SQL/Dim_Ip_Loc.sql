-- Table: public.dim_ip_loc
-- Contains list of IP Addresses both local IPs and external IPs 
-- along with their corresponding countries.
-- Used in the attacks by top 10 IP address visual in the 
-- GRC Dashboard and attacks by location in the SOC report.
-- Maps directly to src_ip and dst_ip columns in the 
-- Fct_attack_summary fact table

-- DROP TABLE IF EXISTS public.dim_ip_loc;

CREATE TABLE IF NOT EXISTS public.dim_ip_loc
(
    ip_address inet NOT NULL,
    country character(100) COLLATE pg_catalog."default",
    CONSTRAINT dim_ip_loc_pkey PRIMARY KEY (ip_address)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_ip_loc
    OWNER to postgres;