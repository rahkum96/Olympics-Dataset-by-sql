create database olympics;
use olympics;
CREATE TABLE  OLYMPICS
(id          INT,
name    text,
sex      text,
    age       int,
    height     int,
    weight      int,
    team       text,
    noc         text,
    games       text,
    year        text,
    season      text,
    city        text,
    sport       text,
    event      text,
    medal      text
);

CREATE TABLE REGIONS
(
    noc        text,
    region  text
   );

select * from olympics limit 10;

select * from REGIONS limit 10;

/*List of all these 20 queries mentioned below: */

/* 1. How many olympics games have been held?*/
select count(distinct games) as Total_games
from olympics;

/*2. List down all Olympics games held so far.*/
select year,season,city
from olympics;

/*3. Mention the total no of nations who participated in each olympics game?*/
select o.games,count(distinct(o.noc)) as total_countries
from olympics o, regions r
where o.noc=r.noc
group by games
order by games;

/*4. Which year saw the highest and lowest no of countries participating in olympics*/
select games
 from   (select o.games,count(distinct(o.noc)) as total_countries
	from olympics o, regions r
	where o.noc=r.noc
	group by games
	order by games) as x;

/*5.Which nation has participated in all of the olympic games*/
select r.region as country, count(distinct(games)) as Total_games
from olympics o, regions r
where o.noc=r.noc
group by region
order by 2 desc;

/*6. Identify the sport which was played in all summer olympics.*/

select sport, count(distinct(games)) as Total_games
from olympics
where season= "summer"
group by sport
having Total_games =29
order by 2 desc ;


	with t1 as
          	(select count(distinct games) as total_games
          	from olympics where season = 'Summer'),
          t2 as
          	(select distinct games, sport
          	from olympics where season = 'Summer'),
          t3 as
          	(select sport, count(1) as no_of_games
          	from t2
          	group by sport)
      select *
      from t3
      join t1 on t1.total_games = t3.no_of_games;

/*7. Which Sports were just played only once in the olympics*/
select sport, count(distinct games) as no_of_games, games
from olympics
group by sport
having no_of_games=1;

/*8. Fetch the total no of sports played in each olympic games.*/
select games, count(distinct sport) as no_of_sports
from olympics
group by games
order by 2 desc;

/*9. Fetch oldest athletes to win a gold medal*/
select * 
from(select *,
	rank() over (order by age desc) as rnk
	from olympics
	where medal= "gold") as x
where rnk=1;

/*10. Find the Ratio of male and female athletes participated in all olympic games.*/
select sum(if(sex="M",1,0))/sum(if(sex="F",1,0)) as ratio
from olympics;

SELECT
    COUNT(IF(sex = 'M', 1, NULL)) count_male,
    COUNT(IF(sex = 'F', 1, NULL)) count_female,
    COUNT(IF(sex = 'M', 1, NULL))/COUNT(IF(sex = 'F', 1, NULL)) as ratio
FROM olympics;

/*11. Fetch the top 5 athletes who have won the most gold medals.*/
select * from
(select *, dense_rank() over (order by Total_gold desc) as rnk
from (select name, team, count(*) as Total_gold
from olympics
where medal= "gold"
group by name
order by Total_gold desc)as x) as y
where rnk<=5;

/*12.Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).*/
select * 
from (select * , dense_rank() over(order by Total_medal desc) as rnk
	from (select name, team, count(medal) as Total_medal
		from olympics
		group by name
		order by 3 desc) as x) as y
where rnk <=5;

/*13. Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won*/
select * from
(select * , rank() over (order by Total_medal desc) as rnk
from(select region, count(medal) as Total_medal
	from olympics as o, regions as r
	where o.noc=r.noc
	group by region
	order by 2 desc) as x) as y
where rnk <=5;

/*14. List down total gold, silver and bronze medals won by each country.*/
select region as country,
	count(case when medal= "gold" then "gold" end )as Gold_medal,
    count(case when medal= "silver" then "silver" end )as silver_medal,
    count(case when medal= "bronze" then "bronze" end )as bronze_medal
from olympics as o, regions as r 
where o.noc= r.noc
group by region
order by 2 desc;

/*15.List down total gold, silver and bronze medals won by each country corresponding to each olympic games.*/
select games, region as country,
	count(case when medal= "gold" then "gold" end )as Gold_medal,
    count(case when medal= "silver" then "silver" end )as silver_medal,
    count(case when medal= "bronze" then "bronze" end )as bronze_medal
from olympics as o, regions as r 
where o.noc= r.noc
group by region;

/*18.Which countries have never won gold medal but have won silver/bronze medals?*/
select region as country,
	count(case when medal= "gold" then null end )as Gold_medal,
    count(case when medal= "silver" then "silver" end )as silver_medal,
    count(case when medal= "bronze" then "bronze" end )as bronze_medal
from olympics as o, regions as r 
where o.noc= r.noc
group by region
order by region;

/*19. In which Sport/event, India has won highest medals.*/
select sport, max(total_medals) as total_medal from
(select sport , count(medal) as total_medals
from olympics as o, regions as r
where o.noc=r.noc and region="india"
group by sport) as x;

/*20.Write an SQL Query to fetch details of all Olympic Games where India won medal(s) in hockey.*/
select region as country,sport, games, count(*) as total_medals
from olympics o, regions r
where o.noc=r.noc and region="india" and sport="hockey"
group by games
order by 4 desc;

/*16.Write SQL query to display for each Olympic Games, which country won the highest gold, silver and bronze medals.*/
select games, region as country,
	count(case when medal= "gold" then "gold" end )as max_Gold_medal,
    count(case when medal= "silver" then "silver" end )as max_silver_medal,
    count(case when medal= "bronze" then "bronze" end )as max_bronze_medal
from olympics as o, regions as r 
where o.noc= r.noc
group by games,region
order by region;

select * from olympics limit 10;
select * from REGIONS limit 10;

