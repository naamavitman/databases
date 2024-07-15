
insert into person values (1, 'alice', 'alice@example.com');
insert into person values (2, 'bob', 'bob@example.com');
insert into person values (3, 'charlie', 'charlie@example.com');
insert into person values (4, 'david', 'david@example.com');
insert into person values (5, 'eve', 'eve@example.com');

insert into donor values (1);
insert into donor values (2);
insert into donor values (3);
insert into donor values (4);
insert into donor values (5);

insert into community_company values (1);
insert into community_company values (2);
insert into community_company values (3);
insert into community_company values (4);
insert into community_company values (5);

insert into product values ('food', 1001);
insert into product values ('clothing', 1002);
insert into product values ('electronics', 1003);
insert into product values ('books', 1004);
insert into product values ('toys', 1005);

insert into community_company_product values (TO_DATE('2023-01-01', 'YYYY-MM-DD'), 10, 1, 1001);
insert into community_company_product values (TO_DATE('2023-02-01', 'YYYY-MM-DD'), 20, 2, 1002);
insert into community_company_product values (TO_DATE('2023-03-01', 'YYYY-MM-DD'), 15, 3, 1003);
insert into community_company_product values (TO_DATE('2023-04-01', 'YYYY-MM-DD'), 25, 4, 1004);
insert into community_company_product values (TO_DATE('2023-05-01', 'YYYY-MM-DD'), 30, 5, 1005);

insert into contribution values (to_date('2023-01-10', 'yyyy-mm-dd'), 5001, 1);
insert into contribution values (to_date('2023-02-10', 'yyyy-mm-dd'), 5002, 2);
insert into contribution values (to_date('2023-03-10', 'yyyy-mm-dd'), 5003, 3);
insert into contribution values (to_date('2023-04-10', 'yyyy-mm-dd'), 5004, 4);
insert into contribution values (to_date('2023-05-10', 'yyyy-mm-dd'), 5005, 5);

insert into financial_contribution values (100.00, 'credit card', 5001);
insert into financial_contribution values (200.00, 'cash', 5002);
insert into financial_contribution values (150.00, 'credit card', 5003);
insert into financial_contribution values (250.00, 'bank transfer', 5004);
insert into financial_contribution values (300.00, 'credit card', 5005);

insert into product_donation values (5001);
insert into product_donation values (5002);
insert into product_donation values (5003);
insert into product_donation values (5004);
insert into product_donation values (5005);

insert into product_donation_details values (5, 5001, 1001);
insert into product_donation_details values (10, 5002, 1002);
insert into product_donation_details values (8, 5003, 1003);
insert into product_donation_details values (12, 5004, 1004);
insert into product_donation_details values (15, 5005, 1005);

