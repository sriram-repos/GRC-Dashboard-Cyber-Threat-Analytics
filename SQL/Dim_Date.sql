-- Table: public.dim_date
-- Contains dates for periods 2017 and 2018. 
-- Used in the summarized calculations and previous period 
-- comparisons.
-- Directly maps to report_date column in Fct_attack_summary

-- DROP TABLE IF EXISTS public.dim_date;

CREATE TABLE IF NOT EXISTS public.dim_date
(
    date_key date NOT NULL,
    year numeric,
    month numeric,
    month_name text COLLATE pg_catalog."default",
    day numeric,
    day_of_week_number numeric,
    day_name text COLLATE pg_catalog."default",
    weekday_type text COLLATE pg_catalog."default",
    CONSTRAINT dim_date_pkey PRIMARY KEY (date_key)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_date
    OWNER to postgres;