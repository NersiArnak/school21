SELECT DISTINCT
    address,
    ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
    ROUND(AVG(age::numeric), 2) AS average,
    ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) > ROUND(AVG(age), 2) AS comparison
FROM
    person
GROUP BY
    address
ORDER BY
    address;
