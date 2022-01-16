select * from invoice;

-- Create procedure to add employee to sales

CREATE OR REPLACE PROCEDURE add_salesperson(
	_employee_id INTEGER,
	_first_name VARCHAR(50),
	_last_name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO salesperson(employee_id, first_name, last_name)
	VALUES (_employee_id, _first_name, _last_name);
END;
$$;


-- Execute procedure
CALL add_salesperson(
	1,
	'Ray'::VARCHAR(50),
	'Stantz'::VARCHAR(50)
);

select * from salesperson;

call add_salesperson(
	2,
	'George',
	'Costanza'
);


-- Execute procedure
CALL add_salesperson(
	1,
	'Ray'::VARCHAR(50),
	'Stantz'::VARCHAR(50)
);


-- Create Procedure to add customer
CREATE OR REPLACE PROCEDURE add_customer(
	_customer_id INTEGER,
	_first_name VARCHAR(50),
	_last_name VARCHAR(50),
	_phone_number INTEGER,
	_address VARCHAR(100),
	_city VARCHAR(50),
	_state VARCHAR(2),
	_zipcode INTEGER,
	_country VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(customer_id, first_name, last_name, phone_number, address, city, state, zipcode, country)
	VALUES (_customer_id, _first_name, _last_name, _phone_number, _address, _city, _state, _zipcode, _country);
END;
$$;

-- Execute add_invoice procedure

call add_customer(
	1,
	'Cosmo'::VARCHAR(50),
	'Kramer'::VARCHAR(50),
	1465553455,
	'129 West 81st St, Apt 5B'::VARCHAR(100),
	'New York City'::VARCHAR(50),
	'NY'::VARCHAR(2),
	10024,
	'United States'::VARCHAR(50)
);

call add_customer(
	2,
	'Sherlock'::VARCHAR(50),
	'Holmes'::VARCHAR(50),
	111-222-3333,
	'221B Baker St'::VARCHAR(100),
	'London'::VARCHAR(50),
	'TX'::VARCHAR(2),
	75001,
	'United States'::VARCHAR(50)
);

select* from customer;

-- Create Procedure to add an invoice
CREATE OR REPLACE PROCEDURE add_invoice(
	_invoice_id INTEGER,
	_amount numeric(8,2),
	_date_of_invoice DATE,
	_employee_id INTEGER,
	_customer_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO invoice(invoice_id, amount, date_of_invoice, employee_id, customer_id)
	VALUES (_invoice_id, _amount, _date_of_invoice, _employee_id, _customer_id);
END;
$$;

-- Execute add_invoice procedure

call add_invoice(
	123,
	200,
	current_date,
	2,
	1
);
