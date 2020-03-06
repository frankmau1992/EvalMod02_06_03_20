/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     06-03-2020 12:45:58                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_FUNCION_OBTIENE_PROMOCIO') then
    alter table FUNCION
       delete foreign key FK_FUNCION_OBTIENE_PROMOCIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FUNCION_REPRODUCE_PELICULA') then
    alter table FUNCION
       delete foreign key FK_FUNCION_REPRODUCE_PELICULA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_GENERA_GENERA_SALA') then
    alter table GENERA
       delete foreign key FK_GENERA_GENERA_SALA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_GENERA_GENERA2_FUNCION') then
    alter table GENERA
       delete foreign key FK_GENERA_GENERA2_FUNCION
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_OPINION_SE_GENERA_PELICULA') then
    alter table OPINION
       delete foreign key FK_OPINION_SE_GENERA_PELICULA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SALA_POSEE_CINE') then
    alter table SALA
       delete foreign key FK_SALA_POSEE_CINE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TIENE_TIENE_PELICULA') then
    alter table TIENE
       delete foreign key FK_TIENE_TIENE_PELICULA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TIENE_TIENE2_DIRECTOR') then
    alter table TIENE
       delete foreign key FK_TIENE_TIENE2_DIRECTOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TIENE_TA_TIENE_TAM_REPARTO') then
    alter table TIENE_TAMBIEN
       delete foreign key FK_TIENE_TA_TIENE_TAM_REPARTO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TIENE_TA_TIENE_TAM_PELICULA') then
    alter table TIENE_TAMBIEN
       delete foreign key FK_TIENE_TA_TIENE_TAM_PELICULA
end if;

drop index if exists CINE.CINE_PK;

drop table if exists CINE;

drop index if exists DIRECTOR.DIRECTOR_PK;

drop table if exists DIRECTOR;

drop index if exists FUNCION.OBTIENE_FK;

drop index if exists FUNCION.REPRODUCE_FK;

drop index if exists FUNCION.FUNCION_PK;

drop table if exists FUNCION;

drop index if exists GENERA.GENERA2_FK;

drop index if exists GENERA.GENERA_PK;

drop table if exists GENERA;

drop index if exists OPINION.SE_GENERA_FK;

drop index if exists OPINION.OPINION_PK;

drop table if exists OPINION;

drop index if exists PELICULA.PELICULA_PK;

drop table if exists PELICULA;

drop index if exists PROMOCION.PROMOCION_PK;

drop table if exists PROMOCION;

drop index if exists REPARTO.REPARTO_PK;

drop table if exists REPARTO;

drop index if exists SALA.POSEE_FK;

drop index if exists SALA.SALA_PK;

drop table if exists SALA;

drop index if exists TIENE.TIENE2_FK;

drop index if exists TIENE.TIENE_PK;

drop table if exists TIENE;

drop index if exists TIENE_TAMBIEN.TIENE_TAMBIEN2_FK;

drop index if exists TIENE_TAMBIEN.TIENE_TAMBIEN_PK;

drop table if exists TIENE_TAMBIEN;

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
create table CINE 
(
   NOMBRE_CINE          varchar(50)                    not null,
   DIRECCION            varchar(50)                    null,
   TELEFONO             integer                        null,
   constraint PK_CINE primary key (NOMBRE_CINE)
);

/*==============================================================*/
/* Index: CINE_PK                                               */
/*==============================================================*/
create unique index CINE_PK on CINE (
NOMBRE_CINE ASC
);

/*==============================================================*/
/* Table: DIRECTOR                                              */
/*==============================================================*/
create table DIRECTOR 
(
   NOMBRE_ACTOR2        varchar(50)                    not null,
   NAC_DIRECTOR         varchar(30)                    not null,
   CANT_PELICULAS_DIR   integer                        not null,
   constraint PK_DIRECTOR primary key (NOMBRE_ACTOR2)
);

/*==============================================================*/
/* Index: DIRECTOR_PK                                           */
/*==============================================================*/
create unique index DIRECTOR_PK on DIRECTOR (
NOMBRE_ACTOR2 ASC
);

