
-- series
--
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (1, 'M university', 'cases that occurs in the M university');
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (2, 'M Airline', 'cases that happnes within M Airline');
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (3, 'MG Entertainment', 'cases that related to MG Entertainment Group');
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (4, 'Historical Story', 'cases that happens in the acient time time');
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (5, 'M city', 'cases that happens in the M city');
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (6, 'M hosipital', 'cases that happens within the M hosipital');


-- cases
--
INSERT INTO `cases` (`case_ID`, `case_name`, `case_desc`, `series_ID`) VALUES (1001, 'the falling of a insta star', 'A insta famous female student was murdered', 1);
INSERT INTO `cases` (`case_ID`, `case_name`, `case_desc`, `series_ID`) VALUES (2001, 'the flight that can''t take off ', 'MG Airlines co-pilot found dead in the cabin with strangulation marks on his neck.', 2);
INSERT INTO `cases` (`case_ID`, `case_name`, `case_desc`, `series_ID`) VALUES (3001, 'war between idols', 'The Minister of MG Entertainment was witnessed dead in the recording studio.', 3);
INSERT INTO `cases` (`case_ID`, `case_name`, `case_desc`, `series_ID`) VALUES (4001, 'Mermaid''s Tears', 'The mermaid islander was found lying down in the middle of the island''s shrine.', 4);
INSERT INTO `cases` (`case_ID`, `case_name`, `case_desc`, `series_ID`) VALUES (5001, 'The Groom Who Disappeared', 'The body of the wedding groom was hidden in the dressing room closet.', 5);
INSERT INTO `cases` (`case_ID`, `case_name`, `case_desc`, `series_ID`) VALUES (6001, 'Tulip Madness', 'Plant geneticist found dead with a knife to the chest after everyone fainted and woke up during a flower house party.', 5);
INSERT INTO `cases` (`case_ID`, `case_name`, `case_desc`, `series_ID`) VALUES (7001, 'Please answer 1998', 'The owner of Zhen Ji grocery store and Nintendo game hall was found dead in the grocery store.', 5);
INSERT INTO `cases` (`case_ID`, `case_name`, `case_desc`, `series_ID`) VALUES (8001, 'It''s all the fault of the being beautiful', 'The director of the Yan Beauty Plastic Surgery Hospital, known as "China''s sharpest scalpel", was found dead in his office, and his upper body had been burned.', 6);
INSERT INTO `cases` (`case_ID`, `case_name`, `case_desc`, `series_ID`) VALUES (9001, 'Dueling at the night of the Champions League Final', 'The MG Football League Golden Boot winner was found dead in the restroom of MG Ball Bar.', 5);
INSERT INTO `cases` (`case_ID`, `case_name`, `case_desc`, `series_ID`) VALUES (10001, 'hero night', 'The Winter Soldier actor collapsed during the movie shooting.', 5);

-- seasons
--
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S01', '2015-01-01', '2015-11-02');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S02', '2017-01-13', '2017-11-13');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S03', '2017-09-22', '2018-05-30');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S04', '2018-10-26', '2019-06-25');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S05', '2019-11-08', '2020-07-14');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S06', '2020-12-24', '2021-08-26');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S07', '2021-12-25', NULL);


-- episodes
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E1001', 'hero night 01', 'People find the victim and the detective questions suspects in a group.', 10001, 'S04', 75);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E1002', 'hero night 02', 'each player finds evidence and people discuss together.', 10001, 'S04', 120);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E101', 'the falling of a insta star 01', 'People find the victim and the detective questions suspects in a group.', 1001, 'S01', 60);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E102', 'the falling of a insta star 02', 'each player finds evidence and people discuss together.', 1001, 'S01', 80);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E201', 'the flight that can''t take off 01', 'People find the victim and the detective questions suspects in a group.', 2001, 'S02', 100);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E202', 'the flight that can''t take off 02', 'each player finds evidence and people discuss together.', 2001, 'S02', 80);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E301', 'war between idols 01', 'People find the victim and the detective questions suspects in a group.', 3001, 'S03', 120);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E302', 'war between idols 02', 'each player finds evidence and people discuss together.', 3001, 'S03', 70);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E401', 'Mermaid''s Tears 01', 'People find the victim and the detective questions suspects in a group.', 4001, 'S04', 100);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E402', 'Mermaid''s Tears 02', 'each player finds evidence and people discuss together.', 4001, 'S04', 70);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E501', 'The Groom Who Disappeared 01', 'People find the victim and the detective questions suspects in a group.', 5001, 'S05', 90);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E502', 'The Groom Who Disappeared 02', 'each player finds evidence and people discuss together.', 5001, 'S05', 100);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E601', 'Tulip Madness 01', 'People find the victim and the detective questions suspects in a group.', 6001, 'S06', 100);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E602', 'Tulip Madness 02', 'each player finds evidence and people discuss together.', 6001, 'S06', 120);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E701', 'Please answer 1998 01', 'People find the victim and the detective questions suspects in a group.', 7001, 'S01', 70);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E702', 'Please answer 1998 02', 'each player finds evidence and people discuss together.', 7001, 'S01', 110);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E801', 'It''s all the fault of the being beautiful 01', 'People find the victim and the detective questions suspects in a group.', 8001, 'S02', 90);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E802', 'It''s all the fault of the being beautiful 02', 'each player finds evidence and people discuss together.', 8001, 'S02', 80);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E901', 'Dueling at the night of the Champions League Final 01', 'People find the victim and the detective questions suspects in a group.', 9001, 'S03', 90);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E902', 'Dueling at the night of the Champions League Final 02', 'each player finds evidence and people discuss together.', 9001, 'S03', 100);


