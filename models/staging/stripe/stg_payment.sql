 WITH payments AS (
    SELECT
        id            AS payment_id,
        orderid,
        paymentmethod,
        status,
        amount,
        created
    FROM {{source('stripe_payment','payment')}}
)

SELECT *
FROM payments
