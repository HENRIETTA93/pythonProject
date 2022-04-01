DROP TABLE IF EXISTS report_log;
DROP TABLE IF EXISTS chatroom;
DROP TABLE IF EXISTS room_membership;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS user_login;

-- update1: 根据你第一条，一种是moderator主持人，一种是admin，这个是角色，不是状态，所以加一个角色表
drop table if exists roles;
create table roles(
role_id int primary key,
role_name varchar(30)
);

-- update2: 为user 分配角色通过外键
-- update3：权限是正常和停用。不管是哪个角色都可能停用他
CREATE TABLE user_login(
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    pass VARCHAR(20) NOT NULL,
    permission VARCHAR(20) check (permission in ('default','suspend')),
    role_id int,
primary key(id),
foreign key (role_id) references roles(role_id)
);

CREATE TABLE room(
    room_id INT NOT NULL AUTO_INCREMENT,
    roomname VARCHAR(40),
    king_id INT NOT NULL,
    create_time TIME,
    capacity INT,
    PRIMARY KEY(room_id),
    FOREIGN KEY(king_id) REFERENCES user_login(id)
);

-- 这块没问题，要检测room不能超过多少人，可以用trigger 但是不建议，还是在应用程序里面count()一下比较合适。


CREATE TABLE room_membership(
    user_id INT,
    room_id INT,
    PRIMARY KEY(user_id, room_id),
    FOREIGN KEY(user_id) REFERENCES user_login(id),
    FOREIGN KEY(room_id) REFERENCES room(room_id)
);



-- update4: chatroom 聊天必须是限制在一个聊天室，不能跨聊天室聊天，所以room_id 和user_id 必须合起来references room_membership这个表
-- update5: 主键，room_id, user_id, time_stamp 表示一个时间只能说一个message，
-- 或者使用PRIMARY KEY(room_id, user_id, time_stamp,message) 作为主键
-- message 作为发言内容没问题
CREATE TABLE chatroom(
    room_id INT,
    user_id INT,
    message TEXT,
    time_stamp TIME,
    PRIMARY KEY(room_id, user_id, time_stamp),
    FOREIGN KEY(room_id, user_id) references room_membership(room_id,user_id)
);

-- update6：更新report用户，一个user可能在多个群，且多个群都可能被举报

CREATE TABLE report_log(
    report_uid INT,
    room_id INT,
    reported_time INT,
    primary key(report_uid, room_id),
    FOREIGN KEY(room_id,report_uid) REFERENCES chatroom(room_id,user_id)
);

-- 另外
-- reported_time 可以换成datetime类型 指明被举报时间
-- reponted_count 当举报次数

--CREATE TABLE report_log(
--    report_uid INT,
--    room_id INT,
--    reported_time datetime,
--    reported_count int,
--    primary key(report_uid, room_id, reported_time),
--    FOREIGN KEY(room_id,report_uid) REFERENCES chatroom(room_id,user_id)
--);