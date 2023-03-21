-- JIM'S BOOK
SELECT * FROM jim;

-- Jim's book with Bob's pictures inserted
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures"
from jim
inner join bob
on bob.noun_id = jim.noun_id
order by jim.letter;

-- Jim's book with Bob's pictures inserted
-- but showing all the letter spaces Jim in his book where Bob hasn't given him pictures yet
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures"
from jim
left outer join bob
on bob.noun_id = jim.noun_id
order by jim.letter;

-- Jim's book with Bob's pictures inserted
-- and all the pictures Bob has left over, where Jim has missing letters
select 
	jim.letter as "Letters in Book",
    bob.noun as "Pictures"
from jim
right outer join bob
on bob.noun_id = jim.noun_id
order by jim.letter;