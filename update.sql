UPDATE financial_contribution fc
SET payment_method = 'bank transfer'
WHERE amount > 500
AND Donation_number IN (
    SELECT c.Donation_number
    FROM contribution c
);

UPDATE product p
SET type = 'toys'
WHERE product_number IN (
    SELECT pdd.product_number
    FROM product_donation_details pdd
    WHERE pdd.Donation_number = 5005
);
