SELECT po.order_date, (SELECT CONCAT(person.name,' (age:',person.age,')' ))  AS person_information 
FROM person_order po
JOIN person ON person.id=po.person_id
ORDER BY order_date, person_information