-- crew
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (1, 'Xiaoling', 'Chen', '1970-12-08', 'Female', '13844563928', 'driector');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (2, 'xiaojun', 'zhao', '1985-02-03', 'Male', '13655391746', 'screenwriter');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (3, 'xiujie', 'qian', '1980-04-24', 'Male', '16294672946', 'producer');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (4, 'wenjing', 'sun', '1973-04-12', 'Female', '12749264294', 'art director');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (5, 'yifan', 'li', '1987-03-09', 'Female', '13056392745', 'casting director');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (6, 'wuke', 'zhou', '1991-08-26', 'Male', '13304862946', 'director');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (7, 'tongxin', 'wu', '1998-02-14', 'Female', '18649264910', 'producer');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (8, 'lei', 'zheng', '1998-04-15', 'Male', '18529462946', 'screenwriter');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (9, 'zucheng', 'wang', '1988-02-16', 'Female', '16293645815', 'prop master');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (10, 'liang', 'feng', '1998-02-17', 'Male', '15381644321', 'director of photography');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (11, 'wanxu', 'chen', '1998-02-18', 'Male', '16492649988', 'camera operator');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (12, 'xiaonan', 'zhu', '1998-02-19', 'Female', '13622773526', 'light');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (13, 'xiaobei', 'wei', '1998-02-20', 'Female', '13655492749', 'make-up artist');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (14, 'jing', 'jiang', '1998-02-21', 'Female', '13845529462', 'hair artist');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (15, 'guoqing', 'shen', '1998-02-22', 'Female', '14387665422', 'costume designer');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (16, 'chang', 'han', '1998-02-23', 'Male', '14387665423', 'sound mixer');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (17, 'ke', 'liang', '1998-02-24', 'Female', '14387665424', 'vfx supervisor');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (18, 'fang', 'he', '1998-02-25', 'Male', '14387665425', 'prop maker');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (19, 'yang', 'lv', '1998-02-26', 'Male', '14387665426', 'scenic artist');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (20, 'aichen', 'shi', '1998-02-27', 'Female', '14387665427', 'gaffer');

-- actor
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (1, 'Jingting', 'Bai', '1993-10-15', 'M', '1310301231');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (2, 'Beining', 'Sa', '1976-03-23', 'M', '1310301232');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (3, 'Jiong', 'He', '1974-07-28', 'M', '1310301233');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (4, 'Ou', 'Wang', '1982-10-28', 'F', '1310301234');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (5, 'Yingjie', 'Wu', '1989-08-11', 'F', '1310301235');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (6, 'zhangwei', 'da', '1983-08-31', 'M', '1310301236');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (7, 'haoran', 'liu', '1997-10-10', 'M', '1310301237');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (8, 'ruoyun', 'zhao', '1988-08-24', 'M', '1310301238');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (9, 'daxun', 'wei', '1989-04-12', 'M', '1310301239');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (10, 'rong', 'yang', '1981-06-03', 'F', '1310301240');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (11, 'chen', 'wei', '1986-02-22', 'M', '1310301241');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (12, 'jiaer', 'wang', '1994-03-28', 'M', '1310301242');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (13, 'minghao', 'huang', '2002-02-19', 'M', '1310301243');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (14, 'songyun', 'tan', '1990-05-31', 'F', '1310301244');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (15, 'xin', 'wu', '1983-01-29', 'F', '1310301245');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (16, 'minghao', 'hou', '1997-08-03', 'M', '1310301246');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (17, 'chengcheng', 'fan', '2000-06-16', 'M', '1310301247');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (18, 'wei', 'qi', '1984-10-26', 'F', '1310301248');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (19, 'caijie', 'guo', '1986-02-19', 'F', '1310301249');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (20, 'zhenyu', 'qiao', '1978-11-01', 'M', '1310301250');


