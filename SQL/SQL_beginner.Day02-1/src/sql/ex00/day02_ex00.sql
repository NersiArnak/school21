SELECT pizza.name, rating 
FROM (SELECT pi.name, pi.rating, pv.person_id 
	FROM pizzeria pi
	LEFT JOIN person_visits pv ON pv.pizzeria_id=pi.id) AS pizza
WHERE (person_id IS NULL);


