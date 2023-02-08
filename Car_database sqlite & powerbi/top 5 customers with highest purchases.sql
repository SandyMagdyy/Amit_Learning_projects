--Question: Top 5 customers with highest purchases?
SELECT first_name || ' ' || last_name AS Full_Name, CO.purchase_price
from Customers C
left join Customer_Ownership CO on CO.customer_id = C.customer_id
order by CO.purchase_price desc
limit 5