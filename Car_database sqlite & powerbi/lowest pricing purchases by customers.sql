--Question: lowest pricing purchases by customers

SELECT first_name || ' ' || last_name AS Full_Name, CO.purchase_price
from Customer_Ownership CO
left join Customers C on CO.customer_id = C.customer_id
order by CO.purchase_price asc
limit 2