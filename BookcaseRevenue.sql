SELECT 
   sp.continent AS continent,
   SUM(p.price) AS revenue,
   SUM(CASE
           WHEN p.category = 'Bookcases & shelving units'
           THEN p.price
           ELSE 0
       END) AS revenue_from_bookcases,
   SUM(CASE
           WHEN p.category = 'Bookcases & shelving units'
           THEN p.price
           ELSE 0
       END)
       / SUM(p.price) * 100 AS revenue_from_bookcases_percent
FROM `data-analytics-mate.DA.product` p
JOIN `data-analytics-mate.DA.order` o
   ON p.item_id = o.item_id
JOIN `data-analytics-mate.DA.session_params` sp
   ON o.ga_session_id = sp.ga_session_id
GROUP BY continent;
