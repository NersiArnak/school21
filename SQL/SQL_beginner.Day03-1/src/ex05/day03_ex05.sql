SELECT p.name AS pizzeria_name FROM pizzeria p
JOIN person_visits pv ON pv.pizzeria_id=p.id
JOIN person pe ON pe.id=pv.person_id
WHERE pe.name = 'Andrey' 
	
EXCEPT
SELECT pizzeria.name  
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_order ON menu.id = person_order.menu_id
JOIN person ON person_order.person_id = person.id
WHERE person.name = 'Andrey';