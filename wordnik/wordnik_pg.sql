--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.2
-- Dumped by pg_dump version 9.1.2
-- Started on 2012-01-20 11:42:28 PST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 234 (class 3079 OID 11907)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2577 (class 0 OID 0)
-- Dependencies: 234
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 166 (class 1259 OID 19013)
-- Dependencies: 5
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 165 (class 1259 OID 19011)
-- Dependencies: 166 5
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2578 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 2579 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 164 (class 1259 OID 18998)
-- Dependencies: 5
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 18996)
-- Dependencies: 164 5
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2580 (class 0 OID 0)
-- Dependencies: 163
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 2581 (class 0 OID 0)
-- Dependencies: 163
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 174 (class 1259 OID 19078)
-- Dependencies: 5
-- Name: auth_message; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 19076)
-- Dependencies: 174 5
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO postgres;

--
-- TOC entry 2582 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- TOC entry 2583 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_message_id_seq', 1, false);


--
-- TOC entry 162 (class 1259 OID 18988)
-- Dependencies: 5
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 18986)
-- Dependencies: 5 162
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2584 (class 0 OID 0)
-- Dependencies: 161
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 2585 (class 0 OID 0)
-- Dependencies: 161
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 66, true);


--
-- TOC entry 172 (class 1259 OID 19058)
-- Dependencies: 5
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 19043)
-- Dependencies: 5
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 19041)
-- Dependencies: 170 5
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2586 (class 0 OID 0)
-- Dependencies: 169
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 2587 (class 0 OID 0)
-- Dependencies: 169
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 171 (class 1259 OID 19056)
-- Dependencies: 172 5
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2588 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 2589 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 168 (class 1259 OID 19028)
-- Dependencies: 5
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 19026)
-- Dependencies: 5 168
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2590 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 2591 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 181 (class 1259 OID 19125)
-- Dependencies: 2353 5
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 19123)
-- Dependencies: 181 5
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2592 (class 0 OID 0)
-- Dependencies: 180
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 2593 (class 0 OID 0)
-- Dependencies: 180
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 176 (class 1259 OID 19094)
-- Dependencies: 5
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 19092)
-- Dependencies: 176 5
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2594 (class 0 OID 0)
-- Dependencies: 175
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 2595 (class 0 OID 0)
-- Dependencies: 175
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 22, true);


--
-- TOC entry 177 (class 1259 OID 19107)
-- Dependencies: 5
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 19117)
-- Dependencies: 5
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 19115)
-- Dependencies: 5 179
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- TOC entry 2596 (class 0 OID 0)
-- Dependencies: 178
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- TOC entry 2597 (class 0 OID 0)
-- Dependencies: 178
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- TOC entry 223 (class 1259 OID 19480)
-- Dependencies: 5
-- Name: market_businessmodel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_businessmodel (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description text
);


ALTER TABLE public.market_businessmodel OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 19465)
-- Dependencies: 5
-- Name: market_businessmodel_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_businessmodel_comments (
    id integer NOT NULL,
    businessmodel_id integer NOT NULL,
    comment_id integer NOT NULL
);


ALTER TABLE public.market_businessmodel_comments OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 19463)
-- Dependencies: 221 5
-- Name: market_businessmodel_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_businessmodel_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_businessmodel_comments_id_seq OWNER TO postgres;

--
-- TOC entry 2598 (class 0 OID 0)
-- Dependencies: 220
-- Name: market_businessmodel_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_businessmodel_comments_id_seq OWNED BY market_businessmodel_comments.id;


--
-- TOC entry 2599 (class 0 OID 0)
-- Dependencies: 220
-- Name: market_businessmodel_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_businessmodel_comments_id_seq', 1, false);


--
-- TOC entry 222 (class 1259 OID 19478)
-- Dependencies: 5 223
-- Name: market_businessmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_businessmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_businessmodel_id_seq OWNER TO postgres;

--
-- TOC entry 2600 (class 0 OID 0)
-- Dependencies: 222
-- Name: market_businessmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_businessmodel_id_seq OWNED BY market_businessmodel.id;


--
-- TOC entry 2601 (class 0 OID 0)
-- Dependencies: 222
-- Name: market_businessmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_businessmodel_id_seq', 1, false);


--
-- TOC entry 225 (class 1259 OID 19496)
-- Dependencies: 5
-- Name: market_businessmodeldetails; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_businessmodeldetails (
    id integer NOT NULL,
    model_id integer NOT NULL,
    company_id integer NOT NULL,
    details text NOT NULL
);


ALTER TABLE public.market_businessmodeldetails OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 19494)
-- Dependencies: 5 225
-- Name: market_businessmodeldetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_businessmodeldetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_businessmodeldetails_id_seq OWNER TO postgres;

--
-- TOC entry 2602 (class 0 OID 0)
-- Dependencies: 224
-- Name: market_businessmodeldetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_businessmodeldetails_id_seq OWNED BY market_businessmodeldetails.id;


--
-- TOC entry 2603 (class 0 OID 0)
-- Dependencies: 224
-- Name: market_businessmodeldetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_businessmodeldetails_id_seq', 1, false);


--
-- TOC entry 183 (class 1259 OID 19147)
-- Dependencies: 5
-- Name: market_comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_comment (
    id integer NOT NULL,
    user_id integer NOT NULL,
    body text NOT NULL,
    company_id integer,
    category character varying(20) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.market_comment OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 19145)
-- Dependencies: 183 5
-- Name: market_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_comment_id_seq OWNER TO postgres;

--
-- TOC entry 2604 (class 0 OID 0)
-- Dependencies: 182
-- Name: market_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_comment_id_seq OWNED BY market_comment.id;


--
-- TOC entry 2605 (class 0 OID 0)
-- Dependencies: 182
-- Name: market_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_comment_id_seq', 5, true);


--
-- TOC entry 197 (class 1259 OID 19233)
-- Dependencies: 5
-- Name: market_company; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_company (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    parent_id integer,
    description text,
    slogan text NOT NULL,
    logo character varying(100) NOT NULL,
    url character varying(250) NOT NULL,
    platform character varying(45) NOT NULL,
    state character varying(45) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    public boolean NOT NULL,
    ticker character varying(45)
);


ALTER TABLE public.market_company OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 19208)
-- Dependencies: 5
-- Name: market_company_ecosystem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_company_ecosystem (
    id integer NOT NULL,
    company_id integer NOT NULL,
    ecosystem_id integer NOT NULL
);


ALTER TABLE public.market_company_ecosystem OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 19206)
-- Dependencies: 193 5
-- Name: market_company_ecosystem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_company_ecosystem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_company_ecosystem_id_seq OWNER TO postgres;

--
-- TOC entry 2606 (class 0 OID 0)
-- Dependencies: 192
-- Name: market_company_ecosystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_company_ecosystem_id_seq OWNED BY market_company_ecosystem.id;


--
-- TOC entry 2607 (class 0 OID 0)
-- Dependencies: 192
-- Name: market_company_ecosystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_company_ecosystem_id_seq', 60, true);


--
-- TOC entry 196 (class 1259 OID 19231)
-- Dependencies: 5 197
-- Name: market_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_company_id_seq OWNER TO postgres;

--
-- TOC entry 2608 (class 0 OID 0)
-- Dependencies: 196
-- Name: market_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_company_id_seq OWNED BY market_company.id;


--
-- TOC entry 2609 (class 0 OID 0)
-- Dependencies: 196
-- Name: market_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_company_id_seq', 233, true);


--
-- TOC entry 195 (class 1259 OID 19218)
-- Dependencies: 5
-- Name: market_company_segments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_company_segments (
    id integer NOT NULL,
    company_id integer NOT NULL,
    segment_id integer NOT NULL
);


ALTER TABLE public.market_company_segments OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 19216)
-- Dependencies: 195 5
-- Name: market_company_segments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_company_segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_company_segments_id_seq OWNER TO postgres;

--
-- TOC entry 2610 (class 0 OID 0)
-- Dependencies: 194
-- Name: market_company_segments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_company_segments_id_seq OWNED BY market_company_segments.id;


--
-- TOC entry 2611 (class 0 OID 0)
-- Dependencies: 194
-- Name: market_company_segments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_company_segments_id_seq', 908, true);


--
-- TOC entry 191 (class 1259 OID 19193)
-- Dependencies: 5
-- Name: market_company_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_company_tags (
    id integer NOT NULL,
    company_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.market_company_tags OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 19191)
-- Dependencies: 5 191
-- Name: market_company_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_company_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_company_tags_id_seq OWNER TO postgres;

--
-- TOC entry 2612 (class 0 OID 0)
-- Dependencies: 190
-- Name: market_company_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_company_tags_id_seq OWNED BY market_company_tags.id;


--
-- TOC entry 2613 (class 0 OID 0)
-- Dependencies: 190
-- Name: market_company_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_company_tags_id_seq', 808, true);


--
-- TOC entry 215 (class 1259 OID 19413)
-- Dependencies: 5
-- Name: market_ecosystem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_ecosystem (
    id integer NOT NULL,
    name character varying(450) NOT NULL,
    description text,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.market_ecosystem OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 19411)
-- Dependencies: 215 5
-- Name: market_ecosystem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_ecosystem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_ecosystem_id_seq OWNER TO postgres;

--
-- TOC entry 2614 (class 0 OID 0)
-- Dependencies: 214
-- Name: market_ecosystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_ecosystem_id_seq OWNED BY market_ecosystem.id;


--
-- TOC entry 2615 (class 0 OID 0)
-- Dependencies: 214
-- Name: market_ecosystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_ecosystem_id_seq', 9, true);


--
-- TOC entry 185 (class 1259 OID 19163)
-- Dependencies: 5
-- Name: market_exit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_exit (
    id integer NOT NULL,
    type character varying(450) NOT NULL,
    amount numeric(24,2),
    company_id integer,
    acquirer_id integer,
    date date,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.market_exit OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 19161)
-- Dependencies: 185 5
-- Name: market_exit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_exit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_exit_id_seq OWNER TO postgres;

--
-- TOC entry 2616 (class 0 OID 0)
-- Dependencies: 184
-- Name: market_exit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_exit_id_seq OWNED BY market_exit.id;


--
-- TOC entry 2617 (class 0 OID 0)
-- Dependencies: 184
-- Name: market_exit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_exit_id_seq', 1, false);


--
-- TOC entry 203 (class 1259 OID 19310)
-- Dependencies: 5
-- Name: market_feature; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_feature (
    id integer NOT NULL,
    gen_name character varying(450) NOT NULL,
    gen_descr text NOT NULL,
    gen_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.market_feature OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 19308)
-- Dependencies: 203 5
-- Name: market_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_feature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_feature_id_seq OWNER TO postgres;

--
-- TOC entry 2618 (class 0 OID 0)
-- Dependencies: 202
-- Name: market_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_feature_id_seq OWNED BY market_feature.id;


--
-- TOC entry 2619 (class 0 OID 0)
-- Dependencies: 202
-- Name: market_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_feature_id_seq', 1, false);


--
-- TOC entry 219 (class 1259 OID 19437)
-- Dependencies: 5
-- Name: market_metric; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_metric (
    id integer NOT NULL,
    category_id integer NOT NULL,
    platform character varying(25) NOT NULL,
    product_id integer,
    region character varying(45),
    company_id integer NOT NULL,
    round character varying(45),
    stat character varying(25) NOT NULL,
    date date,
    source_id integer
);


ALTER TABLE public.market_metric OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 19435)
-- Dependencies: 219 5
-- Name: market_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_metric_id_seq OWNER TO postgres;

--
-- TOC entry 2620 (class 0 OID 0)
-- Dependencies: 218
-- Name: market_metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_metric_id_seq OWNED BY market_metric.id;


--
-- TOC entry 2621 (class 0 OID 0)
-- Dependencies: 218
-- Name: market_metric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_metric_id_seq', 134, true);


--
-- TOC entry 217 (class 1259 OID 19429)
-- Dependencies: 5
-- Name: market_metrictype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_metrictype (
    id integer NOT NULL,
    name character varying(450) NOT NULL
);


ALTER TABLE public.market_metrictype OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 19427)
-- Dependencies: 5 217
-- Name: market_metrictype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_metrictype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_metrictype_id_seq OWNER TO postgres;

--
-- TOC entry 2622 (class 0 OID 0)
-- Dependencies: 216
-- Name: market_metrictype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_metrictype_id_seq OWNED BY market_metrictype.id;


--
-- TOC entry 2623 (class 0 OID 0)
-- Dependencies: 216
-- Name: market_metrictype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_metrictype_id_seq', 32, true);


--
-- TOC entry 201 (class 1259 OID 19294)
-- Dependencies: 5
-- Name: market_product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_product (
    id integer NOT NULL,
    name character varying(450) NOT NULL,
    description text,
    value_prop character varying(450) NOT NULL,
    state character varying(45) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.market_product OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 19292)
-- Dependencies: 201 5
-- Name: market_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_product_id_seq OWNER TO postgres;

--
-- TOC entry 2624 (class 0 OID 0)
-- Dependencies: 200
-- Name: market_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_product_id_seq OWNED BY market_product.id;


--
-- TOC entry 2625 (class 0 OID 0)
-- Dependencies: 200
-- Name: market_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_product_id_seq', 1, false);


--
-- TOC entry 199 (class 1259 OID 19279)
-- Dependencies: 5
-- Name: market_product_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_product_tags (
    id integer NOT NULL,
    product_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.market_product_tags OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 19277)
-- Dependencies: 199 5
-- Name: market_product_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_product_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_product_tags_id_seq OWNER TO postgres;

--
-- TOC entry 2626 (class 0 OID 0)
-- Dependencies: 198
-- Name: market_product_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_product_tags_id_seq OWNED BY market_product_tags.id;


--
-- TOC entry 2627 (class 0 OID 0)
-- Dependencies: 198
-- Name: market_product_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_product_tags_id_seq', 1, false);


--
-- TOC entry 207 (class 1259 OID 19336)
-- Dependencies: 5
-- Name: market_productfeature; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_productfeature (
    id integer NOT NULL,
    product_id integer NOT NULL,
    feature_id integer NOT NULL,
    spec_name character varying(250) NOT NULL,
    spec_descr text NOT NULL,
    spec_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.market_productfeature OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 19334)
-- Dependencies: 5 207
-- Name: market_productfeature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_productfeature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_productfeature_id_seq OWNER TO postgres;

--
-- TOC entry 2628 (class 0 OID 0)
-- Dependencies: 206
-- Name: market_productfeature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_productfeature_id_seq OWNED BY market_productfeature.id;


--
-- TOC entry 2629 (class 0 OID 0)
-- Dependencies: 206
-- Name: market_productfeature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_productfeature_id_seq', 1, false);


--
-- TOC entry 205 (class 1259 OID 19321)
-- Dependencies: 5
-- Name: market_productfeature_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_productfeature_tags (
    id integer NOT NULL,
    productfeature_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.market_productfeature_tags OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 19319)
-- Dependencies: 205 5
-- Name: market_productfeature_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_productfeature_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_productfeature_tags_id_seq OWNER TO postgres;

--
-- TOC entry 2630 (class 0 OID 0)
-- Dependencies: 204
-- Name: market_productfeature_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_productfeature_tags_id_seq OWNED BY market_productfeature_tags.id;


--
-- TOC entry 2631 (class 0 OID 0)
-- Dependencies: 204
-- Name: market_productfeature_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_productfeature_tags_id_seq', 1, false);


--
-- TOC entry 233 (class 1259 OID 19562)
-- Dependencies: 5
-- Name: market_report; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_report (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    description text NOT NULL,
    file character varying(100) NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.market_report OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 19547)
-- Dependencies: 5
-- Name: market_report_companies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_report_companies (
    id integer NOT NULL,
    report_id integer NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.market_report_companies OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 19545)
-- Dependencies: 5 231
-- Name: market_report_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_report_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_report_companies_id_seq OWNER TO postgres;

--
-- TOC entry 2632 (class 0 OID 0)
-- Dependencies: 230
-- Name: market_report_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_report_companies_id_seq OWNED BY market_report_companies.id;


--
-- TOC entry 2633 (class 0 OID 0)
-- Dependencies: 230
-- Name: market_report_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_report_companies_id_seq', 1, false);


--
-- TOC entry 232 (class 1259 OID 19560)
-- Dependencies: 233 5
-- Name: market_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_report_id_seq OWNER TO postgres;

--
-- TOC entry 2634 (class 0 OID 0)
-- Dependencies: 232
-- Name: market_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_report_id_seq OWNED BY market_report.id;


--
-- TOC entry 2635 (class 0 OID 0)
-- Dependencies: 232
-- Name: market_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_report_id_seq', 1, false);


--
-- TOC entry 229 (class 1259 OID 19532)
-- Dependencies: 5
-- Name: market_report_segments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_report_segments (
    id integer NOT NULL,
    report_id integer NOT NULL,
    segment_id integer NOT NULL
);


ALTER TABLE public.market_report_segments OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 19530)
-- Dependencies: 5 229
-- Name: market_report_segments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_report_segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_report_segments_id_seq OWNER TO postgres;

--
-- TOC entry 2636 (class 0 OID 0)
-- Dependencies: 228
-- Name: market_report_segments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_report_segments_id_seq OWNED BY market_report_segments.id;


--
-- TOC entry 2637 (class 0 OID 0)
-- Dependencies: 228
-- Name: market_report_segments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_report_segments_id_seq', 1, false);


--
-- TOC entry 227 (class 1259 OID 19517)
-- Dependencies: 5
-- Name: market_report_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_report_tags (
    id integer NOT NULL,
    report_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.market_report_tags OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 19515)
-- Dependencies: 227 5
-- Name: market_report_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_report_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_report_tags_id_seq OWNER TO postgres;

--
-- TOC entry 2638 (class 0 OID 0)
-- Dependencies: 226
-- Name: market_report_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_report_tags_id_seq OWNED BY market_report_tags.id;


--
-- TOC entry 2639 (class 0 OID 0)
-- Dependencies: 226
-- Name: market_report_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_report_tags_id_seq', 1, false);


--
-- TOC entry 189 (class 1259 OID 19182)
-- Dependencies: 5
-- Name: market_segment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_segment (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description text,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.market_segment OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 19180)
-- Dependencies: 5 189
-- Name: market_segment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_segment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_segment_id_seq OWNER TO postgres;

--
-- TOC entry 2640 (class 0 OID 0)
-- Dependencies: 188
-- Name: market_segment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_segment_id_seq OWNED BY market_segment.id;


--
-- TOC entry 2641 (class 0 OID 0)
-- Dependencies: 188
-- Name: market_segment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_segment_id_seq', 37, true);


--
-- TOC entry 213 (class 1259 OID 19392)
-- Dependencies: 5
-- Name: market_source; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_source (
    id integer NOT NULL,
    author character varying(450),
    source character varying(450),
    url character varying(450),
    file character varying(100),
    title character varying(450) NOT NULL,
    date date,
    insight text,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.market_source OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 19362)
-- Dependencies: 5
-- Name: market_source_company; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_source_company (
    id integer NOT NULL,
    source_id integer NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.market_source_company OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 19360)
-- Dependencies: 209 5
-- Name: market_source_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_source_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_source_company_id_seq OWNER TO postgres;

--
-- TOC entry 2642 (class 0 OID 0)
-- Dependencies: 208
-- Name: market_source_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_source_company_id_seq OWNED BY market_source_company.id;


--
-- TOC entry 2643 (class 0 OID 0)
-- Dependencies: 208
-- Name: market_source_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_source_company_id_seq', 1835, true);


--
-- TOC entry 212 (class 1259 OID 19390)
-- Dependencies: 5 213
-- Name: market_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_source_id_seq OWNER TO postgres;

--
-- TOC entry 2644 (class 0 OID 0)
-- Dependencies: 212
-- Name: market_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_source_id_seq OWNED BY market_source.id;


--
-- TOC entry 2645 (class 0 OID 0)
-- Dependencies: 212
-- Name: market_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_source_id_seq', 612, true);


--
-- TOC entry 211 (class 1259 OID 19377)
-- Dependencies: 5
-- Name: market_source_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_source_tags (
    id integer NOT NULL,
    source_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.market_source_tags OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 19375)
-- Dependencies: 5 211
-- Name: market_source_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_source_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_source_tags_id_seq OWNER TO postgres;

--
-- TOC entry 2646 (class 0 OID 0)
-- Dependencies: 210
-- Name: market_source_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_source_tags_id_seq OWNED BY market_source_tags.id;


--
-- TOC entry 2647 (class 0 OID 0)
-- Dependencies: 210
-- Name: market_source_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_source_tags_id_seq', 522, true);


--
-- TOC entry 187 (class 1259 OID 19171)
-- Dependencies: 5
-- Name: market_tag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE market_tag (
    id integer NOT NULL,
    name character varying(450) NOT NULL,
    description text,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.market_tag OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 19169)
-- Dependencies: 187 5
-- Name: market_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_tag_id_seq OWNER TO postgres;

--
-- TOC entry 2648 (class 0 OID 0)
-- Dependencies: 186
-- Name: market_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_tag_id_seq OWNED BY market_tag.id;


--
-- TOC entry 2649 (class 0 OID 0)
-- Dependencies: 186
-- Name: market_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('market_tag_id_seq', 162, true);


--
-- TOC entry 2345 (class 2604 OID 19016)
-- Dependencies: 166 165 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2344 (class 2604 OID 19001)
-- Dependencies: 163 164 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2349 (class 2604 OID 19081)
-- Dependencies: 173 174 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- TOC entry 2343 (class 2604 OID 18991)
-- Dependencies: 162 161 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2348 (class 2604 OID 19061)
-- Dependencies: 171 172 172
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2347 (class 2604 OID 19046)
-- Dependencies: 170 169 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2346 (class 2604 OID 19031)
-- Dependencies: 168 167 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2352 (class 2604 OID 19128)
-- Dependencies: 180 181 181
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2350 (class 2604 OID 19097)
-- Dependencies: 175 176 176
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2351 (class 2604 OID 19120)
-- Dependencies: 179 178 179
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- TOC entry 2374 (class 2604 OID 19483)
-- Dependencies: 223 222 223
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_businessmodel ALTER COLUMN id SET DEFAULT nextval('market_businessmodel_id_seq'::regclass);


--
-- TOC entry 2373 (class 2604 OID 19468)
-- Dependencies: 221 220 221
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_businessmodel_comments ALTER COLUMN id SET DEFAULT nextval('market_businessmodel_comments_id_seq'::regclass);


--
-- TOC entry 2375 (class 2604 OID 19499)
-- Dependencies: 224 225 225
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_businessmodeldetails ALTER COLUMN id SET DEFAULT nextval('market_businessmodeldetails_id_seq'::regclass);


--
-- TOC entry 2354 (class 2604 OID 19150)
-- Dependencies: 182 183 183
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_comment ALTER COLUMN id SET DEFAULT nextval('market_comment_id_seq'::regclass);


--
-- TOC entry 2361 (class 2604 OID 19236)
-- Dependencies: 196 197 197
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_company ALTER COLUMN id SET DEFAULT nextval('market_company_id_seq'::regclass);


--
-- TOC entry 2359 (class 2604 OID 19211)
-- Dependencies: 193 192 193
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_company_ecosystem ALTER COLUMN id SET DEFAULT nextval('market_company_ecosystem_id_seq'::regclass);


--
-- TOC entry 2360 (class 2604 OID 19221)
-- Dependencies: 195 194 195
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_company_segments ALTER COLUMN id SET DEFAULT nextval('market_company_segments_id_seq'::regclass);


--
-- TOC entry 2358 (class 2604 OID 19196)
-- Dependencies: 190 191 191
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_company_tags ALTER COLUMN id SET DEFAULT nextval('market_company_tags_id_seq'::regclass);


--
-- TOC entry 2370 (class 2604 OID 19416)
-- Dependencies: 215 214 215
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_ecosystem ALTER COLUMN id SET DEFAULT nextval('market_ecosystem_id_seq'::regclass);


--
-- TOC entry 2355 (class 2604 OID 19166)
-- Dependencies: 184 185 185
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_exit ALTER COLUMN id SET DEFAULT nextval('market_exit_id_seq'::regclass);


--
-- TOC entry 2364 (class 2604 OID 19313)
-- Dependencies: 203 202 203
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_feature ALTER COLUMN id SET DEFAULT nextval('market_feature_id_seq'::regclass);


--
-- TOC entry 2372 (class 2604 OID 19440)
-- Dependencies: 219 218 219
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_metric ALTER COLUMN id SET DEFAULT nextval('market_metric_id_seq'::regclass);


--
-- TOC entry 2371 (class 2604 OID 19432)
-- Dependencies: 217 216 217
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_metrictype ALTER COLUMN id SET DEFAULT nextval('market_metrictype_id_seq'::regclass);


--
-- TOC entry 2363 (class 2604 OID 19297)
-- Dependencies: 200 201 201
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_product ALTER COLUMN id SET DEFAULT nextval('market_product_id_seq'::regclass);


--
-- TOC entry 2362 (class 2604 OID 19282)
-- Dependencies: 199 198 199
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_product_tags ALTER COLUMN id SET DEFAULT nextval('market_product_tags_id_seq'::regclass);


--
-- TOC entry 2366 (class 2604 OID 19339)
-- Dependencies: 207 206 207
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_productfeature ALTER COLUMN id SET DEFAULT nextval('market_productfeature_id_seq'::regclass);


--
-- TOC entry 2365 (class 2604 OID 19324)
-- Dependencies: 205 204 205
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_productfeature_tags ALTER COLUMN id SET DEFAULT nextval('market_productfeature_tags_id_seq'::regclass);


--
-- TOC entry 2379 (class 2604 OID 19565)
-- Dependencies: 232 233 233
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_report ALTER COLUMN id SET DEFAULT nextval('market_report_id_seq'::regclass);


--
-- TOC entry 2378 (class 2604 OID 19550)
-- Dependencies: 231 230 231
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_report_companies ALTER COLUMN id SET DEFAULT nextval('market_report_companies_id_seq'::regclass);


--
-- TOC entry 2377 (class 2604 OID 19535)
-- Dependencies: 229 228 229
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_report_segments ALTER COLUMN id SET DEFAULT nextval('market_report_segments_id_seq'::regclass);


--
-- TOC entry 2376 (class 2604 OID 19520)
-- Dependencies: 227 226 227
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_report_tags ALTER COLUMN id SET DEFAULT nextval('market_report_tags_id_seq'::regclass);


--
-- TOC entry 2357 (class 2604 OID 19185)
-- Dependencies: 189 188 189
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_segment ALTER COLUMN id SET DEFAULT nextval('market_segment_id_seq'::regclass);


--
-- TOC entry 2369 (class 2604 OID 19395)
-- Dependencies: 213 212 213
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_source ALTER COLUMN id SET DEFAULT nextval('market_source_id_seq'::regclass);


--
-- TOC entry 2367 (class 2604 OID 19365)
-- Dependencies: 208 209 209
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_source_company ALTER COLUMN id SET DEFAULT nextval('market_source_company_id_seq'::regclass);


--
-- TOC entry 2368 (class 2604 OID 19380)
-- Dependencies: 210 211 211
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_source_tags ALTER COLUMN id SET DEFAULT nextval('market_source_tags_id_seq'::regclass);


--
-- TOC entry 2356 (class 2604 OID 19174)
-- Dependencies: 186 187 187
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE market_tag ALTER COLUMN id SET DEFAULT nextval('market_tag_id_seq'::regclass);


--
-- TOC entry 2537 (class 0 OID 19013)
-- Dependencies: 166
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2536 (class 0 OID 18998)
-- Dependencies: 164
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2541 (class 0 OID 19078)
-- Dependencies: 174
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2535 (class 0 OID 18988)
-- Dependencies: 162
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add log entry', 8, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change log entry', 8, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete log entry', 8, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add message', 4, 'add_message');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change message', 4, 'change_message');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete message', 4, 'delete_message');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add user', 3, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change user', 3, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete user', 3, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can add business model', 21, 'add_businessmodel');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can change business model', 21, 'change_businessmodel');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can delete business model', 21, 'delete_businessmodel');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can add business model details', 22, 'add_businessmodeldetails');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (65, 'Can change business model details', 22, 'change_businessmodeldetails');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (66, 'Can delete business model details', 22, 'delete_businessmodeldetails');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add comment', 9, 'add_comment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change comment', 9, 'change_comment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete comment', 9, 'delete_comment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add company', 13, 'add_company');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change company', 13, 'change_company');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete company', 13, 'delete_company');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can add ecosystem', 18, 'add_ecosystem');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can change ecosystem', 18, 'change_ecosystem');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can delete ecosystem', 18, 'delete_ecosystem');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add exit', 10, 'add_exit');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change exit', 10, 'change_exit');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete exit', 10, 'delete_exit');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can add feature', 15, 'add_feature');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can change feature', 15, 'change_feature');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can delete feature', 15, 'delete_feature');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can add metric', 20, 'add_metric');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can change metric', 20, 'change_metric');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can delete metric', 20, 'delete_metric');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can add metric type', 19, 'add_metrictype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can change metric type', 19, 'change_metrictype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can delete metric type', 19, 'delete_metrictype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can add product', 14, 'add_product');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can change product', 14, 'change_product');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can delete product', 14, 'delete_product');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can add product feature', 16, 'add_productfeature');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can change product feature', 16, 'change_productfeature');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can delete product feature', 16, 'delete_productfeature');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add segment', 12, 'add_segment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change segment', 12, 'change_segment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete segment', 12, 'delete_segment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add source', 17, 'add_source');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change source', 17, 'change_source');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete source', 17, 'delete_source');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add tag', 11, 'add_tag');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change tag', 11, 'change_tag');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete tag', 11, 'delete_tag');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add site', 7, 'add_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change site', 7, 'change_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete site', 7, 'delete_site');


--
-- TOC entry 2540 (class 0 OID 19058)
-- Dependencies: 172
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) VALUES (1, 'thaymore', '', '', 'thomas.haymore@gmail.com', 'sha1$d8c95$fbf4e8cd3cc0f08374254c51a0418a0a190c7cf7', true, true, true, '2012-01-20 11:22:49.452685-08', '2011-12-22 12:00:54-08');


--
-- TOC entry 2539 (class 0 OID 19043)
-- Dependencies: 170
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2538 (class 0 OID 19028)
-- Dependencies: 168
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2545 (class 0 OID 19125)
-- Dependencies: 181
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2542 (class 0 OID 19094)
-- Dependencies: 176
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_content_type (id, name, app_label, model) VALUES (21, 'business model', 'market', 'businessmodel');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (22, 'business model details', 'market', 'businessmodeldetails');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (9, 'comment', 'market', 'comment');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (13, 'company', 'market', 'company');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (5, 'content type', 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (18, 'ecosystem', 'market', 'ecosystem');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (10, 'exit', 'market', 'exit');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (15, 'feature', 'market', 'feature');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (2, 'group', 'auth', 'group');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (8, 'log entry', 'admin', 'logentry');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (4, 'message', 'auth', 'message');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (20, 'metric', 'market', 'metric');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (19, 'metric type', 'market', 'metrictype');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (1, 'permission', 'auth', 'permission');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (14, 'product', 'market', 'product');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (16, 'product feature', 'market', 'productfeature');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (12, 'segment', 'market', 'segment');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (6, 'session', 'sessions', 'session');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (7, 'site', 'sites', 'site');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (17, 'source', 'market', 'source');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (11, 'tag', 'market', 'tag');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (3, 'user', 'auth', 'user');


--
-- TOC entry 2543 (class 0 OID 19107)
-- Dependencies: 177
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('30c3f82174b3cc922c6e63dfea9c09c5', 'MGJmZDUzNTVjYzA2NjU2YTVmNDhkNTE1NTljY2ZjZGIyNjBjZThiZDqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
', '2012-01-19 13:52:07-08');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('6082d740a7b13ee4a752d0162b848371', 'MGJmZDUzNTVjYzA2NjU2YTVmNDhkNTE1NTljY2ZjZGIyNjBjZThiZDqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
', '2012-01-31 23:23:18-08');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('4c44dc080d4e767df4bf7f64c73b2da0', 'MGJmZDUzNTVjYzA2NjU2YTVmNDhkNTE1NTljY2ZjZGIyNjBjZThiZDqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
', '2012-02-03 11:22:49.460113-08');


--
-- TOC entry 2544 (class 0 OID 19117)
-- Dependencies: 179
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_site (id, domain, name) VALUES (1, 'example.com', 'example.com');


--
-- TOC entry 2566 (class 0 OID 19480)
-- Dependencies: 223
-- Data for Name: market_businessmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2565 (class 0 OID 19465)
-- Dependencies: 221
-- Data for Name: market_businessmodel_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2567 (class 0 OID 19496)
-- Dependencies: 225
-- Data for Name: market_businessmodeldetails; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2546 (class 0 OID 19147)
-- Dependencies: 183
-- Data for Name: market_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_comment (id, user_id, body, company_id, category, created, modified) VALUES (1, 1, '<p>
	Lithium has an interesting business model where they charge based on the activity of customers on the platforms that Lithium provides to its customers. &nbsp;Clever idea, and it means that their revenue automaticaly scales with growth in product. &nbsp;Also probably means an easy early sell because price would be quite low.</p>
', 122, 'co', '2012-01-05 13:52:40-08', '2012-01-05 13:52:40-08');
INSERT INTO market_comment (id, user_id, body, company_id, category, created, modified) VALUES (2, 1, '<p>
	I&#39;m not sure why Nimble thinks that it&#39;s the first and only company to realize that social is the future of marketing, but they have a genius idea for creating a platform for customers to do the marketing for the companies. &nbsp;They provide an opportunity for customers to think of themselves as mavens (think Gladwell) and then they can take on some of the burden of customer outreach.</p>
', 213, 'co', '2012-01-05 14:16:10-08', '2012-01-05 14:16:10-08');
INSERT INTO market_comment (id, user_id, body, company_id, category, created, modified) VALUES (3, 1, '<p>
	BuzzFeed is a pretty interesting company. &nbsp;On the one hand it&#39;s like the Huffington Post, a mix of aggregation (without much attribution) and content, but one that is not necessarily very interesting to us right away. &nbsp;However, on the other hand BuzzFeed is more about measuring and inducing virality -- the content is part of it, for sure, but not the most interesting part.</p>
', 223, 'co', '2012-01-09 13:48:36-08', '2012-01-09 13:48:36-08');
INSERT INTO market_comment (id, user_id, body, company_id, category, created, modified) VALUES (4, 1, '<p>
	&quot;<strong style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(25, 25, 25); font-family: Verdana, Helvetica, Arial, sans-serif; line-height: 16px; ">Of these three factors, the uniqueness of content remains the most potent one</strong><span style="color: rgb(25, 25, 25); font-family: Verdana, Helvetica, Arial, sans-serif; line-height: 16px; ">. With the inflation of aggregators and of social reading habits, the natural replication of information has turned into an overwhelming flood. Then, the production of specific content&mdash;and its protection&mdash;becomes a key element in building value. As for price structures, there is no magic formula. Usually, the simpler the better (as Apple demonstrated)&mdash;especially for businesses that start from scratch. But, with pre-existing and different audience segments such as an individual and corporate users, pricing decisions become more complicated and a diversified price list can prevent cannibalization. As for the Apple v independent app issue, my personal take is that sleeping with Apple is a quick short-term win, an easier strategy. But, in the long run, the independent way (which, after all, is an article of faith for Apple itself) will yield better results.&quot;</span></p>
<p>
	From &quot;How the FT and NYT Aim To May Paywalls Pay&quot;</p>
<p>
	Very interesting take on the power and importance of traditional media outlets, and on the tradeoffs in getting in bed with Apple.</p>
', 215, 'co', '2012-01-10 08:59:18-08', '2012-01-10 08:59:18-08');
INSERT INTO market_comment (id, user_id, body, company_id, category, created, modified) VALUES (5, 1, '<p>
	<span style="color: rgb(0, 0, 0); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 15px; line-height: 24px; ">&quot;Quixey is trying to stand out by offering what it calls a functional search engine, which takes in more than just a title and description of an app but pulls in information from blogs, forums, review sites and social networks to better understand what an app actually does.&quot;</span></p>
', 207, 'co', '2012-01-13 11:47:16-08', '2012-01-13 11:47:16-08');


--
-- TOC entry 2553 (class 0 OID 19233)
-- Dependencies: 197
-- Data for Name: market_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (14, 'Everlane', NULL, '', '', '', '', '', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (50, 'plista', NULL, '', '', '', '', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (116, 'BuzzWatcher', NULL, '', '', '', '', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (178, 'Jotly', NULL, '', '', '', 'jotly.com', '', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (209, 'Digg', NULL, '', '', '', '', '', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (1, 'Trap.it', NULL, '<p>
	Trapit is great content, for you. We scour the web on your behalf, 24/7, organizing the best, most relevant content into individual &quot;traps&quot; on your favorite topics and interests for easy consumption.</p>
', 'Rule the web', '', 'http://trap.it/', 'web', 'active', '2011-12-27 19:29:37-08', '2012-01-06 10:18:52-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (2, 'Snip.it', NULL, '<p>
	Snip.it lets you effortlessly share your opinions on anything from the web. You can create collections of content (we call them &quot;snips&quot;), add your thoughts, and share them with anyone or everyone. Snip it also makes it easy to discover people with interesting opinions on the issues you care about.</p>
', 'Your content, your voice--in one place', '', 'http://snip.it/', 'web', 'active', '2011-12-27 19:29:37-08', '2012-01-17 11:53:30-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (3, 'Pinterest', NULL, 'Pinterest is a social catalog service. Think of it as a virtual pinboard -- a place where you can post collections of things you love, and follow collections created by people with great taste.', '', '', 'http://pinterest.com/', 'web, mobile', 'active', '2011-12-27 19:29:37-08', '2012-01-03 14:22:30-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (4, 'Ness', NULL, 'The first personal search engine based on your unique tastes, preferences and personality.  We''re proud to present our first category, Ness for restaurants.', '', '', 'likeness.com', 'mobile', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (5, 'Svpply', NULL, '<p>
	Svpply is a growing community of people discovering the products they love. Use Svpply to keep track of the things you want to buy, or browse a personal feed of products from across the web, curated and filtered by the people and stores you find interesting.</p>
', '', '', 'http://svpply.com/', 'web', 'active', '2011-12-27 19:29:38-08', '2012-01-07 07:43:57-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (6, 'Tumblr', NULL, '<p>
	Tumblr is a re-envisioning of tumblelogging, a subset of blogging that uses quick, mixed-media posts. The service hopes to do for the tumblelog what services like LiveJournal and Blogger did for the blog. The difference is that its extreme simplicity will make luring users a far easier task than acquiring users for traditional weblogging. Anytime a user sees something interesting online, they can click a quick &quot;Share on Tumblr&quot; bookmarklet that then tumbles the snippet directly. The result is varied string of media ranging links and text to pictures and videos that takes very little time and effort to maintain.</p>
', '', '', 'http://tumblr.com/', 'web, mobile', 'active', '2011-12-27 19:29:38-08', '2012-01-03 17:08:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (7, 'Foursquare', NULL, 'Foursquare is a geographical location based social network that incorporates gaming elements. Users share their location with friends by �checking in� via a smartphone app or by text message. Points are awarded for checking in at various venues. Users can connect their Foursquare accounts to their Twitter and Facebook accounts, which can update when a check in is registered. By checking in a certain number of times, or in different locations, users can collect virtual badges. In addition, users who have checked in the most times at a certain venue will be crowned �Mayor� until someone surpasses their number. Various venues have embraced Foursquare, and offer special deals to users who are �mayors�.', '', '', 'foursquare.com', 'web, mobile', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (8, 'Fancy', NULL, 'Fancy is part store, blog, magazine and wishlist. It''s a place to discover great stuff, to curate a collection of things you love, to get updates on your favorite brands and stores and to share your discoveries.', '', '', 'thefancy.com', 'web, mobile, tablet', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (9, 'Wanelo', NULL, 'Wanelo is a site for bookmarking and sharing your favorite products.', '', '', 'wanelo.com', 'web', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (10, 'Ly.st', NULL, 'Lyst is a social curation platform that�s changing the way people discover fashion online.', '', '', 'lyst.com', 'web', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (11, 'GimmeBar', NULL, 'Gimme Bar is more than social bookmarking -- it actually saves your content to the cloud.', '', '', 'gimmebar.com', 'web', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (12, 'Nuji', NULL, 'Nuji is a tool for gathering your "social wish list"', '', '', 'nuji.com', 'web, mobile', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (13, 'lookk.com', NULL, 'LOOKK (formerly Garmz) enables new design talent to reach their customers and start building their brand. As well as empowering customers to discover a previously unseen section of the market, which they can then chose to support, promote and purchase from.', '', '', 'lookk.com', 'mobile', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (15, 'likeabl.es', NULL, '', '', '', '', '', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (16, 'Radian6', NULL, 'Radian6 helps companies listen to what people are saying about them online and engage in those conversations across the social web. From blogs and comments to multimedia, boards, forums and communities like Twitter, Radian6 gathers the discussions happening online and gives businesses the ability to analyze, manage, track, and report on their social media monitoring and engagement efforts.', '', '', 'radian6.com', 'web, mobile', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (17, 'Polyvore', NULL, 'Polyvore is the leading community site for online style where users are empowered to discover their style and set trends around the world. The company collaborates with prominent brands such as Calvin Klein, Diane Von Furstenberg, Lancme, Net-a-Porter, Gap and Coach to drive product engagement; and its user-generated fashion campaigns have been judged by Lady Gaga and Katy Perry. Headquartered in Silicon Valley, Polyvore is funded by Benchmark Capital and Matrix Partners', '', '', 'polyvore.com', 'web', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (18, 'Path', NULL, 'Path is the simple and private way to share life with close friends & family.', '', '', 'path.com', 'mobile', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (19, 'GoWalla', NULL, '', '', '', 'gowalla.com', '', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (20, 'Pulse', NULL, '<p>
	Pulse is an elegant news reading application for iPhone, iPad and Android devices. It incorporates colorful panning story bars and fills them with content from your favorite sources. Pulse redefines news, giving you the opportunity to experience the news you desire from traditional sources, your favorite blogs and social networks -- all in one beautiful interface.</p>
', '', '', 'http://pulse.me/', 'mobile, tablet', 'active', '2011-12-27 19:29:38-08', '2012-01-07 07:42:49-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (21, 'Outbrain', NULL, 'Outbrain (www.outbrain.com) is the leading content discovery platform, reaching a highly engaged audience through distribution on top publisher sites, including CNN, Fox News, Hachette Filipacchi Media, Mashable, MSNBC and Slate. Outbrain provides publishers a service for recommended links to increase traffic and generate revenue.', '', '', 'outbrain.com', '', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (22, 'VisualRevenue', NULL, 'Visual Revenue''s Front Page Recommendation Platform provides Editors with actionable, real-time recommendations on what content to place in what position right now and for how long. Our predictive analytics technology allows media organizations to proactively manage the cost of exposing a piece of content on a front page, whilst maximizing the return they expect from promoting it', '', '', 'visualrevenue.com', '', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (23, 'Evri', NULL, 'Evri is pioneering a unique, topic-based approach to content discovery. Evri automatically and constantly indexes millions of topic-specific streams from thousands of different sources to filter through the noise of the web and deliver customized news experiences.', '', '', 'evri.com', 'web, mobile', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (24, 'SailThru', NULL, 'API based Email service provider focused on delivering all automated emails (both transactional and marketing) into the inbox. Provides marketing advice on creating engaging emails that drive traffic and revenues. Particularly relevant for those applications hosted within cloud infrastructure as their emails end up in the spam folder more often than not. Sailthru is the only email service provider with behavioral tracking and content selection. Market to the individual, not the unknown.', '', '', 'sailthru.com', 'web', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (25, 'Hakia', NULL, 'Hakia is a semantic search technology company.', '', '', 'hakia.com', 'web', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (26, 'LMK', NULL, '', '', '', 'lmk.com', 'mobile', 'active', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (27, 'Powerset', NULL, 'Powerset is a search engine focused on natural language processing. In other words, Powerset will not search based simply on keywords alone, but will try to understand the semantic meaning behind the search phrase as a whole. The company�launched�in May 2008 with intentions of making search more easy and intuitive.', '', '', 'powerset.com', '', 'discontinued', '2011-12-27 19:29:38-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (28, 'WalmartLabs', NULL, '', '', '', 'walmartlabs.com', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (67, 'Instapaper', NULL, 'A simple tool to save web pages for reading later.', '', '', 'instapaper.com', 'web, mobile', 'active', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (29, 'Kosmix', NULL, 'Kosmix is a guide to the Web. The site (www.kosmix.com) lets users explore the Web by topic, presenting a dashboard of relevant videos, photos, news, commentary, opinion, communities and links to related topics. Kosmix''s categorization engine organizes the Internet into magazine-style topic pages, enabling people to navigate the Web even if they don''t know exactly what they''re looking for.', '', '', 'kosmix.com', '', 'discontiinued', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (30, 'YourVersion', NULL, 'YourVersion is a personalized, real-time discovery engine that helps you to find new and relevant content based on your interests. YourVersion delivers new, personally relevant web content on an ongoing basis and lets you easily bookmark and share your discoveries with friends via email, Facebook, and Twitter.', '', '', 'yourversion.com', 'web, mobile', 'active', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (31, 'Mahalo', NULL, 'Mahalo is a human powered search engine founded by Silicon Alley veteran entrepreneur Jason Calacanis. Results are generated non-algorithmically by a team of profile builders who create pages for search terms. Mahalo includes the most appropriate hand found links and information about for about 10,000 unique queries.', '', '', 'mahalo.com', 'web', 'active', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (32, 'Ellerdale', NULL, 'This enables Ellerdale to automatically display trending topics in real-time within categories, e.g. trending people, trending films, trending companies, trending sports, etc. Users can select from over a million individual topics to track in real-time. The latest tweets and rss articles are tracked, as well as the most discussed URLs that match the topic. The reason Ellerdale is able to do this is that they index the stream using richly described topics that belong to categories, instead of the usual approach of relying on simple keyword strings.', '', '', 'ellerdale.com', '', 'discontinued', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (33, 'Collecta', NULL, 'Collecta monitors the update streams of popular realtime blogs and sites like Twitter, Wordpress, and Flickr, and shows results as they happen. Results can be filtered by status updates, comments, stories, or photos. The entire engine is built around the XMPP standard, which pushes out data on a continual basis, so that for every search you end up watching a stream that keeps updating itself.', '', '', 'collecta.com', '', 'inactive', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (34, 'JustSpotted', NULL, 'Scoopler has now become JustSpotted, a celebrity-tracking tool, meant to give fans an idea of what their favorite celebrities are up to at any given moment. JustSpotted, like Scoopler, is a data-aggregator, yet JustSpotted collects from Twitter, Facebook, and Foursquare � alongside their own data they''ll be collecting from users who actual spot celebrities in the wild. All the information we aggregate is publicly available and you can even do a search on Twitter yourself and find sightings of celebrities. We�re just the first people to organize it on a map and in such a way that it�s easy to consume and ENJOY.', '', '', '', '', 'inactive', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (35, 'Twazzup', NULL, 'Twazzup is an online application that searches�Twitter�for relevant news and information.', '', '', 'twazzup.com', 'web', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (36, 'CrowdEye', NULL, 'CrowdEye is a Twitter Search engine that returns not only recent tweets, but the number of tweets on a subject over time, related news articles, and related keywords.', '', '', 'crowdeye.com', 'web', 'inactive', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (37, 'Pluggd', NULL, '', '', '', '', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (38, 'Retrevo', NULL, '', '', '', '', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (39, 'LazyFeed', NULL, 'Lazyfeed is a realtime RSS feeder that indexes tags on the internet to help users follow topics of interest across online information sources, instead of subscribing to specific blogs. The company�s other product is Lazyscope, a Twitter and RSS reader combined into one', '', '', 'lazyfeed.com', 'web', 'inactive?', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (40, 'ensembli', NULL, 'Ensembli�s technology scans, filters and collates stories, from across the web, that relate to your interests. The more you read, discard, or even ignore the stories Ensembli finds, the more it�ll be able to locate the stories that you�ll really like. Just to be extra clever, as your tastes change, Ensembli will be able to automagically keep up with you!', '', '', 'ensembli.com', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (41, 'Surphace', NULL, 'Surphace (formerly Sphere) provides contextual content tools that make connections between text, video, photos and ads. Surphace helps online publishers create a more engaging reader experience leading to longer time spent on site and increased PVs per visit along with a new incremental revenue stream. Surphace is currently integrated into over 150,000 leading sites and is live on over 1.2 Billion monthly article pages across the web.', '', '', '', '', '$25M', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (42, 'DayLife', NULL, '<p>
	Daylife is a platform for curating, discovering, and combining high-quality content. Its platform serves some of the world&#39;s best-known media brands and consumer destination websites, including USA Today, Turner Sports, Sky News, and the Washington Post. The Daylife Platform also powers its own popular news and information website at www.daylife.com.</p>
', '', '', 'http://daylife.com/', 'web', 'active', '2011-12-27 19:29:39-08', '2012-01-16 22:07:23-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (43, 'Inform Technologies', NULL, 'Inform provides related content for a broad spectrum of online media and information companies including newspapers, magazines, non-traditional publishers, search engines, and portals. Our clients include world-class publishers such as The Washington Post, CNN, NBC, IDG, Newsweek, The Economist, and Conde Nast.  The company support editors and publishers by searching, organizing and linking content so your site can present even greater editorial breadth ��� and win more readers.  While processing millions of pages of content, Inform automatically identifies people, companies, places, organizations and products as they appear in the news; continuously delivering real time, editorially accurate content to the world�s top publishers. Inform�s journalistic technology understands context and recognizes subtle differences in meaning, providing clients with a reliable source of Related Articles and Related Media, as well as Smart Inline Links and Topic Pages.', '', '', 'inform.com', '', 'active', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (44, 'Aggregate Knowledge', NULL, '<p>
	Aggregate Knowledge is an IaaS (Infrastructure as a Service) company delivering the neutral data management platform (DMP) on which the world&#39;s largest advertisers make their digital media decisions. The patent-pending AK Platform combines data management and multi-touch attribution to make media accountable helping advertisers, agencies, ad networks, DSPs, SSPs, and publishers manage and exploit all of their data around a single view of the user. The platform automates &quot;trading desk&quot; like features by bundling hardware, software, science, tools, reports, and services into a single, highly scalable offering.</p>
', '', '', 'http://aggregateknowledge.com/', 'All', 'active', '2011-12-27 19:29:39-08', '2012-01-16 21:10:34-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (45, 'Zemanta', NULL, 'Zemanta is a�tool�that looks over your shoulder while you blog and�gives you tips and advice, suggests related content and pictures and makes sure your posts get promoted as they deserve to be. We at Zemanta are thinking hard to help make blogging easier for you. We''re engineering better creative tools to help you�get the most out of your blogging time.', '', '', 'zemanta.com', 'browser plug-in, blogging engines', 'active', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (46, 'NewsCred', NULL, '<p>
	NewsCred is re-inventing the current news model to license, curate and deliver high quality content cheaper, smarter and easier. With over 700+ of the world&#39;s highest quality news sources, NewsCred provides full text news articles, photo and video from sources like Billboard and Forbes, Gawker and The Guardian, The Economist and The Washington Post.</p>
', '', '', 'http://www.newscred.com/', 'Web', 'active', '2011-12-27 19:29:39-08', '2012-01-06 10:52:19-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (47, 'Loud3r', NULL, 'The Loud3r platform powers publishers with the web''s best real-time content. LOUD3R is an automated, scalable content aggregation platform that finds, filters and publishes the best news, blogs, photos, videos and social media about any topic. We combine semantic search & aggregation technology with human experts to find the hottest, freshest, most relevant content on the web about the things that you REALLY care about.', '', '', 'loud3r.com', '', 'Semantic search and aggregation', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (48, 'OneSpot', NULL, 'OneSpot''s system finds top stories for a specific topic area by evaluating story linking patterns across the Web. This approach allows providers to complement their content without requiring a large existing archive of previously published work.', '', '', 'onespot.com', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (49, 'SezWho', NULL, 'SezWho is a service which encourages user participation and community engagement on social media sites. This is accomplished through a universal profile widget which provides links to a user�s contributions across the web. When a reader views a particular piece of content that they find interesting, the next question they naturally ask is �who is this person and what else have they contributed?� Using the SezWho plugin they can click through to other contributions made by this user whether they�re blog posts, blog comments, forum contributions, pictures, videos, etc. The end result is a people based content discovery mechanism for viewers and increased page views for hosting sites. SezWho also provides a rating and reputation module which allows viewers to rate content, whereby contributors develop portable, context specific reputations based upon community feedback. Content can then be filtered and tracked based upon ratings.', '', '', 'cross-platform profiles', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (51, 'BlogGlue', NULL, 'Improves SEO and content by including SEO links and contextually relevant content, from own site and from network of blog glue sites', '', '', 'bloglue.com', '', 'active', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (52, 'nrelate', NULL, 'nRelate provides free tools for online publishers to help increase traffic and revenues. Their first product, a related content plugin, analyzes the current page and suggests other relevant articles from the publisher�s own site, their partners, or content marketers.', '', '', 'nrelate.com', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (53, 'Vertical Acuity', NULL, 'On-site content discovery -- doesn''t force you to go to a different site', '', '', '', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (54, 'OnSwipe', NULL, 'OnSwipe is a platform that provides a way for publishers of all sizes to make their content and advertising a beautiful experience on touch-enabled devices via Web browser. With OnSwipe, media content and advertising will appear and function as they do on native websites and applications, providing a magazine-like experience on touch devices. OnSwipe addresses a growing industry need with tablet use on the rise.', '', '', 'onswipe.com', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (55, 'Ctroo', NULL, 'Ctroo''s mission is to create tools to help navigate in the vast oceans of textual data that surround us.', '', '', 'ctroo.com', 'browser plug-in', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (56, 'SimpleReach', NULL, 'Provides Slide widget that slides in at bottom of page and recommends related content on site based on contextual, behavioral, and sentiment analysis, popular posts, and trends in social media.', '', '', 'simplereach.com', 'web', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (57, 'Apture', NULL, 'Apture allows publishers and bloggers to link and incorporate several media items into a dynamic layer above their pages. Publishers have to embed a single line of Javascript code into their site and then sign into their Apture account. By highlighting words or phrases Apture allows publishers to link, providing appropriate content to choose between. When the reader clicks a small window opens with related items selected by the publisher. The reader can view the content be it text, video or photos. Readers access these items without leaving the original page', '', '', 'apture.com', '', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (58, 'Gravity', NULL, 'Gravity''s mission is to personalize the internet. Through our applications, Gravity understands people''s interests so that our partners can create more relevant experiences for their users. Our goal is to build a smarter internet that helps people sift through the overwhelming amount of information on the web, while delivering a serendipitous experience that exposes them to the breadth and depth of the internet.  Our proprietary ontology and natural language processing algorithms enable us to extract interests from structured and unstructured content with a high degree of accuracy and to systematically build high-precision Interest Graphs for people.', '', '', 'gravity.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (59, 'Google Related', NULL, 'Similar to Apture, but displays a thin bar at the bottom of the Chrome browser window (or as part of the Google toolbar) that lets users access content that is related to what they''re currently browsing', '', '', 'google.com/related', 'browser plug-in', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (60, 'PersonalizedMedia', NULL, 'Like apture', '', '', 'knewco.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (61, 'Silk', NULL, 'Silk is a web-based platform that allows content creators to provide their content in a more structured manner on the web. We enable users to choose the data they want from the mass of information available, and to view and arrange it in ways that make sense to them.', '', '', 'silkapp.com', '', 'private beta', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (62, 'SocialFlow', NULL, 'SocialFlow''s optimization helps earn greater attention and engagement by publishing content when your audience is most available and receptive to your Tweets. The result is a greater number of clicks, Retweets, @mentions, @replies and Followers.', '', '', 'socialflow.com', '', 'active', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (63, 'ShareThis', NULL, 'ShareThis is the largest market for sharing and influence across the web, reaching more than 400 million users across nearly 1 million sites. ShareThis makes content more engaging for publishers and marketing more impactful for brands by tapping into its true influence and value.', '', '', 'http://sharethis.com/', 'web', 'active', '2011-12-27 19:29:40-08', '2012-01-02 16:34:28-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (64, 'AddThis', NULL, 'AddThis is the world''s largest content sharing platform. It gives end users a simple and easy way to share content across the social web, and provides publishers with increased web traffic and in-depth analytics.', '', '', 'addthis.com', '', 'active', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (65, 'Bit.ly', NULL, '<p>
	bitly helps you collect, organize, shorten and share links. We are currently reinventing how people discover and share content on the web.</p>
', '', '', 'http://bitly.com/', 'web, mobile', 'active', '2011-12-27 19:29:40-08', '2012-01-07 07:41:52-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (66, 'Delicious', NULL, 'With Delicious you save, stack and share the web. Instantly save your favorite links, collect your discoveries in stacks, share what you find, and dig deeper into your favorite topics.', '', '', 'delicious.com', 'web', 'active', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (206, 'Appbrain', NULL, '', '', '', 'appbrain.com', 'web', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (68, 'Tynt', NULL, 'In the world of digital advertising, only Tynt can accurately predict consumer behavior on the Web. Through a vast network of publisher partnerships, Tynt sees 3 out of every 4 of the world�s unique Internet users to capture information on their interests and interactions online. This data represents the Interest Graph, and provides an accurate measure of consumer intent. This insight gives advertisers the tools they need to react quickly to new opportunities; to anticipate marketing spend and to realize both short and long term goals. Tynt is the first-of-its-kind ad network to revolutionize online customization, delivering the right message, to the right person, at the right time.', '', '', 'tynt.com', 'web', 'active', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (69, 'Shortrr', NULL, 'Social idea curation', '', '', 'shortrr.com', '', 'active', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (70, 'StumbleUpon', NULL, 'StumbleUpon is a discovery engine that finds the best of the web, recommended just for you. StumbleUpon uses positive and negative user ratings to form collaborative opinions on website quality. When users stumble, they will only see pages which friends and like-minded stumblers have recommended. Users often find that the content they discover on StumbleUpon could not have been found using a search engine. People who are passionate about StumbleUpon say they like it because of its serendipitous nature. Users love the surprise factor in what they see next, and the fact that the product has such a high hit rate in delivering interesting new content.', '', '', 'stumbleupon.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (71, 'Flipboard', NULL, 'Flipboard is a digital social magazine that aggregates web links from your social circle, i.e.�Twitter�and�Facebook, and displays the content in magazine form on an iPad.', '', '', 'flipboard.com', 'tablet', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (72, 'Zite', NULL, 'Personalized magazine service', '', '', 'zite.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (73, 'News.me', NULL, 'Delivers a daily digest of the best tweets and also has an ipad app the focuses on best tweets', '', '', 'news.me', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (74, 'Summify', NULL, 'People are increasingly getting their news mainly from the social networks they�re part of, but this is rapidly getting overwhelming. If you�re connected with a few hundred people and companies it�s hard to stay on top of the news they share. There�s currently no way to get the important stuff without going through all your news.  Summify automatically identifies the most important news stories for you across all of your social networks and delivers to you a personalized email digest in your inbox!', '', '', 'summify.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (75, 'Editions (AOL)', NULL, 'Editions by AOL is a beautiful, new, daily magazine that learns what you like, and what you don''t.  It curates the bets articles that match your interests and delivers you a magazine made just for you.', '', '', 'editions.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (76, 'Spling', NULL, 'Spling is a social platform focusing on content discovery and media sharing. Our goal is to make sharing and discovering cool and relevant links as easy as possible. We allow users to share any link with anyone in the single click of a button, while creating a repository where they can store and sort their favorite links. Users can share with friends, groups, or the community at large. Simultaneously, we allow the users to explore and consume Internet content filtered through their friends, families, and communities�the people they trust and care about�thus ensuring a guaranteed quality of content.', '', '', 'spling.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (77, 'Subjot', NULL, 'Subjot combines your social graph with your interest graph to create a microforum. You assign a subject to every post. You can find posts by subject and create a feed of only the subjects and people you care about. The emphasis on subjects helps you find friends, new and old, who share your interests, enabling you to have more meaningful conversations with them.', '', '', 'subjot.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (78, 'Chime.in', NULL, 'At Chime.in we�re building the world�s richest interest network. A place to learn and share with others who have the same interests. Where one day, your every interest, no matter how big or small, serious or silly, will have its own vibrant community of people who are just as passionate about it as you are.', '', '', 'chime.in', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (79, 'Pressly', NULL, 'Pressly is an HTML5 publishing platform that automatically transforms online content, such as RSS feeds and social content, into interactive, cleanly-designed web apps for tablet web browsers. Pressly is currently optimized for the iPad.', '', '', 'pressly.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (80, 'Wibiya', NULL, 'Wibiya supports a�web toolbar�platform that enables blogs and websites to integrate a variety of third party applications. These web applications provide a broad spectrum of services and features that eliminate the user�۪s need to leave the web page.', '', '', 'wibiya.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (81, 'LocalVox', NULL, 'LocalVox Media Inc (NearSay) is a digital content hub that provides local neighborhood lifestyle news and editorial content. We provide a platform for merchants to have a single online marketing / promotion solution. Merchants can effectively create awareness, drive transactions and manage communication with clients and prospects with simple, integrated tools.', '', '', 'localvox.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (82, 'Grovo', NULL, 'Grovo produces free and Premium Business video tutorials that cover the Web''s most popular and useful sites as well as essential cloud services in social media, productivity, and online marketing. Applications include Facebook Profile, Advertising, and Pages, Google Analytics and Apps, Twitter, Yelp, Basecamp, and LinkedIn. Currently, our library contains over 800 video tutorials, and we produce 20 more every week. The videos are delivered through our proprietary education and training platform, which includes the lesson, pre-written notes, quizzes, and glossary terms.', '', '', '', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (83, 'my6sense', NULL, 'My6sense brings the good stuff from your digital streams! It''s personal - Content is ranked based on what''s relevant to you. It''s insightful - Empower yourself with the knowledge you''d never want to miss. It''s effortless - You don''t need to give any feedback at all.', '', '', 'my6sense.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (84, 'Genieo', NULL, 'Genieo is a newspaper styled homepage, designed exclusively for you, and featuring personalized news and information specifically relevant to your interests. Offering a new informational experience for all Internet users, Genieo adapts to your online behavior, saves you time and helps discover items of interest to you, all in a process which requires zero management and in which your information remains completely private.', '', '', 'genieo.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (85, 'Cascaad', NULL, 'Cascaad is a new kind of personalized recommendation engine, helping the right content find users through a deep analysis on social graphs and social stream activity to create a current semantically-rich interest profile and social sphere of influence for a person, that can then be used to surface personally relevant content and ads.', '', '', 'cascaad.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (207, 'Quixey', NULL, '<p>
	Quixey is a functional search engine for apps.</p>
', '', '', 'http://quixey.com/', 'web', 'active', '2011-12-27 19:29:43-08', '2012-01-13 11:47:30-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (86, 'Proximic', NULL, 'Proximic precision-matches complex and unstructured online content to the most effective advertisement targeting. At the same time the company helps brand advertisers assess the quality of ad environments for their brand messages. This leads to higher acceptance of online ads for users and advertisers and ultimately brings more revenue into the online ad market place.', '', '', 'proximic.com', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (87, 'OpenCalais', NULL, 'The OpenCalais Web Service automatically creates rich semantic metadata for the content you submit in well under a second. Using natural language processing, machine learning and other methods, Calais analyzes your document and finds the entities within it. But, Calais goes well beyond classic entity identification and returns the facts and events hidden within your text as well.', '', '', 'opencalais.com', 'web', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (88, 'Alchemy', NULL, 'AlchemyAPI is a product of Orchestr8, a leading provider of semantic tagging and text mining solutions, helping companies enhance, understand, and better-leverage their textual information assets. We provide publishers with the tools and capabilities necessary to compete in today''s highly-interconnected global information economy.�', '', '', '', '', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (89, 'AddToAny', NULL, 'Add to Any�s �Share/Save� and �Subscribe� widgets let website visitors share and save pages using any service, and subscribe to RSS feeds using any feed reader. Widgets contain a searchable menu of every applicable service, with the most popular displayed by default.', '', '', 'addtoany.com', '', 'acquired', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (90, 'Trunk.ly', NULL, 'Trunk.ly automatically collects links when and where you share them, storing them in one place so you can easily find them again with our powerful search. Trunk.ly is the easiest way to save links online.', '', '', 'trunk.ly', '', 'acquired', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (91, 'Symbaloo', NULL, 'By creating their own favorite webmixes, people can easily access their favorite websites, news feeds, search engines, radio stations and/or widgets. By sharing and publishing their webmixes others can find the best information about all different subjects.', '', '', 'symbaloo.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (92, 'BlueFin Labs', NULL, 'Bluefin Labs is a social TV analytics company providing solutions to brand advertisers, advertising agencies, and TV networks. Bluefin Labs'' technology and data enable clients, for the first time, to tap into data at scale that links people''s social media commentary to the shows and commercials they watch on TV. Grounded in 15 years of cognitive science and machine learning research at the MIT Media Lab, Bluefin Labs was founded by Deb Roy and Michael Fleischman in 2008 and is headquartered in Cambridge, MA.', '', '', 'bluefinlabs.com', 'TV', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (93, 'DataSift', NULL, 'DataSift solves the problem for developers and companies where they want to easily be able to aggregate and filter the content from Twitter but don�t have the server resources to do this on a per project basis. DataSift gets the full firehose of information so you won�t miss anything either and you don�t need to go through the Twitter app authorization process.  DataSift resolves this by taking the complexity away and providing API�s and notification services to get round this issue. Our interface is drag & drop with the option for developers to use our own filtering language as well.  DataSift resolves this by taking the complexity away and providing API�s and notification services to get round this issue. Our interface is drag & drop with the option for developers to use our own filtering language as well.  Our revenue model is simple, you pay for the volume you consume or have inline advertising within your stream.', '', '', 'datasift.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (94, 'Bunchify', NULL, 'Our goal is for you to find people you can really connect with. Bunchify will let you share cool photos, links, or videos with people who actually like what you�re sharing. No more searching for people to follow or trying to add new friends, we will do it all for you. If meeting new people isn�t what you�re looking for, then browse Bunchify and read posts about your favorite interests <� What a great idea. And all in one feed!', '', '', 'bunchify.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (95, 'Paper.li', NULL, 'A newspaper built from all the articles, blog posts, videos and photos shared on Twitter or Facebook.', '', '', 'paper.li', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (96, 'Hunch', NULL, 'Hunch is a consumer web application that is building the �taste graph� of the internet, mapping every person on the internet to every entity on the internet and their affinity for that entity. An entity could be a web site, a cookbook, a hotel room, a celebrity, a restaurant, etc.', '', '', 'hunch.com', 'web', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (97, 'soup.io', NULL, '<p>
	With Soup.io, users can upload videos and images as well as post HTML, quotes and text. Users can also import content from Digg, Flickr,Del.ici.ous, YouTube, StumbleUpon, Twitter and others, use a bookmarklet to collect content from around the web, send in posts by email, or repost what they like from their friends.</p>
', '', '', 'http://playwho.com/', 'Web', 'active', '2011-12-27 19:29:41-08', '2012-01-03 17:17:07-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (98, 'Playwho', NULL, 'PLAYWHO is a social shop-marking service where peoplediscover, recommend�and�share�affordable products', '', '', 'playwho.com', 'web', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (99, 'Yeay.me', NULL, 'Yeay.me is a place where you can get your personalized recommendations, get advices from your friends and find products at best price.', '', '', 'yeay.me', '', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (100, 'Convore', NULL, 'Convore is the best way to communicate with groups in real-time. You can join an existing group or create your own. Then post topics and have conversations with friends about those topics.', '', '', '', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (101, 'Kippt', NULL, 'Kippt makes it easy to save, organize, search and read information you find on the web.', '', '', 'kippt.com', '', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (102, 'Pearltrees', NULL, 'Pearltrees is a place to organize, discover and share everything you like on the web.', '', '', 'pearltrees.com', '', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (103, 'NotJustALabel', NULL, '', '', '', '', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (104, 'OpenAmplify', NULL, 'OpenAmplify is a technology company specializing in natural language processing and text analysis.�Over the past 10 years we have developed a multi-patented text analysis platform that has been used in real-world commercial applications since 2003. We have worked with over 900 brands over the past few years, with hundreds of customers and some of the largest ad and media agencies using OpenAmplify technology every day.', '', '', 'openamplify.com', '', 'aactive', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (105, 'Klout', NULL, 'Klout allows users to track the impact of their opinions, links and recommendations across your social graph. Data is collected about the content users create, how people interact with that content and the size and composition of their networks. Klout identifies influencers and provides tools for influencers to monitor their influence.', '', '', 'klout.com', 'web', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (106, 'Alterian', NULL, 'Alterian (LSE: ALN) helps marketers improve results through its integrated marketing software platform and global partner community of leading marketing service providers, agencies, and systems integrators.', '', '', '', '', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (107, 'Meltwater Buzz', NULL, 'Meltwater Buzz is a Social Media Monitoring & Engagement platform that provides businesses and brands with deep insight into the communications happening across the social web. Meltwater Buzz monitors over 200 million sources and captures and analyzes conversations relevant to your brand, your business and your market. Understand the themes and flow of social conversation. Learn which individuals are the most active influencers in your market. Be alerted to negative conversations about your brand. And much more.', '', '', 'buzz.meltwater.com', 'web', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (108, 'Trackur', NULL, 'Trackur is a social media monitoring tool designed to assist companies and PR professionals in tracking what is said about brands on the internet. Trackur scans hundreds of millions of web pages�including news, blogs, video, images, and forums�and alerts the user to anything that matches the keywords monitored.', '', '', 'trackur.com', 'web', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (109, 'ViralHeat', NULL, 'Viralheat lets brands, agencies, marketers and content producers to monitor consumer generated content on social networks to identify key trends, understand community engagement and perform competitive analysis.', '', '', 'viralheat.com', 'web', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (110, 'Beevolve', NULL, 'Beevolve Technologies provides social media monitoring & insights platform to brands and agencies interested in tracking what people are saying about their brands and products online. The analytics is used to deliver deep insights about products, brands, markets, consumers and trends.', '', '', 'beevolve.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (111, 'Visible Technologies', NULL, 'Visible is the leader in social media monitoring and analytics solutions, providing the perfect combination of software and services to harness business value from social communities. Visible Intelligence is our next generation social media platform, designed to deliver big improvements in competitive and brand intelligence, marketing ROI and smarter customer insights through an agile platform that activates brand communities at Internet speed and enterprise scale.', '', '', 'visibletechnologies.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (112, 'Scout Labs', NULL, 'Scout Labs is a powerful, web-based application that finds signals in the noise to help your team build better products and stronger customer relationships.', '', '', 'scoutlabs.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (113, 'Collective Intellect', NULL, 'Collective Intellect produces real time market intelligence, using the most advanced digital communications analytics platform available to address the most critical needs that marketing professionals face', '', '', 'http://www.collectiveintellect.com/', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (114, 'Biz360', NULL, 'Biz360, Inc. is an information-services company focused on transforming information to help businesses make better decisions. They use technology to aggregate, measure and analyze news media and consumer opinion information from a vast amount of traditional and social media sources (i.e. print, broadcast, websites, blogs and message boards) to yield invaluable insights which enable marketing and media executives to better understand, reach and motivate their target audiences.', '', '', 'biz360.com', '', 'inactive', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (115, 'Sysomos', NULL, 'Sysomos offers social media monitoring and analytics products that give corporations, marketers, public relations agencies and advertisers the intelligence and insight needed to make smarter business and strategic decisions.', '', '', 'http://www.sysomos.com/', 'web', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (117, 'AT Internet', NULL, 'Specialising in online web traffic measurement, and web and mobile site performance, AT Internet has for a longtime been known for its leading product XiTi. Today the company''s activity is mainly focused on Online Intelligence. AT Internet offers a large range of products which are specific to the different jobs in the fields of Web Analytics, performance monitoring, online reputation and multi-channel analysis. The company''s aim is to provide businesses with real time statistics on their Internet and mobile sites, as well as social networks and applications so that businesses can improve their business decision-making processes and work on a coherent online marketing strategy.', '', '', '', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (118, 'Buddy Media', NULL, 'Buddy Media is the social enterprise software of choice for eight of the world�s top ten global advertisers, empowering them to build and maintain relationships with their consumers in a connections-based world. The Buddy Media social marketing suite helps brands build powerful connections globally with its scalable, secure architecture and data-drive customer insights from initial point of contact through point of purchase. Buddy Media is headquartered in New York City, with additional offices located in Asia, London, and San Francisco.', '', '', 'buddymedia.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (119, 'Webfluenz Intelsys', NULL, 'Webfluenz is a social media intelligence company which along with a system to listen, monitor and engage with social media and the real-time web, also provides intelligence in the form of research reports.', '', '', 'http://www.webfluenz.com/', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (120, 'HootSuite', NULL, 'HootSuite helps organizations use the social web to launch marketing campaigns, identify and grow audience, and distribute targeted messages across multiple channels.', '', '', 'http://hootsuite.com', 'web', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (121, 'PeopleBrowsr', NULL, 'PeopleBrowsr�s end-to-end social media marketing solutions assemble the collective intelligence, identify its most influential people, and make them accessible for analysis and engagement. Kred spotlights the most influential people by interest-based community and location. Our 100 terabyte Datamine of 1,000 days of social media posts is accessible through Playground, a comprehensive social analytics platform, or via an API for custom development. Our Enterprise Services group offers full-service social marketing campaigns and custom reports. PeopleBrowsr Labs, our accelerator for social startups, is located at our San Francisco headquarters.', '', '', 'http://www.peoplebrowser.com', '', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (122, 'Lithium', NULL, 'Lithium helps top brands find online and mobile social customers, understand their influence, and build lasting relationships. The Lithium Social Customer Suite offers comprehensive social monitoring, creative customer experiences, and actionable analytics across millions of blogs, forums, and social networking sites. Our technology is proven in high-volume, growth environments and provides security, open and custom APIs, and multi-language support. For market leaders such as Best Buy, AT&T, Research In Motion Limited (RIM), Univision, and PayPal, Lithium is the leading provider of social customer solutions that deliver real business results.', '', '', 'lithium.com', 'web', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (123, 'Social Mention', NULL, '', '', '', 'socialmention.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (124, 'Ubervu', NULL, 'uberVU keeps track track of all the major social media platforms in real-time. You can get all the mentions related to a search, access all your metrics and engage with the influencers from a single unified dashboard.', '', '', 'ubervu.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (125, 'eCairn', NULL, 'We specialize in community and influencers marketing and differentiate in "who matters". Our headquarters are in Los Gatos, California in the heart of Silicon Valley.', '', '', 'ecairn.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (126, 'Weardrobe', NULL, 'Weardrobe�is a social platform for personal fashion. It is a place where people can catalog their own clothing and easily browse through the lookbooks of other people''s street style. Users can upload photos, tag what they are wearing, and organize these items in a virtual closet to share with others. Tags also allow users to search and view all the clothing photos of a particular piece of clothing in their own or their friends'' wardrobes. All the content on Weardrobe is user-generated, comprising photos and clothing tags.', '', '', 'http://weardrobe.com', 'web', 'inactive', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (127, 'Chicismo', NULL, 'Chicisimo is a community of fashionistas sharing their personal style and inspiring each other. You can use Chicisimo�to share your style and keep a diary of how you dress daily, or you can use the site to discover new looks and brands, and decide what to wear tomorrow.', 'real fashion on real people', '', 'http://chicismo.com', 'web', 'active', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (128, 'ShopStyle', NULL, '', '', '', '', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (129, 'Chick Approved', NULL, '', '', '', 'chickapproved.com', '', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (130, 'ThisNext', NULL, 'ThisNext is a social commerce site where people recommend their favorite products so others can discover what�s best to buy online. It blends two powerful elements of real-world shopping otherwise lost for online consumers: word-of-mouth recommendation from trusted sources and the ability to browse products in the way that naturally leads to discovery. ThisNext has also developed a suite of distribution tools for bloggers, online communities and commerce sites', '', '', 'thisnext.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (131, 'OneRiot', NULL, '', '', '', 'oneriot.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (132, 'Float', NULL, 'Personalized to your interests, integrated with social sharing features and offering a �floating� reading experience across devices, Float makes it easy to transition between casually browsing and deeply diving into the broad range of topics that pique interest, inspire curiosity and capture the imagination.', '', '', 'float.com', 'web, mobile, tablet', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (133, 'Ongo', NULL, 'The site compiles some of the most trusted, best news brands today - such as The New York Times, Washington Post, Financial Times, USA Today and Associated Press - in one comprehensive online destination.', '', '', 'ongo.com', 'tablet', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (134, 'Trove', NULL, 'Trove is a personalized news and information engine. Our goal: to aggregate the Web''s most interesting stories from a wide swath of sources, then give our users the power to customize what they see and how they see it.', '', '', 'trove.com', 'web', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (135, 'Skygrid', NULL, 'SkyGrid builds products that connect people with the things they care about most, whether it''s making closer connections with music artists, or staying up to date on trending news.', '', '', 'skygrid.com', 'mobile, tablet', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (136, 'Evernote', NULL, 'Evernote allows users to capture, organize, and find information across multiple platforms. Users can take notes, clip webpages, snap photos using their mobile phones, create to-dos, and record audio. All data is synchronized with the Evernote web service and made available to clients on Windows, Mac, Web, and mobile devices. Additionally, the Evernote web service performs image recognition on all incoming notes, making printed or handwritten text found within images searchable.', 'Remember everything', '', 'evernote.com', 'web, mobile, tablet', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (137, 'Springpad', NULL, '', '', '', 'springpad.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (138, 'Foodspotting', NULL, '', '', '', 'foodspotting.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (139, 'Radar Networks', NULL, 'Radar Networks Twine uses semantic technology to auto-categorize the things in your life.', '', '', 'radarnetworks.com', '', 'discontinued', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (140, 'reQall', NULL, '', '', '', 'reqall.com', 'mobile', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (141, 'Memonic', NULL, 'Memonic allows you to quickly and easily clip, capture, organize and re-use/ retrieve any type of digital information or web content - from web pages to snippets from the web, to images, videos and more.', '', '', 'memonic.com', 'web, mobile, tablet', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (142, 'Simperium', NULL, '', '', '', 'simperium.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (143, 'Strands Labs', NULL, 'Strands Labs powers online personalization by providing solutions within the financial, recommendation and fitness industries', '', '', 'strands.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (144, 'Directed Edge', NULL, 'Directed Edge delivers Amazon-like �People who bought this also bought�� and �We think you�d also like�-style recommendations to other sites, using existing data being collected such as purchase or click histories. Recommendations are served in real-time via a REST API, with language bindings in several programming languages to make integration easy.', '', '', 'directededge.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (145, 'Intense Debate', NULL, '', '', '', '', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (146, 'Disqus', NULL, '', '', '', '', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (147, 'Tangler', NULL, '', '', '', '', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (148, 'HaloScan', NULL, '', '', '', '', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (149, 'Loomia', NULL, '', '', '', 'loomia.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (150, 'Vibrant Media', NULL, 'Vibrant  is a world leader in contextual technology aligning billions of words across the Internet with relevant video, information, tools, and advertising. With over 4,500 premium publishers, reaching 200 million unique users per month (comScore, September 2010), Vibrant gives top brand marketers the opportunity to deliver highly targeted advertisements within premium Web content and offers publishers premium editorial tools to re-circulate users throughout their websites. Vibrant works with top brand advertisers such as Microsoft, Unilever, Warner Bros and AT&T.�', '', '', 'vibrantmedia.com', '', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (151, 'utopic', NULL, '', '', '', 'utopic.me', 'web', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (152, 'Storify', NULL, 'Turn what people post on social media into compelling stories. With Storify, you collect the best photos, video, Tweets and more to publish them as simple, beautiful stories that can be embedded anywhere. It''s the best way to remember an event through what people share, whether it''s a conference, wedding, election or natural disaster', '', '', 'storify.com', 'web', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (153, 'Diigo', NULL, 'An abbreviation for the �Digest of Internet Information, Groups and Other stuff,� Diigo is a social annotation service that lets users add highlights and notes�in situ�to any web page. These overlayed comments made through Diigo can be made either public or private; other Diigo users can then read public comments and reply/interact to comments. Diigo combines aspects of social bookmarking, full-text search, annotations, tagging, and sharing. A browser plugin allows you to share your annotations directly with others, and you can save annotated pages to numerous other bookmarking services as well.', '', '', 'diigo.com', 'web', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (154, 'Trailmeme', NULL, 'Trailmeme is a new kind of Web publishing that you can use to create a trail of content on a specific topic that�s interesting to you. You can also read other peoples� trails and walk them to keep up with any updates they make.', '', '', 'trailmeme.com', 'web', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (155, 'BuzzGain', NULL, 'BuzzGain helps listen, learn, analyze and engage with digital influencers on outreach efforts in an actionable fashion. The fee based service provided, reduces costs of PR by at least 80%.', '', '', '', '', 'inactive', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (156, 'Surf Canyon', NULL, 'Surf Canyon develops real-time implicit personalization technology for search. Available at their website or through a browser extension for Internet Explorer and Firefox, it claims to �improve� search results provided by Bing, Google and Yahoo. It pulls up results from further down the rankings and produces a re-ranked subset of results around each initial one.', '', '', 'surfcanyon.com', 'web', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (157, 'PostRank', NULL, 'PostRank Inc. is a world-class technology company that monitors and collects social engagement events with online content in real-time across the web. PostRank gathers where and when stories generate comments, bookmarks, tweets, and other forms of interaction from a host of social hubs. Publishers and people interested in their content can then use PostRank analysis to gauge influence and reach with audiences.', '', '', 'postrank.com', 'web', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (158, 'Attensity', NULL, 'Attensity helps the world''s leading brands leverage customer conversations as a business asset. Using Attensity''s integrated suite of customer analytics and response applications, organizations can tap the wealth of data stored in both internal and online sources, and use that information to improve the customer experience with their brands. Attensity''s award-winning Customer Experience Management (CEM) solutions are built on a massively scalable text analytics platform that enables organizations to listen, analyze, relate and act on customer conversations, no matter where they take place.', '', '', 'attensity.com', 'web', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (159, 'Thoora', NULL, 'Founded in 2008, Thoora is a service that helps people find, curate, and publish beautiful, naturally search-friendly, automatically updating content on the web.', '', '', 'thoora.com', 'web', 'inactive', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (160, 'Topsy', NULL, 'Topsy, which launched on May 26, 2009, is a real-time search engine, with a focus on social media sites like Twitter. The site�s underlying technology examines popular links as well as the influence of each person citing a link. Topsy augments traditional search engines by finding information that people are talking about.', '', '', 'topsy.com', 'web, mobile', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (161, 'Clever Sense', NULL, 'At the heart of the Clever Sense Platform is the Serendipity Engine: a personalized context-aware right-time discovery engine. The Serendipity Engine adds a layer of real-time machine learning algorithms and intelligent agent architecture on top of the Clever Sense Interest Graph. It goes beyond traditional recommendation engines by incorporating user�s anonymous interest profile and current context (time, location, intent, and social context) into curation of its recommendations.', '', '', 'cleversense.com', 'mobile', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (162, 'blekko', NULL, 'blekko is a better way to search the web by using slashtags. slashtags search only the sites you want and cut out the spam sites. use friends, experts, community or your own slashtags to slash in what you want and slash out what you don''t.', '', '', 'blekko.com', 'web, mobile', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (163, 'horizobu', NULL, '', '', '', 'horizobu.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (164, 'Scoop.it', NULL, 'Scoop.it empowers people and brands to easily create online magazines.', '', '', 'scoop.it', 'web, mobile', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (165, 'Storyful', NULL, 'Storyful was founded by journalists who wanted to separate the news from the noise of the real-time web. They set out to discover the smartest conversations about world events and raise up the authentic voices on the big stories.', '', '', 'storyful.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (166, 'percolate', NULL, 'Percolate helps brands create content at social scale through a system of onboarding, technology and content curation.', '', '', 'percolate.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (167, 'Hearsay Social', NULL, 'Hearsay Social provides the first comprehensive social media SaaS offering for brands with local branches and representatives. Hearsay Social helps these �corporate/local� organizations centrally measure, manage, and deploy content, compliance, monitoring, and analytics across corporate and local social media presences including Facebook, LinkedIn, and Twitter.', '', '', 'hearsaysocial.com', '', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (168, 'Cloth', NULL, 'Cloth is the simple way to save and share your favorite outfits. No ads. No log-ins. No registration. Just an easy tool for making the most of your closet.', '', '', 'clothapp.com', 'mobile', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (169, 'Fab.com', NULL, 'Fab.com features daily design inspirations and sales at up to 70% off retail.', '', '', 'fab.com', 'web', 'active', '2011-12-27 19:29:42-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (170, 'Canvas', NULL, 'Canvas is an image-centric social website currently in development, led by�Christopher Poole. Canvas has an imageboard that allows users to anonymously share and comment on media, with eventual plans to include video and audio. The site also has image editing tools built into its interface, so users no longer need to rely on desktop editing programs to manipulate content.', '', '', 'canv.as', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (171, 'Vertical Response', NULL, 'VerticalResponse Inc. provides a full suite of Web-based, self-service marketing solutions including email marketing, social media, event marketing, direct mail and online surveys. Its mission is to empower businesses and non-profit organizations to easily and affordably create, share and analyze their own marketing campaigns. Users can benefit from a wide variety of features including more than 700 free email marketing templates; the ability to share their content over social media networks; and robust reporting so that they can understand campaign success.', '', '', 'verticalresponse.com', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (172, 'Roost', NULL, '', '', '', 'roost.com', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (173, 'Punchfork', NULL, 'Punchfork makes it easier to find the best new recipes from popular sites like 101 Cookbooks, The Pioneer Woman, Leite�s Culinaria, Serious Eats, Simply Recipes and The Kitchn.', '', '', 'punchfork.com', '', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (174, 'Milk (Oink)', NULL, 'With Oink, you don''t rate places � you rate the things inside.�We need you to help fill Oink with all the best stuff.', '', '', 'oink.com', 'mobile', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (175, 'Stamped', NULL, 'amped is building a way for friends to put their stamp of approval on only what they like best � restaurants, books, movies, music and more.', '', '', 'stamped.com', 'mobile', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (176, 'Amen', NULL, 'Amen is a service for battling it out over the extra ordinary things in life. The Service is available as an iOS app and a Website. Investors include A-Grade and Index Ventures.', '', '', 'getamen.com', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (177, 'Tiny Review', NULL, '<p>
	Tiny Review is like Instagram for Yelp reviews. Say what you think about a place quickly: take a picture and write 3 words. Follow people whose recommendations you trust. Quickly get an impression based on other tiny reviews: Butter, Overrated, Line, on Tartine in SF. We make reviews fun, short, and easy.</p>
', '', '', 'http://tinyreviewapp.com/', 'mobile', 'active', '2011-12-27 19:29:43-08', '2012-01-17 12:03:12-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (179, 'Wikets', NULL, 'Wikets, Inc., a young social commerce startup. Wikets will allow users to connect directly with each other, share preferences, and receive updates on what their trusted sources are recommending. Then, when another user takes one''s suggestion, both are then rewarded with points. Once users accumulate a certain number of points, they will become eligible to redeem them as gift cards.', '', '', 'wikets.com', 'mobile', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (180, 'Quora', NULL, 'Quora is a continually improving collection of questions and answers created, edited, and organized by everyone who uses it. The most important thing is to have each question page become the best possible resource for someone who wants to know about the question.', '', '', 'quora.com', 'web, mobile', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (181, 'BestVendor', NULL, 'BestVendor helps people at startups and small businesses make faster, smarter purchasing decisions through social recommendations. The company�s vision is to become the first place you go whenever you need to figure out what to buy for your business, much like Amazon is for books and Yelp is for restaurants.', '', '', 'bestvendor.com', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (182, 'Roistr (Thought Into Design)', NULL, '', '', '', 'roistr.com', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (183, 'Extractiv', NULL, '', '', '', 'extractive.com', '', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (184, 'Saplo', NULL, 'Saplo uses innovative semantic technologies to analyze text in a way that mimic how humans read and evaluate text. Saplo help organisations extract and refine valuable information hidden in large text collections.', '', '', 'saplo.com', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (185, 'Basis Technology', NULL, 'Rosette provides such capabilities as identifying the language of incoming text; providing a normalized representation in Unicode; locating names, places, and other key concepts from a body of unstructured text; and name matching and name translation for names in foreign languages and scripts', '', '', 'basistech.com', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (186, 'Lexalytics', NULL, 'Lexalytics�has developed technology to extract metadata from any document source, allowing companies to analyze, understand and react to information from outside sources or from within their own company. Lexalytics� suite of products and services offers the ability to extract entities and relationships from various content, summarize information and determine the sentiment or tone of any source.', '', '', 'lexalytics.com', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (187, 'Skyttle', NULL, '', '', '', 'nlp.skyttle.com/api/nlp', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (188, 'Endeca', NULL, 'Endeca provides enterprise search for large companies including Borders, Boeing, the Census Bureau, the EPA, Ford, Hallmark, IBM, and Toshiba. The company specializes in guided search, auto-categorizing results based on the keywords someone enters. Endeca charges from $100,000 to more than $10 million per installation.', '', '', 'endeca.com', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (189, 'Newssift', NULL, '', '', '', 'newssift.com', 'web', 'inactive', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (190, 'Qwiki', NULL, '<p>
	A Qwiki is a short, interactive story: a drastically improved information experience provided via interactive video. Unlike traditional rich media content, all Qwikis are created on the fly from web sources (without any human intervention).</p>
', '', '', 'http://qwiki.com/', 'web', 'active', '2011-12-27 19:29:43-08', '2012-01-07 07:42:16-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (191, 'Streamglider', NULL, 'The free iPad app allows you to import your social accounts like Facebook, Twitter, YouTube, Flickr and Google Reader and more into a single stream. You can mix and mash multiple sources together (via a drag and drop interface) to create specific topic-focused streams, and share these streams with others. Streamglider will also provide designated streams of content around specific subjects as well.', '', '', 'streamglider.com', 'tablet', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (192, 'Chomp', NULL, 'Chomp is the search engine that finds the apps you want. Chomp�۪s proprietary algorithm learns the functions and topics of apps, so you can search based on what apps do, not just what they�۪re called. Try searching for ���puzzle games�۝, ���kids games�۝, ���expense trackers�۝, ���tip calculators�۝ or ���chat�۝ and start finding great apps. Chomp for iPhone was launched January 2010. Chomp is available via a free download in the iTunes App Store, Android Marketplace and on the web at www.chomp.com', '', '', 'chomp.com', 'web', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (193, 'Yahoo! AppSpot', NULL, '', '', '', '', '', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (194, 'Do@', NULL, 'DoAT delivers a completely new search experience for mobile devices (launching first on iPhone and rolling out on Android, iPad, Windows and other platforms).', '', '', 'doat.com', 'mobile', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (195, 'Appsfire', NULL, '', 'Discover & share the greatest apps', '', 'appsfire.com', 'mobile', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (196, 'Appolicious', NULL, 'Appolicious Inc. is a site and application to help users easily find mobile applications that are useful and interesting to them. The service combines social networking, journalism and technology.', 'Find mobile apps you''ll love', '', 'appolicious.com', '', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (197, 'AppGrooves', NULL, 'AppGrooves is an iOS app that recommends iPhone and iPad apps. AppGrooves is going to fill the gap between the basic App Store (by Apple) and modern advanced EC sites such as Amazon and Netflix.', '', '', 'appgrooves.com', 'mobile', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (198, 'Apptizr', NULL, 'Apptizr provides personalized iPhone app recommendations based on user� interests, like Pandora for iPhone apps. Apptizr offers its service for free at apptizr.com and as a free iPhone app.', '', '', 'apptizr.com', 'web, mobile', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (199, 'Frenzapp', NULL, '', '', '', 'frenzapp.com', 'mobile', 'active', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (200, 'Kinetik', NULL, 'Easy way for people to find, comment and share apps with friends.', 'Share the apps you love', '', 'kinetik.com', '', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (201, 'Zwapp', NULL, 'Zwapp builds iOS (iPhone, iPad) and Android apps that help friends discover new apps together.', '', '', 'zwapp.com', '', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (202, 'AppAdvice', NULL, 'AppAdvice is the ideal resource on the web for people looking to discover iPhone apps. AppAdvice thoroughly filters through the 60,000+ apps in the App Store to bring you up to date on relevant news regarding apps, as well as providing detailed app reviews.', '', '', 'appadvice.com', '', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (203, 'Explor', NULL, 'Appsaurus is a thesaurus for mobile applications on the iPhone. It features a recommendation engine, a �favorites� feature, customized search for the App Store, and automatic syncing.', '', '', 'explor.com', 'web', 'inactive', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (204, 'Mimvi', NULL, 'App search', '', '', 'mimvi.com', 'web', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (205, 'uQuery', NULL, '', '', '', 'uquery.com', 'web', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (208, 'Twitter', NULL, '<p>
	A pioneer in microblogging, Twitter was launched in 2006 wih a simple format: only 140 character posts were accepted. &nbsp;Though it has had a less-than-consistent approach to finding a business model, Twitter has grown consistently and quickly and is one of the largest social networks.</p>
<p>
	In addition to a social network, Twitter is the lead source for &quot;real-time web&quot; information. &nbsp;Everything from epidemics to tragedies are broadcast on Twitter minutes, hours, and days ahead of traditional news sources.</p>
<p>
	This valuable supply of real-time information, dubbed the &quot;Firehose,&quot; is only available to select companies, such as DataSift.</p>
', '', '', 'http://twitter.com/', 'web, mobile, tablet', 'active', '2011-12-27 19:29:43-08', '2012-01-14 16:40:37-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (210, 'Piccsy', NULL, '', '', '', 'piccsy.com', 'web', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (212, 'Parse.ly', NULL, 'Parse.ly is predictive content optimization platform specifically for publishers. We help publishers make better content decisions right now. We also help them plan ahead for greater success tomorrow.', '', '', 'http://parse.ly/', 'web', 'active', '2012-01-03 13:38:26-08', '2012-01-03 13:38:26-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (213, 'Nimble', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">Nimble is a Web Based SaaS platform that helps small businesses attract and retain customers by enabling their team to work more effectively together and stay top of mind with their prospects and customers.</span></p>
', '', '', 'http://Nimble.com/', 'Web', 'active', '2012-01-05 14:07:48-08', '2012-01-05 14:07:48-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (214, 'Facebook', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">Facebook is the world&rsquo;s largest social network, with over&nbsp;</span><a href="http://techcrunch.com/2010/07/21/facebook-500-million/" style="text-decoration: none; color: rgb(25, 85, 141); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; " title="500 million users">500 million users</a><span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">.</span></p>
', '', '', 'http://www.facebook.com/', 'Web, Mobile, Tablet', 'active', '2012-01-06 11:00:04-08', '2012-01-06 11:00:05-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (215, 'New York Times', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">The New York Times Company, a leading media company with 2007 revenues of $3.2 billion, includes The New York Times, the International Herald Tribune, The Boston Globe, 15 other daily newspapers, WQXR-FM and more than 50 Web sites, including NYTimes.com, Boston.com and About.com. The Company&rsquo;s core purpose is to enhance society by creating, collecting and distributing high-quality news, information and entertainment.</span></p>
', '', '', 'http://nytimes.com/', 'Web, Mobile, Tablet', 'active', '2012-01-06 14:12:41-08', '2012-01-06 14:12:44-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (216, 'Forbes', NULL, '<p>
	Produces both Forbes magazine and Forbes.com. &nbsp;Also owns the &quot;RealClear&quot; series of sites.</p>
', '', 'logos/forbes.gif', 'http://www.forbes.com/', 'All', 'active', '2012-01-06 14:19:46-08', '2012-01-06 14:19:46-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (217, 'Wall Street Journal', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">The Wall Street Journal is a major daily business newspaper covering global business and finance. It is owned by News Corp.</span></p>
', '', 'logos/wsj.png', 'http://wsj.com/', 'All', 'active', '2012-01-06 14:27:32-08', '2012-01-06 14:27:32-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (218, 'Fortune', NULL, '<p>
	<i style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; "><b>Fortune</b></i><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">&nbsp;is a&nbsp;</span><a href="http://en.wikipedia.org/wiki/International" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 13px; line-height: 19px; " title="International">global</a><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">&nbsp;business magazine published by&nbsp;</span><a href="http://en.wikipedia.org/wiki/Time_Inc." style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 13px; line-height: 19px; " title="Time Inc.">Time Inc.</a></p>
', '', 'logos/fortune.png', 'http://money.cnn.com/magazines/fortune/', 'Web', 'active', '2012-01-06 14:40:33-08', '2012-01-06 14:40:33-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (219, 'Bloomberg Businessweek', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">BusinessWeek is a global source of essential business insight that inspires leaders to turn ideas into action. Through content, context, and collaboration, BusinessWeek moderates global conversations and moves business professionals forward. Founded in 1929 and published by Bloomberg LP, BusinessWeek magazine is the market leader, with more than 4.7 million readers each week in 140 countries.</span></p>
', '', 'logos/businessweek.jpeg', 'http://www.businessweek.com/', 'Web', 'active', '2012-01-06 14:42:10-08', '2012-01-06 14:42:10-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (220, 'Economist', NULL, '<p>
	<i style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 13px; vertical-align: baseline; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(51, 51, 51); font-family: Verdana, Arial, sans-serif; ">The Economist</i><span style="color: rgb(51, 51, 51); font-family: Verdana, Arial, sans-serif; font-size: 13px; ">&nbsp;online offers authoritative insight and opinion on international news, politics, business, finance, science and technology.</span></p>
', '', 'logos/economist.gif', 'http://www.economist.com/', 'Web', 'active', '2012-01-06 14:44:00-08', '2012-01-06 14:44:00-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (221, 'USA Today', NULL, '<p>
	National daily newspaper as well as associated print and online brands.</p>
', '', 'logos/usatoday.gif', 'http://www.usatoday.com/', 'Web', 'active', '2012-01-06 16:05:18-08', '2012-01-06 16:05:18-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (222, 'Washington Post', NULL, '<p>
	<i style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; "><b>The Washington Post</b></i><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">&nbsp;is&nbsp;</span><a href="http://en.wikipedia.org/wiki/Washington,_D.C." style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 13px; line-height: 19px; " title="Washington, D.C.">Washington, D.C.</a><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">&#39;s largest&nbsp;</span><a href="http://en.wikipedia.org/wiki/Newspaper" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 13px; line-height: 19px; " title="Newspaper">newspaper</a><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">&nbsp;and its oldest still-existing paper, founded in 1877. Located in the capital of the&nbsp;</span><a href="http://en.wikipedia.org/wiki/United_States" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 13px; line-height: 19px; " title="United States">United States</a><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">,&nbsp;</span><i style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">The Post</i><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">&nbsp;has a particular emphasis on national politics. D.C.,&nbsp;</span><a href="http://en.wikipedia.org/wiki/Maryland" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 13px; line-height: 19px; " title="Maryland">Maryland</a><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">, and&nbsp;</span><a href="http://en.wikipedia.org/wiki/Virginia" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 13px; line-height: 19px; " title="Virginia">Virginia</a><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">&nbsp;editions are printed for daily circulation. The newspaper is published as a&nbsp;</span><a href="http://en.wikipedia.org/wiki/Broadsheet" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 13px; line-height: 19px; " title="Broadsheet">broadsheet</a><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19px; ">, with photographs printed both in color and black and white</span></p>
', '', 'logos/washingtonpost.jpeg', 'http://www.washingtonpost.com/', 'Web', 'active', '2012-01-06 16:11:32-08', '2012-01-06 16:11:32-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (223, 'BuzzFeed', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">BuzzFeed is a &lsquo;trends&rsquo; aggregator that uses a web crawler and human editors to find and link to popular stories around the web.</span></p>
', '', 'logos/buzzfeed.png', 'http://www.buzzfeed.com/', 'Web', 'active', '2012-01-09 13:25:57-08', '2012-01-09 13:25:57-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (224, 'Conde Nast', NULL, '<p>
	<span style="color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 13px; text-align: left; ">Cond&eacute; Nast publishes one of the most recognizable magazine portfolios in the industry, including fashion bible Vogue and cybermag Wired, as well as stalwarts GQ, The New Yorker, and Vanity Fair, and newer shopping title &quot;Lucky&quot;. Cond&eacute; Nast Digital runs websites such as Epicurious (food) and Concierge (travel), while Cond&eacute; Nast International produces foreign versions of its titles for readers across the globe. In addition, Cond&eacute; Nast oversees fashion and trade magazine unit Fairchild Fashion Group.</span></p>
', '', '', 'http://www.condenast.com/', 'All', 'active', '2012-01-10 10:04:47-08', '2012-01-10 10:04:47-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (225, 'GetGlue', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">GetGlue is a social network for entertainment that sparks real-time conversation about music, movies, television shows, celebrities, books and topics people are passionate about. GetGlue also offers users personalized recommendations and exclusive rewards from some of the biggest names in entertainment.</span></p>
', '', 'logos/getglue.jpg', 'http://getglue.com/', 'All', 'active', '2012-01-11 09:36:40-08', '2012-01-11 09:36:40-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (226, 'AppTap', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">AppTap is the leading provider of mobile app discovery and advertising solutions for web publishers, mobile operators, and app developers.</span></p>
', '', '', 'http://apptap.com/', 'All', 'active', '2012-01-13 10:10:48-08', '2012-01-13 10:10:48-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (227, 'Google +', NULL, '<p>
	Social networking site launched by Google in 2011.</p>
', '', '', 'http://plus.google.com/', 'All', 'active', '2012-01-16 12:46:49-08', '2012-01-16 12:46:49-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (228, 'Flickr', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">Former game designers Stewart Butterfield and Caterina Fake created Flickr, an online photo sharing network, in 2004. Flickr, which began as a photo-sharing feature of their gaming project, has since then blossomed into one of the premiere photo-sharing sites on the web. Yahoo&nbsp;</span><a href="http://www.eweek.com/article2/0,1759,1777908,00.asp" rel="nofollow" style="text-decoration: none; color: rgb(25, 85, 141); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; " title="purchased">purchased</a>&nbsp;<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">Flickr for $35 million in March of 2005. Since then Flickr continues to compete with other photo-sharing giant&nbsp;</span><a href="http://crunchbase.com/company/photobucket" style="text-decoration: none; color: rgb(25, 85, 141); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; " title="Photobucket">Photobucket</a><span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">.</span></p>
', '', '', 'http://flickr.com/', 'web', 'active', '2012-01-16 13:46:05-08', '2012-01-16 13:47:18-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (229, 'WordPress', NULL, '<p>
	Provides open source blogging software as well as free hosted blogs.</p>
', '', '', 'http://wordpress.com/', 'all', 'active', '2012-01-16 14:00:39-08', '2012-01-16 14:00:39-08', false, NULL);
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (230, 'Posterous', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">Posterous emerged from&nbsp;</span><a href="http://www.crunchbase.com/company/y-combinator" rel="nofollow" style="text-decoration: none; color: rgb(25, 85, 141); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; " title="Y Combinator">Y Combinator</a><span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">&nbsp;in the summer of 2008 as an innovative company focused on making blogging simple - as simple as sending an email - and now has more than 15 million monthly users.</span></p>
', '', '', 'http://posterous.com/', 'All', 'active', '2012-01-16 23:11:54-08', '2012-01-16 23:11:54-08', false, '');
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (231, 'Typepad', NULL, '<p>
	<span style="color: rgb(29, 29, 29); font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 19px; ">TypePad is one of the major blogging platforms, and is used by organizations ranging from enterprises to individuals</span></p>
', '', '', 'http://typepad.com/', 'All', 'active', '2012-01-17 23:25:30-08', '2012-01-17 23:25:30-08', false, '');
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (232, 'Demand Media', NULL, '<p>
	Demand Media is a network of popular and influential lifestyle sites, such as eHow.com and Livestrong.com</p>
', '', '', 'http://demandmedia.com/', 'All', 'active', '2012-01-18 11:43:57-08', '2012-01-18 11:43:57-08', false, '');
INSERT INTO market_company (id, name, parent_id, description, slogan, logo, url, platform, state, created, modified, public, ticker) VALUES (233, 'Technorati Media', NULL, '<p>
	A leading blogging and social ad network. &nbsp;Owns popular sites like Technorati and BlogCritics. &nbsp;</p>
', '', '', 'http://technoratimedia.com/', 'All', 'active', '2012-01-18 11:51:35-08', '2012-01-18 11:51:35-08', false, '');


--
-- TOC entry 2551 (class 0 OID 19208)
-- Dependencies: 193
-- Data for Name: market_company_ecosystem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (46, 3, 1);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (47, 6, 2);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (48, 7, 3);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (49, 16, 4);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (50, 17, 5);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (51, 19, 3);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (52, 33, 6);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (53, 34, 6);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (54, 35, 6);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (55, 36, 6);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (56, 39, 6);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (57, 138, 7);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (58, 188, 8);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (59, 208, 6);
INSERT INTO market_company_ecosystem (id, company_id, ecosystem_id) VALUES (60, 214, 9);


--
-- TOC entry 2552 (class 0 OID 19218)
-- Dependencies: 195
-- Data for Name: market_company_segments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (682, 1, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (683, 2, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (684, 3, 2);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (685, 4, 3);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (686, 5, 2);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (687, 5, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (688, 6, 5);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (689, 7, 5);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (690, 8, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (691, 9, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (692, 10, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (693, 11, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (694, 12, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (695, 13, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (696, 16, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (697, 17, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (698, 18, 5);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (699, 19, 5);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (700, 20, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (701, 20, 25);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (702, 21, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (703, 22, 11);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (704, 23, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (705, 24, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (706, 25, 12);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (707, 26, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (708, 27, 12);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (709, 29, 13);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (710, 30, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (711, 31, 14);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (712, 32, 12);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (713, 33, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (714, 34, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (715, 35, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (716, 36, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (717, 39, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (718, 40, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (719, 41, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (720, 42, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (721, 43, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (722, 44, 16);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (723, 45, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (724, 46, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (725, 47, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (726, 48, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (727, 49, 17);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (728, 50, 18);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (729, 51, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (730, 52, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (731, 53, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (732, 54, 19);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (733, 55, 20);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (734, 56, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (735, 57, 20);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (736, 58, 11);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (737, 59, 20);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (738, 60, 20);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (739, 61, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (740, 62, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (741, 63, 21);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (742, 64, 21);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (743, 65, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (744, 65, 21);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (745, 66, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (746, 67, 23);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (747, 68, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (748, 69, 14);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (749, 70, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (750, 71, 25);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (751, 72, 25);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (752, 73, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (753, 74, 25);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (754, 75, 25);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (755, 76, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (756, 77, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (757, 78, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (758, 79, 19);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (759, 80, 10);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (760, 81, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (761, 83, 11);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (762, 84, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (763, 85, 20);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (764, 86, 26);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (765, 87, 27);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (766, 88, 27);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (767, 89, 21);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (768, 90, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (769, 91, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (770, 92, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (771, 93, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (772, 94, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (773, 95, 25);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (774, 96, 3);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (775, 97, 5);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (776, 98, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (777, 99, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (778, 100, 17);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (779, 101, 23);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (780, 102, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (781, 104, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (782, 105, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (783, 106, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (784, 107, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (785, 108, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (786, 109, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (787, 110, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (788, 111, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (789, 112, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (790, 113, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (791, 114, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (792, 115, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (793, 118, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (794, 119, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (795, 120, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (796, 121, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (797, 122, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (798, 123, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (799, 124, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (800, 125, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (801, 126, 2);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (802, 127, 2);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (803, 128, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (804, 129, 2);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (805, 130, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (806, 131, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (807, 132, 23);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (808, 133, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (809, 134, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (810, 135, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (811, 136, 23);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (812, 137, 23);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (813, 138, 2);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (814, 139, 23);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (815, 140, 23);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (816, 141, 23);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (817, 142, 23);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (818, 143, 11);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (819, 144, 11);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (820, 145, 17);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (821, 146, 17);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (822, 147, 17);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (823, 148, 17);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (824, 149, 11);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (825, 150, 16);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (826, 151, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (827, 152, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (828, 153, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (829, 154, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (830, 155, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (831, 156, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (832, 157, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (833, 158, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (834, 159, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (835, 160, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (836, 161, 3);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (837, 162, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (838, 163, 23);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (839, 164, 25);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (840, 166, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (841, 167, 24);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (842, 168, 2);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (843, 169, 6);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (844, 170, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (845, 171, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (846, 172, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (847, 173, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (848, 174, 3);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (849, 175, 3);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (850, 176, 3);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (851, 177, 3);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (852, 178, 3);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (853, 179, 3);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (854, 180, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (855, 181, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (856, 182, 27);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (857, 183, 27);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (858, 184, 27);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (859, 185, 27);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (860, 186, 27);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (861, 187, 27);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (862, 188, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (863, 189, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (864, 190, 19);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (865, 190, 14);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (866, 191, 31);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (867, 192, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (868, 193, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (869, 194, 15);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (870, 195, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (871, 196, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (872, 197, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (873, 198, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (874, 199, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (875, 200, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (876, 201, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (877, 202, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (878, 203, 32);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (879, 204, 33);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (880, 205, 33);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (881, 206, 33);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (882, 207, 33);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (883, 208, 34);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (884, 209, 7);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (885, 210, 2);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (886, 212, 11);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (887, 213, 8);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (888, 214, 34);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (889, 215, 35);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (890, 216, 35);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (891, 217, 35);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (892, 218, 35);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (893, 219, 35);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (894, 220, 35);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (895, 221, 35);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (896, 222, 35);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (897, 223, 1);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (898, 224, 35);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (899, 225, 34);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (900, 226, 20);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (901, 227, 34);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (902, 228, 36);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (903, 228, 34);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (904, 229, 5);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (905, 230, 5);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (906, 231, 5);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (907, 232, 37);
INSERT INTO market_company_segments (id, company_id, segment_id) VALUES (908, 233, 18);


--
-- TOC entry 2550 (class 0 OID 19193)
-- Dependencies: 191
-- Data for Name: market_company_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (607, 1, 1);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (608, 1, 3);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (609, 1, 2);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (610, 1, 5);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (611, 1, 4);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (612, 1, 6);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (613, 2, 9);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (614, 2, 8);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (615, 2, 2);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (616, 2, 7);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (617, 3, 11);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (618, 3, 10);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (619, 3, 13);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (620, 3, 12);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (621, 3, 1);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (622, 3, 7);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (623, 4, 1);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (624, 4, 3);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (625, 4, 15);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (626, 4, 14);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (627, 4, 16);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (628, 5, 1);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (629, 5, 18);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (630, 5, 17);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (631, 5, 19);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (632, 6, 20);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (633, 6, 21);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (634, 6, 22);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (635, 7, 24);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (636, 7, 21);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (637, 7, 23);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (638, 8, 11);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (639, 8, 12);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (640, 8, 17);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (641, 8, 18);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (642, 8, 1);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (643, 8, 6);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (644, 9, 17);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (645, 10, 25);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (646, 10, 26);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (647, 10, 17);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (648, 11, 27);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (649, 11, 28);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (650, 11, 29);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (651, 12, 12);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (652, 12, 17);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (653, 12, 30);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (654, 13, 26);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (655, 13, 12);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (656, 13, 31);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (657, 13, 17);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (658, 16, 33);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (659, 16, 32);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (660, 16, 21);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (661, 17, 17);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (662, 18, 30);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (663, 18, 34);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (664, 20, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (665, 23, 1);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (666, 23, 37);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (667, 23, 36);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (668, 23, 35);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (669, 24, 31);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (670, 24, 38);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (671, 24, 39);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (672, 24, 40);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (673, 25, 41);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (674, 26, 1);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (675, 26, 8);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (676, 26, 2);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (677, 29, 42);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (678, 29, 36);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (679, 30, 1);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (680, 30, 2);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (681, 30, 6);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (682, 31, 44);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (683, 31, 42);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (684, 31, 43);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (685, 32, 42);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (686, 32, 41);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (687, 33, 45);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (688, 36, 46);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (689, 36, 47);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (690, 39, 48);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (691, 39, 49);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (692, 39, 45);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (693, 39, 50);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (694, 39, 1);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (695, 39, 6);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (696, 40, 37);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (697, 42, 1);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (698, 42, 51);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (699, 42, 52);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (700, 44, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (701, 45, 53);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (702, 46, 55);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (703, 46, 54);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (704, 47, 8);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (705, 47, 57);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (706, 47, 56);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (707, 47, 58);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (708, 55, 31);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (709, 55, 59);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (710, 56, 53);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (711, 57, 60);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (712, 57, 61);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (713, 57, 31);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (714, 57, 62);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (715, 58, 63);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (716, 58, 64);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (717, 59, 60);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (718, 59, 31);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (719, 59, 65);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (720, 60, 59);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (721, 62, 66);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (722, 62, 67);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (723, 63, 33);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (724, 63, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (725, 65, 68);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (726, 65, 69);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (727, 65, 31);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (728, 66, 27);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (729, 68, 63);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (730, 69, 8);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (731, 69, 31);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (732, 70, 31);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (733, 70, 70);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (734, 71, 56);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (735, 71, 71);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (736, 77, 63);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (737, 78, 63);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (738, 78, 73);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (739, 78, 72);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (740, 80, 74);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (741, 84, 75);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (742, 84, 6);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (743, 87, 59);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (744, 92, 76);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (745, 92, 21);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (746, 92, 50);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (747, 96, 77);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (748, 96, 16);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (749, 96, 78);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (750, 97, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (751, 98, 17);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (752, 99, 17);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (753, 101, 19);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (754, 101, 8);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (755, 101, 79);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (756, 102, 80);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (757, 102, 27);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (758, 105, 81);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (759, 108, 82);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (760, 109, 83);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (761, 113, 84);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (762, 136, 86);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (763, 136, 87);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (764, 136, 85);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (765, 153, 88);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (766, 154, 80);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (767, 156, 89);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (768, 157, 45);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (769, 160, 46);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (770, 160, 69);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (771, 161, 90);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (772, 161, 63);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (773, 164, 91);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (774, 164, 8);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (775, 169, 92);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (776, 169, 17);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (777, 171, 93);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (778, 171, 94);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (779, 172, 95);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (780, 177, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (781, 190, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (782, 207, 141);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (783, 208, 20);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (784, 212, 59);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (785, 213, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (786, 214, 99);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (787, 215, 114);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (788, 215, 113);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (789, 216, 115);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (790, 217, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (791, 218, 116);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (792, 219, 116);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (793, 220, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (794, 221, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (795, 222, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (796, 223, 126);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (797, 224, 91);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (798, 225, 138);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (799, 225, 137);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (800, 226, 141);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (801, 227, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (802, 228, 159);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (803, 228, 160);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (804, 229, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (805, 230, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (806, 231, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (807, 232, 98);
INSERT INTO market_company_tags (id, company_id, tag_id) VALUES (808, 233, 98);


--
-- TOC entry 2562 (class 0 OID 19413)
-- Dependencies: 215
-- Data for Name: market_ecosystem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_ecosystem (id, name, description, modified) VALUES (1, 'Pinterest', '', '2011-12-27 19:29:37-08');
INSERT INTO market_ecosystem (id, name, description, modified) VALUES (2, 'Tumblr', '', '2011-12-27 19:29:38-08');
INSERT INTO market_ecosystem (id, name, description, modified) VALUES (3, 'Geolocation', '', '2011-12-27 19:29:38-08');
INSERT INTO market_ecosystem (id, name, description, modified) VALUES (4, 'Salesforce', '', '2011-12-27 19:29:38-08');
INSERT INTO market_ecosystem (id, name, description, modified) VALUES (5, 'Fashion', '', '2011-12-27 19:29:38-08');
INSERT INTO market_ecosystem (id, name, description, modified) VALUES (6, 'Twitter', '', '2011-12-27 19:29:39-08');
INSERT INTO market_ecosystem (id, name, description, modified) VALUES (7, 'Food & Dining', '', '2011-12-27 19:29:42-08');
INSERT INTO market_ecosystem (id, name, description, modified) VALUES (8, 'Enterprise search', '', '2011-12-27 19:29:43-08');
INSERT INTO market_ecosystem (id, name, description, modified) VALUES (9, 'Facebook', '', '2012-01-06 10:57:39-08');


--
-- TOC entry 2547 (class 0 OID 19163)
-- Dependencies: 185
-- Data for Name: market_exit; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2556 (class 0 OID 19310)
-- Dependencies: 203
-- Data for Name: market_feature; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2564 (class 0 OID 19437)
-- Dependencies: 219
-- Data for Name: market_metric; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (1, 22, 'Web', NULL, NULL, 208, NULL, '100000000', '2011-11-30', 486);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (2, 18, 'Web', NULL, NULL, 3, NULL, '6000000', '2011-11-30', 487);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (3, 1, 'Web', NULL, NULL, 105, NULL, '200000000', '2011-11-30', 488);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (4, 18, 'All', NULL, NULL, 208, NULL, '160000000', '2011-12-21', 489);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (5, 18, 'All', NULL, NULL, 6, NULL, '40000000', '2011-12-21', 489);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (6, 26, 'Web', NULL, NULL, 6, NULL, '39000000', '2012-01-04', 499);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (7, 15, 'Web', NULL, NULL, 1, NULL, '2500000', '2012-01-07', 500);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (8, 11, 'Web', NULL, NULL, 1, NULL, '4000000', '2012-01-06', 500);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (9, 2, 'All', NULL, NULL, 215, NULL, '3200000000', '2011-12-31', 505);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (10, 27, 'All', NULL, NULL, 216, NULL, '5383000', '2010-10-31', 506);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (11, 28, 'All', NULL, NULL, 216, NULL, '1091000', '2010-10-31', 506);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (12, 27, 'All', NULL, NULL, 218, NULL, '4384000', '2010-10-31', 506);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (13, 28, 'All', NULL, NULL, 218, NULL, '972000', '2010-10-31', 506);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (14, 27, 'All', NULL, NULL, 219, NULL, '4299000', '2010-10-31', 506);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (15, 27, 'All', NULL, NULL, 220, NULL, '3124000', '2010-10-31', 506);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (16, 28, 'All', NULL, NULL, 220, NULL, '859000', '2010-10-31', 506);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (17, 29, 'All', NULL, NULL, 216, NULL, '924330', '2010-12-31', 506);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (18, 29, 'All', NULL, NULL, 218, NULL, '847105', '2010-12-31', 506);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (19, 29, 'All', NULL, NULL, 219, NULL, '923457', '2010-12-31', 506);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (20, 27, 'All', NULL, NULL, 219, NULL, '4700000', '2012-01-06', 507);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (21, 18, 'Web', NULL, NULL, 215, NULL, '17357176', '2011-11-30', 509);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (22, 18, 'Web', NULL, NULL, 216, NULL, '10,161,572', '2011-11-30', 510);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (23, 18, 'Web', NULL, NULL, 220, NULL, '1,322,900', '2011-11-30', 511);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (24, 18, 'Web', NULL, NULL, 219, NULL, '4975043', '2011-11-30', 512);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (25, 18, 'Web', NULL, NULL, 220, NULL, '3229533', '2011-12-31', 513);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (26, 20, 'Web', NULL, NULL, 220, NULL, '12613022', '2011-12-31', 513);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (27, 18, 'Web', NULL, NULL, 215, NULL, '30000000', '2011-01-24', 514);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (28, 18, 'Web', NULL, NULL, 215, NULL, '34038000', '2012-01-06', 515);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (29, 18, 'Web', NULL, NULL, 215, NULL, '35500000', '2011-06-09', 516);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (30, 18, 'Web', NULL, NULL, 215, NULL, '32530000', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (31, 20, 'Web', NULL, NULL, 215, NULL, '719000000', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (32, 24, 'Web', NULL, NULL, 215, NULL, '22', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (33, 18, 'Web', NULL, NULL, 221, NULL, '16771000', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (34, 24, 'Web', NULL, NULL, 221, NULL, '9', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (35, 20, 'Web', NULL, NULL, 221, NULL, '154000000', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (36, 18, 'Web', NULL, NULL, 222, NULL, '16667000', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (37, 20, 'Web', NULL, NULL, 222, NULL, '178000000', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (38, 24, 'Web', NULL, NULL, 222, NULL, '11', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (39, 18, 'Web', NULL, NULL, 217, NULL, '11325000', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (40, 20, 'Web', NULL, NULL, 217, NULL, '115000000', '2010-05-31', 24);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (41, 24, 'Web', NULL, NULL, 217, NULL, '10000000', '2010-05-31', 517);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (42, 18, 'Web', NULL, NULL, 3, NULL, '5000000', '2011-11-30', 520);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (43, 18, 'Web', NULL, NULL, 216, NULL, '25000000', '2011-10-31', 522);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (44, 18, 'Web', NULL, NULL, 216, NULL, '17000000', '2009-12-31', 523);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (45, 18, 'Web', NULL, NULL, 216, NULL, '20000000', '2008-12-31', 524);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (46, 18, 'Web', NULL, NULL, 217, NULL, '18574000', '2011-11-30', 525);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (47, 20, 'Web', NULL, NULL, 217, NULL, '291956000', '2011-11-30', 525);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (48, 24, 'Web', NULL, NULL, 217, NULL, '16', '2011-11-30', 525);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (49, 30, 'Web', NULL, NULL, 217, NULL, '20.5', '2011-11-30', 525);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (50, 18, 'Web', NULL, NULL, 222, NULL, '27437000', '2011-10-31', 532);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (51, 18, 'All', NULL, NULL, 215, NULL, '79243000', '2011-10-31', 532);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (52, 18, 'All', NULL, NULL, 222, NULL, '26911000', '2011-11-30', 533);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (53, 18, 'All', NULL, NULL, 215, NULL, '79629000', '2011-11-30', 533);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (54, 18, 'All', NULL, NULL, 215, NULL, '72849000', '2011-09-30', 534);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (55, 18, 'All', NULL, NULL, 222, NULL, '24669000', '2011-09-30', 534);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (56, 18, 'All', NULL, NULL, 215, NULL, '66110000', '2011-08-31', 535);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (57, 18, 'All', NULL, NULL, 222, NULL, '25882000', '2011-08-31', 535);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (58, 15, 'All', NULL, NULL, 136, NULL, '14000000', '2011-09-09', 550);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (59, 2, 'All', NULL, NULL, 136, NULL, '12000000', '2011-09-09', 550);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (60, 14, 'All', NULL, NULL, 136, NULL, '500000', '2011-09-09', 550);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (61, 14, 'Web', NULL, NULL, 215, NULL, '324000', '2012-01-09', 552);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (62, 2, 'Web', NULL, NULL, 222, NULL, '92000000', '2011-10-31', 553);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (63, 18, 'All', NULL, NULL, 216, NULL, '27800000', '2011-12-31', 555);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (64, 18, 'All', NULL, NULL, 216, NULL, '25000000', '2011-11-30', 555);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (65, 18, 'All', NULL, NULL, 219, NULL, '9000000', '2011-10-31', 507);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (66, 24, 'All', NULL, NULL, 219, NULL, '3.44', '2011-10-31', 507);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (67, 31, 'All', NULL, NULL, 208, NULL, '45000000', '2010-12-31', 557);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (68, 31, 'All', NULL, NULL, 208, NULL, '139500000', '2011-12-31', 557);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (69, 15, 'All', NULL, NULL, 225, NULL, '750000', '2011-01-01', 559);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (70, 15, 'All', NULL, NULL, 225, NULL, '2000000', '2012-01-11', 559);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (71, 15, 'All', NULL, NULL, 225, NULL, '1000000', '2011-04-13', 561);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (72, 18, 'All', NULL, NULL, 6, '', '18800000', '2011-12-31', 569);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (73, 18, 'All', NULL, NULL, 3, '', '7510000', '2011-12-31', 569);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (74, 1, 'All', NULL, NULL, 169, '', '2000000', '2011-12-08', 391);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (75, 6, 'All', NULL, NULL, 169, '', '100000', '2011-12-07', 393);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (76, 4, 'All', NULL, NULL, 169, '', '1400000', '2011-12-07', 393);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (77, 2, 'All', NULL, NULL, 169, '', '20000000', '2011-12-07', 393);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (78, 15, 'All', NULL, NULL, 169, '', '750000', '2011-10-11', 394);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (79, 5, 'All', NULL, NULL, 169, '', '100000', '2011-10-11', 394);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (80, 15, 'All', NULL, NULL, 169, '', '350000', '2011-07-26', 395);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (81, 7, 'All', NULL, NULL, 169, '', '1000', '2011-07-26', 395);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (82, 2, 'All', NULL, NULL, 169, '', '15600000', '2011-07-26', 395);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (83, 15, 'All', NULL, NULL, 169, '', '300000', '2011-07-11', 396);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (84, 13, 'All', NULL, NULL, 169, '', '.033', '2011-07-11', 396);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (85, 15, 'All', NULL, NULL, 169, '', '1000000', '2011-11-14', 397);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (86, 15, 'All', NULL, NULL, 169, '', '1200000', '2011-12-07', 399);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (87, 15, 'All', NULL, NULL, 169, '', '1400000', '2011-12-16', 400);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (88, 15, 'All', NULL, NULL, 3, '', '2200000', '2011-10-24', 16);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (89, 18, 'All', NULL, NULL, 6, '', '2600000', '2009-08-05', 183);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (90, 20, 'All', NULL, NULL, 6, '', '255000000', '2009-08-05', 183);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (91, 8, 'All', NULL, NULL, 6, '', '650000', '2009-08-05', 177);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (92, 12, 'All', NULL, NULL, 6, '', '5000', '2009-08-05', 183);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (93, 15, 'All', NULL, NULL, 208, '', '300000', '2007-07-26', 572);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (94, 32, 'All', NULL, NULL, 208, '', '5000000', '2007-07-29', 573);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (95, 1, 'All', NULL, NULL, 208, '', '20000000', '2007-07-29', 573);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (96, 15, 'All', NULL, NULL, 208, '', '1000000', '2008-04-29', 574);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (97, 18, 'All', NULL, NULL, 208, '', '1450000', '2008-10-31', 576);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (98, 18, 'All', NULL, NULL, 208, '', '1900000', '2008-12-31', 579);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (99, 32, 'All', NULL, NULL, 208, '', '35000000', '2009-02-13', 580);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (100, 1, 'All', NULL, NULL, 208, '', '250000000', '2009-02-13', 580);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (101, 15, 'All', NULL, NULL, 208, '', '6000000', '2009-03-30', 584);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (102, 18, 'Web', NULL, NULL, 208, '', '9300000', '2009-03-31', 586);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (103, 18, 'Web', NULL, NULL, 208, '', '9300000', '2009-03-31', 587);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (104, 8, 'All', NULL, NULL, 208, '', '140000000', '2011-03-14', 194);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (105, 15, 'All', NULL, NULL, 208, '', '75000000', '2009-12-31', 589);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (106, 15, 'All', NULL, NULL, 227, '', '40000000', '2011-10-13', 590);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (107, 22, 'All', NULL, NULL, 208, '', '100000000', '2011-09-11', 591);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (108, 15, 'All', NULL, NULL, 208, '', '100000000', '2011-09-08', 591);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (109, 18, 'All', NULL, NULL, 208, '', '27000000', '2011-05-31', 592);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (110, 18, 'All', NULL, NULL, 6, '', '10700000', '2011-05-31', 592);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (111, 15, 'All', NULL, NULL, 208, '', '200000000', '2011-11-07', 593);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (112, 15, 'All', NULL, NULL, 227, '', '50000000', '2011-09-26', 594);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (113, 15, 'Web', NULL, NULL, 228, '', '51000000', '2012-01-16', 597);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (114, 26, 'All', NULL, NULL, 6, '', '41023459', '2012-01-16', 599);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (115, 26, 'All', NULL, NULL, 229, '', '35000000', '2012-01-16', 600);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (116, 20, 'All', NULL, NULL, 229, '', '25000000000', '2012-01-16', 601);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (117, 18, 'All', NULL, NULL, 229, '', '308000000', '2012-01-16', 601);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (118, 15, 'All', NULL, NULL, 6, '', '32500000', '2011-10-24', 602);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (119, 18, 'All', NULL, NULL, 230, '', '15000000', '2012-01-16', 604);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (120, 18, 'All', NULL, NULL, 231, '', '10600000', '2012-01-17', 605);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (121, 15, 'Web', NULL, NULL, 208, '', '38000000', '2012-01-18', 607);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (122, 18, 'Web', NULL, NULL, 208, '', '130000000', '2012-01-18', 607);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (123, 20, 'Web', NULL, NULL, 208, '', '2700000000', '2012-01-18', 607);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (124, 18, 'Web', NULL, NULL, 6, '', '50000000', '2012-01-18', 608);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (125, 20, 'Web', NULL, NULL, 6, '', '7800000000', '2012-01-18', 608);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (126, 15, 'Web', NULL, NULL, 229, '', '23000000', '2012-01-18', 609);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (127, 18, 'Web', NULL, '', 229, '', '74000000', '2012-01-18', 609);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (128, 20, 'Web', NULL, '', 229, '', '210000000', '2012-01-18', 609);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (129, 15, 'Web', NULL, '', 230, '', '830000', '2012-01-18', 610);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (130, 18, 'Web', NULL, '', 230, '', '2300000', '2012-01-18', 610);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (131, 20, 'Web', NULL, '', 230, '', '6200000', '2012-01-18', 610);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (132, 18, 'Web', NULL, '', 231, '', '14000000', '2011-12-31', 611);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (133, 15, 'Web', NULL, '', 231, '', '5000000', '2011-12-31', 611);
INSERT INTO market_metric (id, category_id, platform, product_id, region, company_id, round, stat, date, source_id) VALUES (134, 20, 'Web', NULL, '', 231, '', '37000000', '2011-12-31', 611);


--
-- TOC entry 2563 (class 0 OID 19429)
-- Dependencies: 217
-- Data for Name: market_metrictype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_metrictype (id, name) VALUES (1, 'Valuation');
INSERT INTO market_metrictype (id, name) VALUES (2, 'Run rate');
INSERT INTO market_metrictype (id, name) VALUES (3, 'Sales / month');
INSERT INTO market_metrictype (id, name) VALUES (4, 'Sales / week');
INSERT INTO market_metrictype (id, name) VALUES (5, 'Sales / day');
INSERT INTO market_metrictype (id, name) VALUES (6, 'Orders / month');
INSERT INTO market_metrictype (id, name) VALUES (7, 'Orders / day');
INSERT INTO market_metrictype (id, name) VALUES (8, 'Posts / Day');
INSERT INTO market_metrictype (id, name) VALUES (9, 'Posts');
INSERT INTO market_metrictype (id, name) VALUES (10, 'API calls / month');
INSERT INTO market_metrictype (id, name) VALUES (11, 'Shares / URLs / etc per day');
INSERT INTO market_metrictype (id, name) VALUES (12, 'New users / day');
INSERT INTO market_metrictype (id, name) VALUES (13, 'Premium User Conversion Rate');
INSERT INTO market_metrictype (id, name) VALUES (14, 'Premium Users');
INSERT INTO market_metrictype (id, name) VALUES (15, 'Users / Sites ');
INSERT INTO market_metrictype (id, name) VALUES (16, 'Downloads');
INSERT INTO market_metrictype (id, name) VALUES (17, 'Visitors / month');
INSERT INTO market_metrictype (id, name) VALUES (18, 'Uniques / Month');
INSERT INTO market_metrictype (id, name) VALUES (19, 'Uniques / day');
INSERT INTO market_metrictype (id, name) VALUES (20, 'Pageviews / month');
INSERT INTO market_metrictype (id, name) VALUES (21, '% Active Users');
INSERT INTO market_metrictype (id, name) VALUES (22, 'Active Users');
INSERT INTO market_metrictype (id, name) VALUES (23, 'Average Mins / Stay');
INSERT INTO market_metrictype (id, name) VALUES (24, 'Pageviews / User');
INSERT INTO market_metrictype (id, name) VALUES (25, 'Reviews / Rating');
INSERT INTO market_metrictype (id, name) VALUES (26, 'Blogs / Boards / etc');
INSERT INTO market_metrictype (id, name) VALUES (27, 'Readers / Reach');
INSERT INTO market_metrictype (id, name) VALUES (28, 'Affluent Readers');
INSERT INTO market_metrictype (id, name) VALUES (29, 'Circulation');
INSERT INTO market_metrictype (id, name) VALUES (30, 'Time per person');
INSERT INTO market_metrictype (id, name) VALUES (31, 'Online Ad Revenue');
INSERT INTO market_metrictype (id, name) VALUES (32, 'Financing');


--
-- TOC entry 2555 (class 0 OID 19294)
-- Dependencies: 201
-- Data for Name: market_product; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2554 (class 0 OID 19279)
-- Dependencies: 199
-- Data for Name: market_product_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2558 (class 0 OID 19336)
-- Dependencies: 207
-- Data for Name: market_productfeature; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2557 (class 0 OID 19321)
-- Dependencies: 205
-- Data for Name: market_productfeature_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2571 (class 0 OID 19562)
-- Dependencies: 233
-- Data for Name: market_report; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2570 (class 0 OID 19547)
-- Dependencies: 231
-- Data for Name: market_report_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2569 (class 0 OID 19532)
-- Dependencies: 229
-- Data for Name: market_report_segments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2568 (class 0 OID 19517)
-- Dependencies: 227
-- Data for Name: market_report_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2549 (class 0 OID 19182)
-- Dependencies: 189
-- Data for Name: market_segment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_segment (id, name, description, created, modified) VALUES (1, 'News Aggregation', NULL, '2011-12-22 12:01:10-08', '2011-12-22 12:01:10-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (2, 'Social Cataloging', NULL, '2011-12-22 12:01:10-08', '2011-12-22 12:01:10-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (3, 'Social / Intelligent Recommendations', NULL, '2011-12-22 12:01:10-08', '2011-12-22 12:01:10-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (5, 'Blogging / Journaling', NULL, '2011-12-22 12:01:10-08', '2011-12-22 12:01:10-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (6, 'Social Shopping', NULL, '2011-12-22 12:01:10-08', '2011-12-22 12:01:10-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (7, 'Social Bookmarking / Discovery', NULL, '2011-12-22 12:01:10-08', '2011-12-22 12:01:10-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (8, 'Social Media Marketing & CRM', NULL, '2011-12-22 12:01:11-08', '2011-12-22 12:01:11-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (10, 'Content Provision / Recommendation', NULL, '2011-12-22 12:01:11-08', '2011-12-22 12:01:11-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (11, 'Content Personalization / Optimization', NULL, '2011-12-22 12:01:11-08', '2011-12-22 12:01:11-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (12, 'Semantic Search', NULL, '2011-12-22 12:01:11-08', '2011-12-22 12:01:11-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (13, 'Content Discovery', NULL, '2011-12-22 12:01:11-08', '2011-12-22 12:01:11-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (14, 'Content Guides / Summaries', NULL, '2011-12-22 12:01:11-08', '2011-12-22 12:01:11-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (15, 'Real-time / Intelligent Search', NULL, '2011-12-22 12:01:11-08', '2011-12-22 12:01:11-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (16, 'Ad Optimization', NULL, '2011-12-22 12:01:12-08', '2011-12-22 12:01:12-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (17, 'Commenting', NULL, '2011-12-22 12:01:12-08', '2011-12-22 12:01:12-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (18, 'Ad Network', NULL, '2011-12-22 12:01:12-08', '2012-01-18 11:50:49-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (19, 'Content Transformation', NULL, '2011-12-22 12:01:12-08', '2011-12-22 12:01:12-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (20, 'Content Recommendation', NULL, '2011-12-22 12:01:12-08', '2011-12-22 12:01:12-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (21, 'Bookmarking Analytics', NULL, '2011-12-22 12:01:12-08', '2011-12-22 12:01:12-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (23, 'Personal Curation', NULL, '2011-12-22 12:01:12-08', '2011-12-22 12:01:12-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (24, 'Social Media Analysis & Monitoring', NULL, '2011-12-22 12:01:12-08', '2011-12-22 12:01:12-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (25, 'Personalized Newspapers', NULL, '2011-12-22 12:01:13-08', '2011-12-22 12:01:13-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (26, 'Social Ad Optimization', NULL, '2011-12-22 12:01:13-08', '2011-12-22 12:01:13-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (27, 'Content Analysis', NULL, '2011-12-22 12:01:13-08', '2011-12-22 12:01:13-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (31, 'Personalized Magazines', NULL, '2011-12-22 12:01:16-08', '2011-12-22 12:01:16-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (32, 'App Recommendation', NULL, '2011-12-22 12:01:16-08', '2011-12-22 12:01:16-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (33, 'App Search', NULL, '2011-12-22 12:01:16-08', '2011-12-22 12:01:16-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (34, 'Social Networking', NULL, '2012-01-06 10:58:10-08', '2012-01-06 10:58:10-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (35, 'Traditional Publishing', '<p>
	Consists primarily of traditional media publishers, primarily newspapers and magazines, who have established online presences as a way to complement their print businesses. &nbsp;Often characterized as a &quot;dying industry,&quot; traditional publishers have struggled to keep their traditional products from slowly withering while at the same time adapting to the new online format. &nbsp;Some have offered all their content online for free, while others have restricted their content behind a paywall. &nbsp;Neither strategy has proven to a winning one, however.</p>
<div>
	<p>
		The segment has also recently been disrupted by somewhat new players like the Huffington Post and the Business Insider. &nbsp;Somewhere between tabloids and traditional newspapers, these companies have been accused of over-zealous aggregation of stories from other sources with insufficient attribution. &nbsp;However, perhaps due to a higher emphasis on lifestyle and celebrity stories, they are growing at much higher rate than more tradititional players.</p>
	<p>
		Established players include the New York Times, Wall Street Journal, Business Week, Washington Post and a few others.</p>
</div>
', '2012-01-06 14:10:34-08', '2012-01-07 20:20:49-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (36, 'Media Sharing', '', '2012-01-16 13:46:58-08', '2012-01-16 13:46:58-08');
INSERT INTO market_segment (id, name, description, created, modified) VALUES (37, 'Blog Network', '', '2012-01-18 11:40:11-08', '2012-01-18 11:40:11-08');


--
-- TOC entry 2561 (class 0 OID 19392)
-- Dependencies: 213
-- Data for Name: market_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (319, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/sysomos', '', 'Sysomos', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (439, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/endeca', '', 'Endeca', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (10, NULL, 'AllThingsD', 'http://allthingsd.com/20111027/snip-it-is-a-bookmarking-site-for-you-to-share-your-opinions/', '', 'Snip.it Is a Bookmarking Site for Sharing Opinions', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (11, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/snip-it', '', 'Snip.it', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (1, NULL, 'Venture Beat', 'http://venturebeat.com/2011/11/14/trapit/', '', 'Siri sibling Trapit launches as intelligent discovery engine for the web�s�content', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (2, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/chattertrap', '', 'Trapit', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (3, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/trapit_siris_sister_technology_for_news_launches_t.php', '', 'Trip.it: Siri''s Sister Technology for News Launchs to the Public', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (4, NULL, 'PC Magazine', 'http://www.pcmag.com/article2/0,2817,2396511,00.asp', '', 'Trapit, the Non-Search Engine', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (5, NULL, 'Search Engine Watch', 'http://searchenginewatch.com/article/2125910/Trapit-Discovery-Engine-Launches-on-a-Collision-Course-with-Google', '', 'Trapit Discovery Engine Launches, on a "Collision Course with Google"', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (6, NULL, 'Mashable', 'http://mashable.com/2011/11/15/trap-it-beta/', '', 'Siri''s Sister Company Launches a Discovery Engine', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (7, NULL, 'Mashable', 'http://mashable.com/2011/10/27/snip-it/', '', 'Snip.it Lets You Collect and Share Web Content That Matters to You', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (8, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/inside_top_tellme_engineers_new_bookmarking_startu.php', '', 'After Building $800M Voice Platform, TellMe Engineer Gets Funding for Social Bookmarking Startup', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (9, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/27/khosla-ventures-backed-snip-it-lets-you-clip-save-and-share-collections-of-content-on-the-web/', '', 'Khosla Ventures-Backed Snip.it Lets You Clip, Save and Share Collections of Content on the Web', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (12, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/ness-computing', '', 'Ness', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (13, NULL, 'TechCrunch', 'http://techcrunch.com/2011/07/19/ness-computing/', '', 'With $5 Million In Their Pockets, Ness Has Quietly Built a Subjective Search Engine', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (14, NULL, 'TechCrunch', 'http://techcrunch.com/2011/08/25/ness/', '', 'Ness Serves Up Their First Personal Search App Catering to Restaurant Discovery', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (15, NULL, 'Mashable', 'http://mashable.com/2011/08/25/ness/', '', 'Ness Is a Personalized Search Engine for the Mobile World', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (16, NULL, 'Quora', 'http://www.quora.com/How-many-active-users-does-Pinterest-have?q=users+pinterest', '', 'How many active users does Pinterest have?', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (17, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/pinterest', '', 'Pinterest', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (18, NULL, 'TechCrunch', 'http://techcrunch.com/2011/09/15/sources-pinterest-has-already-pinned-down-10m-at-a-40m-valuation/', '', 'Pinterest Has Already Pinned Down $10M At A $40M Valuation', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (19, NULL, 'Quora', 'http://www.quora.com/Pinterest/What-is-driving-the-rapid-growth-in-daily-and-monthly-active-users-of-Pinterest', '', 'What is driving the rapid growth in daily and monthly active users of Pinterest?', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (20, NULL, 'Business Insider', 'http://www.businessinsider.com/pinterest-raises-a-huge-round-at-a-75-million-valuation-2011-9?op=1', '', 'Pinterest Working On A Huge Round At A Big Valuation', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (21, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/07/confirmed-pinterest-raises-27-million-round-led-by-andreessen-horowitz/', '', 'Confirmed: Pinterest Raises $27 Million Round Led By Andreesen Horowitz', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (22, NULL, 'AllThingsD', 'http://allthingsd.com/20111007/exclusive-pinterest-set-to-close-a-new-round-with-andreessen-horowitz-valuing-start-up-at-200m/', '', 'Exclusive: Pinterest Closes New $27M Round With Andreesen Horowitz Valuing Start-Up at $200M', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (23, NULL, 'BusinessWeek', 'http://www.businessweek.com/magazine/why-imagesharing-network-pinterest-is-hot-11172011.html', '', 'Why Image-Sharing Network Pinterest Is Hot', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (24, NULL, 'Time', 'http://www.time.com/time/specials/packages/article/0,28804,2087815_2088159_2088155,00.html', '', 'The 50 Best Websites of 2011', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (25, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/if_youve_never_heard_of_pinterest_youre_a_big_dork.php', '', 'If You''ve Never Heard of Pinterest, You''re a Big Dork', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (26, NULL, 'Mashable', 'http://mashable.com/2011/10/07/pinterest/', '', 'Meet Pinterest: A Private Social Pinboard That Collects Your Online Memories', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (27, NULL, 'Time', 'http://bits.blogs.nytimes.com/2011/11/22/pinterest-appeals-to-online-collectors/', '', 'Pinterest Appeals to Online Collectors', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (28, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/svpply', '', 'Svpply', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (29, NULL, 'AllThingsD', 'http://allthingsd.com/20101122/svpply-is-a-social-shopping-site-with-a-funny-name-good-buzz-and-a-new-funding-round/', '', 'Svpply Is a Social Shopping Site With a Funny Name, Good Buzz and a New Funding Round', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (30, NULL, 'Tumblr', 'http://pieratt.tumblr.com/post/10452105095/who-svpply-is-competing-with-sort-of', '', 'Who Svpply is competing with, sort of', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (31, NULL, 'Fast Company', 'http://www.fastcompany.com/blog/cliff-kuang/design-innovation/svpply-high-style-shopping-curated-crowd', '', 'SVPPLY: High-Style Shopping, Curated by the Crowd', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (32, NULL, 'Venture Beat', 'http://venturebeat.com/2010/11/23/svpply-bags-500k-for-minimalist-social-shopping/', '', 'Svpply Bags $500k for minimalist social shopping', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (33, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/evri', '', 'Evri', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (34, NULL, 'TechCrunch', 'http://techcrunch.com/2010/03/11/evri-acquires-radar-networks/', '', 'Evri Acquires Radar Networks In Semantic Search Consolidation', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (35, NULL, 'TechCrunch', 'http://techcrunch.com/2010/01/22/t2-bing-google-radar-semantic-search-race/', '', 'Bing, Google, And The Enigmatic T2: The Race For A Complete Semantic Search Engine', NULL, '', '2011-12-27 19:30:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (36, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/powerset', '', 'Powerset', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (37, NULL, 'TechCrunch', 'http://techcrunch.com/2009/10/09/hearst-takes-a-stab-at-semi-automated-content-with-lmk/', '', 'Hearst Takes A Stab At Semi-Automated Content With LMK', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (38, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/kosmix', '', 'Kosmix', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (39, NULL, 'TechCrunch', 'http://techcrunch.com/2010/06/10/kosmix-tweetbeat-world-cup/', '', 'Kosmix Unleases Its Realtime TweetBeat On The World Cup', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (40, NULL, 'TechCrunch', 'http://techcrunch.com/2010/10/08/kosmix-kills-off-meehives-custom-news-service-as-it-focuses-on-tweetbeat/', '', 'Kosmix Kills Off MeeHive''s Custom News Service As It Focuses On TweetBeat', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (41, NULL, 'TechCrunch', 'http://techcrunch.com/2009/03/11/meehive-taps-into-kosmix-to-build-your-daily-personalized-newspaper/', '', 'MeeHiv Taps Into Kosmix To Build Your Daily Personalized Newspaper', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (42, NULL, 'TechCrunch', 'http://techcrunch.com/2008/06/25/kosmix-goes-horizontal/', '', 'Kosmix Goes Horizontal', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (43, NULL, 'TechCrunch', 'http://techcrunch.com/2010/09/29/tweetbeat/', '', 'TweetBeat Wants To Kill Hashtags On Twitter By Making Them Obsolete', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (44, NULL, 'TechCrunch', 'http://techcrunch.com/2007/09/12/will-kosmixs-plan-to-take-vertical-search-horizontal-go-flat/', '', 'Will Kosmix''s Plan To Take Vertical Search Horizontal Go Flat?', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (45, NULL, 'TechCrunch', 'http://techcrunch.com/2009/04/15/universal-search-takes-off-kosmix-posts-419-growth-in-march/', '', 'Universal Search Takes Off: Kosmix Posts 419% Growth In March', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (46, NULL, 'Time', 'http://dealbook.nytimes.com/2011/04/19/wal-mart-buys-social-media-site-kosmix/', '', 'Wal-Mart Buys Social Media Firm Kosmix', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (47, NULL, '', 'http://blogs.wsj.com/venturecapital/2011/04/20/wal-marts-kosmix-deal-may-inspire-other-retailers/', '', 'Will Wal-Mart''s Kosmix Deal Inspire Other Retailers?', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (48, NULL, 'DowJones.com', 'https://www.fis.dowjones.com/WebBlogs.aspx?aid=DJFVW00020110418e74j0008d&ProductIDFromApplication=&r=wsjblog&s=djfvw', '', 'DAG Ventures Scores With Wal-Mart Again As Kosmix Sells To Retailer', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (49, NULL, 'ZD Net', 'http://www.zdnet.com/blog/btl/wal-mart-overpaid-for-kosmix-but-bet-on-commerces-future-necessary/47463', '', 'Wal-Mart overpaid for Kosmix, but bet on commerce''s future necessary', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (50, NULL, 'AllThingsD', 'http://allthingsd.com/20110418/exclusive-wal-mart-paid-300-million-plus-for-kosmix/', '', 'Exclusive: Wal-Mart Paid $300 Million-Plus for Kosmix', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (51, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/walmartlabs_kosmix.php', '', '@WalmartLabs: How a Scrappy Search 2.0 Startup Became the Future of Walmart', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (52, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/sphere', '', 'Surphace', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (53, NULL, 'TechCrunch', 'http://techcrunch.com/2010/02/10/aols-surphace-goes-self-service-with-private-beta-of-s4/', '', 'AOL''s Surphace Goes Self Serve With Private Beta of S4', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (272, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/sphere', '', 'Surphace', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (54, NULL, 'AllThingsD', 'http://allthingsd.com/20110201/aol-sells-content-recommender-surphace-to-content-recommender-outbrain/?mod=ATD_rss', '', 'AOL Sells Content Recommender to Surphace to Content Recommender Outbrain', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (55, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/daylife', '', 'DayLife', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (56, NULL, 'Jackmyers.com', 'http://www.jackmyers.com/jackmyers-media-innovation/18722359.html', '', 'Daylife Poised to Reinvent News and Online Content Distribution, with Funding from Publicis, NY Times Company and a Digital Who''s Who', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (57, NULL, 'BusinessWeek', 'http://www.businessweek.com/magazine/content/08_26/b4090073501596.htm?chan=search', '', 'Redirecting the Web''s News Stream', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (58, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/inform-technologies', '', 'Inform', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (59, NULL, 'TechCrunch', 'http://techcrunch.com/2010/05/17/former-joost-ceo-matt-zelesko-joins-inform-technologies-as-cto/', '', 'Former Joost CEO Matt Zelesko Joins Inform Technologies as CEO', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (60, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/loud3r', '', 'Loud3r', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (61, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/loud3r_publisher_curation_service.php', '', 'Sneak Peak at Loud3r''s New Curation Power Tool', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (62, NULL, 'PaidContent.org', 'http://paidcontent.org/article/419-u.s.-news-partners-with-loud3r-on-content-aggregation-channels/', '', 'U.S. News Partners With Loud3r On Content Aggregation Channels', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (63, NULL, 'Venture Beat', 'http://venturebeat.com/2009/06/05/news-aggregator-loud3r-refocuses-raises-300k/', '', 'News aggregator Loud3r refocuses, raises new funding', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (64, NULL, 'TechCrunch', 'http://techcrunch.com/2008/07/17/loud3r-offers-a-bett3r-way-to-discover-news/', '', 'LOUD3R Offers a BETT3R Way To Discover News', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (65, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/outbrain', '', 'Outbrain', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (66, NULL, 'TechCrunch', 'http://techcrunch.com/2008/02/25/blog-recommendation-startup-outbrain-raises-5-million/', '', 'Blog Recommendation Startup Outbrain Raises $5 Million', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (67, NULL, '', 'http://ouriel.typepad.com/myblog/2007/05/lgilab_invests_.html', '', 'LGiLab invests in Outbrain and Timeless Cities', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (68, NULL, '', 'http://www.centernetworks.com/outbrain-b5media-ratings-recommendations', '', 'Outbrain and b5media Partner on Content Rating and Recommendations', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (69, NULL, 'Techaviv', 'http://www.techaviv.com/2009/02/11/outbrain-outsmarts-them-all-secures-12m-second-round/', '', 'Outbrain Outsmarts Them All. Secures $12M Second Round', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (70, NULL, '', 'http://blog.outbrain.com/2011/12/future-publishing-increase-revenue-case-study.html#more-2197', '', 'Future Publishing Leverages 3rd Party Content to Increase Revenue (case study)', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (71, NULL, '', 'http://blog.outbrain.com/2011/11/meet-outbrain-europe.html', '', 'Meet Outbrain Europe', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (72, NULL, '', 'http://blog.outbrain.com/2011/11/outbrain-named-most-promising-startup-of-2011.html', '', 'Outbrain Named Most Promising Startup of 2011', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (73, NULL, 'TechCrunch', 'http://techcrunch.com/2011/01/12/onswipe/', '', 'OnSwipe', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (74, NULL, 'TechCrunch', 'http://techcrunch.com/2011/01/12/onswipe/', '', 'OnSwipe Raises, Like, A Million Dollars', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (75, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/02/spark-lightbank-and-yuri-milner-get-in-on-onswipes-5m-series-awesome/', '', 'Spark, Lightbank and Yuri Milner Get In On OnSwipe''s $5M "Series Awesome"', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (76, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/20/onswipe-wants-to-make-slate-forbes-and-your-website-feel-like-a-native-tablet-app/', '', 'OnSwipe Wants To MakeSlate, Forbes And Your Website Feel Like A Native Tablet App', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (77, NULL, 'Wired', 'http://thenextweb.com/insider/2011/11/21/onswipe-gives-wired-a-taste-of-its-new-tech-coming-in-2012/', '', 'OnSwipe gives WIRED a taste of its new tech, coming in 2012', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (78, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/05/new-content-sharing-network-spling-launches-announces-400k-series-a/', '', 'New Content Sharing Network Spling Launches, Announces $400K Series A', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (79, NULL, 'Mashable', 'http://mashable.com/2011/11/22/vertical-acuity/', '', 'Can Vertical Acuity Stop Your Site Losing Visitors?', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (80, NULL, '', 'http://www.fastcodesign.com/1663888/why-build-an-ipad-app-when-onswipe-instantly-gives-websites-a-tablet-feel', '', 'Why Build an iPad App, when OnSwipe Instantly Gives Websites a "Tablet Feel"?', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (81, NULL, 'Wired', 'http://www.wired.com/epicenter/2011/06/onswipe/', '', 'Onswipe Makes Any News Site Touch-Enabled With HTML5 Magic', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (82, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/sailthru', '', 'SailThru', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (83, NULL, 'Business Insider', 'http://www.businessinsider.com/sailthru-raises-8-million-round-led-by-rre-ventures-2011-9#ixzz1YW5yqxts', '', 'Smart Email Provider Sailthru Raises $8 Million Round Led By RRE Ventures', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (84, NULL, 'Business Insider', 'http://www.businessinsider.com/sailthru-funding-2010-7', '', 'Behavioral Email Startup Sailthru Raises $1 Million Led By DFJ Gotham', NULL, '', '2011-12-27 19:30:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (85, NULL, 'Venture Beat', 'http://venturebeat.com/2010/07/26/sailthru-funding/', '', 'Sailthru lands $1M for targeted company newsletters', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (86, NULL, 'Quora', 'http://www.quora.com/How-is-Sailthru.com-for-API-based-email-delivery?q=sailthru', '', 'How is SailThru.com for API-based email delivery?', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (87, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/simplereach', '', 'SimpleReach', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (88, NULL, 'Quora', 'http://www.quora.com/SimpleReach', '', 'What sites use SimpleReach?', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (89, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/apture', '', 'Apture', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (90, NULL, 'TechCrunch', 'http://techcrunch.com/2011/11/10/google-buys-contextual-rich-news-browsing-startup-apture-to-beef-up-chrome/', '', 'Google Buys Contextual Rich News Browsing Startup Apture To Beef Up�Chrome', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (91, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/29/apture-hotspots/', '', 'The Web Is Full Of Hyperlinks Waiting To Happen, Apture HotSpots Makes Them�Happen', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (92, NULL, 'TechCrunch', 'http://techcrunch.com/2008/06/30/apture-gives-contextual-popups-a-good-name/', '', 'Apture Gives Contextual Popups A Good Name', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (93, NULL, 'TechCrunch', 'http://techcrunch.com/2010/08/24/apture-now-brings-instantaneous-search-to-any-web-page/', '', 'Apture Highlights Brings Instantaneous Search To Any Web Page', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (94, NULL, 'TechCrunch', 'http://techcrunch.com/2010/10/19/scribd-partners-with-apture-to-include-rich-media-contextual-browsing-within-content/', '', 'Scribd Partners With Apture to Include Rich Media Contextual Browsing Within Content', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (95, NULL, 'TechCrunch', 'http://techcrunch.com/2011/03/09/apture-adds-former-about-com-ceo-peter-horan-to-board-signs-up-more-publishers/', '', 'Apture Adds Former About.com CEO Peter Horan To Board; Signs Up More Publishers', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (321, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/buddymedia', '', 'BuddyMedia', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (96, NULL, 'CNet', 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=13&ved=0CIQBEBYwDA&url=http%3A%2F%2Fnews.cnet.com%2F8301-1023_3-57322553-93%2Fgoogle-buys-apture-to-bolster-chrome-browser%2F&ei=AlvdTrlhhrGJApn_7MwD&usg=AFQjCNFzSAKKCfHhJ46pIcLConbKtVpl7Q&sig2=hF5yRpdVoW6P9dPRapawtw', '', 'Google buys Apture to bolster Chrome browser', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (97, NULL, '', 'http://blogs.wsj.com/digits/2011/11/10/google-acquisition-binge-continues-with-%E2%80%98in-page-search%E2%80%99-start-up-apture/', '', 'Google Acquisition Binge Continues With Apture, Katango', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (98, NULL, 'AllThingsD', 'http://allthingsd.com/20111110/another-googley-acquihire-apture-to-join-the-chrome-team/', '', 'Another Googley "Acqhire" -- Contextual Search Start-Up Apture to Join the Chrome Team', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (99, NULL, 'Quora', 'http://www.quora.com/What-is-the-vision-for-Apture?q=apture', '', 'What is the vision for Apture?', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (100, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/gravity', '', 'Gravity', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (101, NULL, 'TechCrunch', 'http://techcrunch.com/2010/10/13/gravity-regroups-for-round-two-the-personalization-war/', '', 'Gravity Regroups For Round Two: The Personalization War', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (102, NULL, 'Scobleizer', 'http://scobleizer.com/2010/11/16/first-look-gravity-is-making-interest-graphs-of-your-social-content/', '', 'First look: Gravity is makign interest graphs of your social content', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (103, NULL, 'CNet', 'http://news.cnet.com/8301-19882_3-20022901-250.html', '', 'Gravity knows what you like; soon advertisers will, too', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (104, NULL, 'TechCrunch', 'http://techcrunch.com/2010/11/16/twinterest-gravity-analyzes-your-twitter-stream-tells-you-what-you-love/', '', 'Twinterest: Gravity Analyzes Your Twitter Stream Tells You What You Love', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (105, NULL, 'Quora', 'http://www.quora.com/Gravity-company/Why-did-Gravitys-Convo-io-fail', '', 'Why did Gravity''s Convo.io fail?', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (106, NULL, '', 'http://googleblog.blogspot.com/2011/08/find-more-while-you-browse-with-google.html', '', 'Find more while you browse with Google Related', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (107, NULL, 'PC Magazine', 'http://www.pcmag.com/article2/0,2817,2391250,00.asp', '', 'Google Related Serves Up Recommendations While You Surf', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (108, NULL, 'Ars Technica', 'http://arstechnica.com/web/news/2011/08/google-related-collects-relevant-content-at-the-foot-of-chrome.ars', '', 'Google Related collects relevant content at the foot of Chrome', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (109, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/zemanta', '', 'Zemanta', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (110, NULL, 'Quora', 'http://www.quora.com/What-is-the-business-model-of-Zemanta?q=zemanta', '', 'What''s the business model of Zemanta?', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (111, NULL, 'TechCrunch', 'http://techcrunch.com/2010/11/18/zemanta-funding/', '', 'Zemanta Raises $3 Million From Union Square, Eden, To Help You "Blog Smarter"', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (112, NULL, '', 'http://www.avc.com/a_vc/2008/09/zemanta.html', '', 'Zemanta', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (113, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/silk', '', 'Silk', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (114, NULL, 'TechCrunch', 'http://techcrunch.com/2011/05/18/silk-scores-seed-funding-from-atomico-others-for-content-crunching-platform/', '', 'Silk Scores Seed Funding From Atomico, Others For Content Crunching Platform', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (115, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/socialflow', '', 'SocialFlow', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (116, NULL, 'Time', 'http://www.quora.com/When-is-the-best-time-to-tweet', '', 'When is the best time to tweet?', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (117, NULL, 'TechCrunch', 'http://techcrunch.com/2011/04/07/socialflow/', '', 'New Twitter Ecosystem Poster Child SocialFlow Secures The Firehose And $7 Million Round', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (118, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/sharethis/posts', '', 'ShareThis', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (119, NULL, 'TechCrunch', 'http://techcrunch.com/2008/03/13/sharethis-raises-15m-a-lot-of-dough-for-one-widget/', '', 'ShareThis Raises $15M: A Lot of Dough for One Widget', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (120, NULL, 'TechCrunch', 'http://techcrunch.com/2010/08/26/sharethis-social-reach-facebook-twitter/', '', 'ShareThis Starts Measuring Social Reach, Facebook and Twitter Account For Nearly Half', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (121, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/06/sharethis-facebook-38-percent-traffic/', '', 'ShareThis Study: Facebook Accounts For 38 Percent of Sharing Traffic On The Web', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (122, NULL, 'TechCrunch', 'http://techcrunch.com/2011/03/21/after-5-years-of-facilitating-sharing-on-the-web-addtoany-turns-a-profit/', '', 'After 5 Years Of Facilitating Sharing On The Web, AddToAny Turns A Profit', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (123, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/addthis', '', 'AddThis', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (124, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/web_user_interest_data.php', '', '1 Billion Peoples'' Interests Now Tracked by AddThis', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (125, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/monetizing_a_button_clearspring_acquires_addthis.php', '', 'Widget Platform Clearspring Acquires AddThis', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (126, NULL, 'AllThingsD', 'http://allthingsd.com/20080930/clearspring-plus-addthis-but-does-that-add-up-to-a-real-business/', '', 'Clearspring Plus AddThis--But Does That Add Up to a Real Business?', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (127, NULL, 'TechCrunch', 'http://techcrunch.com/2011/05/10/addthis-indeed-clearspring-raises-20-million-as-it-rides-social-sharing-boom/', '', 'AddThis Indeed: Clearspring Raises $20 Million As It Rides Social Sharing Boom', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (128, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/bitly-2', '', 'bitly', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (129, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/twitter_crowns_bitly_as_the_king_of_short_links_he.php', '', 'Twitter Crowns Bit.ly As The King of Short Links; Here''s What It Means', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (130, NULL, '', 'http://nyconvergence.com/2011/12/bitly-plans-to-challenge-google-with-new-search-engine.html', '', 'Bitly Plans to Challenge Google with New Search Engine', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (131, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/13/bit-ly-wants-to-predict-the-future-with-realtime-social-search/', '', 'Bit.ly Wants To Predict The Future With Realtime Social Search', NULL, '', '2011-12-27 19:30:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (132, NULL, '', 'http://bitlyenterprise.com/post/11403350749/social-search', '', 'Social Search', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (133, NULL, '', 'http://blog.bitly.com/post/12296694165/bitly-and-verisign', '', 'bitly and Verisign', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (134, NULL, 'Ad Age', 'http://adage.com/article/digital/bitly-rolls-reputation-monitoring-tool-social-search-product/230416/', '', 'Bitly Rolls Out Reputation-Monitoring Tool and Social-Search Product', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (135, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/delicious', '', 'delicious', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (136, NULL, '', 'http://www.avos.com/avos-acquires-trunkly/', '', 'AVOS Acquires Trunk.ly to Enhance Link-Saving in Delicious', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (137, NULL, '', 'http://www.avos.com/new-delicious/', '', 'A New Flavor . . . Still Delicious', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (138, NULL, '', 'http://blog.trunk.ly/2011/11/10/avos-acquires-trunkly/', '', 'AVOS Acquires Trunk.ly to Enhance Link-Saving in Delicious', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (139, NULL, '', 'http://blog.trunk.ly/2011/09/27/trunk-lys-response-to-new-delicious-com/', '', 'Trunk.ly''s response to the new delicious.com', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (140, NULL, '', 'http://blog.trunk.ly/2011/10/05/trunk-ly-the-easiest-way-to-save-links-online-behind-the-scenes-on-the-new-design/', '', 'Trunk.ly -- the easiest way to save links online, behind the scenes on the new design', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (141, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/trunk-ly', '', 'Trunk.ly', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (142, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/instapaper', '', 'Instapaper', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (143, NULL, 'TechCrunch', 'http://techcrunch.com/2011/03/10/instapaper-3/', '', 'Instapaper Goes Social With Sharing, Likes, and Friends', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (144, NULL, '', 'http://www.marco.org/2011/09/14/instapapers-antisocial-network', '', 'Instapaper''s (anti-)social network', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (145, NULL, 'CrunchBase', 'http://www.crunchbase.com/product/tynt-insight', '', 'Tynt', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (146, NULL, '', 'http://daringfireball.net/2010/05/tynt_copy_paste_jerks', '', 'Tynt, the Copy/Paste Jerks', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (147, NULL, 'TechCrunch', 'http://techcrunch.com/2010/04/16/tynt-gets-8-million-for-ctrl-c-action/', '', 'Tynt Gets $8 Million for Ctrl-C Action', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (148, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/tynt_could_be_the_biggest_and_best_web_data_source.php', '', 'Tynt Could be the Biggest and Best Web Data Source You''ve Never Considered', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (149, NULL, 'CNet', 'http://news.cnet.com/8301-19882_3-20011011-250.html', '', 'Tynt breaks copy and paste, but only if you let it', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (150, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/stumbleupon', '', 'StumbleUpon', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (151, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/03/stumbleupon-brings-its-tablet-experience-to-android-optimizes-ui-across-all-its-mobile-apps/', '', 'StumbleUpon Brings Its Tablet Experience To Android, Optimizes UI Across All Its Mobile Apps', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (152, NULL, 'TechCrunch', 'http://techcrunch.com/2011/07/11/stumbleupon-ipad/', '', 'The iPad Was Built For Something Like StumbleUpon, Now They Have A Worthy App', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (153, NULL, 'TechCrunch', 'http://techcrunch.com/2011/03/13/test/', '', 'StumbleUpon Unveils Paid Discovery, Its New "No Click" Ad Platform', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (154, NULL, 'Quora', 'http://www.quora.com/StumbleUpon/What-is-a-typical-revenue-split-between-StumbleUpon-and-a-site-it-drives-traffic-to', '', 'What is a typical revenue split between StumbleUpon and a site it drives traffic to?', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (155, NULL, '', 'https://www.stumbleupon.com/aboutus/', '', 'About StumbleUpon', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (156, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/bluefin-labs', '', 'BlueFin Labs', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (157, NULL, '', 'http://www.bluefinlabs.com/solutions/', '', 'Social TV Analytics', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (158, NULL, 'TechCrunch', 'http://techcrunch.com/2011/02/01/bluefin-labs/', '', 'Bluefin Labs Reveals How It Is Tying Social Media To TV', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (159, NULL, '', 'http://www.xconomy.com/new-york/2011/11/11/bluefin-labs-and-socialguide-push-competing-technology-to-make-social-data-useful-to-tv-networks-and-advertisers/', '', 'Bluefin Labs and SocialGuide Push Competing Technology to Make Social Data Useful to TV Networks and Avertisers', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (160, NULL, '', 'http://www.xconomy.com/boston/2011/09/12/bluefin-labs-named-after-a-sushi-bar-tracks-social-media-around-%E2%80%9Cevery-show-on-tv%E2%80%9D/', '', 'Bluefin Labs, Named After a Sushi Bar, Tracks Social Media Around "Every Show on TV"', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (161, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/flipboard', '', 'Flipboard', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (162, NULL, 'Scobleizer', 'http://scobleizer.com/2010/07/20/exclusive-first-look-at-revolutionary-social-news-ipad-app-flipboard/', '', 'First look at "revolutionary" social news iPad app: Flipboard', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (163, NULL, 'AllThingsD', 'http://allthingsd.com/20100720/flipboard-your-own-digital-magazine/', '', 'Your Own Digital Magazine', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (164, NULL, '', 'http://www.thedailybeast.com/newsweek/2010/08/07/when-you-are-the-editor.html', '', 'When You Are the Editor', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (165, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/zite', '', 'Zite', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (166, NULL, '', 'http://blog.zite.com/2011/12/zite-teams-up-with-lululemon.html', '', 'Zite Teams Up with lululemon', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (167, NULL, '', 'http://www.finsmes.com/2011/08/zite-acquired-cnn.html?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+finsmes%2FcNHu+%28FinSMEs%29', '', 'Zite Acquired by CNN', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (168, NULL, '', 'http://blog.zite.com/2011/10/zite-improves-zite-obsessive-disorder.html', '', 'Zite gets multiple personalities with new release: Sybil', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (169, NULL, '', 'http://edition.cnn.com/2010/TECH/mobile/10/18/pulse.news.app/', '', 'With surprise boost from Steve Jobs, news app is a hit', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (170, NULL, 'TechCrunch', 'http://techcrunch.com/2011/08/02/pulse-espn-5-million/', '', 'On The Verge of 5 Million Users, Pulse Scores The First ESPN Deal', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (171, NULL, 'TechCrunch', 'http://techcrunch.com/2011/08/29/with-save-to-pulse-bookmarklet-and-chrome-extension-pulse-enters-instapapers-turf/', '', 'With "Save To Pulse" Bookmarklet And Chrome Extension, Pulse Enters Instapaper''s Turf', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (172, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/readfu', '', 'Sumify', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (173, NULL, 'Venture Beat', 'http://venturebeat.com/2010/08/24/social-news-reader-summify-raises-funds-to-solve-information-overload/', '', 'Social news-reader Summify raises funds to solve information overload', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (174, NULL, 'TechCrunch', 'http://techcrunch.com/2011/01/06/fly-or-die-flipboard-tryx-windows-phone/', '', 'Fly Or Die: Does Flipboard Have A Chance?', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (175, NULL, 'Quora', 'http://www.quora.com/Pinterest/How-did-Pinterest-gain-initial-traction-and-traffic', '', 'How did Pinterest gain initial traction and traffic?', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (176, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/31/tumblr-acknowledges-its-growing-spam-problem-says-its-doing-everything-it-can/', '', 'Tumblr Acknowledges Its Growing Spam Problem, Says It''s Doing Everything It Can', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (177, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/tumblr', '', 'Tumblr', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (178, NULL, 'Quora', 'http://www.quora.com/How-many-users-does-Tumblr-have', '', 'How many users does Tumblr have?', NULL, '', '2011-12-27 19:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (179, NULL, 'Quora', 'http://www.quora.com/What-makes-Tumblr-so-appealing-to-users', '', 'What makes Tumblr so appealing to users?', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (180, NULL, 'Quora', 'http://www.quora.com/Tumblr/What-problem-does-Tumblr-solve', '', 'What problem does Tumblr solve?', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (181, NULL, 'Tumblr', 'http://www.tumblr.com/about', '', 'About', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (182, NULL, 'Quora', 'http://www.quora.com/Tumblr/Why-did-Tumblr-create-the-Spotlight-directory-if-its-pretty-much-the-same-as-the-old-directory', '', 'Why did Tumblr create the Spotlight directory if it''s pretty much the same as the old directory?', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (183, NULL, 'Mashable', 'http://mashable.com/2009/08/05/tumblr-takeover/', '', 'Tumblr Takes Over The World: 255,000,000 Pageviews in July', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (184, NULL, 'Quora', 'http://www.quora.com/How-many-accounts-does-Tumblr-have-and-what-percent-are-active', '', 'How many accounts does Tumblr have and what percent are active?', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (185, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/tumblr_leaves_posterous_in_the_dust.php', '', 'Tumblr Leaves Posterous in the Dust', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (186, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/foursquare', '', 'Foursquare', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (187, NULL, '', 'https://foursquare.com/about/', '', 'About', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (188, NULL, '', 'http://www.flowtown.com/blog/how-businesses-are-utilizing-foursquare', '', 'How Businesses Are Utilizing Foursquare', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (189, NULL, '', 'http://blog.foursquare.com/2011/01/24/2010infographic/', '', 'So We Grew 3400% Last Year', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (190, NULL, 'Mashable', 'http://mashable.com/2010/03/29/foursquare-growth-numbers/', '', 'Foursquare''s Growth Not Slowing Down', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (191, NULL, 'Venture Beat', 'http://venturebeat.com/2011/08/23/foursquare-wins-against-facebook-places/', '', 'Foursquare wins major victory with death of Facebook Places', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (192, NULL, 'Venture Beat', 'http://venturebeat.com/2011/07/12/foursquare-finds-revenue-stream-in-daily-deals-partnerships/', '', 'Foursquare finds revenue stream in daily deals partnerships', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (193, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/twitter', '', 'Twitter', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (194, NULL, 'AllThingsD', 'http://allthingsd.com/20110314/twitter-numbers-cool-but-how-many-users-do-you-have/', '', 'Twitter Numbers: Cool, But How Many Users Does It Actually Have?', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (195, NULL, '', 'http://www.thefancy.com/help', '', 'What is Fancy?', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (196, NULL, 'TechCrunch', 'http://techcrunch.com/2010/12/28/fancy-is-a-social-shopping-list-for-the-design-obsessed/', '', 'Fancy Is A Social Shopping List For The Design-Obsessed', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (197, NULL, 'Quora', 'http://www.quora.com/Who-are-TheFancy-coms-main-competitors', '', 'Who are TheFancy.com''s main competitors?', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (198, NULL, '', 'http://www.betabeat.com/2011/11/08/worlds-biggest-fashion-brands-invest-10-m-in-the-fancy-at-100-m-valuation/', '', 'World''s Biggest Fashion Brands Invest $10M in The Fancy at $100 M Valuation', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (199, NULL, '', 'http://www.styleite.com/media/the-fancy-website/', '', 'Fancy That: New Site Aims to Catalog Every Item Ever', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (200, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/wanelo', '', 'Wanelo', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (201, NULL, '', 'http://www.socaltech.com/interview_with_deena_varshavskaya__wanelo/s-0034024.html', '', 'Interview with Deena Varshavskaya, Wanelo', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (202, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/lyst', '', 'Lyst', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (203, NULL, 'Quora', 'http://www.quora.com/Which-is-better-Lyst-or-Svpply', '', 'Which is better: Lyst or Svpply?', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (204, NULL, 'Mashable', 'http://mashable.com/2011/07/06/lyst/', '', 'Lyst is a Newsfeed for Shopping', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (205, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/gimme_bar_link_saving_with_dropbox_integration_scr.php', '', 'Gimme Bar: Link Sharing With Dropbox Integration, Screenshots & an API -- If This Doesn''t Work, Maybe Nothing Will', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (206, NULL, '', 'http://www.fastcodesign.com/1664934/gimme-bar-a-virtual-bulletin-board-for-saving-oh-everything', '', 'Gimme Bar, An App That Lets You Clip And Save Anything On The Web', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (207, NULL, 'TheNextWeb', 'http://thenextweb.com/apps/2011/08/31/gimme-bar-is-a-gorgeous-app-for-browsing-and-sharing-web-content/', '', 'Gimme Bar is a gorgeous app for browsing and sharing Web Content', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (208, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/nuji', '', 'Nuji', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (209, NULL, 'Quora', 'http://www.quora.com/Will-Nuji-be-big-in-2011-Why?q=nuji', '', 'Will Nuji be big in 2011? Why?', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (210, NULL, 'TheNextWeb', 'http://thenextweb.com/apps/2010/12/10/nuji-launches-as-instagram-meets-instapaper-for-social-shopping/', '', 'Nuji launches as "Instagram meets Instapaper" for social shopping', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (211, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/lookk', '', 'Lookk', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (212, NULL, '', 'http://www.telegraph.co.uk/finance/newsbysector/retailandconsumer/8686213/Carmen-Busquets-invests-in-social-networking-clothing-design-business-Lookk.com.html', '', 'Carmen Busquets invests in social network clothing design business Llookk.com', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (213, NULL, 'TechCrunch', 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=8&ved=0CE8QFjAH&url=http%3A%2F%2Ftechcrunch.com%2F2011%2F08%2F31%2Fgarmz-pivots-to-become-lookk-aims-to-disrupt-fashion-industry-cycle%2F&ei=NIXgTqCaKKWViAKYzrCdDw&usg=AFQjCNHx7ilrRK6_YeI1fXpHfwhF_H5qCQ&sig2=vOHzyA3NJlZYjxuIPdXG7Q', '', 'Garmz Pivots To Become Llook, Aims To Disrupt Fashion Industry Cycle', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (214, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/radian6', '', 'Radian6', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (215, NULL, 'TechCrunch', 'http://techcrunch.com/2010/03/10/radian6-launches-powerful-social-media-engagement-and-monitoring-console-for-brands-and-agencies/', '', 'Radian6 Launches Powerful Social Media Engagement and Monitoring Console For Brands and Agencies', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (216, NULL, 'TechCrunch', 'http://techcrunch.com/2011/03/30/salesforce-buys-social-media-monitoring-company-radian6-for-326-million/', '', 'Salesforce Buys Social Media Monitoring Company Radian6 For $326 Million', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (217, NULL, 'TechCrunch', 'http://techcrunch.com/2011/03/31/why-salesforce-overpaid-for-radian6/', '', 'Why Salesforce Overpaid for Radian6', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (218, NULL, 'TechCrunch', 'http://techcrunch.com/2011/08/19/salesforces-radian6-takes-social-media-monitoring-platform-mobile-with-new-ios-app/', '', 'Salesforce''s Radian6 Takes Social Media Monitoring Platform Mobile With New iOS App', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (219, NULL, 'TechCrunch', 'http://techcrunch.com/2011/11/30/salesforce-debuts-the-new-radian6-powered-social-marketing-and-monitoring-cloud/', '', 'Salesforce Deubts The New Radian6-Powered Social Marketing and Monitoring Cloud', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (220, NULL, 'AllThingsD', 'http://allthingsd.com/20110331/a-closer-look-at-the-salesforce-deal-for-radian6/', '', 'A Closer Look at the Salesforce Deal for Radian6', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (221, NULL, 'AllThingsD', 'http://allthingsd.com/20111130/march-benioff-brings-his-social-cloud-message-to-new-york/', '', 'Marc Benioff Brings His Social Cloud Message to New York', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (222, NULL, 'ZD Net', 'http://www.zdnet.com/blog/crm/salesforce-the-social-marketing-cloud-round-1-goes-to/3695', '', 'Salesforce & the Social Marketing Cloud: Round 1 Goes to . . . ', NULL, '', '2011-12-27 19:30:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (223, NULL, 'Quora', 'http://www.quora.com/Is-Radian6-services-worth-the-money', '', 'Is Radian6 services worth the money?', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (224, NULL, 'Quora', 'http://www.quora.com/Could-someone-compare-Radian6-Sysomos-PeopleBrowsr-Omniture-Woopra-Argyle-Social-and-IBM-Coremetrics-Social-Analytics', '', 'Could somone compare Radian6, Sysomos, PeopleBrowsr, Omniture, Woopra, Argyle Social and IBM Coremetrics Social Analytics?', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (225, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/polyvore', '', 'Polyvore', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (226, NULL, 'TechCrunch', 'http://techcrunch.com/2007/10/11/polyvore-to-tempt-fasionistas-to-create-then-spend/', '', 'Polyvore To Tempt Fashionistas To Create, Then Spend', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (227, NULL, 'TechCrunch', 'http://techcrunch.com/2009/08/18/polyvore-looks-stylin-in-this-new-56-million-round-of-funding/', '', 'Polyvore Looks Stylin'' In This New $5.6 Million Round of Funding', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (228, NULL, 'GigaOM', 'http://gigaom.com/2011/06/09/polyvore-profitable/', '', 'Now profitable, Polyvore strikes a pose as top fashion site', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (229, NULL, 'TheNextWeb', 'http://thenextweb.com/socialmedia/2011/02/19/the-future-of-polyvore-the-webs-largest-fashion-community-interview/', '', 'The future of Polyvore, the web''s largest fashion community', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (230, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/path', '', 'Path', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (231, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/19/nearing-1-million-users-path-stays-the-course/', '', 'Nearing 1 Million users, Path Stays The Course', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (232, NULL, 'TechCrunch', 'http://techcrunch.com/2011/11/29/paths-second-iteration-is-less-photosharing-and-more-everything-sharing/', '', 'Path''s Second Iteration Is Less Photosharing and More Everything Sharing', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (233, NULL, '', 'http://blog.louisgray.com/2009/02/outbrain-unveils-revenue-plan-with.html', '', 'Outbrain Unveils Revenue Plan With Advertising That''s Not Evil', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (234, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/visual-revenue', '', 'Visual Revenue', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (235, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/ellerdale', '', '', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (236, NULL, 'TechCrunch', 'http://techcrunch.com/2009/11/20/the-ellerdale-project-mines-the-web-to-help-you-make-sense-of-real-time-streams/', '', 'The Ellerdale Project Mines The Semantic Web To Help You Make Sense Of Real-Time Streams', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (237, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/collecta', '', 'Collecta', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (238, NULL, 'Mashable', 'http://mashable.com/2011/01/19/startup-collecta-shuts-down-search-engine/', '', 'Startup Collecta Shuts Down Its Product, Starts Working on a New One', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (239, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/scoopler', '', 'JustSpotted', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (240, NULL, 'TechCrunch', 'http://techcrunch.com/2010/10/12/justspotted/', '', 'Celebrity Geo-Stalking In Real-Time.  Finally.  JustSpotted Launches Next Week', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (241, NULL, 'TechCrunch', 'http://techcrunch.com/2010/10/14/twitter-justspotted/', '', 'Following Pivot To Celebrity Tracking Site, Twitter Cuts Off Scoopler''s Firehose Access', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (242, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/twazzup', '', 'Twazzup', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (243, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/flipboard_launches_first_advertising_plan_with_con.php', '', 'Flipboard''s New Ads Aren''t Just for Magazines', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (244, NULL, '', 'http://blogs.wsj.com/digits/2011/06/24/flipboard-rides-wave-of-user-growth/', '', 'Flipboard Rides Wave of User Growth', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (245, NULL, 'PaidContent.org', 'http://paidcontent.org/article/419-flipboard-raises-50-million-round-200-million-valuation/', '', 'Flipboard Raises $50 Million Round At A $200 Million', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (246, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/evernote', '', 'Evernote', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (247, NULL, 'Fast Company', 'http://www.fastcompany.com/magazine/147/next-tech-remember-the-money.html', '', 'Evernote CEO Phil Libin''s 3 Steps to "Freemium" Success', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (248, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/enterprise/2011/12/evernote-hello-this-is-an-app.php', '', 'Evernote, Hello?  This is an App Only Sheldon Cooper Would Love', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (249, NULL, 'Quora', 'http://www.quora.com/Evernote/How-many-premium-users-does-Evernote-have-as-of-December-2010', '', 'How many premium users does Evernote have, as of December 2010?', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (250, NULL, '', 'http://blog.evernote.com/2011/01/04/evernote-2010-a-year-in-stats/', '', 'Evernote 2010: A Year in Stats', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (251, NULL, 'Quora', 'http://www.quora.com/Will-Springpad-fold?q=springpad', '', 'Will Springpad fold?', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (252, NULL, '', 'http://blog.springpadit.com/2011/10/springpad-reaches-two-million-users-27-million-saves-and-growing-rapidly/', '', 'Springpad Reaches Two Million Users, 27 Million Saves and Growing Rapidly!', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (253, NULL, 'GigaOM', 'http://gigaom.com/2011/03/03/instapapers-arment-seek-money-from-customers-not-vcs/', '', 'Instapaper''s Arment: Seek Money From Customers, Not VCs', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (254, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/qtech', '', 'reQall', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (255, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/08/ness-2/', '', 'Ness Adds Social Sharing To Its Mobile Restaurant Recommendation App', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (256, NULL, '', 'http://www.reuters.com/article/2009/03/13/idUS80453+13-Mar-2009+BW20090313', '', 'Press Release', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (257, NULL, '', 'http://blogs.reuters.com/mediafile/2009/09/16/getty-images-invests-in-daylife-takes-snapshot-of-business/', '', 'Getty Images invests in Daylife, takes snapshot of business', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (258, NULL, '', 'http://www.observer.com/2010/media/amid-major-staff-reductions-abc-news-teams-daylife-ramp-aggregated-content', '', 'Amid Major Staff Reductions, ABC News Teams Up With Daylife to Ramp Up Aggregated Content', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (259, NULL, 'TechCrunch', 'http://techcrunch.com/2010/01/06/aggregate-knowledge-funding/', '', 'Aggregate Knowledge Raises $9 Million For Online Ad Optimization Platform', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (260, NULL, 'TechCrunch', 'http://techcrunch.com/2011/11/30/third-times-the-charm-a-new-newscred-raises-4-million-to-reinvent-the-newswire-service/', '', 'Third Time''s The Charm? A New NewsCred Raises $4 Million To Reinvent The Newswire Service', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (261, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/onespot', '', 'OneSpot', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (262, NULL, 'TechCrunch', 'http://techcrunch.com/2009/03/05/more-comment-consolidation-js-kit-acquires-sezwho/', '', 'Comment Consolidation: JS-Kit Acquires SezWho', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (263, NULL, 'TechCrunch', 'http://techcrunch.com/2008/10/21/sezwho-gets-chatty-with-instablogs-releases-upgrade/', '', 'SezWho Gets Chaty With Instablogs, Releases Upgrade', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (264, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/opencalais', '', 'OpenCalais', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (265, NULL, 'TechCrunch', 'http://techcrunch.com/2009/06/15/opencalais-updates-tagging-system-to-be-more-social-and-recession-friendly/', '', 'OpenCalais Updates Tagging System To Be More Social and Recession Friendly', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (266, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/reuters_open_calais_apps_interview.php', '', 'Reuters Open Calais Update: Apps Progress, Interview', NULL, '', '2011-12-27 19:30:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (267, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/crowdeye', '', 'CrowdEye', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (268, NULL, 'TechCrunch', 'http://techcrunch.com/2009/09/03/crowdeye-introduces-crowdrank-to-real-time-search/', '', 'CrowdEye Introduces CrowdRank To Real-Time Search', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (269, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/lazyfeed', '', 'LazyFeed', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (270, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/start/2009/07/get-the-news-vids-and-pics-you.php', '', 'LazyFeed: Get the News, Vids, and Pics You Want Without Even Trying', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (271, NULL, 'Time', 'http://blog.louisgray.com/2009/07/lazyfeed-poised-to-debut-real-time.html', '', 'Lazyfeed Poised to Debut Real-time Personalized Blog Search', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (273, NULL, 'TechCrunch', 'http://techcrunch.com/2009/10/24/tim-armstrongs-secret-project-is-to-turn-aol-into-a-low-cost-content-machine/', '', 'Tim Armstrong''s Secret Project Is To Turn AOL Into A Low-Cost Content Machine', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (274, NULL, 'Quora', 'http://www.quora.com/How-many-users-does-StumbleUpon-have', '', 'How many users does StumbleUpon have?', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (275, NULL, '', 'http://www.stumbleupon.com/blog/20-million-stumblers', '', '20 Million Stumblers!', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (276, NULL, 'Quora', 'http://www.quora.com/What-is-StumbleUpons-business-model', '', 'What is StumbleUpon''s business model?', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (277, NULL, 'TechCrunch', 'http://techcrunch.com/2011/08/31/subjot-a-topic-based-twitter-without-the-noise/', '', 'Subjot: A Topic-Based Twitter, Without the Noise', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (278, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/subjot', '', 'Subjot', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (279, NULL, '', 'http://www.betabeat.com/2011/08/31/subjot-launches-with-the-bet-that-users-would-rather-tune-out-subjects-theyre-not-interested-in/', '', 'Subjot Launches With the Bet That Users Would Rather Tune Out Subjects They''re Not Interest In', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (280, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/spling', '', 'Spling', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (281, NULL, 'Mashable', 'http://mashable.com/2011/10/17/chime-in/', '', 'New Social Network Combines, Twitter, Blogging and Reddit', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (282, NULL, '', 'http://www.huffingtonpost.com/2011/10/17/chimein-social-network_n_1016634.html', '', 'Chime.In: The Social Newtork That Pays You To Post', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (283, NULL, '', 'http://blogs.reuters.com/mediafile/2011/10/17/another-day-another-social-network-bill-gross-chimes-in/', '', 'Another day, another social network: Bill Gross chimes in', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (284, NULL, 'GigaOM', 'http://gigaom.com/2011/10/17/bill-gross-wants-to-take-on-twitter-facebook-and-google/', '', 'Bill Gross takes on Twitter, Facebook & Google +', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (285, NULL, 'Venture Beat', 'http://venturebeat.com/2011/10/17/chime-in/', '', 'UberMedia launches Twitter/Digg/Reddit/Facebook clone Chime.in', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (286, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/wibiya', '', 'Wibiya', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (287, NULL, 'TechCrunch', 'http://techcrunch.com/2011/04/02/conduit-acquires-web-application-platform-wibiya-for-45-million-sources/', '', 'Conduit Acquires Web Application Platform Wibiya For $45 Million: Sources', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (288, NULL, 'TheNextWeb', 'http://thenextweb.com/apps/2010/03/12/wibiya/', '', 'Wibiya Launches Integration with Cooliris Twitter Lists, Facebook Fan Pages, Backtype and More', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (289, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/my6sense', '', 'my6sense', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (290, NULL, 'TechCrunch', 'http://techcrunch.com/2011/02/09/my6sense-twitter/', '', 'My6sense Injects A Relevance-Based Tweet Stream Into Twitter.com', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (291, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/digital_intuition.php', '', 'My6Sense Releases API: ''Digital Intution'' for the Real-Time Web', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (292, NULL, 'CrunchBase', 'http://www.crunchbase.com/product/genieo', '', 'Genieo', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (293, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/cascaad', '', 'Cascaad', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (294, NULL, 'TechCrunch', 'http://techcrunch.com/2010/03/07/cascaad/', '', 'Cascaad Personalizes Your News Stream In Real Time, Raises Funding', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (295, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/bunchify', '', 'Bunchify', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (296, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/hunch', '', 'Hunch', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (297, NULL, '', 'http://uncrunched.com/2011/11/21/ebays-got-a-hunch-for-around-80-million/', '', 'eBay''s Got a Hunch, For Around $80 Million', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (298, NULL, 'GigaOM', 'http://gigaom.com/2010/11/22/can-hunchs-algorithm-improve-your-gift-giving-skills/', '', 'Can Hunch''s Algorithm Improve Your Gift-Giving Skills?', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (299, NULL, 'Fast Company', 'http://www.fastcompany.com/1789732/hilary-mason-chief-scientist-bitly-whos-next', '', '80 Million Links A Day Don''t Lie', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (300, NULL, 'Quora', 'http://www.quora.com/Why-did-the-latest-version-of-Digg-fail-Why-did-users-prefer-Digg-to-Reddit-previously-but-then-flocked-to-Reddit-after-the-launch-of-the-new-Digg', '', 'Why did the latest version of Digg fail?', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (301, NULL, 'Quora', 'http://www.quora.com/What-is-the-business-model-of-Zemanta', '', 'What is the business model of Zemanta?', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (302, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/playwho', '', 'Playwho', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (303, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/yeay-me', '', 'yeay.me', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (304, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/convore', '', 'Convore', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (305, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/kippt_a_bookmarking_app_to_watch.php', '', 'Kippt: A Bookmarking App to Watch', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (306, NULL, 'Hacker News', 'http://news.ycombinator.com/item?id=3155117', '', 'Kippt', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (307, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/new_delicious_is_a_bitter_dissapointment.php', '', 'New Delicious is a Bitter Disappointment', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (308, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/pearltrees', '', 'Pearltrees', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (309, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/11/pearltrees-brings-visual-content-curation-and-discovery-platform-to-the-ipad/', '', 'Pearltrees Brings Visual Content Curation and Discovery Platform to the iPad', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (310, NULL, 'TechCrunch', 'http://techcrunch.com/2010/12/06/pearltrees/', '', 'Pearltrees Dives Into Social Curating With Pearltrees Team', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (311, NULL, 'Quora', 'http://www.quora.com/How-many-users-does-Pearltree-have', '', 'How many users does Pearltree have?', NULL, '', '2011-12-27 19:30:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (312, NULL, 'CNet', 'http://news.cnet.com/8301-17939_109-10264774-2.html', '', 'Decision maker Hunch.com opens up', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (313, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/28/viralheat-grabs-4-25-million-for-affordable-social-media-tracking-and-intelligence/', '', '', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (314, NULL, 'TechCrunch', 'http://techcrunch.com/2011/03/31/social-media-monitoring-company-visible-technologies-lands-6-million/', '', 'Social Media Monitoring Company Visible Technologies Lands $6 Million', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (315, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/visibletechnologies', '', 'Visible Technologies', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (316, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/collective-intellect', '', 'Collective Intellect', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (317, NULL, 'TechCrunch', 'http://techcrunch.com/2008/04/15/more-money-for-collective-intellect-to-keep-fingers-on-pulse-of-internet/', '', 'More Money for Collective Intellect to Keep Fingers on Pulse of Internet', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (318, NULL, 'TechCrunch', 'http://techcrunch.com/2010/01/13/visible-technologies-raises-a-whopping-22-million-for-social-media-monitoring-software/', '', 'Visible Technologies Raises A Whopping $22 Million for Social Media Monitoring Software', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (320, NULL, 'TechCrunch', 'http://techcrunch.com/2010/07/06/marketwire-acquires-social-media-monitoring-and-analytics-startup-sysomos/', '', 'Marketwire Acquires Social Media Monitoring And Analytics Startup Sysomos', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (322, NULL, 'AllThingsD', 'http://allthingsd.com/20110814/facebook-pal-buddy-media-raises-54-million/', '', 'Facebook Pal Buddy Media Raises $54 Million', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (323, NULL, '', 'http://www.betabeat.com/2011/05/12/spinback-poised-to-close-series-a-when-buddy-media-snapped-them-up/', '', 'Spinback Poised to Close Series A When Buddy Media Snapped Them Up', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (324, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/07/comscore-and-buddy-media-team-up-to-offer-in-depth-social-media-analytics-to-brands/', '', 'comScore And Buddy Media Team Up To Offer In-Depth Social Media Analytics To Brands', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (325, NULL, 'TechCrunch', 'http://techcrunch.com/2011/09/15/sec-watch-social-media-dashboard-hootsuite-raises-3-million/', '', 'SEC Watch: Social Media Dashboard HootSuite Raises $3 Million', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (326, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/peoplebrowsr', '', 'PeopleBrowsr', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (327, NULL, 'TechCrunch', 'http://techcrunch.com/2009/05/27/peoplebrowsr-tosses-its-hat-in-the-twitterfacebook-desktop-client-ring/', '', 'PeopleBrowsr Tosses Its Hat In The Twitter/Facebook Desktop Client Ring', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (328, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/peoplebrowsr_launches_beta.php', '', 'PeopleBrowsr Launches Beta', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (329, NULL, 'Twitter', 'https://twitter.com/#!/timoreilly/statuses/1028198433', '', 'Tim O''Reilly', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (330, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/thoora', '', 'Thoora', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (331, NULL, 'TechCrunch', 'http://techcrunch.com/2011/09/22/thoora-releases-intelligent-content-discovery-engine-to-the-public/', '', 'Thoora Releases Intelligent Content Discovery Engine to The Public', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (332, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/lithiumtechnologies', '', 'Lithium', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (333, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/thisnext', '', 'ThisNext', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (334, NULL, 'TechCrunch', 'http://techcrunch.com/2010/02/01/thisnext-stylehive-curatemedia/', '', 'Social Shopping Site ThisNext Confirms Funding, Acquires Stylehive', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (335, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/topsy', '', 'Topsy', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (336, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/13/topsy-launches-realtime-search-engine-for-mobile-devices/', '', 'Topsy Launches Realtime Search Engine For Mobile Devices', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (337, NULL, 'TechCrunch', 'http://techcrunch.com/2011/03/10/realtime-search-platform-topsy-raises-15-million/', '', 'Realtime Search Platform Topsy Raises $15 Million', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (338, NULL, 'TechCrunch', 'http://techcrunch.com/2010/10/21/the-realtime-switch-oneriot-transitions-search-partners-to-topsy/', '', 'The Realtime Switch: OneRiot Transitions Search Partners to Topsy', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (339, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/cellixis', '', 'Clever Sense', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (340, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/13/google-acquires-clever-sense-creator-of-local-recommendations-app-alfred/', '', 'Google Acquires Clever Sense, Creator Of Local Recommendations App Alfred', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (341, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/aiderss', '', 'PostRank', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (342, NULL, 'TechCrunch', 'http://techcrunch.com/2010/05/28/postrank-creates-a-friendfeed-for-content-with-activity-streams-feature/', '', 'PostRank Creates A "FriendFeed for Content" With Activity Streams Feature', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (343, NULL, 'AllThingsD', 'http://allthingsd.com/20110603/google-buys-social-analytics-company-postrank/', '', 'Google Buys Social Analytics Company PostRank', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (344, NULL, 'TechCrunch', 'http://techcrunch.com/2008/07/10/a-filter-for-your-feeds-aiderss-turns-postrank-into-an-api-and-google-reader-extension/#ixzz0pFaAvlAy', '', 'A Filter For Your Feeds. AideRSS Turns PostRank Into An API and Google Reader Extension', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (345, NULL, 'CrunchBase', 'http://crunchbase.com/company/surf-canyon', '', 'Surf Canyon', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (346, NULL, 'TechCrunch', 'http://techcrunch.com/2010/10/11/surf-canyon-adds-fully-dynamic-instant-search/', '', 'Surf Canyon Adds "Fully Dynamic" Instant Search', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (347, NULL, 'CNet', 'http://news.cnet.com/8301-10784_3-9873229-7.html', '', 'Surf Canyon targets relevant results via browser extension', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (348, NULL, 'AllThingsD', 'http://allthingsd.com/20111011/topsy-says-its-google-search-is-better-than-googles/', '', 'Topsy Says its Google+ Search Is Better Than Google''s', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (349, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/11/topsy-launches-realtime-search-engine-for-public-google-posts/', '', 'Topsy Launches Realtime Search Engine For Public Google+ Posts', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (350, NULL, '', 'http://searchengineland.com/new-topsy-index-leverages-influence-relevance-for-google-search-96439', '', 'New Topsy Index Leverages Influence & Relevance For Google+ Search', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (351, NULL, 'GigaOM', 'http://gigaom.com/2010/08/24/topsy-wants-to-redesign-search-starting-with-twitter/', '', 'Topsy Wants to Redesign Search, Starting with Twitter', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (352, NULL, 'Time', 'http://venturebeat.com/2009/11/03/share-button-madness-real-time-startup-topsy-launches-one-of-its-own/', '', 'Share button madness: Real-time search startup Topsy launces one of its own', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (353, NULL, 'Time', 'http://www.forbes.com/sites/tomiogeron/2011/10/11/topsy-adds-google-plus-to-real-time-search-index/', '', 'Topsy Adds Google Plus To Real Time Search Index', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (354, NULL, 'CNet', 'http://news.cnet.com/8301-27076_3-20016387-248.html', '', 'Trailmeme creates retraceable, social Web history', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (355, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/memex_xerox_trailmeme.php', '', 'What is The Memex? Xerox Presents Trailmeme', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (356, NULL, 'CrunchBase', 'http://crunchbase.com/company/blekko', '', 'blekko', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (357, NULL, 'Venture Beat', 'http://venturebeat.com/2011/09/30/blekko-30-million-round/', '', 'Search startup Blekko closes $30M funding round', NULL, '', '2011-12-27 19:30:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (358, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/29/blekko-partners-with-foodily-on-recipe-search/', '', 'Blekko Partners With Foodily On Recipe Search', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (359, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/21/slash-through-spam-with-blekkos-zorro-update/', '', 'Slash Through the Spam With Blekko''s Zorro Update!', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (360, NULL, '', 'http://searchengineland.com/oh-good-grep-web-grepper-a-new-web-intelligence-feature-from-blekko-92730', '', 'Oh Good Grep!', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (361, NULL, 'CrunchBase', 'http://crunchbase.com/company/horizobu', '', 'horizobu', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (362, NULL, 'Quora', 'http://www.quora.com/How-many-users-does-Diigo-have', '', 'How many users does Diigo have?', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (363, NULL, 'CrunchBase', 'http://crunchbase.com/company/diigo', '', 'Diigo', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (364, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/storify', '', 'Storify', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (365, NULL, 'TechCrunch', 'http://techcrunch.com/2011/02/03/storify-raises-2m-from-khosla-ventures-to-blend-social-media-with-storytelling/', '', 'Storify Raises $2M From Khosla Ventures To Blend Social Media With Storytelling', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (406, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/21/roost-social-media/', '', 'Roost Reinvents Itself As A Super-Easy Social Media Manager For Local Businesses', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (366, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/storify_makes_its_move_a_social_web_news_site_star.php', '', 'Storify Makes Its Move: A Social Web News Site Starring You', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (367, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/directed-edge', '', 'DirectedEdge', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (368, NULL, 'TechCrunch', 'http://techcrunch.com/2009/08/06/yc-funded-directed-edge-sees-a-post-search-web-where-recommendations-rule/', '', 'YC-Funded Directed Edge Sees A Post-Search Web Where Recommendations Rule', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (369, NULL, 'TechCrunch', 'http://techcrunch.com/2010/11/04/vibrant-media-ipo/', '', 'Vibrant Media May Be Annoying, But It''s A Money-Printing IPO Candidate', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (370, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/vibrantmedia', '', 'Vibrant Media', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (371, NULL, '', 'http://www.vibrantmedia.com/press/press_releases/Contextual_Ad_Leader_Vibrant_Grows_Global_Uniques_to_200_Million.asp', '', 'Contextual Ad Leader Vibrant Grows Global Uniques to 200 Million', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (372, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/14/flipboard-adds-1-million-users-its-first-week-on-the-iphone/', '', 'Flipboard Adds 1 Million Users Its First Week On The iPhone', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (373, NULL, 'Quora', 'http://www.quora.com/What-makes-Flipboard-so-special', '', 'What makes Flipboard so special?', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (374, NULL, 'Quora', 'http://www.quora.com/Flipboard/What-is-Flipboards-revenue-model', '', 'What is Flipboard''s revenue model?', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (375, NULL, 'TechCrunch', 'http://techcrunch.com/2011/02/01/news-me/', '', 'Exclusive: An Early Look At News.me', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (376, NULL, 'GigaOM', 'http://gigaom.com/2011/09/15/news-me-finally-gets-its-wings-but-can-it-fly/', '', 'News.me finally gets its wings -- but can it fly?', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (377, NULL, 'TechCrunch', 'http://techcrunch.com/2011/11/06/rise-pinterest-shift-search-discovery/', '', 'The Rise of Pinterest And The Shift From Search To Discoery', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (378, NULL, 'GigaOM', 'http://gigaom.com/2011/03/30/salesforce-buys-radian6-to-make-companies-more-social/', '', 'Salesforce Buys Radian6 to Make Companies More Social', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (379, NULL, 'Fast Company', 'http://www.fastcompany.com/1783354/foresight-is-2020-predictive-analytics-comes-of-age', '', 'Foresight Is 20/20: Predictive Analytics and The Business of Certainty', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (380, NULL, 'TheNextWeb', 'http://thenextweb.com/media/2011/12/10/how-visual-revenue-plans-to-enable-data-driven-decisions-in-every-newsroom/', '', 'How Visual Revenue plans to enable data-drive decisions in every newsroom', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (381, NULL, 'TechCrunch', 'http://techcrunch.com/2011/07/28/nea-and-sequoia-put-18m-in-brand-focused-social-media-platform-hearsay-social/', '', 'NEA and Sequoia Put $18M In Brand-Focused Social Media Platform Hearsay Social', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (382, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/hearsay-social', '', 'Hearsay Social', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (383, NULL, '', 'http://www.computerworld.com/s/article/9194358/Q_A_Blekko_execs_explain_their_search_engine_strategy', '', 'Q&A: Blekko execs explain their search engine strategy', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (384, NULL, 'Ad Age', 'http://adage.com/article/digital/outbrain-adds-war-chest-huge-35-million-funding/231572/', '', 'Related-Links Provider Outbrain Expands War Chest by $35 Million', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (385, NULL, 'Ad Age', 'http://adage.com/article/digital/conde-nast-usa-today-boston-globe-outbrain-traffic/146764/', '', 'Outbrain Gives Web Publishers a New Way to Buy Traffic', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (386, NULL, 'AllThingsD', 'http://allthingsd.com/20111214/content-recommendation-doesnt-come-cheap-outbrain-raises-another-35-million/', '', 'Content (Recommendation) Doesn''t Come Cheap: Outbrain Raises Another $35 Million', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (387, NULL, '', 'http://www.betabeat.com/2011/12/14/outbrain-cashes-in-with-35-m-round-led-by-index-ventures/', '', 'Outbrain Cashes In With $3.5M. Round Led By Index Ventures', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (388, NULL, 'Fast Company', 'http://www.fastcompany.com/1801084/how-outbrain-is-upending-the-content-recommendation-game', '', 'Outbrain''s Content Recommending Ways Seduce Readers To Stick Around', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (389, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/16/getcloth-lets-you-store-your-outfits-in-your-phone/', '', 'Cloth Lets You Store Your "Outfits" In Your "Phone"', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (390, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/16/curate-your-own-digital-magazine-with-scoop-it-for-iphone/', '', 'Cureate Your Own Digital Magazine With Scoop.it For iPhone', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (391, NULL, '', 'http://online.wsj.com/article_email/SB10001424052970204319004577084683789747206-lMyQjAxMTAxMDAwNzEwNDcyWj.html', '', 'Big Price for Flash-Sale Site', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (392, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/fab-com', '', 'Fab', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (393, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/07/design-focused-flash-sales-site-fab-com-raises-40m-from-andreessen-horowitz-ashton-kutcher/', '', 'Design-Focused Flash Sales Site Fab.com Raises $40M From Andreesen Horowitz, Ashton Kutcher', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (394, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/11/fab-com-is-growing-like-crazy-debuts-android-and-ios-apps/', '', 'Fab.com Is Growing Like Crazy, Debuts Android And iOS Apps', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (395, NULL, 'TechCrunch', 'http://techcrunch.com/2011/07/26/fab-com-hits-350000-members-raises-8-million-to-celebrate/', '', 'Design Sales Site Fab.com Hits 350,000 Members, Raises $8M To Celebrate', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (396, NULL, 'TechCrunch', 'http://techcrunch.com/2011/07/11/fab-com-claims-to-be-profitable-on-1-3m-in-revenue-after-30-days-raises-1m/', '', 'Fab.com Claims To Be Profitable On $1.3M In Revenue After 30 Days, Raises $1M', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (397, NULL, 'TechCrunch', 'http://techcrunch.com/2011/11/14/fab-com-hits-a-million-users-is-raising-many-millions-of-dollars/', '', 'Fab Hits A Million Users, Is Raising Many Millions of Dollars', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (398, NULL, '', 'http://betashop.com/post/14249821547/behind-the-scenes-how-fab-raised-40-million-with-a', '', 'Behind the Scenes: How Fab Raised $40 million with a lot of data and not much pain', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (399, NULL, '', 'http://www.betabeat.com/2011/12/07/master-pivoter-fab-com-lands-a-200m-valuation-for-flash-sales-on-design-items/', '', 'Master Pivoter Fab.com Lands a $200M. Valuation for Flash Sales on Design Items', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (400, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/16/now-at-1-4m-members-fab-com-turns-up-the-social-with-a-live-feed/', '', 'Now At 1.4M Members, Fab.com Turns Up The Social With A ''Live Feed''', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (401, NULL, 'Quora', 'http://www.quora.com/Why-does-Pinterest-appeal-to-women-so-well', '', 'Why does Pinterest appeal to women so well?', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (402, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/canvas-networks', '', 'Canvas', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (403, NULL, 'CNet', 'http://news.cnet.com/8301-17939_109-20005066-2.html', '', 'God help us all, here comes 4chan 2', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (404, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/13/union-square-ventures-leads-3m-round-in-4chan-founder-moots-new-startup-canvas/', '', 'Union Square Ventures Leads $3M Round In 4chan Founder Moot''s New Startup Canvas', NULL, '', '2011-12-27 19:30:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (405, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/roost', '', 'Roost', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (407, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/vertical-response', '', 'VerticalResponse', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (408, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/15/verticalresponse-buys-social-media-marketing-technology-startup-roost/', '', 'VerticalResponse Buys Social Media Marketing Technology Startup Roost', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (409, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/punchfork', '', 'Punchfork', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (410, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/15/punchfork-tells-foodies-which-recipes-are-hot-right-now/', '', 'Punchfork Tells Foodies Which Recipes Are Hot Right Now', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (411, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/15/smart-magazine-m6sense/', '', 'Smart Magazine is my6sense''s Flipboard With Digital Intuition', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (412, NULL, 'CrunchBase', 'http://www.crunchbase.com/product/oink', '', 'Oink', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (413, NULL, 'TechCrunch', 'http://techcrunch.com/2011/04/26/milk-completes-1-5-million-angel-round-packed-with-valley-names/', '', 'Milk Completes $1.5 Million Angel Round, Packed With Valley Names', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (414, NULL, 'TechCrunch', 'http://techcrunch.com/2011/11/07/google-ventures-takes-a-sip-of-milk-invests-in-kevin-roses-new-startup/', '', 'Google Ventures Takes a Sip of Milk, Invests In Kevin Rose''s New Startup', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (415, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/21/milks-first-project-revealed-oink-a-mobile-app-to-vote-rank-and-share/', '', 'Milk''s First Project Revealed: Oink, A Mobile App To Vote, Rank, and Share', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (416, NULL, 'AllThingsD', 'http://allthingsd.com/20111209/zite-jumps-to-the-small-screen-too/?refcat=social', '', 'Zite Jumps to the Small Screen, Too', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (417, NULL, 'AllThingsD', 'http://allthingsd.com/20111215/foursquares-crowley-declares-bygones-and-maybe-more-with-google/?refcat=media', '', 'Foursquare''s Crowley Declares Bygones! -- And Maybe More? -- With Google', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (418, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/stamped', '', 'Stamped', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (419, NULL, 'Venture Beat', 'http://venturebeat.com/2011/11/21/stamped-google-ventures/', '', 'Ex-Googlers launch recommendation engine Stamped, with help from Google Ventures', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (420, NULL, 'GigaOM', 'http://gigaom.com/2011/11/21/stamped-recommendation-app/', '', 'Can a new wave of apps kill the 5-star rating system?', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (421, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/13/jotly-lives-parody-app-goes-live-in-itunes/', '', 'Jotly Lives! Parody App Goes Live In iTunes', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (422, NULL, '', 'http://gizmodo.com/5867417/jotly-for-ios-rate-everything', '', 'Jotly for iPhone: Rate EVERYTHING', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (423, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/wikets', '', 'Wikets', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (424, NULL, 'TechCrunch', 'http://techcrunch.com/2011/11/08/wikets-the-social-commerce-app-with-1-5m-in-funding-rewards-users-for-recommendations/', '', 'Wikets, The Social Commerce App With $1.5M In Funding, Rewards Users For Recommendations', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (425, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/quora', '', 'Quora', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (426, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/19/quora-expands-beyond-qa-launches-boards-a-way-to-personally-curate-information/', '', 'Quora Expands Beyond Q&A, Launches ''Boards'' -- A Way To Personally Curate Information', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (427, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/19/bestvendor-raises-3m-for-work-app-recommendation-platform/', '', 'BestVendor Raises $3M For Work App Recommendation Platform', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (428, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/21/peter-thiel-lerer-ventures-and-others-put-600k-in-bestvendor/', '', 'Peter Thiel, Lerer Ventures And Others Put $600K In BestVendor', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (429, NULL, '', 'http://blogs.reuters.com/felix-salmon/2011/12/14/the-value-of-finding-content-to-link-to/', '', 'The value of finding content to link to', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (430, NULL, 'AllThingsD', 'http://allthingsd.com/20111219/quora-moves-beyond-writing-to-curating/', '', 'Quora Moves Beyond Writing to Curatin', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (431, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/extractiv_launches_semantics_as_a_service_platform.php', '', 'Extractiv Launches "Semantics as a Service" Platform', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (432, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/saplo', '', 'Saplo', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (433, NULL, 'TechCrunch', 'http://techcrunch.com/2010/05/27/saplo-raises-500k-for-semantic-text-analysis-technology/', '', 'Saplo Raises $500K For Semantic Analysis Technology', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (434, NULL, 'Venture Beat', 'http://venturebeat.com/2010/12/09/saplo-api-analyses-text-developers/', '', 'Saplo''s API reads text so you don''t have to', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (435, NULL, '', 'http://blog.programmableweb.com/2011/06/01/saplos-swedish-semantics-suite-sets-the-bar-higher/', '', 'Saplo''s Swedish Semantics Suite Sets the Bar Higher', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (436, NULL, 'TechCrunch', 'http://techcrunch.com/2009/03/18/the-financial-times-launches-its-own-business-news-search-engine-newssift/', '', 'The Financial Times Launches Its Own Business News Search Engine', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (437, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/lexalytics', '', 'Lexalytics', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (438, NULL, 'TheNextWeb', 'http://thenextweb.com/insider/2011/05/17/an-interview-with-lexalytics-understanding-text-analytics-technology/', '', 'An Interview with Lexalytics: Understanding the text analytics technology', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (440, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/18/oracle-buys-enterprise-search-and-data-management-company-endeca/', '', 'Oracle Buys Enterprise Search And Data Management Company Endeca', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (441, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/qwiki', '', 'Qwiki', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (442, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/21/qwiki-moves-headquarters-to-nyc-preps-big-update-for-2012/', '', 'Qwiki Moves Headquarters To NYC, Preps Big Update For 2012', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (443, NULL, 'PC Magazine', 'http://www.pcmag.com/article2/0,2817,2376178,00.asp', '', 'Qwiki, Search Engine Funded By Facebook Co-Founder, Launches', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (444, NULL, 'TheNextWeb', 'http://thenextweb.com/apps/2011/02/04/piccsy-stunning-image-bookmarking-and-discovery-invites/', '', 'Piccsy: Stunning Image Bookmarking and Discovery', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (445, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/chomp', '', 'Chomp', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (446, NULL, 'TechCrunch', 'http://techcrunch.com/2011/09/27/oh-hey-google-chomp-launches-its-own-adwords-for-app-search-brings-realtime-search-to-iphone/', '', 'Oh, Hey Google: Chomp Launches Its Own AdWords For App Search; Brings Realtime Search to iPhone', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (447, NULL, 'TechCrunch', 'http://techcrunch.com/2011/09/13/chomp-to-begin-powering-app-search-for-android-phones-via-verizon-apps/', '', 'Chomp To Begin Powerin gApp Search For Android Phones Via Verizon Apps', NULL, '', '2011-12-27 19:30:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (448, NULL, 'TechCrunch', 'http://techcrunch.com/2011/06/15/yahoo-mobile-app-search/', '', 'Yahoo Tries Its Hand At Mobile App Search', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (449, NULL, 'TechCrunch', 'http://techcrunch.com/2011/05/23/do-search-mobile-apps/', '', 'Do@ Bridges The Divide Between Search and Mobile Apps', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (450, NULL, 'Venture Beat', 'http://venturebeat.com/2011/09/27/chomp-iphone-redesign/', '', 'Chomp gets a stunning iPhone redesign to help you find more apps', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (451, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/mobile/2011/09/new-chomp-search-ads-wants-to.php', '', 'New Chomp Search Ads Wants To Be the Google for App Stores', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (452, NULL, 'AllThingsD', 'http://allthingsd.com/20110913/verizon-hopes-customers-will-chomp-down-more-apps-with-revamped-app-store/', '', 'Verizon Hopes Customers Will Chomp Down More Apps With Revamped App Store', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (453, NULL, 'GigaOM', 'http://gigaom.com/2011/09/13/verizon-remakes-its-app-store-with-chomps-search-help/', '', 'Verizon remakes its app store with Chomp''s search help', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (454, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/appolicious', '', 'Appolicious', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (455, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/14/samsung-adds-an-appolicious-powered-social-mobile-app-directory-to-galaxy-tab-devices/', '', 'Samsung Adds An Appolicious-Powered Social Mobile App Directory To Galaxy Tab Devices', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (456, NULL, 'TechCrunch', 'http://techcrunch.com/2011/10/20/best-buy-launches-appolicious-powered-curated-mobile-app-directory/', '', 'Best Buy Launches Appoloicious-Powered, Curated Mobile App Directory', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (457, NULL, 'TechCrunch', 'http://techcrunch.com/2010/08/23/mobile-app-directory-appolicious-deepens-integration-with-yahoo-launches-android-app/', '', 'Mobile App Directory Appolicious Deepens Integration With Yahoo; Launches Android App', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (458, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/better_than_the_market_androidappscom_does_recommendations.php', '', 'Better than the Market?  AndroidApps.com Does Recommendations', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (459, NULL, 'AllThingsD', 'http://allthingsd.com/20100421/appolicious-signs-partnership-to-integrate-with-yahoo/', '', 'Appolicious Signs Partnershp to Integrate with Yahoo', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (460, NULL, 'TechCrunch', 'http://techcrunch.com/2010/03/05/mobile-app-directory-appolicious-rolls-out-facebook-app-url-shortener-and-more/', '', 'Mobile App Directory Appolicious Rolls Out Facebook App, URL Shortener and More', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (461, NULL, 'TechCrunch', 'http://techcrunch.com/2010/02/02/mobile-app-directories-consolidate-appolicious-acquires-appvee/', '', 'Mobile App Directories Consolidate: Appolicious Acquires�AppVee', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (462, NULL, 'Quora', 'http://www.quora.com/Do-services-such-as-Chomp-and-GetJar-really-drive-a-sizable-number-of-users-to-iPhone-apps-Does-anybody-have-any-stats-or-experiences-with-using-these-services', '', 'Do services such as Chomp and GetJar really drive a sizable number of users to iPhone apps?', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (463, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/appgrooves', '', 'AppGrooves', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (464, NULL, 'TechCrunch', 'http://techcrunch.com/2011/08/04/appgrooves-app-recommendation-engine-combines-social-with-hot-or-not-feature/', '', 'AppGrooves', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (465, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/appsfire', '', 'Appsfire', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (466, NULL, 'TheNextWeb', 'http://thenextweb.com/apps/2010/08/26/appsfire-the-app-recommendation-engine-gets-truly-social-with-facebook-connect/', '', 'Appsfire, the app recommendation engine, gets truly social with Facebook Connect', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (467, NULL, 'Quora', 'http://www.quora.com/Is-there-a-website-social-network-where-iPhone-iPad-users-can-share-their-app-installations', '', 'Is there a website/social network where iPhone & iPad users can share their app installations?', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (468, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/doat', '', 'Do@', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (469, NULL, 'Venture Beat', 'http://venturebeat.com/2011/05/23/doat-mobile-search/', '', 'Do@ may be the last mobile search app you need', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (470, NULL, 'AllThingsD', 'http://allthingsd.com/20110523/do-shortcuts-mobile-search-with-new-iphone-app-raises-7m/', '', 'Do@ Shortcuts Mobile Search With New iPhone App, Raises $7M', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (471, NULL, 'CNet', 'http://reviews.cnet.com/8301-19512_7-20064144-233.html', '', 'Do@ iPhone search app delivers live Web sites, not links', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (472, NULL, 'TechCrunch', 'http://techcrunch.com/2011/09/22/bitsmedia-founder-puts-frenzapp-apps-up-for-sale/', '', 'Bitsmedia Founder Puts Frenzapp Apps Up For Sale', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (473, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/zwapp', '', 'Zwapp', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (474, NULL, 'GigaOM', 'http://gigaom.com/2011/06/09/zwapp-builds-a-social-network-for-app-discovery/', '', 'Zwapp builds a social network for app discovery', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (475, NULL, 'CrunchBase', 'http://www.crunchbase.com/product/appsaurus', '', 'Appsaurus', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (476, NULL, 'TechCrunch', 'http://techcrunch.com/2010/05/26/mobile-app-directory-hello-chair-raises-850k-from-mitch-kapor-chris-sacca-and-others/', '', 'Mobile App Recommender Appsaurus Raises $850K From Mitch kapor, Chris Sacca and Others', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (477, NULL, 'TheNextWeb', 'http://thenextweb.com/apps/2011/03/11/the-founder-of-explor-a-new-app-discovery-app-picks-his-top-5-apps/', '', 'The Founder of Explor, a new "app discovery app" picks his top 5 apps', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (478, NULL, 'TechCrunch', 'http://techcrunch.com/2011/03/08/explor-app/', '', 'Explor, Touch-Based App Discovery To Get Around The App Wall', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (479, NULL, 'ReadWriteWeb', 'http://www.readwriteweb.com/archives/stumbleupon_helps_android_users_discover_new_apps.php', '', 'StumbleUpon Helps Android users Discover New Apps', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (480, NULL, 'GigaOM', 'http://gigaom.com/2011/10/27/appsfire-taps-siri-for-voice-activated-app-discovery/', '', 'Appsfire taps Siri for voice-activated app discovery', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (481, NULL, 'CrunchBase', 'http://www.crunchbase.com/company/quixey', '', 'Quixey', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (482, NULL, 'TechCrunch', 'http://techcrunch.com/2011/08/28/quixey-raises-3-8-million-for-a-functional-search-engine-for-apps/', '', 'Quixey Raises $3.8 Million For A Functional Search Engine For Apps', NULL, '', '2011-12-27 19:30:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (483, NULL, 'TechCrunch', 'http://techcrunch.com/2010/08/23/chomp-app-search/', '', 'Chomp Sinks Its Teeth Deeper Into Search', NULL, '', '2011-12-27 22:38:00-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (484, NULL, 'Quora', 'http://www.quora.com/What-are-the-best-case-studies-of-virality-in-early-stage-products?q=What+are+the+most+informative+studies+of+what+makes+a+product+viral%3F', '', 'What are the best case studies of virality in early stage products?', NULL, 'Great breakdown:

- Guns
- Drugs
- AIDs
- Religion
- Smoking

On the one hand, these all sound the same, but on the other hand, the examples for each of these categories kind of make sense.', '2011-12-29 12:55:42-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (485, NULL, 'TechCrunch', 'http://techcrunch.com/2012/01/03/parse-ly-will-launch-its-pageview-generating-machine-called-dash-this-month/', '', 'Parse.ly Will Launch Its Pageview-Generating Machine Called “Dash” This Month', NULL, 'Interesting approach similar to Visual Revenue -- helps publishers understand what content is the most popular as well as what will be the most popular. 

Current customers:

The Atlantic
Apartment Therapy
The Press-Enterprise
U.S. News & World Report
The Daily Dot.

Seems to have a pretty simplistic interface.', '2012-01-03 13:49:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (486, NULL, 'TechCrunch', 'http://techcrunch.com/2011/09/08/twitter-has-100m-monthly-active-users-and-40-of-active-users-dont-tweet/', '', 'Twitter Has 100M Monthly Active Users, And 40% Of Active Users Don’t Tweet', NULL, '"Active users" metric may not be the most useful since users who are just logging in and reading other activity streams are still participating somehow.', '2012-01-03 14:03:45-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (487, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/30/twittertumblrpinterest/', '', 'A New Era For Social Interest Sites: Twitter, Tumblr And Pinterest Go Big In 2011', NULL, 'All of the big players in the social network scene (Facebook, Tumblr, Twitter, and Pinterest) are growing -- only MySpace is still losing ground.', '2012-01-03 14:16:55-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (488, NULL, 'AllThingsD', 'http://allthingsd.com/20120103/klout-confirms-mega-funding-round/', '', 'Klout Confirms Mega Funding Round', NULL, 'Klout got another big round of funding, led by KPCB, with a valuation of around $200M.  Chi-Hua Chien joined the board (Gordon Bing is already on the Klout board).', '2012-01-03 14:25:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (489, NULL, 'TechCrunch', 'http://techcrunch.com/2011/12/21/comscoresocial2011/', '', 'ComScore’s 2011 Social Report: Facebook Leading, Microblogging Growing, World Connecting', NULL, 'Based on comScore''s 2011 social networking report, massive increase across the Internet-using population in social networking usage.  Facebook is still the lion, but microblogging growing in use as well.

"There’s more and more people who want to share around interests, not just the close social relationships."

Some other key points:

-- women lead men in engagement
-- mobile is key
-- email use declining', '2012-01-03 14:34:14-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (490, NULL, 'AllThingsD', 'http://allthingsd.com/20120103/the-social-network-of-two-ourspot-gives-relationships-a-space-for-sharing/?refcat=news', '', 'The Social Network of Two: Ourspot Gives Relationships a Space for Sharing', NULL, 'Talks about possible space for private link / content-sharing, even more limited than Path.', '2012-01-03 14:43:01-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (491, NULL, 'Elad Blog', 'http://blog.eladgil.com/2011/12/how-pinterest-will-transform-web-in.html', '', 'How Pinterest Will Transform the Web in 2012: Social Content Curation As The Next Big Thing', NULL, 'Lots of good material here about how social curation has evolved from blogs to status messages to "push button" to structured sets like Pinterest.  One of the interesting things about this is how structured sets are not readily consumable in a Facebook-style news feed.', '2012-01-04 15:25:50-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (492, NULL, 'GigaOM', 'http://gigaom.com/2012/01/05/lithium-funding/', '', 'Lithium Technologies raises $53.4 million from NEA & SAP Ventures', NULL, '<p>
	&quot;t<span style="color: rgb(0, 0, 0); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 15px; line-height: 24px; ">he company differentiates itself with a platform for brands primarily focused on letting users do the marketing for them.&quot;</span></p>
', '2012-01-05 12:45:07-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (493, NULL, 'GigaOM', 'http://gigaom.com/2012/01/04/you-are-what-you-curate-why-pinterest-is-hawt/', '', 'You are what you curate: why Pinterest is hawt', NULL, '<p>
	&quot;<span style="color: rgb(0, 0, 0); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 15px; line-height: 24px; ">The way I see it, Pinterest is yet another example of basic human behavior&rsquo;s being transposed on to the web. Long before the Internet, we had newsletters and diaries. We had real friends. We used to go meet them in person, write letters to them, check out movie theaters and go to dinner with them. We sent people birthday cards. Of course, then came the Internet and we had WordPress, Yelp, Facebook, Twitter and Foursquare.&quot;</span></p>
<p>
	&quot;<span style="color: rgb(0, 0, 0); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 15px; line-height: 24px; ">The online world is even worse: Everything looks so similar that we do need to do something to stand out. And you can do that by building a carefully curated image of yourself that you are trying to project onto the world.&quot;</span></p>
', '2012-01-05 12:55:02-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (494, NULL, 'WSJ Venture Capital Dispatch', 'http://blogs.wsj.com/venturecapital/2012/01/05/with-fresh-53m-lithium-technologies-aims-to-tame-social-media/', '', 'With Fresh $53M, Lithium Aims To Tame Social Media', NULL, '<p>
	&quot;<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 14px; line-height: 21px; text-align: left; ">The worldwide market for social CRM will reach more than $1 billion by the end of 2012, according to an August study by IT research and advisory firm Gartner Inc. While the amount is still a small portion of the total CRM spend, it does represent the fastest growing portion of the CRM spend during the past two years, also according to the same Gartner study.&quot;</span></p>
<p>
	<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 14px; line-height: 21px; text-align: left; ">&quot;Lithium has added a steady stream of customers over the past six months, including Aruba Networks, Bombardier Recreational Products, BskyB Group, SuccessFactors, IpsosN Movistar Argentina and Nestle USA Inc. These join an already beefy list of big name brands including Best Buy, Verizon Communications Skype Communications, Nissan Motor, McDonald&rsquo;s and Macy&rsquo;s that are already using Lithium.&quot;</span></p>
', '2012-01-05 13:06:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (495, NULL, 'TechCrunch', 'http://techcrunch.com/2012/01/05/lithium-raises-53-4-million-fourth-round-to-push-for-lead-in-social-brand-software/', '', 'Lithium Raises $53.4M Fourth Round To Push For Lead In Social Brand Software', NULL, '', '2012-01-05 13:59:57-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (496, NULL, 'Crunchbase', 'http://www.crunchbase.com/company/nimble-crm', '', 'Nimble', NULL, '<p>
	&nbsp;A bit of press but not in the right places</p>
', '2012-01-05 14:08:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (497, NULL, 'TechCrunch', 'http://techcrunch.com/2012/01/04/google-ventures-mark-cuban-and-others-invest-1m-in-social-crm-startup-nimble/', '', 'Google Ventures, Mark Cuban And Others Invest $1M In Social CRM Startup Nimble', NULL, '<p>
	Nimble includes social integration of contacts database</p>
', '2012-01-05 14:09:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (498, NULL, 'Venture Beat', 'http://venturebeat.com/2012/01/05/lithium-social-engagement/', '', 'With $53.4M more funding, Lithium says social will change marketing as we know it', NULL, '<p>
	&quot;<span style="color: rgb(51, 51, 51); font-family: arial, sans-serif; font-size: 13px; line-height: 18px; text-align: left; ">Lithium&rsquo;s &ldquo;engagement&rdquo; products make you feel like a &ldquo;thought leader,&rdquo; an industry expert on a certain subject. It makes you feel like people are listening. That sense of self righteousness is your ticket to social media buzz.&quot;</span></p>
', '2012-01-05 14:15:16-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (499, NULL, 'Venture Beat', 'http://venturebeat.com/2012/01/04/tumblr-fan-mail/', '', 'Tumblr releases Fan Mail for private messaging', NULL, '<p>
	Interesting that Tumblr didn&#39;t already have this.</p>
<p>
	&nbsp;</p>
<p>
	Pain over features.</p>
', '2012-01-05 14:26:53-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (500, NULL, 'TechCrunch', 'http://techcrunch.com/2012/01/06/siri-sibling-trapit-raises-6-2-million-series-a-from-horizons/', '', 'Siri Sibling Trapit Raises $6.2 Million Series A From Horizons', NULL, '<p>
	Honestly, I don&#39;t get it. &nbsp;Says here that it has 2.5 million users, but it seems to me like an overdesigned, overengineered news reader app. &nbsp;Nowhere near Pulse or Flipboard.</p>
', '2012-01-06 10:16:04-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (501, NULL, 'GigaOM', 'http://gigaom.com/2012/01/06/newsright-a-carrot-or-a-stick-to-beat-aggregators-with/', '', 'NewsRight: A carrot, or a stick to beat aggregators with?', NULL, '<p>
	AP, McClatchy and others launching a sort-of news agregation service that looks to try and control the licensing and distribution of content.</p>
', '2012-01-06 10:30:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (502, NULL, 'GigaOM', 'http://gigaom.com/2011/11/30/newscred-gets-4-million-to-reinvent-the-newswire/', '', 'NewsCred gets $4 million to reinvent the newswire', NULL, '', '2012-01-06 10:31:03-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (503, NULL, 'GigaOM', 'http://gigaom.com/2011/04/25/the-future-of-media-storify-and-the-curatorial-instinct/', '', 'The Future of Media: Storify and the Curatorial Instinct', NULL, '<p>
	Human instinct -- curation? &nbsp;Is this true? &nbsp;Maybe as it relates to self-expression...</p>
', '2012-01-06 10:54:03-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (504, NULL, 'Venture Beat', 'http://venturebeat.com/2012/01/05/facebook-actions/', '', 'Facebook about to launch Actions, the final piece of its plan for frictionless sharing', NULL, '<p>
	Interesting to consider how we might mimic or, preferably, do better than Facebook at Actions.</p>
', '2012-01-06 14:01:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (505, NULL, 'Crunchbase', 'http://www.crunchbase.com/company/newyorktimes', '', 'New York Times', NULL, '', '2012-01-06 14:13:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (506, NULL, 'Forbes', 'http://www.forbesmedia.com/files/F-Print-Accordion_Singles.pdf', '', 'Forbes', NULL, '', '2012-01-06 14:25:43-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (507, NULL, 'Crunchbase', 'http://www.crunchbase.com/company/businessweek', '', 'Bloomberg BusinessWeek', NULL, '', '2012-01-06 14:51:17-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (508, NULL, 'Quantcast', 'http://www.quantcast.com/nytimes.com', '', 'Quantcast New York Times Profile', NULL, '', '2012-01-06 14:53:46-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (509, NULL, 'Compete', 'http://siteanalytics.compete.com/nytimes.com/', '', 'Compete New York Times Profile', NULL, '', '2012-01-06 14:54:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (510, NULL, 'Compete', 'http://siteanalytics.compete.com/forbes.com/', '', 'Compete Forbes.com Profile', NULL, '', '2012-01-06 14:55:46-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (511, NULL, 'Compete', 'http://siteanalytics.compete.com/economist.com/', '', 'Compete Economist Profile', NULL, '', '2012-01-06 14:57:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (512, NULL, 'Compete', 'http://siteanalytics.compete.com/businessweek.com/', '', 'Compete Bloomberg Businessweek Profile', NULL, '', '2012-01-06 14:58:30-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (513, NULL, 'Economist Group', 'http://www.economistgroupmedia.com/planning-tools/circulation/?circ_id=2&productid=1', '', 'Economist: Circulation', NULL, '', '2012-01-06 15:04:48-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (514, NULL, 'WSJ', 'http://online.wsj.com/article/SB10001424052748704213404576100033883758352.html', '', 'New York Times Readies Pay Wall', NULL, '', '2012-01-06 15:38:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (515, NULL, 'New York Times', 'http://nytmarketing.whsites.net/mediakit/online', '', 'New York Times Media Kit', NULL, '', '2012-01-06 15:40:20-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (516, NULL, 'Mashable', 'http://mashable.com/2011/06/09/huffington-post-surpasses-new-york-times/', '', 'HuffPo Surpasses New York Times In Monthly U.S. Unique Visitors', NULL, '', '2012-01-06 15:51:45-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (517, NULL, 'comScore', 'http://www.comscore.com/Press_Events/Press_Releases/2010/6/The_New_York_Times_Ranks_as_Top_Online_Newspaper_According_to_May_2010_U.S._comScore_Media_Metrix_Data', '', 'The New York Times Ranks As Top U.S. Newspaper', NULL, '', '2012-01-06 15:57:06-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (518, NULL, 'comScore', 'http://blog.comscore.com/2011/06/comscore_releases_total_universe.html', '', 'comScore Releases Inaugural Data from Total Universe Report', NULL, '<p>
	Some really great points here about the impact of mobile usage on sites. &nbsp;They use the example of Pandora to demonstrate how large a proportion of a property&#39;s user base might come from mobile -- nearly half(?).</p>
<p>
	In addition, newspapers see a substantial part of their usage through mobile channels. &nbsp;For the New York Times -- 2.3%, but it goes as high as the Los Angeles Times -- 10%.</p>
', '2012-01-06 20:25:45-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (519, NULL, 'comScore', 'http://blog.comscore.com/2012/01/its_a_social_world.html', '', 'It’s a Social World: A Global Look at Social Networking', NULL, '<p>
	<strong>Social Networking Reach and Importance</strong></p>
<p>
	82% of the world&#39;s Internet population visited a social networking site -- nearly 1 in every 5 minutes spent online is at a social networking portal.</p>
<p>
	Nearly 1/3 of US population over 13 accessed social networking site via mobile device</p>
<p>
	<strong>Social Networking and Advertising</strong></p>
<p>
	Social networking leads in online display advertising but doesn&#39;t have the lion&#39;s share of the money.</p>
<p>
	27.7% of display ads are &quot;socially enabled&quot; but account for only 14.8% of the spend.</p>
<p>
	<strong>Regional Differences</strong></p>
<p>
	1/3 of the world&#39;s networkers are in Asia Pacific, but Latin American users spend larger share of ther time online.</p>
<p>
	<strong>User Demographics</strong></p>
<p>
	Women are more social.</p>
<p>
	&quot;Digital natives&quot; -- generation growing up communicating online, and social networking is the norm.</p>
<p>
	<strong>User Activity</strong></p>
<p>
	Most mobile activity was posting updates and reading updates of others -- interesting question as to whether mobile fuels social networking because it generates more content?</p>
<p>
	&nbsp;</p>
', '2012-01-06 20:49:42-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (520, NULL, 'comScore', 'http://blog.comscore.com/2011/12/online_pinboards_facebook.html', '', 'Online Pinboards – Is this the new way to Facebook?', NULL, '<p>
	&quot;<span style="color: rgb(51, 51, 51); font-family: Arial, Tahoma, Verdana, Helvetica, sans-serif; line-height: 15px; ">Online pinboard sites, led by Pinterest, represent your wants, desires and the future memories you wish to create.&quot;</span></p>
<p>
	The term &quot;Pinterest&quot; was searched for 2.4 million times during October 2011.</p>
<p>
	Midwesterners more likely to use the service.</p>
', '2012-01-06 20:57:15-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (521, NULL, 'comScore', 'http://www.comscore.com/Press_Events/Presentations_Whitepapers/2011/Digital_Omnivores', '', 'Digital Omnivores: How Tablets, Smartphones and Connected Devices are Changing U.S. Digital Media Consumption Habits', NULL, '<p>
	&quot;<span class="s1"><b>Nearly 3 out of 5 tablet owners consume news on their tablets. </b></span>58 percent of tablet owners consumed world, national or local news on their devices, with 1 in 4 consuming this content on a near-daily basis on their tablets.&quot;</p>
', '2012-01-06 21:27:47-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (522, NULL, 'Forbes', 'http://www.forbes.com/sites/lewisdvorkin/2011/11/21/forbes-update-our-strategy-comes-alive-on-a-new-and-exciting-mobile-site/', '', 'Forbes Update: Our Strategy Comes Alive on a New and Exciting Mobile Site', NULL, '<p>
	25 million uniques in October.</p>
', '2012-01-06 21:49:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (523, NULL, 'Forbes', 'http://www.forbes.com/selfserve/', '', 'Forbes.com Self Serve Ad Platform', NULL, '', '2012-01-06 21:53:14-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (524, NULL, 'Forbes', 'http://www.forbesinc.com/newsroom/releases/forbescom/FDCTrafficSurges012209.pdf', '', 'Forbes.com Traffic Surges in December', NULL, '', '2012-01-06 22:02:05-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (525, NULL, 'WSJ', 'http://www.wsjmediakit.com/downloads/WSJDN_Audience_Profile.pdf?120107010831', '', 'WSJ: Digital Network Audience Profile', NULL, '', '2012-01-06 22:11:33-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (526, NULL, 'Crowd Science', 'http://blog.crowdscience.com/2011/11/online-advertising-market-size-in-2011-iab-report/', '', 'Online Advertising Market Size in 2011: IAB Report', NULL, '', '2012-01-08 21:56:57-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (527, NULL, 'Crowd Science', 'http://blog.crowdscience.com/2011/07/show-me-the-stats-online-display-advertising-market-size/', '', 'Show Me The Stats: Online Display Advertising Market Size', NULL, '<p>
	&nbsp;</p>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse" width="770">
<!--StartFragment-->	<colgroup>
		<col width="193" />
		<col width="202" />
		<col width="149" />
		<col width="130" />
		<col width="96" />
	</colgroup>
	<tbody>
		<tr height="13">
			<td class="xl26" colspan="2" height="13" width="395">
				<strong>Large Company Adertising Revenue (2011) (from Crowd Science)</strong></td>
			<td class="xl27" width="149">
				&nbsp;</td>
			<td class="xl27" width="130">
				&nbsp;</td>
			<td class="xl27" width="96">
				&nbsp;</td>
		</tr>
		<tr height="13">
			<td class="xl24" height="13">
				Company</td>
			<td class="xl24">
				Revenue</td>
			<td class="xl24">
				Percent of Market</td>
			<td class="xl24">
				Ad Impressions</td>
			<td class="xl24">
				Market Share</td>
		</tr>
		<tr height="13">
			<td height="13">
				Facebook</td>
			<td align="right" class="xl31" x:num="2.2E9">
				$2,200,000,000</td>
			<td align="right" class="xl28" x:num="0.177">
				17.70%</td>
			<td align="right" class="xl29" x:num="3.46E11">
				346,000,000,000</td>
			<td align="right" class="xl30" x:num="0.312">
				31.20%</td>
		</tr>
		<tr height="13">
			<td height="13">
				Yahoo</td>
			<td align="right" class="xl31" x:num="1.6E9">
				$1,600,000,000</td>
			<td align="right" class="xl28" x:num="0.131">
				13.10%</td>
			<td align="right" class="xl29" x:num="1.12E11">
				112,000,000,000</td>
			<td align="right" class="xl30" x:num="0.101">
				10.10%</td>
		</tr>
		<tr height="13">
			<td height="13">
				Google</td>
			<td align="right" class="xl31" x:num="1.5E9">
				$1,500,000,000</td>
			<td align="right" class="xl28" x:num="0.093">
				9.30%</td>
			<td align="right" class="xl25" x:num="2.7E10">
				27,000,000,000</td>
			<td align="right" class="xl30" x:num="0.024">
				2.40%</td>
		</tr>
		<tr height="13">
			<td height="13">
				Microsoft</td>
			<td align="right" class="xl31" x:num="6.0E8">
				$600,000,000</td>
			<td align="right" class="xl28" x:num="0.049">
				4.90%</td>
			<td align="right" class="xl29" x:num="5.3E10">
				53,000,000,000</td>
			<td align="right" class="xl30" x:num="0.048">
				4.80%</td>
		</tr>
		<tr height="13">
			<td height="13">
				AOL</td>
			<td align="right" class="xl31" x:num="5.2E8">
				$520,000,000</td>
			<td align="right" class="xl28" x:num="0.042">
				4.20%</td>
			<td align="right" class="xl29" x:num="3.3E10">
				33,000,000,000</td>
			<td align="right" class="xl30" x:num="0.03">
				3.00%</td>
		</tr>
<!--EndFragment-->	</tbody>
</table>
<p>
	&nbsp;</p>
', '2012-01-08 22:40:37-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (528, NULL, 'Crowd Science', 'http://blog.crowdscience.com/2011/07/online-display-advertising-demystified/', '', 'Online Display Advertising Demystified', NULL, '', '2012-01-08 22:42:38-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (566, 'Leena Rao', 'TechCrunch', 'http://techcrunch.com/2010/03/10/mplayit-app-gurus-for-expert-recommendations/', '', 'Mobile App Directory Mplayit Adds Recommendations From App Gurus', NULL, '<p>
	Added App Gurus to curate apps</p>
', '2012-01-13 11:19:01-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (529, NULL, 'Reuters', 'http://www.reuters.com/article/2011/06/20/us-facebook-idUSTRE75J5SU20110620', '', 'Facebook to take top spot in U.S. display ad market', NULL, '<p>
	Overall display ad market grew by 24.5% 2010-2011. &nbsp;Facebook and Google (which relies primarily on text-based ads) both saw better-than-average growth; Yahoo&#39;s display ad business only grew by about 13%.</p>
<p>
	Google, which generates the vast majority of its revenue from small, often text-only ads that appear alongside its search results, is stepping up efforts to grow its display advertising business. Last week the company announced the acquisition of AdMeld, which makes it easier for Web publishers to sell display ads on their sites.&quot;</p>
', '2012-01-08 22:48:32-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (530, NULL, 'comScore', 'http://www.comscore.com/Press_Events/Press_Releases/2011/5/U.S._Online_Display_Advertising_Market_Delivers_1.1_Trillion_Impressions_in_Q1_2011', '', 'U.S. Online Display Advertising Market Delivers 1.1 Trillion Impressions in Q1 2011', NULL, '<p>
	<span style="color: rgb(51, 51, 51); font-family: Arial, Tahoma, Verdana, Helvetica, sans-serif; line-height: 16px; ">&ldquo;The U.S. online display advertising market maintained its strong momentum from last year with a terrific first quarter,&rdquo; said Jeff Hackett, comScore executive vice president. &ldquo;We are now seeing more than one trillion display ads delivered every single quarter and nearly 300 individual advertisers spending at least $1 million a quarter on display, numbers which underscore just how large and vibrant the online medium has become. And it&rsquo;s not just about the volume but about the quality of the advertising experience that can be delivered as we see continued investment in compelling, high-quality creative that helps cultivate long-term brand equity.&rdquo;</span></p>
<p>
	Are the figures from just Q1?</p>
', '2012-01-08 23:17:01-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (531, NULL, 'IAB', 'http://www.iab.net/about_the_iab/recent_press_releases/press_release_archive/press_release/pr-113011', '', 'Q3 ’11 Internet Advertising Revenues Up 22% from Year Ago, Climb to Nearly $7.9 Billion, According to IAB and PwC', NULL, '<p>
	Internet advertising revenue, Q3 2011: $7.88bil.</p>
<p>
	&nbsp;</p>
', '2012-01-08 23:21:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (532, NULL, 'comScore', 'http://www.comscore.com/Press_Events/Press_Releases/2011/11/comScore_Media_Metrix_Ranks_Top_50_U.S._Web_Properties_for_October_2011', '', 'comScore Media Metrix Ranks Top 50 U.S. Web Properties for October 2011', NULL, '', '2012-01-09 10:18:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (533, NULL, 'comScore', 'http://www.comscore.com/Press_Events/Press_Releases/2011/12/comScore_Media_Metrix_Ranks_Top_50_U.S._Web_Properties_for_November_2011', '', 'comScore Media Metrix Ranks Top 50 U.S. Web Properties for November 2011', NULL, '', '2012-01-09 10:26:40-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (534, NULL, 'comScore', 'http://www.comscore.com/Press_Events/Press_Releases/2011/10/comScore_Media_Metrix_Ranks_Top_50_U.S._Web_Properties_for_September_2011', '', 'comScore Top 50 U.S. Web Sites, Sep 2011', NULL, '', '2012-01-09 12:52:13-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (535, NULL, 'comScore', 'http://www.comscore.com/Press_Events/Press_Releases/2011/9/comScore_Media_Metrix_Ranks_Top_50_U.S._Web_Properties_for_August_2011', '', 'comScore Top 50 U.S. Web Sites, Aug 2011', NULL, '', '2012-01-09 12:46:54-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (536, '', 'WSJ', 'http://www.wsjmediakit.com/downloads/WSJDN_Audience_Profile.pdf?120109035801', '', 'WSJ Digital Network Audience Profile', NULL, '', '2012-01-09 13:12:33-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (537, '', 'Crunchbase', 'http://www.crunchbase.com/company/buzzfeed', '', 'BuzzFeed', NULL, '', '2012-01-09 13:27:10-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (538, 'Alexia Tsotsis', 'TechCrunch', 'http://techcrunch.com/2012/01/09/viral-aggregator-buzzfeed-raises-15-5m-to-transform-the-way-people-get-their-news/', '', 'Viral Aggregator BuzzFeed Raises $15.5M To Transform The Way People Get Their News', NULL, '<p>
	BuzzFeed is hiring to produce more original content.</p>
', '2012-01-09 13:28:36-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (539, 'Alexia Tsotsis', 'TechCrunch', 'http://techcrunch.com/2011/07/26/buzzfeed/', '', 'BuzzFeed Brings On HuffPost’s Andy Wiedlin As Chief Revenue Officer', NULL, '<p>
	BuzzFeed hiring a lot of HuffPo talent.</p>
<p>
	&nbsp;</p>
', '2012-01-09 13:35:16-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (540, 'Alexia Tsotsis', 'TechCrunch', 'http://techcrunch.com/2011/03/30/buzzfeeds-jonah-peretti-on-why-the-facebook-media-world-view-wins/http://techcrunch.com/2011/03/30/buzzfeeds-jonah-peretti-on-why-the-facebook-media-world-view-wins/', '', 'BuzzFeed''s Jonah Peretti On Why The "Facebook" Media World View Wins', NULL, '<p>
	Jonah Peretti talking about the difference between Google and Facebook&#39;s approach to information. &nbsp;Google treats it almost scentifically, distilled to pure information acquisition, retrieval and transmission. &nbsp;Facebook, on the other hand, treats information as social: &quot;On Facebook you share things that define you&quot;.</p>
', '2012-01-09 13:37:59-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (541, 'Mathew Ingram', 'GigaOM', 'http://gigaom.com/2010/09/02/buzzfeed-opens-up-access-to-its-viral-dashboard/', '', 'BuzzFeed Opens Up Access to Its Viral Dashboard', NULL, '', '2012-01-09 13:45:06-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (542, 'Erik Schonfeld', 'TechCrunch', 'http://techcrunch.com/2010/05/12/buzzfeed-8-million/', '', 'RRE Ventures, Ron Conway, And Founder Collective Bet $8 Million On BuzzFeed', NULL, '<p>
	&ldquo;We built a viral analytics platform that tracks how consumers interact with media in realtime and a viral advertising platform that sends more traffic to the content that is actually working. So we optimize content for viral distribution using realtime data and we make money through viral advertising on our site and network.&rdquo;</p>
<p>
	Interesting -- basically BuzzFeed is an engine for measuring and inducing virality; the content is just a layer on top of it and in some ways probably the least valuable layer of the company.</p>
', '2012-01-09 13:47:30-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (543, 'Kara Swisher', 'AllThingsD', 'http://allthingsd.com/20120106/dow-jones-digital-departure-wsj-com-head-to-atlantic-media-for-new-project/', '', 'Dow Jones Digital Departure: WSJ.com Head to Atlantic Media for New Project', NULL, '<p>
	This story is interesting for two reasons --</p>
<p>
	1) The transition at Dow Jones might mean an opportunity for us to create / solidify / increase our BD relationships</p>
<p>
	2) We might need to pay closer attention to what the Atlantic is doing</p>
', '2012-01-09 13:51:02-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (544, 'Ryan Kim', 'GigaOM', 'http://gigaom.com/2012/01/09/mobile-app-use-soars-while-mobile-browsing-wanes/', '', 'Mobile app use soars while mobile browsing wanes', NULL, '<p>
	Interesting -- despite advances in screen resolution and quality, and the emphasis on mobile-friendly websites as well as the initial iPhone focus on having the &quot;whole web&quot;, users are using apps more than they are browsing.</p>
', '2012-01-09 13:52:32-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (545, 'Tom Cheredar', 'Venture Beat', 'http://venturebeat.com/2012/01/09/buzzfeed-secures-15-million/', '', 'Link aggregator Buzzfeed secures $15.5M round', NULL, '', '2012-01-09 13:55:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (546, 'Mathew Ingram', 'GigaOM', 'http://gigaom.com/2012/01/09/dear-wapo-innovating-too-quickly-is-not-the-problem/', '', 'Dear WaPo: Innovating too quickly is not the problem', NULL, '<p>
	Very intersting read on new initiatives that the Washington Post is trying and the importance of changing old media culture.</p>
', '2012-01-09 14:41:11-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (567, 'Ryan Kim', 'GigaOM', 'http://gigaom.com/2011/08/28/quixey-raises-3-8-million-for-smart-app-discovery/', '', 'Quixey raises $3.8 million for smart app discovery', NULL, '', '2012-01-13 11:42:03-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (592, 'Andrew Lipsman', 'comScore', 'http://blog.comscore.com/2011/06/facebook_linkedin_twitter_tumblr.html', '', 'The Network Effect: Facebook, Linkedin, Twitter & Tumblr Reach New Heights in May', NULL, '', '2012-01-16 13:03:53-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (547, 'Mathew Ingram', 'GigaOM', 'http://gigaom.com/2011/09/22/media-companies-revisit-their-aol-days-with-facebook/', '', 'Media companies revisit their AOL days with Facebook', NULL, '<p>
	&nbsp;</p>
<p class="p1">
	The key point Ingram is trying to make is that there aren&#39;t that many persuasive reasons why the established media companies would give up their data to Facebook when they are established destinations in their own rights and with the Open Graph API, they can integrate their articles with FB on their own.</p>
<p class="p2">
	I think we can use this to formulate our own strategy to tell the content providers that we&#39;re going to help them avoid getting chewed up and spit out by both FB and Google.</p>
', '2012-01-09 14:55:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (548, 'Jonah Peretti', 'BuzzFeed', 'http://www.scribd.com/doc/51946168/Web-2-0-Peretti', '', 'The Hidden SecretsOf Social Media & Viral Advertising', NULL, '<p>
	The slides are not terribly hepful, but here are some interesting quotes:</p>
<p>
	<strong>Google World View:</strong></p>
<p>
	Media about access to content. &nbsp;Access to information is paramount.</p>
<p>
	<strong>Facbook World View:</strong></p>
<p>
	Media another way to express your feelings. &nbsp;And more importantly, a way to do something with your friends.</p>
<p>
	On Facebook you share things that define you and make you look good.</p>
', '2012-01-09 15:06:03-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (549, '', 'Quora', 'http://www.quora.com/Will-Evernote-go-IPO-or-get-acquired', '', 'Will Evernote go IPO or get acquired?', NULL, '', '2012-01-09 15:09:16-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (550, 'Liana B. Baker', 'Quora', 'http://www.reuters.com/article/2011/09/09/us-evernote-idUSTRE7885JV20110909', '', 'Exclusive: Evernote considers IPO as growth picks up', NULL, '<p>
	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans; font-size: 14px; line-height: 22px; ">Evernote has more than 14 million users, with about 500,000 users who pay $5 a month for premium access, the company said. People use Evernote to record notes, organize data, store photos and search for documents. The app is available on Android and Apple devices.</span></p>
', '2012-01-09 15:11:09-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (551, '', 'Quora', 'http://www.quora.com/How-does-Evernote-acquire-customers', '', 'How does Evernote acquire customers?', NULL, '<p>
	<span style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, default; font-size: 13px; line-height: 17px; ">&quot;The job of getting people who have never heard of Evernote to hear about Evernote isn&rsquo;t our job &mdash; that&rsquo;s our users&rsquo; job. We very much want the first time you hear about Evernote not to be from us. We want it to be from a friend of yours, or from an article or something. When we track user behavior, what we see is that people who we know came in from a friend referral are vastly more valuable to us: they stick around more, they use it more, they convert [to the paid version] more. People who came in in because we paid to reach out to them, those just don&rsquo;t do nearly as well.&quot;</span></p>
', '2012-01-09 15:17:43-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (552, 'Frederick Filloux', 'PaidContent', 'http://paidcontent.co.uk/article/419-how-the-ft-and-nyt-aim-to-make-paywalls-pay/', '', 'How The FT And NYT Aim To Make Paywalls Pay', NULL, '<p>
	324,000 paying subscribers in 9 months = at least $4.86MM / month</p>
', '2012-01-10 08:56:47-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (553, 'Jennifer Saba', 'Reuters', 'http://blogs.reuters.com/mediafile/2011/11/04/washington-post-the-latest-example-of-print-ad-plunge/', '', 'Washington Post: the latest example of print ad plunge', NULL, '<p>
	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans; font-size: 14px; line-height: 22px; ">Print advertising revenue fell 20 percent to $57.6 million &mdash; quite a stunning plunge even&nbsp; as newspapers across the U.S. manage to post quarter after quarter of print ad revenue declines. Even more disturbing is that online revenue, which includes washingtonpost.com and Slate, plunged 14 percent to $23.3 million. Display online ad revenue dropped 17 percent.</span></p>
', '2012-01-10 09:05:19-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (554, 'Steven Mufson', 'Washington Post', 'http://www.washingtonpost.com/business/economy/washington-post-co-posts-62m-loss-in-third-quarter/2011/11/04/gIQA7S7glM_story.html', '', 'Washington Post Co. posts $6.2 million loss in third quarter', NULL, '', '2012-01-10 09:09:18-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (555, 'Lewis Dvorkin', 'Forbes', 'http://www.forbes.com/sites/lewisdvorkin/2012/01/09/what-a-blockbuster-forbes-post-says-about-the-tyranny-and-future-of-the-page-view/', '', 'What a Blockbuster Forbes Post Says About the Tyranny and Future of the Page View', NULL, '<p>
	Over 25 million unique visitors each of the past three months.</p>
<p>
	For December: 27.8MM unique visitors</p>
<p>
	<strong>Great insight:</strong></p>
<p>
	&quot;For me, it was yet another reminder that readers crave authentic voice in the digital era.&quot;</p>
', '2012-01-10 09:36:57-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (556, '', 'Bloomberg', 'http://www.bloombergmedia.com/digital/businessweek-com/audience/', '', 'Bloomberg BusinessWeek Audience', NULL, '', '2012-01-10 09:51:47-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (557, 'Cotton Delo', 'AdAge Digital', 'http://adage.com/article/digital/twitter-ad-revenue-reach-139-5m-2011-report/230096/', '', 'Twitter Ad Revenue to Reach $139.5M in 2011: Report', NULL, '<p>
	Twitter to reach $139.5MM in ad revenue for 2011.</p>
', '2012-01-10 09:59:45-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (558, '', 'Crunchbase', 'http://www.crunchbase.com/company/getglue', '', 'GetGlue', NULL, '', '2012-01-11 09:37:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (559, 'Sarah Perez', 'TechCrunch', 'http://techcrunch.com/2012/01/11/social-entertainment-network-getglue-raises-12-million-in-new-financing/', '', 'Social Entertainment Network GetGlue Raises $12 Million In New Financing', NULL, '<p>
	GetGlue&#39;s main focus is on social tv; basically it allows users to share their TV viewing experience and partners with broadcasters to integrate with their content streaming.</p>
<p>
	Interestingly enough, they use some NLP to filter out the noise in the activity stream.</p>
', '2012-01-11 09:50:35-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (560, 'Jennifer Van Grove', 'Venture Beat', 'http://venturebeat.com/2012/01/11/getglue-funding/', '', 'GetGlue prepares to take social TV mainstream with $12M in funding', NULL, '<p>
	<span style="color: rgb(51, 51, 51); font-family: arial, sans-serif; font-size: 13px; line-height: 18px; text-align: left; ">But what is social television, exactly? It&rsquo;s a niche section of social networking dedicated entirely to (usually influential) entertainment enthusiasts, and the networks and brands that want to reach them.</span></p>
', '2012-01-11 10:00:27-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (561, 'Leena Rao', 'TechCrunch', 'http://techcrunch.com/2011/04/13/getglue-passes-1m-users-100m-data-points/', '', 'GetGlue Passes 1M Users; 100M Data Points', NULL, '', '2012-01-11 16:24:12-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (562, '', 'Crunchbase', 'http://www.crunchbase.com/company/mplayit', '', 'AppTap', NULL, '', '2012-01-13 10:11:21-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (563, 'Leena Rao', 'TechCrunch', 'http://techcrunch.com/2012/01/12/mobile-app-search-and-recommendations-startup-apptap-raises-4-million/', '', 'Mobile App Search And Recommendations Startup AppTap Raises $4 Million', NULL, '<p>
	Raised $4MM</p>
', '2012-01-13 10:12:09-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (564, '', 'PR Newswire', 'http://www.prnewswire.com/news-releases/app-tap-doubles-use-of-its-app-search-and-social-recommendations-platform-signs-new-partners-108936144.html', '', 'App Tap Doubles Use of Its App Search and Social Recommendations Platform, Signs New Partners', NULL, '<p>
	Partners:</p>
<p>
	PocketGamer.com</p>
<p>
	TiPb.com</p>
<p>
	DroidForums.net</p>
<p>
	iPadForums.net</p>
<p>
	iPhone4Forums.net</p>
<p>
	PocketPicks.co.uk</p>
<p>
	AndroidRundown.com</p>
', '2012-01-13 11:11:36-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (565, '', 'PR Newswire', 'http://www.prnewswire.com/news-releases/app-tap-launches-mobile-app-search-and-social-recommendations-platform-for-web-publishers-105858203.html', '', 'App Tap Launches Mobile App Search and Social Recommendations Platform for Web Publishers', NULL, '', '2012-01-13 11:14:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (568, '', 'Canalys', 'http://www.canalys.com/newsroom/app-stores-direct-revenue-exceed-14-billion-next-year-and-reach-close-37-billion-2015', '', 'App stores'' direct revenue to exceed $14 billion next year and reach close to $37 billion by 2015', NULL, '<p>
	All revenue from apps predicted to hit $14bil this year; $36.7bil by 2015.</p>
<p>
	<span style="color: rgb(51, 51, 51); font-family: Verdana, Arial, sans-serif; line-height: 18px; ">&lsquo;The leading stores already have hundreds of thousands of apps, so it&rsquo;s hard for operators to compete with those numbers,&rsquo; said Canalys Analyst Tim Shepherd. &lsquo;On the other hand, too much choice brings serious problems in terms of application discovery for both developers and users, which operators can turn to their advantage.&rsquo;</span></p>
', '2012-01-13 11:50:01-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (569, 'Eric Eldon', 'TechCrunch', 'http://techcrunch.com/2012/01/13/myinterest/', '', 'December Presents: Record Traffic For Social Interest Sites Tumblr And Pinterest', NULL, '', '2012-01-13 13:08:00-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (570, 'Kelly Reeves', 'Outbrain', 'http://blog.outbrain.com/2012/01/importance-of-content-recommendations-predicted-in-2012.html', '', 'Importance of Content Recommendations Predicted in 2012', NULL, '<p>
	Quotes 6 CMOs about the importance of content recommendation in the coming year.</p>
', '2012-01-14 17:11:40-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (571, 'Michael Arrington', 'TechCrunch', 'http://techcrunch.com/2006/07/15/is-twttr-interesting/', '', 'Odeo Releases Twttr', NULL, '<p>
	According to this post, Twitter (initially Twttr) started as an SMS application that also had a webpage. &nbsp;Very, very simple launch. &nbsp;Interesting to think about how Wordnik might also recreate the simplicity of launch.</p>
', '2012-01-14 17:16:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (572, 'Michael Arrington', 'TechCrunch', 'http://techcrunch.com/2007/07/26/twitter-gets-their-venture-round/', '', 'Twitter Gets Their Venture Round', NULL, '', '2012-01-14 17:30:44-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (573, 'Michael Arrington', 'TechCrunch', 'http://techcrunch.com/2007/07/29/more-information-on-that-secretive-twitter-financing/', '', 'More Information On That Secretive Twitter Financing', NULL, '', '2012-01-14 17:33:14-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (574, 'Michael Arrington', 'TechCrunch', 'http://techcrunch.com/2008/04/29/end-of-speculation-the-real-twitter-usage-numbers/', '', 'End Of Speculation: The Real Twitter Usage Numbers', NULL, '', '2012-01-14 17:45:42-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (575, 'Peter Ha', 'TechCrunch', 'http://techcrunch.com/2008/08/10/why-twitter-hasnt-failed-the-power-of-audience/', '', 'hy Twitter Hasn''t Failed: The Power Of Audience', NULL, '<p>
	Some interesting commentary on the relation between an audience and self-expression. &nbsp;I&#39;m not sure I agree with everything that he&#39;s saying here. &nbsp;For instance, I&#39;m not convinced that people on Twitter know who is receiving their message any more than they do on Facebook. &nbsp;Of course, this was 2008, so I can&#39;t recall all that&#39;s changed since then.</p>
', '2012-01-14 17:58:12-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (576, 'Erik Schonfeld', 'TechCrunch', 'http://techcrunch.com/2008/11/15/twitters-hockey-stick-moment/', '', 'Twitter''s Hockey Stick Moment', NULL, '', '2012-01-14 18:59:28-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (577, 'Michael Arrington', 'TechCrunch', 'http://techcrunch.com/2008/11/19/poll-more-than-half-of-twitter-users-would-pay/', '', 'Poll: More Than Half Of Twitter Users Would Pay', NULL, '<p>
	interesting -- a poll by Guy Kawasaki in 2008 indicated that 50%+ of Twitter users would pay for the service. &nbsp;This is before the service went truly main stream, but is the kind of fanatical devotion that you want from early users.</p>
', '2012-01-14 19:08:57-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (578, 'Steve Gillmor', 'TechCrunch', 'http://techcrunch.com/2008/11/24/a-whale-of-an-opportunity/', '', 'A Whale of an Opportunity', NULL, '<p>
	Very interesting about how Twitter, by establishing a more open portal, could have become the dominant micromessage (and real-time) platform. &nbsp;Of course, it turns out that it did anyway, but I&#39;m not sure it really adopted the features that Gillmor wanted: TrackRank and discovery cloud. &nbsp;</p>
<p>
	I think two key points to take away here for Wordnik are:</p>
<p>
	1) huge value in interoperability, i.e., the ability to track and discover content across sites</p>
<p>
	2) defining what it means to be content discovery -- I think that StumbleUpon has done the most to own this space, but we can improve on this.</p>
', '2012-01-14 19:14:34-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (579, 'Erik Schonfeld', 'TechCrunch', 'http://techcrunch.com/2009/01/20/did-twitter-just-pass-digg/', '', 'Did Twitter Just Pass Digg?', NULL, '', '2012-01-14 20:04:28-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (580, 'Mark Hendrickson', 'TechCrunch', 'http://techcrunch.com/2009/02/13/twitter-raises-third-round-of-funding-from-benchmark-and-ivp/', '', 'Twitter Raises $35 Million Series C From Benchmark and IVP', NULL, '', '2012-01-14 20:10:46-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (581, 'Michael Arrington', 'TechCrunch', 'http://techcrunch.com/2009/03/05/its-time-to-start-thinking-of-twitter-as-a-search-engine/', '', 'It''s Time To Start Thinking Of Twitter As A Search Engine', NULL, '<p>
	&quot;Twitter also gathers other information, like people&rsquo;s&nbsp;experiences with products and services&nbsp;as they interact with them.&quot;</p>
', '2012-01-14 20:17:02-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (582, 'Michael Arrington', 'TechCrunch', 'http://techcrunch.com/2009/03/12/the-amount-and-value-of-twitter-traffic/', '', 'The Amount And Value Of Twitter Traffic', NULL, '<p>
	Arrington showing some (not very good) data that indicates users referred from Twitter are not as valuabe, i.e., don&#39;t browse the site as much, as regularly earned users.</p>
', '2012-01-14 20:20:07-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (583, '', 'Battelle Media', 'http://battellemedia.com/archives/2009/02/twitter_youtube.php', '', 'TWITTER = YOUTUBE.', NULL, '<p>
	Argues that Twitter is the biggest thing in search, just as YouTube was -- which is why Google bought YouTube and why they&#39;re interested in Twitter.</p>
', '2012-01-14 20:22:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (584, 'Michael Learmonth', 'AdAge Digital', 'http://adage.com/article/digital/twitter-google/135016/', '', 'Twitter: We Can Do What Google Can''t', NULL, '<p>
	Very intresting piece about how Twitter could outflank Google and Facebook by powering not a traditional search database, but a search function that would query Twitter users and feed back an answer.</p>
', '2012-01-14 20:26:30-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (585, 'Robin Wauters', 'TechCrunch', 'http://techcrunch.com/2009/04/02/twitter-confirms-and-details-new-discovery-engine/', '', 'Twitter Confirms And Details New "Discovery Engine"', NULL, '<p>
	Talks about Twitter redesigning its homepage as a way to provide a discovery engine -- but basically it&#39;s just making search easier.</p>
', '2012-01-14 20:35:56-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (586, 'Erik Schonfeld', 'TechCrunch', 'http://techcrunch.com/2009/04/15/boom-twitter-more-than-doubles-unique-visitors-to-93-million-in-march/', '', 'Boom! Twitter More Than Doubles Unique U.S. Visitors To 9.3 Million In March', NULL, '', '2012-01-14 20:42:48-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (587, 'Erik Schonfeld', 'TechCrunch', 'http://techcrunch.com/2009/04/24/twitter-eats-world-global-visitors-shoot-up-to-19-million/', '', 'Twitter Eats World: Global Visitors Shoot Up To 19 Million', NULL, '', '2012-01-14 20:48:56-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (588, 'Liz Gannes', 'AllThingsD', 'http://allthingsd.com/20110314/twitter-numbers-cool-but-how-many-users-do-you-have/', '', 'Twitter Numbers: Cool, But How Many Users Does It Actually Have?', NULL, '', '2012-01-16 12:34:01-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (589, 'Jake Stein', 'RJMetrics', 'http://info.rjmetrics.com/blog/bid/44962/New-Data-on-Twitter-s-Users-and-Engagement', '', 'New Data on Twitter''s Users and Engagement', NULL, '', '2012-01-16 12:37:15-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (590, 'Danny Sullivan', 'Search Engine Land', 'http://searchengineland.com/why-you-cant-compare-google-user-figures-to-facebook-twitter-96822', '', 'Why You Can’t Compare Google+ User Figures To Facebook & Twitter', NULL, '', '2012-01-16 12:47:26-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (591, 'Greg Finn', 'Search Engine Land', 'http://searchengineland.com/twitter-hits-100-million-active-users-92243', '', 'Twitter Hits 100 Million ‘Active’ Users', NULL, '', '2012-01-16 12:49:43-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (593, 'Frederick Filloux', 'Guardian', 'http://www.guardian.co.uk/media/2011/nov/07/twitter-facebook', '', 'Does Twitter have more influence than Facebook?', NULL, '<p>
	Some interesing, not-well-developed thoughts in this piece about the difference in influence between Twitter and Facebook. &nbsp;He uses the integration of WSJ with social networks as an example, but I think the point he&#39;s trying to make is that Twitter might be a more natural platform to integrate with the outside world rather than Facebook&#39;s walled garden.</p>
', '2012-01-16 13:11:48-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (594, 'Paul Allen', 'Google+', 'https://plus.google.com/117388252776312694644/posts/EwpnUpTkJ5W', '', 'Google+ Reaches 50 Million User Mark in About 88 Days', NULL, '', '2012-01-16 13:37:57-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (595, 'Paul Allen', 'Google+', 'https://plus.google.com/117388252776312694644/posts/K9Qf1UVNyGy', '', 'Google+ is Really Taking Off! Millions Joining Daily. 30% Increase in Users in last 2 days.', NULL, '', '2012-01-16 13:39:48-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (596, 'Ted Thornhill', 'Mail Online', 'http://www.dailymail.co.uk/sciencetech/article-2080207/Google-Plus-hit-400m-users--overtake-Facebook.html', '', 'Google Plus ''will have more than 400m users by the end of 2012''', NULL, '', '2012-01-16 13:42:43-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (597, '', 'Yahoo!', 'http://advertising.yahoo.com/article/flickr.html', '', 'Flickr', NULL, '', '2012-01-16 13:48:10-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (598, '', 'Crunchbase', 'http://www.crunchbase.com/company/flickr', '', 'Flickr', NULL, '', '2012-01-16 13:49:02-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (599, '', 'Tumblr', 'http://www.tumblr.com/about', '', 'Tumblr|About', NULL, '', '2012-01-16 13:53:24-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (600, '', 'WordPress', 'http://en.wordpress.com/about/', '', 'WordPress | About', NULL, '', '2012-01-16 14:01:08-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (601, '', 'WordPress', 'http://en.wordpress.com/stats/', '', 'WordPress | Stats', NULL, '', '2012-01-16 14:04:59-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (602, 'Mike LaChappelle', 'Quora', 'http://www.quora.com/How-many-users-does-Tumblr-have-in-India', '', 'How many users does Tumblr have in India?', NULL, '', '2012-01-16 22:43:34-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (603, 'Mike LaChappelle', 'Quora', 'http://www.quora.com/How-many-users-does-Tumblr-have-in-India', '', 'How many users does Tumblr have in India?', NULL, '', '2012-01-16 22:46:22-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (604, '', 'Crunchbase', 'http://www.crunchbase.com/company/posterous', '', 'Posterous', NULL, '', '2012-01-16 23:13:16-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (605, '', 'Cru', 'http://www.crunchbase.com/product/typepad', '', 'Typepad', NULL, '', '2012-01-17 23:26:14-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (606, '', 'Quantcast', 'http://www.quantcast.com/typepad.com', '', 'Tyepad', NULL, '', '2012-01-17 23:26:37-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (607, '', 'DoubleClick Ad Planner', 'https://www.google.com/adplanner/planning/site_profile?hl=en#siteDetails?uid=domain%253A%2520twitter.com&geo=US&lp=true', '', 'Twitter | DoubleClick Ad Planner', NULL, '', '2012-01-18 10:58:33-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (608, '', 'DoubleClick Ad Planner', 'https://www.google.com/adplanner/planning/site_profile?hl=en#siteDetails?uid=domain%253A%2520tumblr.com&geo=US&lp=true', '', 'Tumblr | DoubleClick Ad Planner', NULL, '', '2012-01-18 11:05:10-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (609, '', 'DoubleClick Ad Planner', 'https://www.google.com/adplanner/planning/site_profile?hl=en#siteDetails?uid=domain%253A%2520wordpress.com&geo=US&lp=true', '', 'Wordpress | DoubleClick Ad Planner', NULL, '', '2012-01-18 11:13:25-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (610, '', 'DoubleClick Ad Planner', 'https://www.google.com/adplanner/planning/site_profile?hl=en#siteDetails?uid=domain%253A%2520posterous.com&geo=US&lp=true', '', 'Posterous | DoubleClick Ad Planner', NULL, '', '2012-01-18 11:25:23-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (611, '', 'DoubleClick Ad Planner', 'https://www.google.com/adplanner/planning/site_profile?hl=en#siteDetails?uid=domain%253A%2520typepad.com&geo=US&lp=true', '', 'Typepad | DoubleClick Ad Planner', NULL, '', '2012-01-18 11:28:46-08');
INSERT INTO market_source (id, author, source, url, file, title, date, insight, modified) VALUES (612, '', 'Demand Media', 'http://ir.demandmedia.com/phoenix.zhtml?c=215358&p=irol-newsArticle&ID=1627310&highlight=', '', 'Demand Media Reports Third Quarter 2011 Financial Results', NULL, '', '2012-01-18 11:44:29-08');


--
-- TOC entry 2559 (class 0 OID 19362)
-- Dependencies: 209
-- Data for Name: market_source_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_source_company (id, source_id, company_id) VALUES (1256, 1, 1);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1257, 2, 1);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1258, 3, 1);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1259, 4, 1);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1260, 5, 1);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1261, 6, 1);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1262, 7, 2);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1263, 8, 2);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1264, 9, 2);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1265, 10, 2);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1266, 11, 2);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1267, 12, 4);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1268, 13, 4);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1269, 14, 4);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1270, 15, 4);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1271, 16, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1272, 17, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1273, 18, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1274, 19, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1275, 20, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1276, 21, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1277, 22, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1278, 23, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1279, 24, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1280, 25, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1281, 26, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1282, 27, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1283, 28, 5);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1284, 29, 5);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1285, 30, 5);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1286, 31, 5);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1287, 32, 5);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1288, 33, 23);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1289, 34, 23);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1290, 35, 23);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1291, 36, 27);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1292, 37, 26);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1293, 38, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1294, 39, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1295, 40, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1296, 41, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1297, 42, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1298, 43, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1299, 44, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1300, 45, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1301, 46, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1302, 47, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1303, 48, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1304, 49, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1305, 50, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1306, 51, 29);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1307, 52, 41);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1308, 53, 41);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1309, 54, 41);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1310, 55, 42);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1311, 56, 42);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1312, 57, 42);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1313, 58, 43);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1314, 59, 43);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1315, 60, 47);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1316, 61, 47);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1317, 62, 47);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1318, 63, 47);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1319, 64, 47);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1320, 65, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1321, 66, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1322, 67, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1323, 68, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1324, 69, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1325, 70, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1326, 71, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1327, 72, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1328, 73, 54);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1329, 74, 54);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1330, 75, 54);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1331, 76, 54);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1332, 77, 54);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1333, 78, 76);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1334, 79, 53);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1335, 80, 54);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1336, 81, 54);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1337, 82, 24);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1338, 83, 24);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1339, 84, 24);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1340, 85, 24);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1341, 86, 24);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1342, 87, 56);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1343, 88, 56);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1344, 89, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1345, 90, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1346, 91, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1347, 92, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1348, 93, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1349, 94, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1350, 95, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1351, 96, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1352, 97, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1353, 98, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1354, 99, 57);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1355, 100, 58);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1356, 101, 58);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1357, 102, 58);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1358, 103, 58);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1359, 104, 58);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1360, 105, 58);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1361, 106, 59);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1362, 107, 59);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1363, 108, 59);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1364, 109, 45);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1365, 110, 45);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1366, 111, 45);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1367, 112, 45);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1368, 113, 61);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1369, 114, 61);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1370, 115, 62);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1371, 116, 62);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1372, 117, 62);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1373, 118, 63);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1374, 119, 63);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1375, 120, 63);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1376, 121, 63);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1377, 122, 89);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1378, 123, 64);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1379, 124, 64);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1380, 125, 64);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1381, 126, 64);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1382, 127, 64);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1383, 128, 65);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1384, 129, 65);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1385, 130, 65);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1386, 131, 65);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1387, 132, 65);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1388, 133, 65);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1389, 134, 65);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1390, 135, 66);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1391, 136, 66);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1392, 137, 66);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1393, 138, 90);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1394, 139, 90);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1395, 140, 90);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1396, 141, 90);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1397, 142, 67);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1398, 143, 67);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1399, 144, 67);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1400, 145, 68);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1401, 146, 68);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1402, 147, 68);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1403, 148, 68);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1404, 149, 68);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1405, 150, 70);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1406, 151, 70);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1407, 152, 70);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1408, 153, 70);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1409, 154, 70);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1410, 155, 70);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1411, 156, 92);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1412, 157, 92);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1413, 158, 92);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1414, 159, 92);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1415, 160, 92);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1416, 161, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1417, 162, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1418, 163, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1419, 164, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1420, 165, 72);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1421, 166, 72);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1422, 167, 72);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1423, 168, 72);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1424, 169, 20);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1425, 170, 20);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1426, 171, 20);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1427, 172, 74);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1428, 173, 74);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1429, 174, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1430, 175, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1431, 176, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1432, 177, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1433, 178, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1434, 179, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1435, 180, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1436, 181, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1437, 182, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1438, 183, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1439, 184, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1440, 185, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1441, 186, 7);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1442, 187, 7);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1443, 188, 7);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1444, 189, 7);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1445, 190, 7);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1446, 191, 7);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1447, 192, 7);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1448, 193, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1449, 194, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1450, 195, 8);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1451, 196, 8);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1452, 197, 8);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1453, 198, 8);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1454, 199, 8);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1455, 200, 9);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1456, 201, 9);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1457, 202, 10);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1458, 203, 10);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1459, 204, 10);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1460, 205, 11);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1461, 206, 11);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1462, 207, 11);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1463, 208, 12);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1464, 209, 12);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1465, 210, 12);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1466, 211, 13);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1467, 212, 13);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1468, 213, 13);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1469, 214, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1470, 215, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1471, 216, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1472, 217, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1473, 218, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1474, 219, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1475, 220, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1476, 221, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1477, 222, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1478, 223, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1479, 224, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1480, 225, 17);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1481, 226, 17);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1482, 227, 17);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1483, 228, 17);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1484, 229, 17);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1485, 230, 18);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1486, 231, 18);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1487, 232, 18);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1488, 233, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1489, 234, 22);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1490, 235, 32);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1491, 236, 32);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1492, 237, 33);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1493, 238, 33);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1494, 239, 34);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1495, 240, 34);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1496, 241, 34);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1497, 242, 35);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1498, 243, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1499, 244, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1500, 245, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1501, 246, 136);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1502, 247, 136);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1503, 248, 136);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1504, 249, 136);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1505, 250, 136);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1506, 251, 137);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1507, 252, 137);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1508, 253, 67);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1509, 254, 140);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1510, 255, 4);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1511, 256, 40);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1512, 257, 42);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1513, 258, 42);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1514, 259, 44);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1515, 260, 46);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1516, 261, 48);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1517, 262, 49);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1518, 263, 49);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1519, 264, 87);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1520, 265, 87);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1521, 266, 87);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1522, 267, 36);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1523, 268, 36);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1524, 269, 39);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1525, 270, 39);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1526, 271, 39);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1527, 272, 41);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1528, 273, 41);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1529, 274, 70);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1530, 275, 70);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1531, 276, 70);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1532, 277, 77);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1533, 278, 77);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1534, 279, 77);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1535, 280, 76);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1536, 281, 78);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1537, 282, 78);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1538, 283, 78);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1539, 284, 78);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1540, 285, 78);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1541, 286, 80);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1542, 287, 80);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1543, 288, 80);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1544, 289, 83);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1545, 290, 83);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1546, 291, 83);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1547, 292, 84);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1548, 293, 85);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1549, 294, 85);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1550, 295, 94);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1551, 296, 96);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1552, 297, 96);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1553, 298, 96);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1554, 299, 65);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1555, 300, 209);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1556, 301, 45);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1557, 302, 98);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1558, 303, 99);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1559, 304, 100);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1560, 305, 101);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1561, 306, 101);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1562, 307, 66);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1563, 308, 102);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1564, 309, 102);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1565, 310, 102);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1566, 311, 102);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1567, 312, 96);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1568, 313, 109);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1569, 314, 111);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1570, 315, 111);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1571, 316, 113);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1572, 317, 113);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1573, 318, 111);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1574, 319, 115);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1575, 320, 115);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1576, 321, 118);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1577, 322, 118);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1578, 323, 118);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1579, 324, 118);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1580, 325, 120);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1581, 326, 121);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1582, 327, 121);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1583, 328, 121);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1584, 329, 121);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1585, 330, 159);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1586, 331, 159);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1587, 332, 122);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1588, 333, 130);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1589, 334, 130);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1590, 335, 160);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1591, 336, 160);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1592, 337, 160);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1593, 338, 160);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1594, 339, 161);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1595, 340, 161);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1596, 341, 157);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1597, 342, 157);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1598, 343, 157);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1599, 344, 157);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1600, 345, 156);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1601, 346, 156);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1602, 347, 156);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1603, 348, 160);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1604, 349, 160);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1605, 350, 160);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1606, 351, 160);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1607, 352, 160);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1608, 353, 160);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1609, 354, 154);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1610, 355, 154);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1611, 356, 162);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1612, 357, 162);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1613, 358, 162);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1614, 359, 162);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1615, 360, 162);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1616, 361, 163);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1617, 362, 153);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1618, 363, 153);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1619, 364, 152);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1620, 365, 152);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1621, 366, 152);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1622, 367, 144);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1623, 368, 144);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1624, 369, 150);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1625, 370, 150);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1626, 371, 150);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1627, 372, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1628, 373, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1629, 374, 71);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1630, 375, 73);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1631, 376, 73);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1632, 377, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1633, 378, 16);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1634, 379, 22);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1635, 380, 22);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1636, 381, 167);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1637, 382, 167);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1638, 383, 162);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1639, 384, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1640, 385, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1641, 386, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1642, 387, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1643, 388, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1644, 389, 168);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1645, 390, 164);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1646, 391, 169);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1647, 392, 169);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1648, 393, 169);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1649, 394, 169);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1650, 395, 169);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1651, 396, 169);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1652, 397, 169);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1653, 398, 169);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1654, 399, 169);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1655, 400, 169);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1656, 401, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1657, 402, 170);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1658, 403, 170);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1659, 404, 170);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1660, 405, 172);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1661, 406, 172);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1662, 407, 171);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1663, 408, 171);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1664, 409, 173);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1665, 410, 173);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1666, 411, 83);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1667, 412, 174);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1668, 413, 174);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1669, 414, 174);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1670, 415, 174);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1671, 416, 72);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1672, 417, 7);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1673, 418, 175);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1674, 419, 175);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1675, 420, 175);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1676, 421, 178);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1677, 422, 178);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1678, 423, 179);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1679, 424, 179);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1680, 425, 180);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1681, 426, 180);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1682, 427, 180);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1683, 428, 180);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1684, 429, 21);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1685, 430, 180);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1686, 431, 183);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1687, 432, 184);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1688, 433, 184);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1689, 434, 184);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1690, 435, 184);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1691, 436, 186);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1692, 437, 186);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1693, 438, 186);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1694, 439, 188);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1695, 440, 188);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1696, 441, 190);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1697, 442, 190);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1698, 443, 190);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1699, 444, 210);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1700, 445, 192);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1701, 446, 192);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1702, 447, 192);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1703, 448, 193);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1704, 449, 194);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1705, 450, 192);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1706, 451, 192);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1707, 452, 192);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1708, 453, 192);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1709, 454, 196);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1710, 455, 196);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1711, 456, 196);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1712, 457, 196);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1713, 458, 196);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1714, 459, 196);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1715, 460, 196);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1716, 461, 196);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1717, 462, 192);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1718, 463, 197);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1719, 464, 197);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1720, 465, 195);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1721, 466, 195);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1722, 467, 195);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1723, 468, 194);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1724, 469, 194);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1725, 470, 194);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1726, 471, 194);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1727, 472, 199);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1728, 473, 201);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1729, 474, 201);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1730, 475, 203);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1731, 476, 203);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1732, 477, 203);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1733, 478, 203);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1734, 479, 70);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1735, 480, 195);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1736, 481, 207);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1737, 482, 207);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1738, 486, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1739, 488, 105);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1740, 491, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1741, 492, 122);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1742, 493, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1743, 494, 122);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1744, 495, 122);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1745, 496, 213);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1746, 497, 213);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1747, 498, 213);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1748, 499, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1749, 500, 1);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1750, 503, 152);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1751, 505, 215);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1752, 506, 216);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1753, 507, 219);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1754, 508, 215);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1755, 509, 215);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1756, 510, 216);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1757, 511, 220);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1758, 512, 219);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1759, 513, 220);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1760, 514, 215);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1761, 515, 215);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1762, 517, 215);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1763, 520, 3);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1764, 522, 216);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1765, 523, 216);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1766, 524, 216);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1767, 525, 217);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1768, 537, 223);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1769, 538, 223);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1770, 539, 223);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1771, 540, 223);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1772, 541, 223);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1773, 542, 223);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1774, 545, 223);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1775, 546, 222);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1776, 549, 136);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1777, 550, 136);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1778, 551, 136);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1779, 552, 215);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1780, 553, 222);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1781, 554, 222);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1782, 555, 216);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1783, 556, 219);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1784, 557, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1785, 558, 225);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1786, 559, 225);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1787, 560, 225);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1788, 561, 225);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1789, 562, 226);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1790, 563, 226);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1791, 564, 226);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1792, 565, 226);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1793, 566, 226);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1794, 567, 207);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1795, 569, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1796, 571, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1797, 572, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1798, 573, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1799, 574, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1800, 575, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1801, 576, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1802, 577, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1803, 578, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1804, 579, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1805, 580, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1806, 581, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1807, 582, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1808, 583, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1809, 584, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1810, 585, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1811, 586, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1812, 587, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1813, 588, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1814, 589, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1815, 590, 227);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1816, 591, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1817, 593, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1818, 594, 227);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1819, 595, 227);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1820, 596, 227);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1821, 597, 228);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1822, 598, 228);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1823, 599, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1824, 600, 229);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1825, 601, 229);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1826, 603, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1827, 604, 230);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1828, 605, 231);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1829, 606, 231);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1830, 607, 208);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1831, 608, 6);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1832, 609, 229);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1833, 610, 230);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1834, 611, 231);
INSERT INTO market_source_company (id, source_id, company_id) VALUES (1835, 612, 232);


--
-- TOC entry 2560 (class 0 OID 19377)
-- Dependencies: 211
-- Data for Name: market_source_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (349, 483, 42);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (350, 483, 96);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (351, 484, 97);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (352, 485, 59);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (353, 486, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (354, 487, 99);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (355, 488, 82);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (356, 489, 99);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (357, 489, 100);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (358, 490, 99);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (359, 491, 102);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (360, 491, 103);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (361, 491, 101);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (362, 491, 104);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (363, 491, 105);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (364, 492, 106);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (365, 493, 25);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (366, 493, 107);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (367, 494, 106);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (368, 495, 106);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (369, 496, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (370, 497, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (371, 498, 106);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (372, 499, 99);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (373, 499, 100);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (374, 499, 108);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (375, 500, 109);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (376, 500, 110);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (377, 501, 37);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (378, 502, 37);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (379, 503, 37);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (380, 503, 111);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (381, 504, 11);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (382, 504, 111);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (383, 504, 112);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (384, 505, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (385, 506, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (386, 507, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (387, 508, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (388, 509, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (389, 510, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (390, 511, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (391, 512, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (392, 513, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (393, 514, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (394, 515, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (395, 516, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (396, 517, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (397, 518, 99);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (398, 518, 117);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (399, 518, 119);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (400, 518, 118);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (401, 519, 99);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (402, 519, 120);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (403, 519, 100);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (404, 520, 25);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (405, 520, 121);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (406, 521, 122);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (407, 522, 114);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (408, 522, 113);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (409, 523, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (410, 524, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (411, 525, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (412, 526, 123);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (413, 527, 123);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (414, 527, 124);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (415, 528, 123);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (416, 528, 124);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (417, 529, 123);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (418, 529, 124);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (419, 530, 123);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (420, 530, 124);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (421, 531, 123);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (422, 531, 124);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (423, 532, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (424, 533, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (425, 534, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (426, 535, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (427, 536, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (428, 537, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (429, 538, 127);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (430, 539, 56);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (431, 540, 128);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (432, 540, 21);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (433, 541, 97);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (434, 542, 97);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (435, 543, 114);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (436, 543, 113);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (437, 544, 129);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (438, 544, 130);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (439, 545, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (440, 546, 114);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (441, 546, 113);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (442, 547, 114);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (443, 547, 131);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (444, 547, 113);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (445, 547, 132);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (446, 548, 97);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (447, 549, 85);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (448, 550, 85);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (449, 551, 133);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (450, 552, 134);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (451, 553, 135);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (452, 554, 135);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (453, 555, 136);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (454, 556, 136);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (455, 557, 135);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (456, 558, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (457, 559, 139);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (458, 559, 140);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (459, 560, 138);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (460, 560, 137);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (461, 561, 137);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (462, 562, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (463, 563, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (464, 564, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (465, 565, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (466, 566, 142);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (467, 567, 141);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (468, 568, 144);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (469, 568, 143);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (470, 569, 146);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (471, 569, 101);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (472, 569, 145);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (473, 570, 53);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (474, 571, 147);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (475, 572, 148);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (476, 573, 148);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (477, 574, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (478, 575, 149);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (479, 576, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (480, 577, 150);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (481, 578, 151);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (482, 578, 153);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (483, 578, 152);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (484, 579, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (485, 580, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (486, 581, 100);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (487, 581, 149);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (488, 582, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (489, 583, 42);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (490, 584, 155);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (491, 584, 154);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (492, 585, 156);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (493, 586, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (494, 587, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (495, 588, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (496, 589, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (497, 590, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (498, 591, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (499, 592, 21);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (500, 592, 157);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (501, 593, 99);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (502, 593, 158);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (503, 593, 131);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (504, 594, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (505, 595, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (506, 596, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (507, 597, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (508, 597, 161);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (509, 598, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (510, 599, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (511, 600, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (512, 601, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (513, 603, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (514, 604, 125);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (515, 605, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (516, 606, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (517, 607, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (518, 608, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (519, 609, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (520, 610, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (521, 611, 98);
INSERT INTO market_source_tags (id, source_id, tag_id) VALUES (522, 612, 162);


--
-- TOC entry 2548 (class 0 OID 19171)
-- Dependencies: 187
-- Data for Name: market_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO market_tag (id, name, description, created, modified) VALUES (1, 'discovery', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (2, 'news', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (3, 'intelligent', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (4, 'automated', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (5, 'persistent discovery', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (6, 'automated curation', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (7, 'content', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (8, 'curation', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (9, 'bookmarks', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (10, 'social', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (11, 'sharing', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (12, 'catalog', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (13, 'social competition', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (14, 'restaurant', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (15, 'subjective search', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (16, 'personalization', '', '2011-12-27 19:29:37-08', '2011-12-27 19:29:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (17, 'social shopping', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (18, 'retail', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (19, 'bookmarking', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (20, 'microblogging', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (21, 'social media', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (22, 'media sharing', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (23, 'location sharing', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (24, 'deals', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (25, 'social curation', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (26, 'fashion', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (27, 'social bookmarking', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (28, 'booksaving', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (29, 'virtual bulletin board', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (30, 'social sharing', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (31, 'content discovery', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (32, 'social media monitoring', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (33, 'analytics', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (34, 'smart journal', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (35, 'semantic', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (36, 'personalized news', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (37, 'news aggregation', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (38, 'personalized email', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (39, 'behavioral email', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (40, 'user engagement', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (41, 'semantic search', '', '2011-12-27 19:29:38-08', '2011-12-27 19:29:38-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (42, 'search', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (43, 'human search', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (44, 'web guide', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (45, 'real-time', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (46, 'real-time search', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (47, 'Twitter search', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (48, 'twitter', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (49, 'rss', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (50, 'machine learning', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (51, 'news aggregator', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (52, 'publisher tools', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (53, 'content recommendation', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (54, 'news curation', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (55, 'newsire', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (56, 'content aggregation', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (57, 'natural language processing', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (58, 'professional publishing', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (59, 'semantic analysis', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (60, 'contextual discovery', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (61, 'instant search', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (62, 'in-page search', '', '2011-12-27 19:29:39-08', '2011-12-27 19:29:39-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (63, 'interest graph', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (64, 'content personalization', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (65, 'content sharing', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (66, 'social media optimization', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (67, 'twitter timeing', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (68, 'url shortener', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (69, 'social search', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (70, 'user curation', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (71, 'social magazine', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (72, 'social discovery', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (73, 'interest network', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (74, 'toolbar', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (75, 'automated personalization', '', '2011-12-27 19:29:40-08', '2011-12-27 19:29:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (76, 'TV analysis', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (77, 'recommendations', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (78, 'crowd-sourcing', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (79, 'personal', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (80, 'visualization', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (81, 'social influence', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (82, 'influence analysis', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (83, 'sentiment analysis', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (84, 'widgets', '', '2011-12-27 19:29:41-08', '2011-12-27 19:29:41-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (85, 'personal curation', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (86, 'web clips', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (87, 'cloud storage', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (88, 'overlaid bookmarks', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (89, 'realtime search', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (90, 'social recommendations', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (91, 'publishing', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (92, 'ecommerce', '', '2011-12-27 19:29:42-08', '2011-12-27 19:29:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (93, 'self-service marketing', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (94, 'email marketing', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (95, 'local', '', '2011-12-27 19:29:43-08', '2011-12-27 19:29:43-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (96, 'apps', '', '2011-12-27 22:38:00-08', '2011-12-27 22:38:00-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (97, 'virality', '', '2011-12-29 12:55:42-08', '2011-12-29 12:55:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (98, '', '', '2012-01-02 16:24:46-08', '2012-01-02 16:24:46-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (99, 'social networking', '', '2012-01-03 14:16:55-08', '2012-01-03 14:16:55-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (100, ' microblogging', '', '2012-01-03 14:34:14-08', '2012-01-03 14:34:14-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (101, 'pinterest', '', '2012-01-04 15:25:50-08', '2012-01-04 15:25:50-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (102, ' social curation', '', '2012-01-04 15:25:50-08', '2012-01-04 15:25:50-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (103, ' social networking', '', '2012-01-04 15:25:50-08', '2012-01-04 15:25:50-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (104, ' blogging', '', '2012-01-04 15:25:50-08', '2012-01-04 15:25:50-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (105, ' design', '', '2012-01-04 15:25:50-08', '2012-01-04 15:25:50-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (106, 'social media marketing', '', '2012-01-05 12:45:07-08', '2012-01-05 12:45:07-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (107, ' self expression', '', '2012-01-05 12:55:02-08', '2012-01-05 12:55:02-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (108, ' messaging', '', '2012-01-05 14:26:53-08', '2012-01-05 14:26:53-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (109, 'rss reader', '', '2012-01-06 10:16:04-08', '2012-01-06 10:16:04-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (110, ' news aggregation', '', '2012-01-06 10:16:04-08', '2012-01-06 10:16:04-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (111, ' curation', '', '2012-01-06 10:54:03-08', '2012-01-06 10:54:03-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (112, ' open graph', '', '2012-01-06 14:01:26-08', '2012-01-06 14:01:26-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (113, 'traditional publishing', '', '2012-01-06 14:12:41-08', '2012-01-06 14:12:41-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (114, ' content provider', '', '2012-01-06 14:12:42-08', '2012-01-06 14:12:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (115, 'content provider', '', '2012-01-06 14:19:46-08', '2012-01-06 14:19:46-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (116, 'financial publications', '', '2012-01-06 14:40:33-08', '2012-01-06 14:40:33-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (117, ' content providers', '', '2012-01-06 20:25:45-08', '2012-01-06 20:25:45-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (118, ' traditional publishing', '', '2012-01-06 20:25:45-08', '2012-01-06 20:25:45-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (119, ' mobile usage', '', '2012-01-06 20:25:45-08', '2012-01-06 20:25:45-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (120, ' mobile', '', '2012-01-06 20:49:42-08', '2012-01-06 20:49:42-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (121, ' pinning', '', '2012-01-06 20:57:15-08', '2012-01-06 20:57:15-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (122, 'modality', '', '2012-01-06 21:27:47-08', '2012-01-06 21:27:47-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (123, 'advertising', '', '2012-01-08 21:56:56-08', '2012-01-08 21:56:56-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (124, ' online advertising', '', '2012-01-08 22:40:37-08', '2012-01-08 22:40:37-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (125, 'web stats', '', '2012-01-09 10:11:07-08', '2012-01-09 10:11:07-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (126, 'trending content', '', '2012-01-09 13:25:57-08', '2012-01-09 13:25:57-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (127, 'meme aggregation', '', '2012-01-09 13:28:36-08', '2012-01-09 13:28:36-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (128, ' virality', '', '2012-01-09 13:37:59-08', '2012-01-09 13:37:59-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (129, 'mobile', '', '2012-01-09 13:52:32-08', '2012-01-09 13:52:32-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (130, ' mobile apps', '', '2012-01-09 13:52:32-08', '2012-01-09 13:52:32-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (131, ' facebook', '', '2012-01-09 14:55:18-08', '2012-01-09 14:55:18-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (132, ' social media', '', '2012-01-09 14:55:18-08', '2012-01-09 14:55:18-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (133, 'customer acquisition', '', '2012-01-09 15:16:52-08', '2012-01-09 15:16:52-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (134, 'paywall', '', '2012-01-10 08:56:47-08', '2012-01-10 08:56:47-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (135, 'online advertising revenue', '', '2012-01-10 09:05:19-08', '2012-01-10 09:05:19-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (136, 'online audience', '', '2012-01-10 09:36:57-08', '2012-01-10 09:36:57-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (137, 'social entertainment', '', '2012-01-11 09:36:40-08', '2012-01-11 09:36:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (138, ' second screen', '', '2012-01-11 09:36:40-08', '2012-01-11 09:36:40-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (139, 'social tv', '', '2012-01-11 09:50:35-08', '2012-01-11 09:50:35-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (140, ' natural language processing', '', '2012-01-11 09:50:35-08', '2012-01-11 09:50:35-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (141, 'app recommendation', '', '2012-01-13 10:10:48-08', '2012-01-13 10:10:48-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (142, 'app curation', '', '2012-01-13 11:19:01-08', '2012-01-13 11:19:01-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (143, 'app revenue', '', '2012-01-13 11:50:01-08', '2012-01-13 11:50:01-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (144, ' app market', '', '2012-01-13 11:50:01-08', '2012-01-13 11:50:01-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (145, ' tumblr', '', '2012-01-13 13:08:00-08', '2012-01-13 13:08:00-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (146, ' web traffic', '', '2012-01-13 13:08:00-08', '2012-01-13 13:08:00-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (147, 'launch', '', '2012-01-14 17:16:23-08', '2012-01-14 17:16:23-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (148, 'financing', '', '2012-01-14 17:30:44-08', '2012-01-14 17:30:44-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (149, 'self expression', '', '2012-01-14 17:58:12-08', '2012-01-14 17:58:12-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (150, 'subscription', '', '2012-01-14 19:08:57-08', '2012-01-14 19:08:57-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (151, 'definition', '', '2012-01-14 19:14:34-08', '2012-01-14 19:14:34-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (152, ' open platform', '', '2012-01-14 19:14:34-08', '2012-01-14 19:14:34-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (153, ' platform', '', '2012-01-14 19:14:34-08', '2012-01-14 19:14:34-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (154, 'social intelligence', '', '2012-01-14 20:26:30-08', '2012-01-14 20:26:30-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (155, ' social search', '', '2012-01-14 20:26:30-08', '2012-01-14 20:26:30-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (156, 'discovery engine', '', '2012-01-14 20:35:56-08', '2012-01-14 20:35:56-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (157, ' social networks', '', '2012-01-16 13:03:53-08', '2012-01-16 13:03:53-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (158, ' twitter', '', '2012-01-16 13:11:48-08', '2012-01-16 13:11:48-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (159, 'photo sharing', '', '2012-01-16 13:46:05-08', '2012-01-16 13:46:05-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (160, ' social network', '', '2012-01-16 13:46:05-08', '2012-01-16 13:46:05-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (161, ' advertising stats', '', '2012-01-16 13:48:10-08', '2012-01-16 13:48:10-08');
INSERT INTO market_tag (id, name, description, created, modified) VALUES (162, 'quarterly report', '', '2012-01-18 11:44:29-08', '2012-01-18 11:44:29-08');


--
-- TOC entry 2389 (class 2606 OID 19020)
-- Dependencies: 166 166
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2385 (class 2606 OID 19005)
-- Dependencies: 164 164 164
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 2387 (class 2606 OID 19003)
-- Dependencies: 164 164
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 19018)
-- Dependencies: 166 166
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 19086)
-- Dependencies: 174 174
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 18995)
-- Dependencies: 162 162 162
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 2383 (class 2606 OID 18993)
-- Dependencies: 162 162
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 19048)
-- Dependencies: 170 170
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 19050)
-- Dependencies: 170 170 170
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 2401 (class 2606 OID 19063)
-- Dependencies: 172 172
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 19033)
-- Dependencies: 168 168
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 19035)
-- Dependencies: 168 168 168
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 2403 (class 2606 OID 19065)
-- Dependencies: 172 172
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2415 (class 2606 OID 19134)
-- Dependencies: 181 181
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 19101)
-- Dependencies: 176 176 176
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- TOC entry 2409 (class 2606 OID 19099)
-- Dependencies: 176 176
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 19114)
-- Dependencies: 177 177
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2413 (class 2606 OID 19122)
-- Dependencies: 179 179
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 19472)
-- Dependencies: 221 221 221
-- Name: market_businessmodel_comments_businessmodel_id_comment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_businessmodel_comments
    ADD CONSTRAINT market_businessmodel_comments_businessmodel_id_comment_id_key UNIQUE (businessmodel_id, comment_id);


--
-- TOC entry 2471 (class 2606 OID 19470)
-- Dependencies: 221 221
-- Name: market_businessmodel_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_businessmodel_comments
    ADD CONSTRAINT market_businessmodel_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 19488)
-- Dependencies: 223 223
-- Name: market_businessmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_businessmodel
    ADD CONSTRAINT market_businessmodel_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 19504)
-- Dependencies: 225 225
-- Name: market_businessmodeldetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_businessmodeldetails
    ADD CONSTRAINT market_businessmodeldetails_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 19155)
-- Dependencies: 183 183
-- Name: market_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_comment
    ADD CONSTRAINT market_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 19215)
-- Dependencies: 193 193 193
-- Name: market_company_ecosystem_company_id_ecosystem_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_company_ecosystem
    ADD CONSTRAINT market_company_ecosystem_company_id_ecosystem_id_key UNIQUE (company_id, ecosystem_id);


--
-- TOC entry 2431 (class 2606 OID 19213)
-- Dependencies: 193 193
-- Name: market_company_ecosystem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_company_ecosystem
    ADD CONSTRAINT market_company_ecosystem_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 19241)
-- Dependencies: 197 197
-- Name: market_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_company
    ADD CONSTRAINT market_company_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 19225)
-- Dependencies: 195 195 195
-- Name: market_company_segments_company_id_segment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_company_segments
    ADD CONSTRAINT market_company_segments_company_id_segment_id_key UNIQUE (company_id, segment_id);


--
-- TOC entry 2435 (class 2606 OID 19223)
-- Dependencies: 195 195
-- Name: market_company_segments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_company_segments
    ADD CONSTRAINT market_company_segments_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 19200)
-- Dependencies: 191 191 191
-- Name: market_company_tags_company_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_company_tags
    ADD CONSTRAINT market_company_tags_company_id_tag_id_key UNIQUE (company_id, tag_id);


--
-- TOC entry 2427 (class 2606 OID 19198)
-- Dependencies: 191 191
-- Name: market_company_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_company_tags
    ADD CONSTRAINT market_company_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 19421)
-- Dependencies: 215 215
-- Name: market_ecosystem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_ecosystem
    ADD CONSTRAINT market_ecosystem_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 19168)
-- Dependencies: 185 185
-- Name: market_exit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_exit
    ADD CONSTRAINT market_exit_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 19318)
-- Dependencies: 203 203
-- Name: market_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_feature
    ADD CONSTRAINT market_feature_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19442)
-- Dependencies: 219 219
-- Name: market_metric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_metric
    ADD CONSTRAINT market_metric_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 19434)
-- Dependencies: 217 217
-- Name: market_metrictype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_metrictype
    ADD CONSTRAINT market_metrictype_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 19302)
-- Dependencies: 201 201
-- Name: market_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_product
    ADD CONSTRAINT market_product_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 19284)
-- Dependencies: 199 199
-- Name: market_product_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_product_tags
    ADD CONSTRAINT market_product_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 19286)
-- Dependencies: 199 199 199
-- Name: market_product_tags_product_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_product_tags
    ADD CONSTRAINT market_product_tags_product_id_tag_id_key UNIQUE (product_id, tag_id);


--
-- TOC entry 2451 (class 2606 OID 19344)
-- Dependencies: 207 207
-- Name: market_productfeature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_productfeature
    ADD CONSTRAINT market_productfeature_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 19326)
-- Dependencies: 205 205
-- Name: market_productfeature_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_productfeature_tags
    ADD CONSTRAINT market_productfeature_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 19328)
-- Dependencies: 205 205 205
-- Name: market_productfeature_tags_productfeature_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_productfeature_tags
    ADD CONSTRAINT market_productfeature_tags_productfeature_id_tag_id_key UNIQUE (productfeature_id, tag_id);


--
-- TOC entry 2485 (class 2606 OID 19552)
-- Dependencies: 231 231
-- Name: market_report_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_report_companies
    ADD CONSTRAINT market_report_companies_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 19554)
-- Dependencies: 231 231 231
-- Name: market_report_companies_report_id_company_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_report_companies
    ADD CONSTRAINT market_report_companies_report_id_company_id_key UNIQUE (report_id, company_id);


--
-- TOC entry 2489 (class 2606 OID 19570)
-- Dependencies: 233 233
-- Name: market_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_report
    ADD CONSTRAINT market_report_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 19537)
-- Dependencies: 229 229
-- Name: market_report_segments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_report_segments
    ADD CONSTRAINT market_report_segments_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 19539)
-- Dependencies: 229 229 229
-- Name: market_report_segments_report_id_segment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_report_segments
    ADD CONSTRAINT market_report_segments_report_id_segment_id_key UNIQUE (report_id, segment_id);


--
-- TOC entry 2477 (class 2606 OID 19522)
-- Dependencies: 227 227
-- Name: market_report_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_report_tags
    ADD CONSTRAINT market_report_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 19524)
-- Dependencies: 227 227 227
-- Name: market_report_tags_report_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_report_tags
    ADD CONSTRAINT market_report_tags_report_id_tag_id_key UNIQUE (report_id, tag_id);


--
-- TOC entry 2423 (class 2606 OID 19190)
-- Dependencies: 189 189
-- Name: market_segment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_segment
    ADD CONSTRAINT market_segment_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 19367)
-- Dependencies: 209 209
-- Name: market_source_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_source_company
    ADD CONSTRAINT market_source_company_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 19369)
-- Dependencies: 209 209 209
-- Name: market_source_company_source_id_company_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_source_company
    ADD CONSTRAINT market_source_company_source_id_company_id_key UNIQUE (source_id, company_id);


--
-- TOC entry 2461 (class 2606 OID 19400)
-- Dependencies: 213 213
-- Name: market_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_source
    ADD CONSTRAINT market_source_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 19382)
-- Dependencies: 211 211
-- Name: market_source_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_source_tags
    ADD CONSTRAINT market_source_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 19384)
-- Dependencies: 211 211 211
-- Name: market_source_tags_source_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_source_tags
    ADD CONSTRAINT market_source_tags_source_id_tag_id_key UNIQUE (source_id, tag_id);


--
-- TOC entry 2421 (class 2606 OID 19179)
-- Dependencies: 187 187
-- Name: market_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY market_tag
    ADD CONSTRAINT market_tag_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 19252)
-- Dependencies: 2436 185 197
-- Name: acquirer_id_refs_id_27ed64d7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_exit
    ADD CONSTRAINT acquirer_id_refs_id_27ed64d7 FOREIGN KEY (acquirer_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2491 (class 2606 OID 19006)
-- Dependencies: 164 162 2382
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2497 (class 2606 OID 19087)
-- Dependencies: 2400 172 174
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2495 (class 2606 OID 19051)
-- Dependencies: 166 2390 170
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2493 (class 2606 OID 19036)
-- Dependencies: 168 162 2382
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2526 (class 2606 OID 19489)
-- Dependencies: 2472 223 221
-- Name: businessmodel_id_refs_id_dd753d81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_businessmodel_comments
    ADD CONSTRAINT businessmodel_id_refs_id_dd753d81 FOREIGN KEY (businessmodel_id) REFERENCES market_businessmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2501 (class 2606 OID 19242)
-- Dependencies: 2436 197 183
-- Name: company_id_refs_id_277314a1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_comment
    ADD CONSTRAINT company_id_refs_id_277314a1 FOREIGN KEY (company_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2502 (class 2606 OID 19247)
-- Dependencies: 2436 185 197
-- Name: company_id_refs_id_27ed64d7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_exit
    ADD CONSTRAINT company_id_refs_id_27ed64d7 FOREIGN KEY (company_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2509 (class 2606 OID 19267)
-- Dependencies: 2436 197 195
-- Name: company_id_refs_id_aa132695; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_company_segments
    ADD CONSTRAINT company_id_refs_id_aa132695 FOREIGN KEY (company_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2506 (class 2606 OID 19262)
-- Dependencies: 2436 193 197
-- Name: company_id_refs_id_c5e948a4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_company_ecosystem
    ADD CONSTRAINT company_id_refs_id_c5e948a4 FOREIGN KEY (company_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2505 (class 2606 OID 19257)
-- Dependencies: 191 197 2436
-- Name: company_id_refs_id_e5d7a5be; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_company_tags
    ADD CONSTRAINT company_id_refs_id_e5d7a5be FOREIGN KEY (company_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2490 (class 2606 OID 19102)
-- Dependencies: 176 2408 162
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2499 (class 2606 OID 19140)
-- Dependencies: 176 2408 181
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2498 (class 2606 OID 19135)
-- Dependencies: 172 181 2400
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2507 (class 2606 OID 19422)
-- Dependencies: 193 215 2462
-- Name: ecosystem_id_refs_id_7adbe209; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_company_ecosystem
    ADD CONSTRAINT ecosystem_id_refs_id_7adbe209 FOREIGN KEY (ecosystem_id) REFERENCES market_ecosystem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2492 (class 2606 OID 19021)
-- Dependencies: 2390 166 164
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2525 (class 2606 OID 19473)
-- Dependencies: 2416 183 221
-- Name: market_businessmodel_comments_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_businessmodel_comments
    ADD CONSTRAINT market_businessmodel_comments_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES market_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2528 (class 2606 OID 19510)
-- Dependencies: 197 2436 225
-- Name: market_businessmodeldetails_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_businessmodeldetails
    ADD CONSTRAINT market_businessmodeldetails_company_id_fkey FOREIGN KEY (company_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2527 (class 2606 OID 19505)
-- Dependencies: 223 225 2472
-- Name: market_businessmodeldetails_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_businessmodeldetails
    ADD CONSTRAINT market_businessmodeldetails_model_id_fkey FOREIGN KEY (model_id) REFERENCES market_businessmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2500 (class 2606 OID 19156)
-- Dependencies: 2400 183 172
-- Name: market_comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_comment
    ADD CONSTRAINT market_comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2508 (class 2606 OID 19226)
-- Dependencies: 2422 195 189
-- Name: market_company_segments_segment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_company_segments
    ADD CONSTRAINT market_company_segments_segment_id_fkey FOREIGN KEY (segment_id) REFERENCES market_segment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2504 (class 2606 OID 19201)
-- Dependencies: 191 2420 187
-- Name: market_company_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_company_tags
    ADD CONSTRAINT market_company_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES market_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2521 (class 2606 OID 19443)
-- Dependencies: 217 219 2464
-- Name: market_metric_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_metric
    ADD CONSTRAINT market_metric_category_id_fkey FOREIGN KEY (category_id) REFERENCES market_metrictype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2523 (class 2606 OID 19453)
-- Dependencies: 197 2436 219
-- Name: market_metric_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_metric
    ADD CONSTRAINT market_metric_company_id_fkey FOREIGN KEY (company_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2522 (class 2606 OID 19448)
-- Dependencies: 201 2442 219
-- Name: market_metric_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_metric
    ADD CONSTRAINT market_metric_product_id_fkey FOREIGN KEY (product_id) REFERENCES market_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2524 (class 2606 OID 19458)
-- Dependencies: 219 2460 213
-- Name: market_metric_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_metric
    ADD CONSTRAINT market_metric_source_id_fkey FOREIGN KEY (source_id) REFERENCES market_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2511 (class 2606 OID 19287)
-- Dependencies: 2420 187 199
-- Name: market_product_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_product_tags
    ADD CONSTRAINT market_product_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES market_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2516 (class 2606 OID 19350)
-- Dependencies: 203 207 2444
-- Name: market_productfeature_feature_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_productfeature
    ADD CONSTRAINT market_productfeature_feature_id_fkey FOREIGN KEY (feature_id) REFERENCES market_feature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2515 (class 2606 OID 19345)
-- Dependencies: 207 2442 201
-- Name: market_productfeature_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_productfeature
    ADD CONSTRAINT market_productfeature_product_id_fkey FOREIGN KEY (product_id) REFERENCES market_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2513 (class 2606 OID 19329)
-- Dependencies: 2420 187 205
-- Name: market_productfeature_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_productfeature_tags
    ADD CONSTRAINT market_productfeature_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES market_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2533 (class 2606 OID 19555)
-- Dependencies: 197 231 2436
-- Name: market_report_companies_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_report_companies
    ADD CONSTRAINT market_report_companies_company_id_fkey FOREIGN KEY (company_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2531 (class 2606 OID 19540)
-- Dependencies: 229 189 2422
-- Name: market_report_segments_segment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_report_segments
    ADD CONSTRAINT market_report_segments_segment_id_fkey FOREIGN KEY (segment_id) REFERENCES market_segment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2529 (class 2606 OID 19525)
-- Dependencies: 187 227 2420
-- Name: market_report_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_report_tags
    ADD CONSTRAINT market_report_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES market_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2517 (class 2606 OID 19370)
-- Dependencies: 209 197 2436
-- Name: market_source_company_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_source_company
    ADD CONSTRAINT market_source_company_company_id_fkey FOREIGN KEY (company_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2519 (class 2606 OID 19385)
-- Dependencies: 187 211 2420
-- Name: market_source_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_source_tags
    ADD CONSTRAINT market_source_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES market_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2510 (class 2606 OID 19272)
-- Dependencies: 197 2436 197
-- Name: parent_id_refs_id_fb936167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_company
    ADD CONSTRAINT parent_id_refs_id_fb936167 FOREIGN KEY (parent_id) REFERENCES market_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2512 (class 2606 OID 19303)
-- Dependencies: 201 199 2442
-- Name: product_id_refs_id_47e5eb02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_product_tags
    ADD CONSTRAINT product_id_refs_id_47e5eb02 FOREIGN KEY (product_id) REFERENCES market_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2514 (class 2606 OID 19355)
-- Dependencies: 2450 205 207
-- Name: productfeature_id_refs_id_db1ea0a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_productfeature_tags
    ADD CONSTRAINT productfeature_id_refs_id_db1ea0a FOREIGN KEY (productfeature_id) REFERENCES market_productfeature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2532 (class 2606 OID 19576)
-- Dependencies: 229 2488 233
-- Name: report_id_refs_id_878ff517; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_report_segments
    ADD CONSTRAINT report_id_refs_id_878ff517 FOREIGN KEY (report_id) REFERENCES market_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2530 (class 2606 OID 19571)
-- Dependencies: 2488 233 227
-- Name: report_id_refs_id_a2da900e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_report_tags
    ADD CONSTRAINT report_id_refs_id_a2da900e FOREIGN KEY (report_id) REFERENCES market_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2534 (class 2606 OID 19581)
-- Dependencies: 2488 231 233
-- Name: report_id_refs_id_b35ea171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_report_companies
    ADD CONSTRAINT report_id_refs_id_b35ea171 FOREIGN KEY (report_id) REFERENCES market_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2520 (class 2606 OID 19406)
-- Dependencies: 211 2460 213
-- Name: source_id_refs_id_1f20cb66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_source_tags
    ADD CONSTRAINT source_id_refs_id_1f20cb66 FOREIGN KEY (source_id) REFERENCES market_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2518 (class 2606 OID 19401)
-- Dependencies: 2460 209 213
-- Name: source_id_refs_id_7d97ba91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_source_company
    ADD CONSTRAINT source_id_refs_id_7d97ba91 FOREIGN KEY (source_id) REFERENCES market_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2496 (class 2606 OID 19071)
-- Dependencies: 170 172 2400
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2494 (class 2606 OID 19066)
-- Dependencies: 2400 172 168
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2576 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-01-20 11:42:29 PST

--
-- PostgreSQL database dump complete
--

