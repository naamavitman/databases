CREATE TABLE person
(
  person_Id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  PRIMARY KEY (person_Id)
);

CREATE TABLE donor
(
  person_Id INT NOT NULL,
  PRIMARY KEY (person_Id),
  FOREIGN KEY (person_Id) REFERENCES person(person_Id)
);

CREATE TABLE community_company
(
  person_Id INT NOT NULL,
  PRIMARY KEY (person_Id),
  FOREIGN KEY (person_Id) REFERENCES person(person_Id)
);

CREATE TABLE product
(
  type VARCHAR(50) NOT NULL,
  product_number INT NOT NULL,
  PRIMARY KEY (product_number)
);

CREATE TABLE community_company_product
(
  receive_date DATE NOT NULL,
  quantity INT NOT NULL,
  person_Id INT NOT NULL,
  product_number INT NOT NULL,
  PRIMARY KEY (person_Id, product_number),
  FOREIGN KEY (person_Id) REFERENCES community_company(person_Id),
  FOREIGN KEY (product_number) REFERENCES product(product_number)
);

CREATE TABLE contribution
(
  contribution_date DATE NOT NULL,
  Donation_number INT NOT NULL,
  person_Id INT NOT NULL,
  PRIMARY KEY (Donation_number),
  FOREIGN KEY (person_Id) REFERENCES donor(person_Id)
);

CREATE TABLE financial_contribution
(
  amount DECIMAL(10, 2) NOT NULL,
  payment_method VARCHAR(50) NOT NULL,
  Donation_number INT NOT NULL,
  PRIMARY KEY (Donation_number),
  FOREIGN KEY (Donation_number) REFERENCES contribution(Donation_number)
);

CREATE TABLE product_donation
(
  Donation_number INT NOT NULL,
  PRIMARY KEY (Donation_number),
  FOREIGN KEY (Donation_number) REFERENCES contribution(Donation_number)
);

CREATE TABLE product_donation_details
(
  amount_of_items INT NOT NULL,
  Donation_number INT NOT NULL,
  product_number INT NOT NULL,
  PRIMARY KEY (Donation_number, product_number),
  FOREIGN KEY (Donation_number) REFERENCES product_donation(Donation_number),
  FOREIGN KEY (product_number) REFERENCES product(product_number)
);
