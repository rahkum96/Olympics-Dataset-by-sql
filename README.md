# Olympics-Dataset-by-sql


## Data
You can download the dataset from here. Or, you can download it by clicking on the below download button “Download Olympics Dataset”. 
https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results/download

## Approach data cleaning
- Once you download, you would see two csv files “athlete_events.csv“ and “noc_regions.csv“.
- cleaned data from “athlete_events.csv“ by using 'Power Query' in Excel and 
- Removed "NA" values from  column Medals“athlete_events.csv“ for simplicity 
- Named clean data "olympics_event" and write query using this table and "noc_region" table.

## Loading dataset to SQL Database:
- There are two method we can upload the data 1) from table wizard 2) from cmd prompt 
- Here I have used cmd prompt to upload the data, because the data set was huge it would take more than hour if we would import data from "import table wizard"

## Step to follow to import data from cmd prompt:
1. change directory
- - cd C:\Program Files\MySQL\MySQL Server 8.0\bin

2. mysql -u root -p
- - enter password- *******

3. configure with databse and quit the server 
  - - SET GLOBAL local_infile=1;
- - quit

4. configure with clinet server 
- - mysql --local-infile=1 -u root -p

5. Show Databases;
- - USE olympic;

6. Load the file 
- LOAD DATA LOCAL INFILE 'C:\\Users\\Rohit Kumar (Prince)\\OneDrive\\Desktop\\Ivy_Data_science\\SQL\\project\\Research_project\\olympic_event.csv'
INTO TABLE olympic_event
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;


## List of all these 20 queries mentioned below:
1. How many olympics games have been held?
2. List down all Olympics games held so far.
3. Mention the total no of nations who participated in each olympics game?
4. Which year saw the highest and lowest no of countries participating in olympics?
5. Which nation has participated in all of the olympic games?
6. Identify the sport which was played in all summer olympics.
7. Which Sports were just played only once in the olympics?
8. Fetch the total no of sports played in each olympic games.
9. Fetch details of the oldest athletes to win a gold medal.
10. Find the Ratio of male and female athletes participated in all olympic games.
11. Fetch the top 5 athletes who have won the most gold medals.
12. Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
13. Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
14. List down total gold, silver and broze medals won by each country.
15. List down total gold, silver and broze medals won by each country corresponding to each olympic games.
16. Identify which country won the most gold, most silver and most bronze medals in each olympic games.
17. Identify which country won the most gold, most silver, most bronze medals and the most medals in each olympic games.
18. Which countries have never won gold medal but have won silver/bronze medals?
19. In which Sport/event, India has won highest medals.
20. Break down all olympic games where india won medal for Hockey and how many medals in each olympic games.


