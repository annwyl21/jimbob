-- how is our book looking now - the inner join will show us all the fully connected parts where we have all 3 components; letter, picture and animal group name
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Animal Groups"
from jim
inner join bob
on bob.noun_id = jim.noun_id
inner join marjory
on marjory.col_id = bob.col_id;

-- Oh dear, Can Marjory help?
-- Marjory has done quite alot of work but it is not yet connected
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Animal Groups"
from jim
right outer join bob
on bob.noun_id = jim.noun_id
right outer join marjory
on marjory.col_id = bob.col_id;

-- Marjory has alot more information that needs to be connected
select 
    bob.noun as "Pictures",
    bob.noun_id,
    marjory.col_id,
    marjory.collective_noun as "Collective Nouns"
from bob -- lets look at bob's pictures
left outer join marjory -- we can see all of Bob's pictures and some don't have collective nouns yet
on marjory.col_id = bob.col_id;

-- lets see if Marjory has those collective nouns
-- MySQL doesnt allow a full outer join so we need a union
select 
    bob.noun as "Pictures",
    bob.noun_id,
    marjory.col_id,
    marjory.collective_noun as "Collective Nouns"
from bob -- look at bob's pictures
left outer join marjory -- all Bob's pictures and the gaps that need Marjory's collective nouns
on marjory.col_id = bob.col_id
union
select 
    bob.noun as "Pictures",
    bob.noun_id,
    marjory.col_id,
    marjory.collective_noun as "Collective Nouns"
from bob -- still looking at Bob's pictures
right outer join marjory -- but now also looking at the collective nouns that don't yet have pictures assigned
on marjory.col_id = bob.col_id;

-- now we can update Bob's table with Marjory's collective nouns
update bob
set col_id = 3 -- connect the collective noun 'pod'
where noun_id = 3; -- with the dolphin picture

update bob
set col_id = 4 -- connect the collective noun 'bloat'
where noun_id = 4; -- with the hippo picture

update bob
set col_id = 8 -- connect 'crash'
where noun_id = 8; -- with rhino

update bob
set col_id = 5 -- connect aggregation
where noun_id = 5; -- with manatee

update bob
set col_id = 7 -- connect pandemonium
where noun_id = 6; -- with parrots