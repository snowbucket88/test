WITH orders AS (
    SELECT * 
    FROM {{ ref('stg_orders') }}
),

payments AS (
    SELECT * 
    FROM {{ ref('stg_payment') }}
),

fct_orders AS (
    SELECT
        o.order_id,
        p.payment_id,
        p.amount
    FROM orders   o
    LEFT JOIN payments p
        ON o.order_id = p.orderid
)

SELECT *
FROM fct_orders
