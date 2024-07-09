SELECT (SELECT person.name FROM person WHERE person.id=person_visits.person_id) AS person_name,
	(SELECT pizzeria.name FROM pizzeria WHERE pizzeria.id=pizzeria_id) AS pizzeria_name
	FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') person_visits ORDER BY person_name ASC, pizzeria_name DESC 