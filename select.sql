SELECT p.name, SUM(pdd.amount_of_items) as total_items
FROM person p
JOIN donor d ON p.person_Id = d.person_Id
JOIN contribution c ON d.person_Id = c.person_Id
JOIN product_donation pd ON c.Donation_number = pd.Donation_number
JOIN product_donation_details pdd ON pd.Donation_number = pdd.Donation_number
GROUP BY p.name
ORDER BY total_items DESC;

SELECT p.name, 
       EXTRACT(MONTH FROM ccp.receive_date) as month, 
       EXTRACT(YEAR FROM ccp.receive_date) as year, 
       SUM(ccp.quantity) as total_quantity
FROM person p
JOIN community_company cc ON p.person_Id = cc.person_Id
JOIN community_company_product ccp ON cc.person_Id = ccp.person_Id
GROUP BY p.name, EXTRACT(MONTH FROM ccp.receive_date), EXTRACT(YEAR FROM ccp.receive_date)
ORDER BY year, month;

SELECT pr.type, 
       EXTRACT(YEAR FROM c.contribution_date) as year, 
       COUNT(fc.Donation_number) as donation_count
FROM product pr
JOIN product_donation_details pdd ON pr.product_number = pdd.product_number
JOIN product_donation pd ON pdd.Donation_number = pd.Donation_number
JOIN contribution c ON pd.Donation_number = c.Donation_number
JOIN financial_contribution fc ON c.Donation_number = fc.Donation_number
GROUP BY pr.type, EXTRACT(YEAR FROM c.contribution_date)
ORDER BY EXTRACT(YEAR FROM c.contribution_date), donation_count DESC;

SELECT fc.payment_method, 
       EXTRACT(MONTH FROM c.contribution_date) as month, 
       EXTRACT(YEAR FROM c.contribution_date) as year, 
       SUM(fc.amount) as total_amount
FROM financial_contribution fc
JOIN contribution c ON fc.Donation_number = c.Donation_number
GROUP BY fc.payment_method, EXTRACT(MONTH FROM c.contribution_date), EXTRACT(YEAR FROM c.contribution_date)
ORDER BY EXTRACT(YEAR FROM c.contribution_date), EXTRACT(MONTH FROM c.contribution_date), total_amount DESC;

SELECT fc.payment_method, 
       EXTRACT(MONTH FROM c.contribution_date) as month, 
       EXTRACT(YEAR FROM c.contribution_date) as year, 
       SUM(fc.amount) as total_amount
FROM financial_contribution fc
JOIN contribution c ON fc.Donation_number = c.Donation_number
GROUP BY fc.payment_method, EXTRACT(MONTH FROM c.contribution_date), EXTRACT(YEAR FROM c.contribution_date)
ORDER BY EXTRACT(YEAR FROM c.contribution_date), EXTRACT(MONTH FROM c.contribution_date), total_amount DESC;
