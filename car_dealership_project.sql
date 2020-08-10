--TABLES CREATION

CREATE TABLE salesperson(
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	contact_num VARCHAR(15),
	email VARCHAR(200)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(200),
	address VARCHAR(200),
	phone VARCHAR(15)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	address VARCHAR(200),
	phone VARCHAR(15)
);

CREATE TABLE car_inventory(
	serial_id INTEGER PRIMARY KEY,
	make VARCHAR(15),
	model VARCHAR(15),
	staff_id INTEGER,
	customer_id INTEGER,
	FOREIGN KEY(staff_id) REFERENCES salesperson(staff_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
	
CREATE TABLE sales_invoice(
	sales_id SERIAL PRIMARY KEY,
	amount NUMERIC(9,2),
	purchase_date DATE DEFAULT CURRENT_DATE,
	serial_id INTEGER,
	staff_id INTEGER,
	customer_id INTEGER,
	FOREIGN KEY(serial_id) REFERENCES car_inventory(serial_id),
	FOREIGN KEY(staff_id) REFERENCES salesperson(staff_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE service_invoice(
	service_id SERIAL PRIMARY KEY,
	order_date DATE,
	amount NUMERIC(8,2),
	total_cost NUMERIC(10,2),
	description VARCHAR(500),
	customer_id INTEGER,
	parts_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

ALTER TABLE service_invoice
ADD FOREIGN KEY(parts_id) REFERENCES parts(parts_id);

CREATE TABLE parts(
	parts_id SERIAL PRIMARY KEY,
	part_type VARCHAR(100),
	part_price NUMERIC(6,2),
	service_id INTEGER,
	FOREIGN KEY(service_id) REFERENCES service_invoice(service_id)
);

CREATE TABLE mechanic_record(
	record_id SERIAL PRIMARY KEY,
	FOREIGN KEY(service_id) REFERENCES service_invoice(service_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

--DATA INSERTION------------------------------

--SALESPERSON DATA
INSERT INTO salesperson(staff_id, first_name, last_name, contact_num, email)
VALUES(1, 'Mike', 'Latona', '555-555-5551', 'mike.latona@cars.com');

INSERT INTO salesperson(staff_id, first_name, last_name, contact_num, email)
VALUES(2, 'Theresa', 'Latona', '555-555-5552', 'theresa.latona@cars.com');

INSERT INTO salesperson(staff_id, first_name, last_name, contact_num, email)
VALUES(3, 'Randy', 'Latona', '555-555-5553', 'randy.latona@cars.com');

INSERT INTO salesperson(staff_id, first_name, last_name, contact_num, email)
VALUES(4, 'Angela', 'Latona', '555-555-5554', 'angela.latona@cars.com');

--CUSTOMER DATA
INSERT INTO customer(customer_id, first_name, last_name, email, address, phone)
VALUES(1, 'John', 'Smith', 'john.smith@gmail.com', '100 Main St', '777-777-7771');

INSERT INTO customer(customer_id, first_name, last_name, email, address, phone)
VALUES(2, 'Mel', 'Gibson', 'mel.gibson@gmail.com', '100 State St', '777-777-7772');

INSERT INTO customer(customer_id, first_name, last_name, email, address, phone)
VALUES(3, 'Dave', 'Adams', 'dave.adams@gmail.com', '100 Elm St', '777-777-7773');

INSERT INTO customer(customer_id, first_name, last_name, email, address, phone)
VALUES(4, 'Melissa', 'Jones', 'melissa.jones@gmail.com', '100 Oak St', '777-777-7774');


--MECHANIC DATA
INSERT INTO mechanic(mechanic_id, first_name, last_name, email, address, phone)
VALUES(1, 'Jeff', 'Mills', 'jeff.mills@cars.com', '200 Forest Ave', '888-888-8881');

INSERT INTO mechanic(mechanic_id, first_name, last_name, email, address, phone)
VALUES(2, 'Jill', 'Foles', 'jill.foles@cars.com', '200 Circle Ave', '888-888-8882');

INSERT INTO mechanic(mechanic_id, first_name, last_name, email, address, phone)
VALUES(3, 'Dillon', 'Jeffries', 'dillon.jeffries@cars.com', '200 Cormiers Ave', '888-888-8883');

INSERT INTO mechanic(mechanic_id, first_name, last_name, email, address, phone)
VALUES(4, 'Kim', 'Riggins', 'kim.riggins@cars.com', '200 Teller Ave', '888-888-8884');


--SALES_INVOICE DATA
INSERT INTO sales_invoice(sales_id, amount, serial_id, staff_id, customer_id)
VALUES(1, 15000, 1, 1, 1);

INSERT INTO sales_invoice(sales_id, amount, serial_id, staff_id, customer_id)
VALUES(2, 25000, 2, 2, 2);


--CAR_INVENTORY DATA
INSERT INTO car_inventory(serial_id, make, model, staff_id, customer_id)
VALUES(1, 'Hyundai', 'Santa Fe', 1, 1);

INSERT INTO car_inventory(serial_id, make, model, staff_id, customer_id)
VALUES(2, 'Hyundai', 'Elantra', 2, 2);

-------------------------------------

SELECT *
FROM service_invoice;
