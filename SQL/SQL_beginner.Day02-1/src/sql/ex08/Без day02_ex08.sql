SELECT name from person 
JOIN person_order ON person_order.person_id=person.id 
JOIN menu ON menu.id=person_order.menu_id AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza') 
WHERE gender = 'male' and person.address = 'Moscow' or person.address = 'Samara'  
ORDER BY name DESC