-- advertisement
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A01', 'oppo R11', 'oppo');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A02', 'Nongfu Spring', 'water');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A03', 'Xiaomi', 'Xiaomi');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A04', 'Mengniu Dairy', 'milk');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A05', 'Yili Group', 'yogurt');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A06', 'soul', 'app');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A07', 'pepsi', 'food');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A08', 'shenwu gaming', 'games');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A09', 'Nestlé', 'coffee');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A10', 'Robert Bosch', 'machine');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A11', 'Mead Johnson', 'powered milk');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A12', '999', 'medicine');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A13', 'sanjin', 'medicine');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A14', 'quark', 'app');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A15', 'shouba', 'app');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A16', 'Nabisco', 'oreo');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A17', 'jd.com', 'website');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A18', 'tecent', 'app');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A19', 'ikea', 'furniture');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A20', 'Haier', 'television');


-- advert_for_season
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (1, 'A01', 'S01', 1999.00, 8);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (2, 'A02', 'S01', 2038.00, 10);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (3, 'A03', 'S02', 8427.00, 10);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (4, 'A04', 'S02', 20475.00, 7);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (5, 'A05', 'S02', 5497.00, 12);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (6, 'A06', 'S03', 9369.00, 15);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (7, 'A07', 'S03', 94681.00, 9);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (8, 'A08', 'S03', 88761.00, 8);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (9, 'A09', 'S04', 102948.00, 14);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (10, 'A10', 'S04', 175028.00, 18);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (11, 'A11', 'S04', 192649.00, 19);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (12, 'A12', 'S05', 240974.00, 13);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (13, 'A13', 'S05', 304857.00, 15);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (14, 'A14', 'S05', 358271.00, 20);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (15, 'A15', 'S05', 512875.00, 12);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (16, 'A16', 'S06', 487632.00, 17);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (17, 'A17', 'S06', 612534.00, 23);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (18, 'A18', 'S06', 759372.00, 24);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (19, 'A19', 'S06', 846581.00, 18);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (20, 'A20', 'S06', 998463.00, 28);

-- roles
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R01', 'sa zhentan', 'a famous detective', 'detective', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R02', 'he chiqing', 'junior student of the university', 'suspect', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R03', 'bai laoshi', 'professor of the univeristy', 'suspect', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R04', 'gui xuejie', 'senior student of the university', 'murderer', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R05', 'ou xuemei', 'junior student of the university', 'suspect', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R06', 'qiao xuezhang', 'senior student of the university', 'suspect', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R07', 'xia qingtian', 'famous student of the university', 'victim', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R08', 'sazhentan', 'a famous detective', 'detective', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R09', 'bai kongshao', 'a handsome flight attendant', 'suspect', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R10', 'gui chengwu', 'a beautiful flight attendant', 'suspect', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R11', 'he jianxi', 'an intern pilot', 'murderer', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R12', 'ou kongjie', 'a pretty light attendant', 'suspect', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R13', 'da jizhang', 'an pilot', 'suspect', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R14', 'zhen fujia', 'an pilot', 'victim', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R15', 'gui zhentan', 'a famous detective', 'detective', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R16', 'he meinan', 'member of man group', 'suspect', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R17', 'sa weixiao', 'member of man group', 'suspect', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R18', 'chen wudao', 'member of man group', 'murderer', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R19', 'bai rap', 'member of man group', 'suspect', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R20', 'da zhuchang', 'member of man group', 'suspect', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R21', 'zhen buzhang', 'manager of man group', 'victim', 'E201');

-- acting
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (1, 1, 'R01');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (2, 2, 'R02');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (3, 3, 'R03');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (4, 4, 'R04');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (5, 5, 'R05');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (6, 6, 'R06');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (7, 7, 'R07');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (8, 8, 'R08');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (9, 9, 'R09');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (10, 10, 'R10');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (11, 11, 'R11');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (12, 12, 'R12');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (13, 13, 'R13');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (14, 14, 'R14');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (15, 15, 'R15');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (16, 16, 'R16');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (17, 17, 'R17');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (18, 18, 'R18');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (19, 19, 'R19');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (20, 20, 'R20');


