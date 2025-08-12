----------- Homework 3 from Anastasiya Hryharenka -----------

--1.1
select 
	first_name, 
  	last_name, 
  	age, 
  	country
from customers
where 
 	age > 25 
  	and country = 'USA';
   
   
--1.2    
select * from orders
where
   	amount > 1000;
   
   
--2.1
select 
  	first_name, 
 	last_name, 
  	item, 
 	amount 
from customers
left join orders
on customers.customer_id = orders.customer_id; 


--2.2
select 
  	status, 
  	first_name, 
  	last_name 
from shippings
left join customers
on shippings.customer_id = customers.customer_id;


--3.1
select country, count(*) from customers
group by country 


--3.2
select item, count(*), avg(amount) as avg_amount from orders
group by item;


--4.1
select first_name, age from customers
order by age desc;


--5.1
select 
	first_name, 
   	last_name,
  	amount
from customers
join orders 
on customers.customer_id = orders.customer_id 
where amount = (select max(amount) from orders);


--6.1
select 
	order_id, 
 	customer_id,
  	item,
  	amount,
  	sum(amount) over (partition by customer_id) as total_by_customer 
from orders
order by order_id;


--7.1 - version with group by
select   
	concat(first_name, ' ', last_name) as full_name,
	country,
	count(*) as total_orders,
	sum(amount) as total_amount 
from orders
join customers
on orders.customer_id = customers.customer_id
join shippings
on shippings.customer_id = customers.customer_id
where status = 'Delivered'
group by full_name, country
having count(*) >= 2;

--7.1 - version with cte and window functions
with 
customer_orders as 
(
	select
	    customers.customer_id,
	  	concat(first_name, ' ', last_name) as full_name,
	  	country,
	  	count(*) over (partition by orders.customer_id) as total_orders,
	  	sum(amount) over (partition by orders.customer_id) as total_amount 
	from orders
	join customers
	on orders.customer_id = customers.customer_id
)
select distinct full_name, country, total_orders, total_amount 
from customer_orders
join shippings
on shippings.customer_id = customer_orders.customer_id 
where status = 'Delivered' and total_orders>=2;

