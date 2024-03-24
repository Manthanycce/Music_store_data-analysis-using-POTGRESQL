 --Q1 Who is the senior most employee on the job title ?

SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1;

--Q2 WHICH COUNTRY HAS THE MOST NUMBER OF CUSTOMERS ?

SELECT country as country_name,
count(customer_id) as Numer_of_users 
FROM customer 
group by country
order by Numer_of_users desc;

--Q3 WHAT ARE THE TOP 3 HIGHEST VALUES OF PURCHASE ?

SELECT total,customer_id
FROM invoice
ORDER BY total DESC
LIMIT 5;

--Q4 Which city has the best customers? We would like
--to throw a promotional Music Festival in the city we made the
--most money. Write a query that returns one city that has the highest
--sum of invoice totals. Return both the city name & sum of all 
--invoice totals

SELECT billing_city,
SUM(total) AS total_bill 
FROM invoice
GROUP BY billing_city
ORDER BY total_bill DESC;


--Q5 Who is the best customer? The customer who has spent the most
 --money will be declared the best customer. Write a query that 
 --returns the person who has spent the most money.
 
 select customer.customer_id ,customer.first_name,customer.last_name,sum(invoice.total) as total
 from customer
 inner join invoice
 on customer.customer_id=invoice.customer_id
 group by customer.customer_id
 order by total desc
 limit 1 ;
 
--Q6Write query to return the email, first name, last name, & Genre 
--of all Rock Music listeners. Return your list ordered alphabetically
--by email starting with A
 
 select distinct customer.email,customer.first_name,customer.last_name
 from customer
 inner join invoice
 on customer.customer_id=invoice.customer_id
 inner join invoice_line
 on invoice.invoice_id=invoice_line.invoice_id
 inner join track
 on invoice_line.track_id=track.track_id
 inner join genre
 on track.genre_id=genre.genre_id
 where genre.name = 'Rock'
 order by customer.email ;
 
--Q7Let's invite the artists who have written the most rock music 
--in our dataset. Write a query that returns the Artist name and 
--total track count of the top 10 rock bands

SELECT artist.artist_id,artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album on album.album_id=track.album_id
join artist ON artist.artist_id=album.artist_id
JOIN genre ON genre.genre_id=track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


--Q8) Return all the track names that have a song length longer
--than the average song length. Return the Name and Milliseconds
--for each track. Order by the song length with the longest songs
--listed first.

SELECT name,milliseconds
FROM track
WHERE milliseconds > 
(SELECT AVG(milliseconds)
 FROM track;
)
ORDER BY milliseconds DESC;