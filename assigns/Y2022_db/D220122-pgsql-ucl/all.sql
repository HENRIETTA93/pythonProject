drop schema if exists ucbqcd3 cascade ;
create schema ucbqcd3;

drop table if exists ucbqcd3.playground;

create table ucbqcd3.playground (
    playground_id serial,
    playgournd_name character varying(100) not null,
    playgournd_built_year int
);

