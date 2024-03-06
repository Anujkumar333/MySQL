SELECT * FROM ecommerce.users_data;
#ANS 3
desc users_data;
# ANS4
select*from users_data limit 100;
# ANS5r
select count(distinct country) as country,count(distinct language) language from users_data;
#ANS6r
select gender,count(socialNbFollowers) as socialNbFollowers from users_data where socialNbFollowers >=1 group by gender;
# ANS7r
select count(hasprofilepicture) as profilepicture from users_data where hasprofilepicture=true;
select count(hasAnyApp) as hasAnyApp from users_data where hasAnyApp=true;
select count(hasAndroidApp) as AndroidApp from users_data where hasAndroidApp=true;
select count(hasIosApp) as IosApp from users_data where hasIosApp=true;
# ANS8r
select country,count(productsBought) as buyers from users_data where productsBought >=1 group by country order by buyers desc;
#ANS 9r
select country,count(productsSold) as sellers from users_data where productsSold >=1 group by country order by sellers asc;
# ANS10r
select country,count(productspassrate) as ProductsRate from users_data group by country order by ProductsRate  desc limit 10;
# ANS11r
select count(hasAnyApp),language from users_data group by language;
#ANS12r
select 'product in a wishlist', count(productsWished) choices
 from users_Data where gender='F' and productsWished>0
 union
 select 'product liked socially', count(socialProductsLiked) choices2
 from users_Data where gender='F' and socialProductsLiked>0;
#ANS 13r
select 'Selling', count(productsSold) choices
 from users_Data where gender='M' and productsSold>0
 union
 select 'Buying', count(productsBought) choices2
 from users_Data where gender='M' and productsBought>0;
#ANS14r
select country,max(productsBought) as max_buyer from users_data;
#ANS15r
select country,productssold from users_data where productssold=0 limit 10;
# ANS16r
select hasAnyApp from users_data where hasAnyApp=0 order by hasAnyApp desc limit 110;
#ANS17r
select count(gender) as female from users_data where gender="f" and daysSinceLastLogin !=100;
#ANS18r
select country,count(gender) as female from users_data where gender="f"  group by country;
#ANS19r
select country,hasAnyApp,gender from users_data where gender="m";
#ANS20r
select country,avg(productsSold) Sold,avg(productsBought) Bought
from users_data  
where gender='M' and hasAnyApp='True' group by country;