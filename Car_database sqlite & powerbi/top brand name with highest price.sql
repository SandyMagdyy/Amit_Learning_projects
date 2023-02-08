--Question: Top 2 brand name with highest purchases price and customer's name and their income?

select B.brand_name, CO.purchase_price,  first_name || ' ' || last_name AS Full_Name,C.household_income
from Customers C
left join Customer_Ownership CO on C.customer_id=CO.customer_id
left join Dealers D on D.dealer_id= CO.dealer_id
left join Dealer_Brand DB on DB.brand_id= D.dealer_id
left join Brands B on B.brand_id = DB.brand_id
order by  CO.purchase_price DESC
limit 2