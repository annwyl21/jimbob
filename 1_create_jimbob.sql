-- jim, bob and marjory are a team working together to create a children's picture book
-- run this file all at once to create their picture book

create database jimbob;
use jimbob;

create table jim (
	letter_id int primary key auto_increment,
    letter varchar(1)
    );
    
create table bob (
	noun_id int auto_increment primary key,
    noun varchar(15)
    );
    
create table marjory (
	col_id int primary key auto_increment,
    collective_noun varchar(25)
    );

alter table jim
add column noun_id int,
add foreign key(noun_id) references bob(noun_id);

alter table bob
add column col_id int,
add foreign key(col_id) references marjory(col_id);

INSERT INTO jim (letter)
VALUES
('a'), ('b'), ('d'), ('f'), ('g'), ('h'), ('j'), ('l'), ('o'), ('p'), ('q'), ('s'), ('t'), ('u'), ('v'), ('w'), ('x'), ('y');

insert into bob (noun)
values
('ant'), ('chicken'), ('dolphin'), ('hippopotamus'), ('manatee'), ('parrot'), ('owl'), ('rhinocerous');

insert into marjory (collective_noun)
values
('colony'), ('brood'), ('pod'), ('bloat'), ('aggregation'), ('parliament'), ('pandemonium'), ('crash'), ('swarm');

update jim
set noun_id = 1
where letter_id = 1;

update jim
set noun_id = 3
where letter_id = 3;

update jim
set noun_id = 6
where letter_id = 10;

update bob
set col_id = 1
where noun_id = 1;

update bob
set col_id = 6
where noun_id = 7;

update bob
set col_id = 2
where noun_id = 2;
