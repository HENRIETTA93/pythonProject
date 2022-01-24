drop schema if exists ucbqcd3 cascade ;
create schema ucbqcd3;

drop table if exists ucbqcd3.playground;

create table ucbqcd3.playground (
    playground_id serial,
    playground_name character varying(100) not null,
    playground_built_year int
);

-- add the geometry columns 2D in the table playground
alter table ucbqcd3.playground drop column if exists location;
select AddGeometryColumn('ucbqcd3','playground','location',27700, 'geometry',2);

drop table if exists ucbqcd3.equipment_areas;
create table ucbqcd3.equipment_areas(
    equipment_area_id serial,
    equipment_area_name character varying(100) not null,
    equipment_area_built_year int,
    playground_id integer
);

-- add the geometry columns - 3D in the table equipment_areas
alter table ucbqcd3.equipment_areas drop column if exists location;
select AddGeometryColumn('ucbqcd3','equipment_areas','location',27700,'geometry',3);

drop table if exists ucbqcd3.activity_towers;
create table ucbqcd3.activity_towers(
    activity_tower_id serial,
    floor_number integer,
    activity_tower_name character varying(100) not null,
    equipment_area_id integer
);


-- add the geometry column - 3D(polygon) in the table activity_towers
alter table ucbqcd3.activity_towers drop column if exists location;
select AddGeometryColumn('ucbqcd3','activity_towers','location',0,'polygon',3);


drop table if exists ucbqcd3.lighting;
create table ucbqcd3.lighting(
    lighting_id serial,
    lighting_name character varying(50) not null,
    lighting_brand character varying(50) not null,
    activity_tower_id integer
);

-- add the geometry column - 3D(point) in the table lighting
alter table ucbqcd3.activity_towers drop column if exists location;
select AddGeometryColumn('ucbqcd3','activity_towers','location',0,'polygon',3);


-- create the lighting_condition table
drop table if exists ucbqcd3.lighting_condition;
create table ucbqcd3.lighting_condition(
    lighting_condition_id serial,
    lighting_id integer not null,
    lighting_condition integer not null,
    user_id integer not null,
    report_date date not null default CURRENT_DATE
);


-- create table activity_tower_condition;
drop table if exists ucbqcd3.activity_tower_condition;
create table ucbqcd3.activity_tower_condition(
    activity_tower_condition_id serial,
    activity_tower_id integer not null,
    wall_condition integer not null,
    door_condition integer not null,
    window_condition integer not null,
    user_id integer not null,
    report_date date not null default CURRENT_DATE
);

-- parameters table
drop table if exists ucbqcd3.parameters;
create table ucbqcd3.parameters(
parameter_id serial,
parameter_type character varying (100),
parameter_name character varying (150),
parameter_subname character varying (150),
parameter_value double precision,
parameter_units character varying (100),
date_created date default CURRENT_DATE
);


-- user table
drop table if exists ucbqcd3.users;
create table ucbqcd3.users(
    user_id serial not null,
    user_name character varying(30) not null
);


