create table customer (
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),	
	phone_number VARCHAR(15),
	billing_info VARCHAR(150)
);

create table inventory (
	upc_food SERIAL primary key,
	product_amount INTEGER 
);

create table movies (
	upc SERIAL primary key,
	movie_title VARCHAR(30)
);

create table tickets (
	ticket_id SERIAL primary key,
	customer_id integer, 
	foreign key(customer_id) references customer(customer_id),
	order_id integer,
	foreign key(order_id) references orders(order_id)
);

create table orders (
	order_id SERIAL primary key,
	order_date DATE default CURRENT_DATE,
	ticket_total integer,
	sub_total numeric(8,2),
	total_cost numeric(8,2),
	seat_choice integer,
	upc INTEGER not null,
	foreign KEY(upc) references movies(upc)
);

create table librarys (
	movie_id SERIAL primary key,
	move_name VARCHAR(30),
	upc INTEGER not null,
	foreign KEY(upc) references movies(upc)
);

create table concessions (
	concessions_id SERIAL primary key,
	customer_id integer,
	foreign KEY(customer_id) references customer(customer_id),
	product_name VARCHAR(20),
	product_cost numeric(4,2),
	total_cost numeric(8,2),
	upc_food INTEGER not null,
	foreign KEY(upc_food) references inventory(upc_food)
);


