SELECT p.name, SUM(fc.amount) AS total_amount
FROM person p
JOIN donor d ON p.person_Id = d.person_Id
JOIN contribution c ON d.person_Id = c.person_Id
JOIN financial_contribution fc ON c.Donation_number = fc.Donation_number
WHERE p.name = :donor_name
AND fc.amount >= :min_amount
GROUP BY p.name;

SELECT p.name, c.contribution_date, fc.amount
FROM person p
JOIN donor d ON p.person_Id = d.person_Id
JOIN contribution c ON d.person_Id = c.person_Id
JOIN financial_contribution fc ON c.Donation_number = fc.Donation_number
WHERE c.contribution_date >= :start_date
AND p.name = :donor_name;

SELECT c.contribution_date, fc.amount, p.name
FROM contribution c
JOIN financial_contribution fc ON c.Donation_number = fc.Donation_number
JOIN donor d ON c.person_Id = d.person_Id
JOIN person p ON d.person_Id = p.person_Id
WHERE c.contribution_date >= :start_date
AND fc.amount >= :min_amount
ORDER BY c.contribution_date;

SELECT p.type, SUM(pdd.amount_of_items) AS total_items
FROM product p
JOIN product_donation_details pdd ON p.product_number = pdd.product_number
JOIN product_donation pd ON pdd.Donation_number = pd.Donation_number
JOIN contribution c ON pd.Donation_number = c.Donation_number
WHERE c.contribution_date BETWEEN :start_date AND :end_date
AND p.type IN (:product_type_list)
GROUP BY p.type
ORDER BY total_items DESC;
