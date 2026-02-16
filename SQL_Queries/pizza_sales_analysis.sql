select sum(total_price) as total_revenue from pizza_sales;
select sum(total_price) / count(distinct order_id) as avg_order_value from pizza_sales;
select sum(quantity) as total_pizza_sold from pizza_sales;
select count(distinct(order_id)) as total_orders from pizza_sales;
select cast(sum(quantity) as decimal(10,2)) / cast(count(distinct(order_id)) as decimal(10,2)) as avg_pizza_per_order from pizza_sales;
select datename(DW,order_date) as date_name, count(distinct order_id) as total_order from pizza_sales
group by datename(DW,order_date);
select pizza_category,sum(total_price) as total_amount,sum(total_price) *100/ ( select sum(total_price) from pizza_sales) as PCT 
from pizza_sales
group by pizza_category;
select pizza_category,sum(total_price) as total_amount,sum(total_price) *100/ ( select sum(total_price) from pizza_sales) as PCT 
from pizza_sales
where month(order_date)=2
group by pizza_category;
select pizza_size,sum(total_price) as total_amount,cast(sum(total_price) *100/ ( select sum(total_price) from pizza_sales) as  decimal(10,2)) as PCT 
from pizza_sales
group by pizza_size;
select top 5 pizza_name,cast(sum(total_price) as decimal(10,2)) as total_revenue 
from pizza_sales
group by  pizza_name
order by  total_revenue desc ;
select top 5 pizza_name,cast(sum(total_price) as decimal(10,2)) as total_revenue 
from pizza_sales
group by  pizza_name
order by  total_revenue asc ;