-- work_for_cases
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (1, 1, 1001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (4, 1, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (5, 2, 1001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (3, 2, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (6, 3, 1001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (7, 4, 1001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (8, 4, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (9, 4, 3001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (11, 5, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (10, 5, 4001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (2, 6, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (12, 6, 4001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (13, 7, 5001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (15, 8, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (14, 8, 6001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (16, 8, 7001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (17, 8, 8001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (18, 9, 4001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (19, 9, 5001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (20, 9, 6001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (21, 9, 9001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (22, 10, 1001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (23, 10, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (24, 10, 3001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (25, 10, 4001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (26, 10, 5001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (27, 10, 6001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (28, 10, 7001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (29, 10, 8001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (30, 10, 9001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (31, 10, 10001);

-- audience
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0001', 'xiaobai', 20, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0002', 'xiaowang', 20, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0003', 'xiaoli', 20, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0004', 'xiaozhang', 21, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0005', 'xiaozhou', 21, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0006', 'xiaowu', 21, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0007', 'xiaoguo', 22, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0008', 'xiaobi', 22, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0009', 'xiaozhao', 22, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0010', 'xiaoqian', 23, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0011', 'xiaosun', 23, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0012', 'xiaoliu', 23, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0013', 'xiaoke', 24, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0014', 'xiaohong', 24, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0015', 'xiaohei', 24, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0016', 'xiaozi', 25, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0017', 'xiaolv', 25, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0018', 'xiaolan', 25, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0019', 'xiaocheng', 26, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0020', 'xiaohui', 26, 'F');

-- viewing_episode

INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (1, 'A0001', 'E101', 0, 60, 'nice', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (2, 'A0002', 'E101', 10, 60, 'good', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (3, 'A0001', 'E102', 20, 60, 'not so good', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (4, 'A0002', 'E102', 0, NULL, 'average ', 3);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (5, 'A0003', 'E201', NULL, NULL, 'great', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (6, 'A0004', 'E201', NULL, NULL, 'amazing', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (7, 'A0005', 'E202', NULL, NULL, 'nice', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (8, 'A0006', 'E202', NULL, NULL, 'good', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (9, 'A0007', 'E301', NULL, NULL, 'not so good', 3);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (10, 'A0008', 'E302', NULL, NULL, 'average ', 3);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (11, 'A0009', 'E401', NULL, NULL, 'great', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (12, 'A0010', 'E402', NULL, NULL, 'amazing', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (13, 'A0011', 'E501', NULL, NULL, 'nice', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (14, 'A0012', 'E502', NULL, NULL, 'good', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (15, 'A0013', 'E601', NULL, NULL, 'not so good', 3);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (16, 'A0014', 'E602', NULL, NULL, 'average ', 3);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (17, 'A0015', 'E701', NULL, NULL, 'great', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (18, 'A0016', 'E702', NULL, NULL, 'amazing', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (19, 'A0017', 'E801', NULL, NULL, 'bad', 2);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (20, 'A0018', 'E802', NULL, NULL, 'confusing', 2);

-- member_policy
INSERT INTO `member_policy` (`policy_ID`, `policy_type`, `fee`) VALUES ('p01', 'annual', 199.00);
INSERT INTO `member_policy` (`policy_ID`, `policy_type`, `fee`) VALUES ('p02', 'quarter', 99.00);
INSERT INTO `member_policy` (`policy_ID`, `policy_type`, `fee`) VALUES ('p03', 'month', 39.00);
INSERT INTO `member_policy` (`policy_ID`, `policy_type`, `fee`) VALUES ('p04', 'week', 19.00);

-- member

INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (0, 'A0001', 'p01', '2021-10-10', '2022-10-10');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (2, 'A0002', 'p01', '2021-10-11', '2022-10-11');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (3, 'A0003', 'p01', '2021-10-12', '2022-10-12');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (4, 'A0004', 'p01', '2021-10-13', '2022-10-13');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (5, 'A0005', 'p01', '2021-10-14', '2022-10-14');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (6, 'A0006', 'p01', '2021-10-15', '2022-10-15');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (7, 'A0007', 'p01', '2021-10-16', '2022-10-16');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (8, 'A0008', 'p01', '2021-10-17', '2022-10-17');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (9, 'A0009', 'p01', '2021-10-18', '2022-10-18');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (10, 'A0010', 'p01', '2021-10-19', '2022-10-19');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (11, 'A0011', 'p01', '2021-10-20', '2022-10-20');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (12, 'A0012', 'p01', '2021-10-21', '2022-10-21');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (13, 'A0013', 'p01', '2021-10-22', '2022-10-22');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (14, 'A0014', 'p01', '2021-10-23', '2022-10-23');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (15, 'A0015', 'p01', '2021-10-24', '2022-10-24');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (16, 'A0016', 'p02', '2021-10-25', '2022-01-25');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (17, 'A0017', 'p02', '2021-10-26', '2022-01-26');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (18, 'A0018', 'p02', '2021-10-27', '2022-01-27');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (19, 'A0019', 'p02', '2021-10-28', '2022-01-28');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (20, 'A0020', 'p02', '2021-10-29', '2022-01-29');