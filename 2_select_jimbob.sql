-- run the statements on this page one at a time

-- jim has been working hard on his book and he nearly has all the letters and he has already got 3 pictures from bob
select * from jim;

-- bob has also worked hard to collect lots of pictures, he has told marjory about some of the pictures and they have been able to connect 3 together
select * from bob;

-- marjory has worked hard to find some fun collective nouns
select * from marjory;

-- This inner join shows us the results of Jim and Bob's hard work, they have put 3 pictures in Jim's book
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures"
from jim
inner join bob
on bob.noun_id = jim.noun_id;

-- a left join will show us how far they have got by showing us the book and also all the pages that still have missing pictures
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures"
from jim
left join bob
on bob.noun_id = jim.noun_id;

-- marjory has researched some collective nouns for the book and bought those to add
-- an inner join will show us the team's success
-- Jim has the letter 'a', Bob has connected his picture of an 'ant' to the letter and marjoey has identified that a collection of ants is called a 'colony' and told Jim and Bob.
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Animal Groups"
from jim
inner join bob
on bob.noun_id = jim.noun_id
inner join marjory
on marjory.col_id = bob.col_id;

-- but the team have some more work to do to fill the book
-- Jim needs to collect a few more letters
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Animal Groups"
from jim
left join bob
on bob.noun_id = jim.noun_id
left join marjory
on marjory.col_id = bob.col_id;

-- they aren't as far off as they think though, just making a few connections could help the team out
-- Bob has pictures of an owl and a chicken, Marjory has the collective nouns for brood of chickens and parliament of owls and they have connected them
-- Does Jim have a 'c' and an 'o'?
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures",
    marjory.collective_noun as "Animal Groups"
from jim
right outer join bob
on bob.noun_id = jim.noun_id
right outer join marjory
on marjory.col_id = bob.col_id;

-- they just need to view more data to find out
select 
	jim.letter as "Letters in Book",
    jim.letter_id,
    bob.noun as "Pictures",
    bob.noun_id
from jim
left outer join bob
on bob.noun_id = jim.noun_id
union
select 
	jim.letter as "Letters in Book",
    jim.letter_id,
    bob.noun as "Pictures",
    bob.noun_id
from jim
right outer join bob
on bob.noun_id = jim.noun_id;

-- good news, they can make some more connections
-- jim has an 'o' in his book
update jim
set noun_id = 7 -- connect the owl picture
where letter_id = 9; -- with the letter 'o'

-- we can fix the hippo's too
update jim
set noun_id = 4 -- connect the hippo picture
where letter_id = 6; -- with the letter 'h'

-- now when we run our join things look clearer
select 
	jim.letter as "Letters in Book",
    jim.letter_id,
    bob.noun as "Pictures",
    bob.noun_id
from jim
left outer join bob
on bob.noun_id = jim.noun_id
union
select 
	jim.letter as "Letters in Book",
    jim.letter_id,
    bob.noun as "Pictures",
    bob.noun_id
from jim
right outer join bob
on bob.noun_id = jim.noun_id;

-- it looks like jim is missing 'c', 'm' and 'r'
-- lets check
select * from jim;

-- yes, jim is missing 'c', 'm' and 'r'
insert into jim(letter)
values ('c'), ('r'), ('m');

-- lets check they are there
select * from jim
order by letter;

-- jim doesn't have all 26 letters yet though!
select count(*)
from jim;

