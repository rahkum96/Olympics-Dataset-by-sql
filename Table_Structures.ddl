
CREATE TABLE OLYMPICS
(
    id          INT,
    name        VARCHAR,
    sex         VARCHAR,
    age         VARCHAR,
    height      VARCHAR,
    weight      VARCHAR,
    team        VARCHAR,
    noc         VARCHAR,
    games       VARCHAR,
    year        INT,
    season      VARCHAR,
    city        VARCHAR,
    sport       VARCHAR,
    event       VARCHAR,
    medal       VARCHAR
);


CREATE TABLE REGIONS
(
    noc         VARCHAR,
    region      VARCHAR,
    
);

select * from OLYMPICS_event;
select * from REGIONS;
