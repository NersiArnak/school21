SELECT pizzeria.name AS pizzeria_name
FROM pizzeria 
	JOIN menu ON menu.pizzeria_id = pizzeria.id and menu.price < 800
	JOIN person_visits ON person_visits.pizzeria_id=pizzeria.id and person_visits.visit_date = '2022-01-08'
	JOIN person ON person.id=person_visits.person_id and person.name = 'Dmitriy'


