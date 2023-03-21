-- so what work is left to do?
-- jim is a good project manager and he sits down with Bob
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures"
from jim -- Jim gets out his nearly but not quite complete letter book
left outer join bob -- jim and Bob have fitted all the pictures in now they are just looking at the gaps
on bob.noun_id = jim.noun_id
order by jim.letter; -- Jim has put the letters he has in order to make it clearer

-- jim needs to get some missing letters e, i, k, n and z
-- bob has some drawing to do

-- bob thinks Jim is a rubbish project manager and decides to mutiny with Marjory
select
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Collectives"
from marjory
right outer join bob
on bob.col_id = marjory.col_id
right outer join jim
on jim.noun_id = bob.noun_id
order by jim.letter;

-- this is much better, Bob saves it as a todo list
create view to_do_list_view as
select
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Collectives"
from marjory
right outer join bob
on bob.col_id = marjory.col_id
right outer join jim
on jim.noun_id = bob.noun_id
order by jim.letter;

-- bob doodled a bee while he was in the meeting so now he can add in Marjory's 'swarm' with its col_id = 9
insert into bob(noun, col_id) value ('bee', 9);
update jim set noun_id = 9 where letter_id = 2;

-- bob is doodling fish
insert into bob(noun) value ('fish');
update jim set noun_id = 10 where letter_id = 4;

-- now the team only have to navigate to the view to see what they need to complete for this project
select * from jim;