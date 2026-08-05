-- Table: public.ids_traffic
-- This staging table is created as a copy of the data source 
-- file IDS_Traffic2018.csv. Though there are few changes to 
-- some columns this is a replica of file data loaded into the 
-- database.

-- DROP TABLE IF EXISTS public.ids_traffic;

CREATE TABLE IF NOT EXISTS public.ids_traffic
(
    protocol integer,
    flow_duration bigint,
    tot_fwd_pkts bigint,
    tot_bwd_pkts bigint,
    totlen_fwd_pkts double precision,
    totlen_bwd_pkts double precision,
    fwd_pkt_len_max double precision,
    fwd_pkt_len_min double precision,
    fwd_pkt_len_mean double precision,
    fwd_pkt_len_std double precision,
    bwd_pkt_len_max double precision,
    bwd_pkt_len_min double precision,
    bwd_pkt_len_mean double precision,
    bwd_pkt_len_std double precision,
    flow_byts_s double precision,
    flow_pkts_s double precision,
    flow_iat_mean double precision,
    flow_iat_std double precision,
    flow_iat_max double precision,
    flow_iat_min double precision,
    fwd_iat_tot double precision,
    fwd_iat_mean double precision,
    fwd_iat_std double precision,
    fwd_iat_max double precision,
    fwd_iat_min double precision,
    bwd_iat_tot double precision,
    bwd_iat_mean double precision,
    bwd_iat_std double precision,
    bwd_iat_max double precision,
    bwd_iat_min double precision,
    fwd_psh_flags integer,
    bwd_psh_flags integer,
    fwd_urg_flags integer,
    bwd_urg_flags integer,
    fwd_header_len bigint,
    bwd_header_len bigint,
    fwd_pkts_s double precision,
    bwd_pkts_s double precision,
    pkt_len_min double precision,
    pkt_len_max double precision,
    pkt_len_mean double precision,
    pkt_len_std double precision,
    pkt_len_var double precision,
    fin_flag_cnt integer,
    syn_flag_cnt integer,
    rst_flag_cnt integer,
    psh_flag_cnt integer,
    ack_flag_cnt integer,
    urg_flag_cnt integer,
    cwe_flag_count integer,
    ece_flag_cnt integer,
    down_up_ratio double precision,
    pkt_size_avg double precision,
    fwd_seg_size_avg double precision,
    bwd_seg_size_avg double precision,
    fwd_byts_b_avg bigint,
    fwd_pkts_b_avg bigint,
    fwd_blk_rate_avg bigint,
    bwd_byts_b_avg bigint,
    bwd_pkts_b_avg bigint,
    bwd_blk_rate_avg bigint,
    subflow_fwd_pkts bigint,
    subflow_fwd_byts bigint,
    subflow_bwd_pkts bigint,
    subflow_bwd_byts bigint,
    init_fwd_win_byts bigint,
    init_bwd_win_byts bigint,
    fwd_act_data_pkts bigint,
    fwd_seg_size_min bigint,
    active_mean double precision,
    active_std double precision,
    active_max double precision,
    active_min double precision,
    idle_mean double precision,
    idle_std double precision,
    idle_max double precision,
    idle_min double precision,
    "timestamp" timestamp without time zone,
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "NIST_Id" bigint,
    "Port_ID" bigint,
    CONSTRAINT ids_traffic_pkey PRIMARY KEY (id),
    CONSTRAINT fk_ids_traffic_nist FOREIGN KEY ("NIST_Id")
        REFERENCES public.dim_nist (nist_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_ids_traffic_port FOREIGN KEY ("Port_ID")
        REFERENCES public.dim_ports (port_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ids_traffic
    OWNER to postgres;

COMMENT ON COLUMN public.ids_traffic."NIST_Id"
    IS 'Joins to DIM_NIST';
-- Index: idx_ids_traffic_nist_id

-- DROP INDEX IF EXISTS public.idx_ids_traffic_nist_id;

CREATE INDEX IF NOT EXISTS idx_ids_traffic_nist_id
    ON public.ids_traffic USING btree
    ("NIST_Id" ASC NULLS LAST)
    WITH (deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_ids_traffic_port

-- DROP INDEX IF EXISTS public.idx_ids_traffic_port;

CREATE INDEX IF NOT EXISTS idx_ids_traffic_port
    ON public.ids_traffic USING btree
    ("Port_ID" ASC NULLS LAST)
    WITH (deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_ids_traffic_protocol

-- DROP INDEX IF EXISTS public.idx_ids_traffic_protocol;

CREATE INDEX IF NOT EXISTS idx_ids_traffic_protocol
    ON public.ids_traffic USING btree
    (protocol ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: idx_ids_traffic_timestamp

-- DROP INDEX IF EXISTS public.idx_ids_traffic_timestamp;

CREATE INDEX IF NOT EXISTS idx_ids_traffic_timestamp
    ON public.ids_traffic USING btree
    ("timestamp" ASC NULLS LAST)
    INCLUDE("timestamp")
    WITH (deduplicate_items=True)
    TABLESPACE pg_default;