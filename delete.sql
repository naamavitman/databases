DELETE FROM contribution
WHERE Donation_number IN (
    SELECT c.Donation_number
    FROM financial_contribution fc
    JOIN contribution c ON fc.Donation_number = c.Donation_number
    WHERE fc.payment_method <> 'cash'
);

DELETE FROM financial_contribution
WHERE payment_method <> 'cash';

DELETE FROM financial_contribution
WHERE Donation_number IN (
    SELECT c.Donation_number
    FROM contribution c
    WHERE c.person_Id = (
        SELECT d.person_Id
        FROM donor d
        WHERE d.person_Id = 1
        )
    GROUP BY c.person_Id
    HAVING COUNT(*) <= 3
);

