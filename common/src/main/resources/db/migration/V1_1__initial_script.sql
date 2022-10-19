create sequence if not exists roles_id_seq
    as integer;

alter sequence roles_id_seq owner to postgres;

create sequence if not exists roless_id_seq
    as integer;

alter sequence roless_id_seq owner to postgres;

create sequence if not exists "Credential_id_seq";

alter sequence "Credential_id_seq" owner to postgres;

create sequence if not exists linked_roles_id_seq;

alter sequence linked_roles_id_seq owner to postgres;

create table if not exists users
(
    id                bigserial
        constraint users_pk
            primary key,
    user_name         varchar(20)  default 'name'::character varying        not null,
    surname           varchar(50)  default 'surname'::character varying     not null,
    creation_date     timestamp(6) default CURRENT_TIMESTAMP(6)             not null,
    modification_date timestamp(6) default CURRENT_TIMESTAMP(6)             not null,
    is_banned         boolean      default false                            not null,
    is_deleted        boolean      default false                            not null,
    region            varchar(30)  default 'some region'::character varying not null,
    birth             timestamp(6) default CURRENT_TIMESTAMP(6)             not null,
    gender            varchar(15)
);

alter table users
    owner to postgres;

create unique index if not exists users_id_uindex
    on users (id);

create table if not exists cars
(
    id                  bigserial
        constraint cars_pk
            primary key,
    manufacturer        varchar(20)                                          not null,
    model               varchar(20)                                          not null,
    year_of_manufacture timestamp(6)                                         not null,
    engine_volume       real                                                 not null,
    color               varchar(15)                                          not null,
    conditioner         boolean     default false                            not null,
    registration_number varchar(10)                                          not null,
    price               double precision                                     not null,
    user_id             bigint
        constraint cars_users_id_fk
            references users
            on update cascade on delete cascade,
    photo               varchar(255),
    region              varchar(30) default 'some region'::character varying not null
);

alter table cars
    owner to postgres;

create unique index if not exists cars_id_uindex
    on cars (id);

create table if not exists roles
(
    id                integer      default nextval('rentcar.roless_id_seq'::regclass) not null
        constraint roles_pk
            primary key,
    role_name         varchar(10)  default 'User'::character varying                  not null,
    creation_date     timestamp(6) default CURRENT_TIMESTAMP(6)                       not null,
    modification_date timestamp(6) default CURRENT_TIMESTAMP(6)                       not null
);

alter table roles
    owner to postgres;

alter sequence roless_id_seq owned by roles.id;

create unique index if not exists roles_id_uindex
    on roles (id);

create table if not exists discount_system
(
    id                bigserial
        constraint discount_system_pk
            primary key,
    user_id           bigint                                    not null
        constraint discount_system_users_id_fk
            references users
            on update cascade on delete cascade,
    discount_size     real         default 0                    not null,
    creation_date     timestamp(6) default CURRENT_TIMESTAMP(6) not null,
    modification_date timestamp(6) default CURRENT_TIMESTAMP(6) not null,
    expiration_date   timestamp(6) default CURRENT_TIMESTAMP(6) not null
);

alter table discount_system
    owner to postgres;

create unique index if not exists discount_system_id_uindex
    on discount_system (id);

create table if not exists order_history
(
    id                bigserial
        constraint order_history_pk
            primary key,
    user_id           bigint                                    not null
        constraint order_history_users_id_fk
            references users
            on update cascade on delete cascade,
    cars_id           bigint                                    not null
        constraint order_history_cars_id_fk
            references cars
            on update cascade on delete cascade,
    creation_date     timestamp(6) default CURRENT_TIMESTAMP(6) not null,
    modification_date timestamp(6) default CURRENT_TIMESTAMP(6) not null,
    expiration_date   timestamp(6) default CURRENT_TIMESTAMP(6) not null
);

alter table order_history
    owner to postgres;

create unique index if not exists order_history_id_uindex
    on order_history (id);

create table if not exists credential
(
    id            bigint default nextval('rentcar."Credential_id_seq"'::regclass) not null
        constraint credential_pk
            primary key
        constraint credential_users_id_fk
            references users
            on update cascade on delete cascade,
    user_login    varchar(100)                                                    not null,
    user_password varchar(200)                                                    not null,
    user_email    varchar(100)                                                    not null
);

alter table credential
    owner to postgres;

alter sequence "Credential_id_seq" owned by credential.id;

create unique index if not exists credential_id_uindex
    on credential (id);

create table if not exists l_role_user
(
    id      bigint default nextval('rentcar.linked_roles_id_seq'::regclass) not null,
    user_id bigint                                                          not null
        constraint linked_roles_users_id_fk
            references users
            on update cascade on delete cascade,
    role_id bigint                                                          not null
        constraint linked_roles_roless_id_fk
            references roles
            on update cascade on delete cascade
);

alter table l_role_user
    owner to postgres;

