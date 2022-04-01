--实现显示包含被举报的id，房间id，被举报的次数，被举报的发言。
--实现显示用户创建的room_id, （king_id=user_id
--实现显示群组里活跃的用户id，（所谓的活跃就是点开此群聊的用户，我不打算做出加群成为群成员，用户点进去就是活跃，点退出去就直接删掉uid）
----

select report_uid,r.room_id, reported_time, message
from report_log r join chatroom c
on r.report_uid=c.user_id
and r.room_id=c.room_id;

select room_id, u.*
from room r join user_login u on r.king_id=u.id;

select user_id
from chatroom;