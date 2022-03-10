create database board;
use board;

create table users(
	id int primary key auto_increment,
    nickname varchar(20),
    url varchar(200)
);

create table board_articles(
	id int primary key auto_increment,
    title varchar(50) not null,
    content varchar(10000) not null,
    created_at timestamp default current_timestamp not null,
    updated_at timestamp default current_timestamp on update current_timestamp not null,
    
    user_id int,
    foreign key (user_id) references users(id)
);

create table board_photos(
	id int primary key auto_increment,
	url varchar(200) not null,
    
    user_id int,
    board_article_id int,
    foreign key (user_id) references users(id),
    foreign key (board_article_id) references board_articles(id)
);


create table board_comments(
	id int primary key auto_increment,
    content varchar(500),
    parentid int not null,
	created_at timestamp default current_timestamp not null,
    updated_at timestamp default current_timestamp on update current_timestamp not null,
    
    user_id int,
    board_article_id int,
	foreign key (user_id) references users(id),
    foreign key (board_article_id) references board_articles(id)
);

create table board_tags(
	id int primary key auto_increment,
    name varchar(30)
);

create table board_article_tag(
	article_id int,
    tag_id int,
    foreign key (article_id) references board_articles(id),
    foreign key (tag_id) references board_tags(id)
);

create table board_likes_article(
	user_id int,
    article_id int,
    foreign key (user_id) references users(id),
    foreign key (article_id) references board_articles(id)
);

create table board_likes_comment(
	user_id int,
    comment_id int,
    foreign key (user_id) references users(id),
    foreign key (comment_id) references board_comments(id)
);

