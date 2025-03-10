PGDMP     *                    z            job_vacancy    14.1    14.1 4    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    32778    job_vacancy    DATABASE     o   CREATE DATABASE job_vacancy WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE job_vacancy;
                postgres    false            S           1247    32945    role    TYPE     P   CREATE TYPE public.role AS ENUM (
    'seeker',
    'recruiter',
    'admin'
);
    DROP TYPE public.role;
       public          postgres    false            �            1259    32895    appliers    TABLE     �   CREATE TABLE public.appliers (
    applierid integer NOT NULL,
    userid integer,
    jobid integer,
    filename text NOT NULL,
    applied date DEFAULT now() NOT NULL
);
    DROP TABLE public.appliers;
       public         heap    postgres    false            �            1259    32894    appliers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.appliers_id_seq;
       public          postgres    false    218            3           0    0    appliers_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.appliers_id_seq OWNED BY public.appliers.applierid;
          public          postgres    false    217            �            1259    32923 	   companies    TABLE     n   CREATE TABLE public.companies (
    companyid integer NOT NULL,
    companyname text,
    noofjobs integer
);
    DROP TABLE public.companies;
       public         heap    postgres    false            �            1259    32922    companies_companyid_seq    SEQUENCE     �   CREATE SEQUENCE public.companies_companyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.companies_companyid_seq;
       public          postgres    false    220            4           0    0    companies_companyid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.companies_companyid_seq OWNED BY public.companies.companyid;
          public          postgres    false    219            �            1259    32873    jobs    TABLE     �  CREATE TABLE public.jobs (
    jobid integer NOT NULL,
    userid integer,
    company text,
    title text NOT NULL,
    catagory text NOT NULL,
    lev text NOT NULL,
    vacancyno integer DEFAULT 1,
    deadline date NOT NULL,
    hremail text,
    location text NOT NULL,
    skillsandqualifications text[],
    description text,
    posted date DEFAULT now() NOT NULL,
    type text,
    salary text DEFAULT 'Negotiable'::text
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    32872    jobs_jobid_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_jobid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.jobs_jobid_seq;
       public          postgres    false    216            5           0    0    jobs_jobid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.jobs_jobid_seq OWNED BY public.jobs.jobid;
          public          postgres    false    215            �            1259    32858 	   recruiter    TABLE     &  CREATE TABLE public.recruiter (
    recruiterid integer NOT NULL,
    userid integer,
    location text NOT NULL,
    noofjobs integer DEFAULT 0,
    website text,
    workemail text,
    contactno bigint NOT NULL,
    description text,
    date date DEFAULT now() NOT NULL,
    social json
);
    DROP TABLE public.recruiter;
       public         heap    postgres    false            �            1259    32857    recruiter_recid_seq    SEQUENCE     �   CREATE SEQUENCE public.recruiter_recid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.recruiter_recid_seq;
       public          postgres    false    214            6           0    0    recruiter_recid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.recruiter_recid_seq OWNED BY public.recruiter.recruiterid;
          public          postgres    false    213            �            1259    32843    seeker    TABLE     a  CREATE TABLE public.seeker (
    seekerid integer NOT NULL,
    userid integer,
    location text NOT NULL,
    jobinterest text[],
    portfolio text,
    workemail text,
    contactno bigint NOT NULL,
    currentstatus character varying(20) NOT NULL,
    description text,
    date date DEFAULT now() NOT NULL,
    currentjob text,
    social json
);
    DROP TABLE public.seeker;
       public         heap    postgres    false            �            1259    32842    seeker_sekid_seq    SEQUENCE     �   CREATE SEQUENCE public.seeker_sekid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.seeker_sekid_seq;
       public          postgres    false    212            7           0    0    seeker_sekid_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.seeker_sekid_seq OWNED BY public.seeker.seekerid;
          public          postgres    false    211            �            1259    32834    users    TABLE     �   CREATE TABLE public.users (
    userid integer NOT NULL,
    name text NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    avatar text,
    pw text NOT NULL,
    role public.role
);
    DROP TABLE public.users;
       public         heap    postgres    false    851            �            1259    32833    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    210            8           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    209            �           2604    32898    appliers applierid    DEFAULT     q   ALTER TABLE ONLY public.appliers ALTER COLUMN applierid SET DEFAULT nextval('public.appliers_id_seq'::regclass);
 A   ALTER TABLE public.appliers ALTER COLUMN applierid DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    32926    companies companyid    DEFAULT     z   ALTER TABLE ONLY public.companies ALTER COLUMN companyid SET DEFAULT nextval('public.companies_companyid_seq'::regclass);
 B   ALTER TABLE public.companies ALTER COLUMN companyid DROP DEFAULT;
       public          postgres    false    220    219    220            ~           2604    32876 
   jobs jobid    DEFAULT     h   ALTER TABLE ONLY public.jobs ALTER COLUMN jobid SET DEFAULT nextval('public.jobs_jobid_seq'::regclass);
 9   ALTER TABLE public.jobs ALTER COLUMN jobid DROP DEFAULT;
       public          postgres    false    215    216    216            {           2604    32861    recruiter recruiterid    DEFAULT     x   ALTER TABLE ONLY public.recruiter ALTER COLUMN recruiterid SET DEFAULT nextval('public.recruiter_recid_seq'::regclass);
 D   ALTER TABLE public.recruiter ALTER COLUMN recruiterid DROP DEFAULT;
       public          postgres    false    214    213    214            y           2604    32846    seeker seekerid    DEFAULT     o   ALTER TABLE ONLY public.seeker ALTER COLUMN seekerid SET DEFAULT nextval('public.seeker_sekid_seq'::regclass);
 >   ALTER TABLE public.seeker ALTER COLUMN seekerid DROP DEFAULT;
       public          postgres    false    212    211    212            x           2604    32837    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    209    210    210            *          0    32895    appliers 
   TABLE DATA           O   COPY public.appliers (applierid, userid, jobid, filename, applied) FROM stdin;
    public          postgres    false    218   <       ,          0    32923 	   companies 
   TABLE DATA           E   COPY public.companies (companyid, companyname, noofjobs) FROM stdin;
    public          postgres    false    220   ;<       (          0    32873    jobs 
   TABLE DATA           �   COPY public.jobs (jobid, userid, company, title, catagory, lev, vacancyno, deadline, hremail, location, skillsandqualifications, description, posted, type, salary) FROM stdin;
    public          postgres    false    216   X<       &          0    32858 	   recruiter 
   TABLE DATA           �   COPY public.recruiter (recruiterid, userid, location, noofjobs, website, workemail, contactno, description, date, social) FROM stdin;
    public          postgres    false    214   u<       $          0    32843    seeker 
   TABLE DATA           �   COPY public.seeker (seekerid, userid, location, jobinterest, portfolio, workemail, contactno, currentstatus, description, date, currentjob, social) FROM stdin;
    public          postgres    false    212   �<       "          0    32834    users 
   TABLE DATA           P   COPY public.users (userid, name, username, email, avatar, pw, role) FROM stdin;
    public          postgres    false    210   �<       9           0    0    appliers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.appliers_id_seq', 3, true);
          public          postgres    false    217            :           0    0    companies_companyid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.companies_companyid_seq', 2, true);
          public          postgres    false    219            ;           0    0    jobs_jobid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.jobs_jobid_seq', 3, true);
          public          postgres    false    215            <           0    0    recruiter_recid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.recruiter_recid_seq', 2, true);
          public          postgres    false    213            =           0    0    seeker_sekid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.seeker_sekid_seq', 3, true);
          public          postgres    false    211            >           0    0    users_userid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.users_userid_seq', 5, true);
          public          postgres    false    209            �           2606    32901    appliers appliers_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.appliers
    ADD CONSTRAINT appliers_pkey PRIMARY KEY (applierid);
 @   ALTER TABLE ONLY public.appliers DROP CONSTRAINT appliers_pkey;
       public            postgres    false    218            �           2606    32930    companies companies_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (companyid);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            postgres    false    220            �           2606    32881    jobs jobs_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (jobid);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    216            �           2606    32866    recruiter recruiter_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.recruiter
    ADD CONSTRAINT recruiter_pkey PRIMARY KEY (recruiterid);
 B   ALTER TABLE ONLY public.recruiter DROP CONSTRAINT recruiter_pkey;
       public            postgres    false    214            �           2606    32851    seeker seeker_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.seeker
    ADD CONSTRAINT seeker_pkey PRIMARY KEY (seekerid);
 <   ALTER TABLE ONLY public.seeker DROP CONSTRAINT seeker_pkey;
       public            postgres    false    212            �           2606    32841    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    210            �           2606    32907    appliers fk_appliers_jobs    FK CONSTRAINT     x   ALTER TABLE ONLY public.appliers
    ADD CONSTRAINT fk_appliers_jobs FOREIGN KEY (jobid) REFERENCES public.jobs(jobid);
 C   ALTER TABLE ONLY public.appliers DROP CONSTRAINT fk_appliers_jobs;
       public          postgres    false    216    218    3212            �           2606    32902    appliers fk_appliers_users    FK CONSTRAINT     |   ALTER TABLE ONLY public.appliers
    ADD CONSTRAINT fk_appliers_users FOREIGN KEY (userid) REFERENCES public.users(userid);
 D   ALTER TABLE ONLY public.appliers DROP CONSTRAINT fk_appliers_users;
       public          postgres    false    210    3206    218            �           2606    32882    jobs fk_jobs_users    FK CONSTRAINT     t   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT fk_jobs_users FOREIGN KEY (userid) REFERENCES public.users(userid);
 <   ALTER TABLE ONLY public.jobs DROP CONSTRAINT fk_jobs_users;
       public          postgres    false    210    216    3206            �           2606    32867    recruiter fk_recruiter_users    FK CONSTRAINT     ~   ALTER TABLE ONLY public.recruiter
    ADD CONSTRAINT fk_recruiter_users FOREIGN KEY (userid) REFERENCES public.users(userid);
 F   ALTER TABLE ONLY public.recruiter DROP CONSTRAINT fk_recruiter_users;
       public          postgres    false    214    3206    210            �           2606    32852    seeker fk_seeker_users    FK CONSTRAINT     x   ALTER TABLE ONLY public.seeker
    ADD CONSTRAINT fk_seeker_users FOREIGN KEY (userid) REFERENCES public.users(userid);
 @   ALTER TABLE ONLY public.seeker DROP CONSTRAINT fk_seeker_users;
       public          postgres    false    3206    212    210            *      x������ � �      ,      x������ � �      (      x������ � �      &      x������ � �      $      x������ � �      "      x������ � �     