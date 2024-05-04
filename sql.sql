-- itemsview -> for getting the items with its gategory, first image and rating

create or replace view itemsview as select *, items_price - (items_price * (discount / 100)) as priceAfterDiscount from 
items 
inner join subcategories on items.items_subcat_id  = subcategories.subcat_id 
left join (select * from item_images group by item_id) as item_images on items.items_id = item_images.item_id
left join (select sum(reviews_rating) / count(reviews_rating) as rating,count(reviews_rating) as raters, item_id as itemsId from reviews group by item_id) as rating  on  itemsId = items.items_id
left join brands on brands_id = brand_id

-------------------------------------------------------------------------------------------
-- this is the ordersview
create or REPLACE view ordersview as
(
select orders.*, order_status.order_status_name, addresses.addresses_name, orders_type.orders_type_name, if(coupons_id is null, 0,1) as isUsedCoupon, payment_methods.payment_methods_name, prices.fullPrice, 
(fullPrice - (fullPrice * (coupons_amount / 100))) as priceAfterCoupon
from orders
inner join order_status on order_status_id = orders_statusid 
left join addresses on addresses_id = orders_addressid 
inner join orders_type on orders_type_id = orders_typeid 
left join (select coupons_id, coupons_amount from coupons) as coupons on coupons_id = orders_couponid 
inner join payment_methods on payment_methods_id = orders_paymentmethodid  
)

-------------------------------------------------------------------------------------------

-- this query for getting the orders for the admin and it contains the ordersview but added more information about the address and the also the coupon name if used
select ordersview.*,addresses.addresses_lat,addresses.addresses_long,addresses.addresses_desc,coupons.coupons_name from ordersview inner join addresses on ordersview.orders_addressid = addresses.addresses_id
left join coupons on ordersview.orders_couponid = coupons.coupons_id 


-------------------------------------------------------------------------------------------
-- gets the items price of every orders

 select cart_orderid as order_id, sum(fullPrice) from
 (
select  cart.*, (cart_amount  * itemsview.priceAfterDiscount) as fullPrice from cart inner join itemsview on cart_itemid = itemsview.items_id 
 ) as data
 
GROUP by cart_orderid having cart_orderid is not null
-----------------------------------------------------------

--! create the map screen which will have a controller that will have a fcuntoin that listen to the location and send the location updates
--! to CloudFirestore and the user should listen to it

--! if I prepare the order then I should notify the delivererres about that and they should listen to it
--! when I cancel an order then the user should list to that stream


SELECT * FROM 
itemsview
inner join (select * from cart where cart_orderid = 23) as cart on cart_itemid = itemsview.items_id 
left join (select cart_itemid as cart2_itemid, cart_amount as inCart from cart where cart_userid = 71 and cart_orderid is null) as cart2 on cart2_itemid = cart_itemid