alter sequence linked_roles_id_seq owned by l_role_user.id;

create sequence if not exists roles_id_seq
    as integer;

alter sequence roles_id_seq owner to postgres;

create sequence if not exists roless_id_seq
    as integer;

alter sequence roless_id_seq owner to postgres;

create sequence if not exists "Credential_id_seq";

alter sequence "Credential_id_seq" owner to postgres;

create sequence if not exists linked_roles_id_seq;

alter sequence linked_roles_id_seq owner to postgres;

create table if not exists users
(
    id                bigserial
        constraint users_pk
            primary key,
    user_name         varchar(20)  default 'name'::character varying        not null,
    surname           varchar(50)  default 'surname'::character varying     not null,
    creation_date     timestamp(6) default CURRENT_TIMESTAMP(6)             not null,
    modification_date timestamp(6) default CURRENT_TIMESTAMP(6)             not null,
    is_banned         boolean      default false                            not null,
    is_deleted        boolean      default false                            not null,
    region            varchar(30)  default 'some region'::character varying not null,
    birth             timestamp(6) default CURRENT_TIMESTAMP(6)             not null,
    gender            varchar(15)
);

alter table users
    owner to postgres;

create unique index if not exists users_id_uindex
    on users (id);

create table if not exists cars
(
    id                  bigserial
        constraint cars_pk
            primary key,
    manufacturer        varchar(20)                                          not null,
    model               varchar(20)                                          not null,
    year_of_manufacture timestamp(6)                                         not null,
    engine_volume       real                                                 not null,
    color               varchar(15)                                          not null,
    conditioner         boolean     default false                            not null,
    registration_number varchar(10)                                          not null,
    price               double precision                                     not null,
    user_id             bigint
        constraint cars_users_id_fk
            references users
            on update cascade on delete cascade,
    photo               varchar(255),
    region              varchar(30) default 'some region'::character varying not null
);

alter table cars
    owner to postgres;

create unique index if not exists cars_id_uindex
    on cars (id);

create table if not exists roles
(
    id                integer      default nextval('rentcar.roless_id_seq'::regclass) not null
        constraint roles_pk
            primary key,
    role_name         varchar(10)  default 'User'::character varying                  not null,
    creation_date     timestamp(6) default CURRENT_TIMESTAMP(6)                       not null,
    modification_date timestamp(6) default CURRENT_TIMESTAMP(6)                       not null
);

alter table roles
    owner to postgres;

alter sequence roless_id_seq owned by roles.id;

create unique index if not exists roles_id_uindex
    on roles (id);

create table if not exists discount_system
(
    id                bigserial
        constraint discount_system_pk
            primary key,
    user_id           bigint                                    not null
        constraint discount_system_users_id_fk
            references users
            on update cascade on delete cascade,
    discount_size     real         default 0                    not null,
    creation_date     timestamp(6) default CURRENT_TIMESTAMP(6) not null,
    modification_date timestamp(6) default CURRENT_TIMESTAMP(6) not null,
    expiration_date   timestamp(6) default CURRENT_TIMESTAMP(6) not null
);

alter table discount_system
    owner to postgres;

create unique index if not exists discount_system_id_uindex
    on discount_system (id);

create table if not exists order_history
(
    id                bigserial
        constraint order_history_pk
            primary key,
    user_id           bigint                                    not null
        constraint order_history_users_id_fk
            references users
            on update cascade on delete cascade,
    cars_id           bigint                                    not null
        constraint order_history_cars_id_fk
            references cars
            on update cascade on delete cascade,
    creation_date     timestamp(6) default CURRENT_TIMESTAMP(6) not null,
    modification_date timestamp(6) default CURRENT_TIMESTAMP(6) not null,
    expiration_date   timestamp(6) default CURRENT_TIMESTAMP(6) not null
);

alter table order_history
    owner to postgres;

create unique index if not exists order_history_id_uindex
    on order_history (id);

create table if not exists credential
(
    id            bigint default nextval('rentcar."Credential_id_seq"'::regclass) not null
        constraint credential_pk
            primary key
        constraint credential_users_id_fk
            references users
            on update cascade on delete cascade,
    user_login    varchar(100)                                                    not null,
    user_password varchar(200)                                                    not null,
    user_email    varchar(100)                                                    not null
);

alter table credential
    owner to postgres;

alter sequence "Credential_id_seq" owned by credential.id;

create unique index if not exists credential_id_uindex
    on credential (id);

create table if not exists l_role_user
(
    id      bigint default nextval('rentcar.linked_roles_id_seq'::regclass) not null,
    user_id bigint                                                          not null
        constraint linked_roles_users_id_fk
            references users
            on update cascade on delete cascade,
    role_id bigint                                                          not null
        constraint linked_roles_roless_id_fk
            references roles
            on update cascade on delete cascade
);

alter table l_role_user
    owner to postgres;

alter sequence linked_roles_id_seq owned by l_role_user.id;

