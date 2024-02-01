--1. List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, customer.customer_id, count(customer.customer_id)
from customer
full join address
on customer.customer_id = address.customer_id
where district = 'Texas'
group by customer.customer_id;

--2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, payment.amount
from customer
join payment
on customer.customer_id = payment.customer_id
where payment.amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment 
	where amount > 175
);

--4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name
from customer
join address 
on customer.address_id = address.address_id
join city 
on address.city_id = city.city_id
where city = 'Nepal';

--5. Which staff member had the most transactions?
select staff.staff_id, staff.first_name, staff.last_name, count(payment.payment_id) 
from staff
join payment 
on staff.staff_id = payment.staff_id
group by staff.staff_id, staff.first_name, staff.last_name
order by count(payment.payment_id) desc
LIMIT 1;

--6. How many movies of each rating are there?
select rating, count(film_id) as film_count
from film
group by rating;


--7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name
from customer
where customer.customer_id in (
    select payment.customer_id
    from payment
    where payment.amount > 6.99
    group by payment.customer_id
    having count(payment.payment_id) = 1
);


--8. How many free rentals did our store give away?
select count(payment.rental_id) as free_rentals
from payment
where payment.amount = 0;

