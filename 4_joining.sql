-- where are we now? 5 completed pages
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Animal Groups"
from jim
inner join bob
on bob.noun_id = jim.noun_id
inner join marjory
on marjory.col_id = bob.col_id;

-- Does Marjory have anything that Jim and Bob either don't have or haven't connected yet?
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Animal Groups"
from jim
right outer join bob
on bob.noun_id = jim.noun_id
right outer join marjory
on marjory.col_id = bob.col_id;

-- I am sure Jim added 'c', lets connect it
select * from jim; -- c was letter_id = 19
select * from bob; -- chicken picture  was noun.id = 2
select * from marjory; -- brood was col_id = 2

update jim
set noun_id = 2 -- connect the chicken picture
where letter_id = 19; -- with the letter 'c'

-- We gave Jim 'm' and 'r' too
select * from jim; -- 'm' has letter_id=21, 'r' has letter_id=20
select * from bob; -- manatee is noun_id=5, rhino has noun_id = 8

update jim
set noun_id = 5
where letter_id = 21;

update jim
set noun_id = 8
where letter_id = 20;

-- that's looking better - 8 completed pages (inner joins show us completed pages)
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Animal Groups"
from jim
inner join bob
on bob.noun_id = jim.noun_id
inner join marjory
on marjory.col_id = bob.col_id;

-- Does Marjory have anything that Jim and Bob either don't have or haven't connected yet?
-- Just 1-thing, and I don't think Bob has a bee picture yet, but Jim has a letter 'b' and the letter_id = 2.
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Animal Groups"
from jim
right outer join bob
on bob.noun_id = jim.noun_id
right outer join marjory
on marjory.col_id = bob.col_id;

-- however, Jim's table can't accept links from Marjory (it has no col_id column) so he has to wait for Bob to draw a bee
select * from jim;



