DELETE FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-10'
AND ctid NOT IN (
  SELECT MIN(ctid)
  FROM person_visits
  WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-10'
  GROUP BY person_id
);

SELECT person_id, visit_date FROM person_visits WHERE (visit_date BETWEEN '2022-01-06' and '2022-01-09') or pizzeria_id = '2' ORDER BY person_id  DESC