/*==============================================================*/
/* Table: FUNCION                                               */
/*==============================================================*/
create table FUNCION 
(
   ID_FUNCION           integer                        not null,
   ID_PELICULA          varchar(50)                    not null,
   TIPO_DESCUENTO       integer                        not null,
   DIA_FUNCION          date                           not null,
   HORA_FUNCION         time                           not null,
   constraint PK_FUNCION primary key (ID_FUNCION)
);

/*==============================================================*/
/* Index: FUNCION_PK                                            */
/*==============================================================*/
create unique index FUNCION_PK on FUNCION (
ID_FUNCION ASC
);

/*==============================================================*/
/* Index: REPRODUCE_FK                                          */
/*==============================================================*/
create index REPRODUCE_FK on FUNCION (
ID_PELICULA ASC
);

/*==============================================================*/
/* Index: OBTIENE_FK                                            */
/*==============================================================*/
create index OBTIENE_FK on FUNCION (
TIPO_DESCUENTO ASC
);

/*==============================================================*/
/* Table: GENERA                                                */
/*==============================================================*/
create table GENERA 
(
   NUMERO_SALA          integer                        not null,
   ID_FUNCION           integer                        not null,
   constraint PK_GENERA primary key (NUMERO_SALA, ID_FUNCION)
);

/*==============================================================*/
/* Index: GENERA_PK                                             */
/*==============================================================*/
create unique index GENERA_PK on GENERA (
NUMERO_SALA ASC,
ID_FUNCION ASC
);

/*==============================================================*/
/* Index: GENERA2_FK                                            */
/*==============================================================*/
create index GENERA2_FK on GENERA (
ID_FUNCION ASC
);

/*==============================================================*/
/* Table: OPINION                                               */
/*==============================================================*/
create table OPINION 
(
   ID_OPINION           integer                        not null,
   ID_PELICULA          varchar(50)                    not null,
   NOMBRE_OPINION       varchar(30)                    null,
   EDAD_OPINION         integer                        null,
   FECHA_OPINION        date                           null,
   CALIFICACION         varchar(20)                    null,
   COMENTARIO           varchar(50)                    null,
   constraint PK_OPINION primary key (ID_OPINION)
);

/*==============================================================*/
/* Index: OPINION_PK                                            */
/*==============================================================*/
create unique index OPINION_PK on OPINION (
ID_OPINION ASC
);

