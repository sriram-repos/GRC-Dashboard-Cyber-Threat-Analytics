-- Table: public.dim_nist
-- Contains threat label, how it maps to NIST framework.
-- Used in multiple visuals and calculations. 
-- NIST_Id = 1 is categorized as Beningn and everything else as 
-- attack flows. A very important dimension forms the core of 
-- the GRC Dashboard.
-- Maps to NIST_Id in Fct_attack_summary

-- DROP TABLE IF EXISTS public.dim_nist;

CREATE TABLE IF NOT EXISTS public.dim_nist
(
    nist_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    threat_label character varying(100) COLLATE pg_catalog."default",
    nist_csf_code character varying(100) COLLATE pg_catalog."default",
    nist_csf_category character varying(100) COLLATE pg_catalog."default",
    nist_csf_function character varying(100) COLLATE pg_catalog."default",
    nist_800_53_family character varying(100) COLLATE pg_catalog."default",
    control_objective character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT dim_nist_mapping_pkey PRIMARY KEY (nist_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_nist
    OWNER to postgres;