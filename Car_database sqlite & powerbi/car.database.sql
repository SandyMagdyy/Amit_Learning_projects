--changed the null values 
--update Car_Options
--set premium_sound_id = 5
--where premium_sound_id is null
--update Models
--set model_name = "other"
--where model_name is 450
--Questions:
--1-top brand and model name by sales? 2-cars quantity? 3- manufacture plant name and location of the cars?
--4- manufacture plant type and date of the cars? 5- top dealer name by sales? 6- total sales by year?
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT B.brand_name,M.model_name,sum(CO.purchase_price) as Total_sales_by_brand_model_name,
COUNT(B.brand_name) as cars_quantity,MP.plant_name as manufacture_plant_name,(MP.plant_location),
MP.plant_type,CV.manufactured_date,D.dealer_name,
STRFTIME('%Y', CO.purchase_date) Date_Year, sum(CO.purchase_price) as Total_sales_year
from Brands B
join Models M on M.brand_id= B.brand_id
join Car_Vins CV on CV.model_id= M.model_id
join Customer_Ownership CO on CO.vin= CV.vin
join Manufacture_Plant MP on MP.manufacture_plant_id= CV.manufactured_plant_id
join Dealers D on D.dealer_id= CO.dealer_id
group by B.brand_name
order by sum(CO.purchase_price) DESC