/*==============================================================*/
/* Index: SE_GENERA_FK                                          */
/*==============================================================*/
create index SE_GENERA_FK on OPINION (
ID_PELICULA ASC
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA 
(
   ID_PELICULA          varchar(50)                    not null,
   SUBTITULOS           smallint                       not null,
   URL                  varchar(50)                    null,
   DURACION             time                           not null,
   FECHA_ESTRENO        date                           not null,
   RESUMEN              varchar(100)                   not null,
   TITULO_ORIGEN        varchar(50)                    not null,
   ANO_ORIGEN           date                           not null,
   PAIS_ORIGEN          varchar(30)                    not null,
   IDIOMA_ORIGEN        varchar(30)                    not null,
   GENERO               varchar(20)                    not null,
   constraint PK_PELICULA primary key (ID_PELICULA)
);

/*==============================================================*/
/* Index: PELICULA_PK                                           */
/*==============================================================*/
create unique index PELICULA_PK on PELICULA (
ID_PELICULA ASC
);

/*==============================================================*/
/* Table: PROMOCION                                             */
/*==============================================================*/
create table PROMOCION 
(
   TIPO_DESCUENTO       integer                        not null,
   DESCRIPCION_DESCUENTO varchar(50)                    not null,
   constraint PK_PROMOCION primary key (TIPO_DESCUENTO)
);

/*==============================================================*/
/* Index: PROMOCION_PK                                          */
/*==============================================================*/
create unique index PROMOCION_PK on PROMOCION (
TIPO_DESCUENTO ASC
);

/*==============================================================*/
/* Table: REPARTO                                               */
/*==============================================================*/
create table REPARTO 
(
   NOMBRE_ACTOR         varchar(50)                    not null,
   NAC_ACTOR            date                           not null,
   CANT_PELICULAS_ACT   integer                        not null,
   constraint PK_REPARTO primary key (NOMBRE_ACTOR)
);

/*==============================================================*/
/* Index: REPARTO_PK                                            */
/*==============================================================*/
create unique index REPARTO_PK on REPARTO (
NOMBRE_ACTOR ASC
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA 
(
   NUMERO_SALA          integer                        not null,
   NOMBRE_CINE          varchar(50)                    not null,
   NOMBRE_SALA          varchar(20)                    null,
   BUTACAS              integer                        null,
   constraint PK_SALA primary key (NUMERO_SALA)
);

/*==============================================================*/
/* Index: SALA_PK                                               */
/*==============================================================*/
create unique index SALA_PK on SALA (
NUMERO_SALA ASC
);

/*==============================================================*/
/* Index: POSEE_FK                                              */
/*==============================================================*/
create index POSEE_FK on SALA (
NOMBRE_CINE ASC
);

/*==============================================================*/
/* Table: TIENE                                                 */
/*==============================================================*/
create table TIENE 
(
   ID_PELICULA          varchar(50)                    not null,
   NOMBRE_ACTOR2        varchar(50)                    not null,
   constraint PK_TIENE primary key (ID_PELICULA, NOMBRE_ACTOR2)
);

/*==============================================================*/
/* Index: TIENE_PK                                              */
/*==============================================================*/
create unique index TIENE_PK on TIENE (
ID_PELICULA ASC,
NOMBRE_ACTOR2 ASC
);

/*==============================================================*/
/* Index: TIENE2_FK                                             */
/*==============================================================*/
create index TIENE2_FK on TIENE (
NOMBRE_ACTOR2 ASC
);

/*==============================================================*/
/* Table: TIENE_TAMBIEN                                         */
/*==============================================================*/
create table TIENE_TAMBIEN 
(
   NOMBRE_ACTOR         varchar(50)                    not null,
   ID_PELICULA          varchar(50)                    not null,
   constraint PK_TIENE_TAMBIEN primary key (NOMBRE_ACTOR, ID_PELICULA)
);

/*==============================================================*/
/* Index: TIENE_TAMBIEN_PK                                      */
/*==============================================================*/
create unique index TIENE_TAMBIEN_PK on TIENE_TAMBIEN (
NOMBRE_ACTOR ASC,
ID_PELICULA ASC
);

/*==============================================================*/
/* Index: TIENE_TAMBIEN2_FK                                     */
/*==============================================================*/
create index TIENE_TAMBIEN2_FK on TIENE_TAMBIEN (
ID_PELICULA ASC
);

alter table FUNCION
   add constraint FK_FUNCION_OBTIENE_PROMOCIO foreign key (TIPO_DESCUENTO)
      references PROMOCION (TIPO_DESCUENTO)
      on update restrict
      on delete restrict;

alter table FUNCION
   add constraint FK_FUNCION_REPRODUCE_PELICULA foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA)
      on update restrict
      on delete restrict;

alter table GENERA
   add constraint FK_GENERA_GENERA_SALA foreign key (NUMERO_SALA)
      references SALA (NUMERO_SALA)
      on update restrict
      on delete restrict;

alter table GENERA
   add constraint FK_GENERA_GENERA2_FUNCION foreign key (ID_FUNCION)
      references FUNCION (ID_FUNCION)
      on update restrict
      on delete restrict;

alter table OPINION
   add constraint FK_OPINION_SE_GENERA_PELICULA foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA)
      on update restrict
      on delete restrict;

alter table SALA
   add constraint FK_SALA_POSEE_CINE foreign key (NOMBRE_CINE)
      references CINE (NOMBRE_CINE)
      on update restrict
      on delete restrict;

alter table TIENE
   add constraint FK_TIENE_TIENE_PELICULA foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA)
      on update restrict
      on delete restrict;

alter table TIENE
   add constraint FK_TIENE_TIENE2_DIRECTOR foreign key (NOMBRE_ACTOR2)
      references DIRECTOR (NOMBRE_ACTOR2)
      on update restrict
      on delete restrict;

alter table TIENE_TAMBIEN
   add constraint FK_TIENE_TA_TIENE_TAM_REPARTO foreign key (NOMBRE_ACTOR)
      references REPARTO (NOMBRE_ACTOR)
      on update restrict
      on delete restrict;

alter table TIENE_TAMBIEN
   add constraint FK_TIENE_TA_TIENE_TAM_PELICULA foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA)
      on update restrict
      on delete restrict;

