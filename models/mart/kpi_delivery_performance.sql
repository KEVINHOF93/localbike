WITH delivery_performance AS (
    SELECT 
        dp.store_id,
        DATE_TRUNC(CAST(o.order_date AS DATE), MONTH) AS month,
        SUM(CASE WHEN o.shipped_date <= o.required_date THEN 1 ELSE 0 END) AS on_time_deliveries,
        COUNT(*) AS total_orders,
        SUM(CASE WHEN o.shipped_date <= o.required_date THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS on_time_delivery_rate
    FROM {{ ref('int_delivery_performance') }} dp
    LEFT JOIN {{ ref('stg_orders') }} o ON dp.store_id = o.store_id
    GROUP BY dp.store_id, DATE_TRUNC(CAST(o.order_date AS DATE), MONTH)
),
average_performance AS (
    SELECT 
        month,
        AVG(on_time_delivery_rate) AS avg_delivery_rate
    FROM delivery_performance
    GROUP BY month
)
SELECT 
    dp.store_id,
    dp.month,
    dp.on_time_delivery_rate,
    ap.avg_delivery_rate,
    RANK() OVER (PARTITION BY dp.month ORDER BY dp.on_time_delivery_rate DESC) AS store_rank
FROM delivery_performance dp
LEFT JOIN average_performance ap
    ON dp.month = ap.month
ORDER BY dp.month, dp.on_time_delivery_rate DESC
