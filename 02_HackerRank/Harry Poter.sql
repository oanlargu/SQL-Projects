SELECT id, age, coins_needed, power
FROM(
    SELECT w.id, wp.age, w.coins_needed, w.power, wp.is_evil,
            DENSE_RANK()OVER(PARTITION BY wp.age, w.power ORDER BY w.coins_needed) AS item_number
    FROM wands w
    LEFT JOIN wands_property wp
    ON w.code = wp.code
    ) AS result
WHERE item_number = 1 AND is_evil = 0
ORDER BY power desc, age desc