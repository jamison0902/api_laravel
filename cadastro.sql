PGDMP                      |            cosis    15.4 (Debian 15.4-1.pgdg120+1)    17.0 "    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            <           1262    16458    cosis    DATABASE     p   CREATE DATABASE cosis WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE cosis;
                     postgres    false                        2615    16459    cadastro    SCHEMA        CREATE SCHEMA cadastro;
    DROP SCHEMA cadastro;
                     postgres    false            �            1259    16621 	   enderecos    TABLE     a  CREATE TABLE cadastro.enderecos (
    id integer NOT NULL,
    cep character varying(8) NOT NULL,
    logradouro character varying(255) NOT NULL,
    bairro character varying(100) NOT NULL,
    cidade character varying(100) NOT NULL,
    estado character(2) NOT NULL,
    numero character varying(10) NOT NULL,
    complemento character varying(255)
);
    DROP TABLE cadastro.enderecos;
       cadastro         heap r       postgres    false    6            �            1259    16620    enderecos_id_seq    SEQUENCE     �   CREATE SEQUENCE cadastro.enderecos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE cadastro.enderecos_id_seq;
       cadastro               postgres    false    6    220            =           0    0    enderecos_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE cadastro.enderecos_id_seq OWNED BY cadastro.enderecos.id;
          cadastro               postgres    false    219            �            1259    16597    perfis    TABLE     d   CREATE TABLE cadastro.perfis (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);
    DROP TABLE cadastro.perfis;
       cadastro         heap r       postgres    false    6            �            1259    16596    perfis_id_seq    SEQUENCE     �   CREATE SEQUENCE cadastro.perfis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE cadastro.perfis_id_seq;
       cadastro               postgres    false    6    216            >           0    0    perfis_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE cadastro.perfis_id_seq OWNED BY cadastro.perfis.id;
          cadastro               postgres    false    215            �            1259    16629    usuario_endereco    TABLE     n   CREATE TABLE cadastro.usuario_endereco (
    usuario_id integer NOT NULL,
    endereco_id integer NOT NULL
);
 &   DROP TABLE cadastro.usuario_endereco;
       cadastro         heap r       postgres    false    6            �            1259    16604    usuarios    TABLE     e  CREATE TABLE cadastro.usuarios (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    cpf character varying(11) NOT NULL,
    perfil_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE cadastro.usuarios;
       cadastro         heap r       postgres    false    6            �            1259    16603    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE cadastro.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE cadastro.usuarios_id_seq;
       cadastro               postgres    false    218    6            ?           0    0    usuarios_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE cadastro.usuarios_id_seq OWNED BY cadastro.usuarios.id;
          cadastro               postgres    false    217            �           2604    16624    enderecos id    DEFAULT     p   ALTER TABLE ONLY cadastro.enderecos ALTER COLUMN id SET DEFAULT nextval('cadastro.enderecos_id_seq'::regclass);
 =   ALTER TABLE cadastro.enderecos ALTER COLUMN id DROP DEFAULT;
       cadastro               postgres    false    220    219    220            �           2604    16600 	   perfis id    DEFAULT     j   ALTER TABLE ONLY cadastro.perfis ALTER COLUMN id SET DEFAULT nextval('cadastro.perfis_id_seq'::regclass);
 :   ALTER TABLE cadastro.perfis ALTER COLUMN id DROP DEFAULT;
       cadastro               postgres    false    215    216    216            �           2604    16607    usuarios id    DEFAULT     n   ALTER TABLE ONLY cadastro.usuarios ALTER COLUMN id SET DEFAULT nextval('cadastro.usuarios_id_seq'::regclass);
 <   ALTER TABLE cadastro.usuarios ALTER COLUMN id DROP DEFAULT;
       cadastro               postgres    false    217    218    218            5          0    16621 	   enderecos 
   TABLE DATA           g   COPY cadastro.enderecos (id, cep, logradouro, bairro, cidade, estado, numero, complemento) FROM stdin;
    cadastro               postgres    false    220   (       1          0    16597    perfis 
   TABLE DATA           ,   COPY cadastro.perfis (id, nome) FROM stdin;
    cadastro               postgres    false    216   �)       6          0    16629    usuario_endereco 
   TABLE DATA           E   COPY cadastro.usuario_endereco (usuario_id, endereco_id) FROM stdin;
    cadastro               postgres    false    221   *       3          0    16604    usuarios 
   TABLE DATA           ]   COPY cadastro.usuarios (id, nome, email, cpf, perfil_id, created_at, updated_at) FROM stdin;
    cadastro               postgres    false    218   M*       @           0    0    enderecos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('cadastro.enderecos_id_seq', 22, true);
          cadastro               postgres    false    219            A           0    0    perfis_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('cadastro.perfis_id_seq', 3, true);
          cadastro               postgres    false    215            B           0    0    usuarios_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('cadastro.usuarios_id_seq', 22, true);
          cadastro               postgres    false    217            �           2606    16628    enderecos enderecos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY cadastro.enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY cadastro.enderecos DROP CONSTRAINT enderecos_pkey;
       cadastro                 postgres    false    220            �           2606    16602    perfis perfis_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY cadastro.perfis
    ADD CONSTRAINT perfis_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY cadastro.perfis DROP CONSTRAINT perfis_pkey;
       cadastro                 postgres    false    216            �           2606    16633 &   usuario_endereco usuario_endereco_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY cadastro.usuario_endereco
    ADD CONSTRAINT usuario_endereco_pkey PRIMARY KEY (usuario_id, endereco_id);
 R   ALTER TABLE ONLY cadastro.usuario_endereco DROP CONSTRAINT usuario_endereco_pkey;
       cadastro                 postgres    false    221    221            �           2606    16614    usuarios usuarios_cpf_key 
   CONSTRAINT     U   ALTER TABLE ONLY cadastro.usuarios
    ADD CONSTRAINT usuarios_cpf_key UNIQUE (cpf);
 E   ALTER TABLE ONLY cadastro.usuarios DROP CONSTRAINT usuarios_cpf_key;
       cadastro                 postgres    false    218            �           2606    16612    usuarios usuarios_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY cadastro.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 G   ALTER TABLE ONLY cadastro.usuarios DROP CONSTRAINT usuarios_email_key;
       cadastro                 postgres    false    218            �           2606    16610    usuarios usuarios_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY cadastro.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY cadastro.usuarios DROP CONSTRAINT usuarios_pkey;
       cadastro                 postgres    false    218            �           2606    16639 2   usuario_endereco usuario_endereco_endereco_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY cadastro.usuario_endereco
    ADD CONSTRAINT usuario_endereco_endereco_id_fkey FOREIGN KEY (endereco_id) REFERENCES cadastro.enderecos(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY cadastro.usuario_endereco DROP CONSTRAINT usuario_endereco_endereco_id_fkey;
       cadastro               postgres    false    3228    221    220            �           2606    16634 1   usuario_endereco usuario_endereco_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY cadastro.usuario_endereco
    ADD CONSTRAINT usuario_endereco_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES cadastro.usuarios(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY cadastro.usuario_endereco DROP CONSTRAINT usuario_endereco_usuario_id_fkey;
       cadastro               postgres    false    218    3226    221            �           2606    16615     usuarios usuarios_perfil_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY cadastro.usuarios
    ADD CONSTRAINT usuarios_perfil_id_fkey FOREIGN KEY (perfil_id) REFERENCES cadastro.perfis(id);
 L   ALTER TABLE ONLY cadastro.usuarios DROP CONSTRAINT usuarios_perfil_id_fkey;
       cadastro               postgres    false    218    216    3220            5   �  x���=��0���)x�-꧴���:+X�Tی#ƘM:��"�IR�*�/���RoE�>���Lª*d&�v����`��~&4��E��Gx�/�m!����I�C��\�Uz��)�xv�A�]p�����51�ǟN<L�`�U-�'ȳT�n��>��s��:�z�/3�i���?�@8�P�"PP�y���&x���N���Al����]O�L�F���X�>�*UU�J�.*&���wL���l�t�'�7|�?$Y	e��rU�Wd7�\��F��;VON�\dа�!m^A&U�������y�j�fp�nLl��1^,9������id3^�����䠝x���a�c�}��J��ql�����-egPB��T�eص�߹��,�Zt�>���a[���М9ڮu���>I�Jt܄      1   2   x�3�tL����,.)JL�/�2�-.=��(3�˘�=�(5�$�+F��� 6�~      6   1   x�ǹ  �����C�u����!�M�<Iy��[>E��ۀ�b      3   &  x�m�MN�0F��S����o��`W��薍["d�t�S*��Q�N� -�,��-�7z��H���ߥ>B��&�a�}��-w͞zp�������J�JX.d6(}-c�cI�?�t�R��6�g�1n�'>kj��F+�B�o2��e&E�6(�<l�sm���1"��c��ǔ'�6޶Π��č`A�k���$�M�T�����ui�JT��Q� yF��:(w-c�W{5�i���Ŷ�h�Z����e.���`f�v����Xv4D��â ��Z��>��
�NmЋ?y��>5��oaV�U     