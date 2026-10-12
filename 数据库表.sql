-- 用户表
create table user(
    user_id int primary key auto_increment comment '用户id',
    user_account varchar(50) not null unique comment '用户填写手机号作为唯一账号',
    username varchar(50) not null comment '用户名',
    password varchar(100) not null comment '密码'
)engine=innodb default charset=utf8mb4 comment='用户表';

-- 会议室表
create table meeting_room(
    room_id int primary key auto_increment comment '会议室id',
    room_no varchar(50) not null unique comment '房间号',
    capacity int not null comment '容纳人数',
    equipment varchar(200) comment '设备',
    location varchar(100) comment '位置',
    status tinyint default 1 comment '状态(1=可用，0=停用或者维修）',
    create_time datetime default current_timestamp comment '创建时间',
    update_time datetime default current_timestamp on update current_timestamp comment '更新时间'
) engine=innodb default charset=utf8mb4 comment='会议室表';

-- 预约记录表
create table reserve_record (
    reserve_id int primary key auto_increment comment '预约ID',
    room_id int not null comment '会议室ID',
    user_id int not null comment '用户ID',
    title varchar(100) comment '标题',
    reserve_date date not null comment '预约日期',
    start_time time not null comment '开始时间',
    end_time time not null comment '结束时间',
    status tinyint default 1 comment '状态',
    create_time datetime default current_timestamp comment '创建时间',
    update_time datetime default current_timestamp on update current_timestamp comment '更新时间',
    foreign key (user_id) references user(user_id),
    foreign key (room_id) references meeting_room(room_id)
) engine=innodb default charset=utf8mb4 comment='预约记录表';
