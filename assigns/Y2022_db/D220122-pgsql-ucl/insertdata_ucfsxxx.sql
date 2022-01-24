drop schema if exists ucbqcd3 cascade ;
create schema ucbqcd3;


-- insert into users table


-- insert into parameters table
-- lighting parameters
insert into ucbqcd3.parameters
(parameter_type, parameter_name, parameter_subname, parameter_value, parameter_units)
values
('buy cost','lighting','small lighting',100,'£ per'),
('buy cost','lighting','middle lighting',200,'£ per'),
('buy cost','lighting','big lighting',300,'£ per'),
('repair cost','lighting','small lighting',50,'£ per year'),
('repair cost','lighting','middle lighting',100,'£ per year'),
('repair cost','lighting','big lighting',150,'£ per year');

-- activity_towers parameters
insert into ucbqcd3.parameters
(parameter_type, parameter_name, parameter_subname, parameter_value, parameter_units)
values
('maintenance cost','activity_towers','maintenance the overall tower',1000,'£ per month'),
('air cleaning cost','activity_towers','air cleaning the overall tower',2000,'£ per week'),
('energy consumption cost','activity_towers','energy consumption the overall tower',500,'kwh per sqm per year');


-- equipment_areas parameters
insert into ucbqcd3.parameters
(parameter_type, parameter_name, parameter_subname, parameter_value, parameter_units)
values
('maintenance cost','equipment_areas','maintenance the overall equipment',5000,'£ per month'),
('air cleaning cost','equipment_areas','air cleaning the overall equipment',8000,'£ per week'),
('energy consumption cost','equipment_areas','energy consumption the overall equipment',500,'kwh per sqm per year');


-- playground parameters
insert into ucbqcd3.parameters
(parameter_type, parameter_name, parameter_subname, parameter_value, parameter_units)
values
('maintenance cost','playground','maintenance the overall playground',10000,'£ per month'),
('air cleaning cost','playground','air cleaning the overall playground',12000,'£ per week'),
('energy consumption cost','playground','energy consumption the overall playground',500,'kwh per sqm per year');

-- insert into users
insert into ucbqcd3.users (user_name)
values
('ucbqcd3');



-- insert into playground
insert into ucbqcd3.playground
(playground_name,playground_built_year,location)
values
('Central Park Playground', '1980', st_geomfromtext('POLYGON ((0 0 ,2700 0 , 2700 3200 , 0 3200 , 0 0 ))',27700));


-- insert into equipment_areas
insert into ucbqcd3.equipment_areas
(equipment_area_name,equipment_area_built_year,location,playground_id)
values
('Equipment 1', 1982, st_extrude(st_geomfromtext('POLYGON((320 180 0, 320 2200 0, 1600 2200 0, 1600 180 0, 320 180 0))',27700),0,0,660),
 (select playground_id from ucbqcd3.playground p where st_intersects(p.location, st_geomfromtext('POLYGON((320 180 0, 320 2200 0, 1600 2200 0, 1600 180 0, 320 180 0))',27700)))
 );

insert into ucbqcd3.equipment_areas
(equipment_area_name,equipment_area_built_year,location,playground_id)
values
('Equipment 2', 1983, st_extrude(st_geomfromtext('POLYGON((1800 200 0, 1800 2500 0, 2600 2500 0, 2600 200 0, 1800 200 0))',27700),0,0,660),
 (select playground_id from ucbqcd3.playground p where st_intersects(p.location, st_geomfromtext('POLYGON((1800 200 0, 1800 2500 0, 2600 2500 0, 2600 200 0, 1800 200 0))',27700)))
 );

-- insert into activity_towers
insert into ucbqcd3.activity_towers
(floor_number,activity_tower_name,location)
values
(0,'Tower 1', st_geomfromtext('POLYGON((400 240 0, 1000 240 0, 1000 1800 0, 400 1800 0, 400 240 0))',27700)
);


insert into ucbqcd3.activity_towers
(floor_number,activity_tower_name,location)
values
(1,'Tower 1', st_geomfromtext('POLYGON((400 240 300, 1000 240 300, 1000 1800 300, 400 1800 300, 400 240 300))',27700)
);


insert into ucbqcd3.activity_towers
(floor_number,activity_tower_name,location)
values
(0,'Tower 2', st_geomfromtext('POLYGON((2000 240 0, 2500 240 0, 2500 600 0, 2000 600 0, 2000 240 0))',27700)
);


insert into ucbqcd3.activity_towers
(floor_number,activity_tower_name,location)
values
(1,'Tower 2', st_geomfromtext('POLYGON((2000 240 300, 2500 240 300, 2500 600 300, 2000 600 300, 2000 240 300))',27700)
);


insert into ucbqcd3.activity_towers
(floor_number,activity_tower_name,location)
values
(0,'Tower 3', st_geomfromtext('POLYGON((2000 1200 0, 2500 1200 0, 2500 1560 0, 2000 1560 0, 2000 1200 0))',27700)
);


insert into ucbqcd3.activity_towers
(floor_number,activity_tower_name,location)
values
(1,'Tower 3', st_geomfromtext('POLYGON((2000 1200 0, 2500 1200 0, 2500 1560 0, 2000 1560 0, 2000 1200 0))',27700)
);




update ucbqcd3.activity_towers a
set equipment_area_id =
(select b.equipment_area_id from ucbqcd3.equipment_areas b
where st_3dintersects(a.location, b.location));


