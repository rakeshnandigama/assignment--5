-- Name : Rakesh Nandigama
-- CWID : 200 54 070
-- Date : 2/20/2014
-- Assignment-5


--1. Get the cities of agents booking an order for customer Basics using joins

select a.city 
from agents a 
join orders o on a.aid=o.aid
join customers c on c.cid=o.cid and c.name='Basics' ;


--2. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto.

select distinct o1.pid 
from orders o 
join customers c on o.cid=c.cid and c.city='Kyoto' 
join orders o1 on o1.aid=o.aid order by o1.pid ;


--3. Get the names of customers who have never placed an order using subquery.

select distinct name 
from customers
where cid not in ( select cid 
		   from orders ); 


--4. Get the names of customers who have never placed an order using an outer join.

select distinct name 
from customers c
left outer join orders o on c.cid = o.cid
where o.cid is null ;


--5. Get the names of customers who placed at least one order through an agent in their city, along with those agents names.

select distinct c.name,a.name 
from customers c 
join agents a on c.city = a.city 
join orders o on o.aid = a.aid
where c.city = a.city and o.aid = a.aid and o.cid = c.cid ;


--6. Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not the 
--   customer has ever placed an order with that agent.

select distinct c.name, a.name 
from customers c
join agents a on c.city = a.city 
order by c.name, a.name ;


--7. Get the name and city of customers who live in a city where the least number of products are made.

select distinct c.name, c.city 
from customers c
where c.city in ( select city 
                  from products
		  group by city
		  order by count(quantity)
		  limit 1 ) ;
