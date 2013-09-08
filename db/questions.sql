#What 3 towns have the highest population of citizens that are 65 years and older?
select * from town_health_records order by population_05_over_64 desc limit 3;

#What 3 towns have the highest population of citizens that are 19 years and younger?
select * from town_health_records order by population_05_under_20 desc limit 3;

#What 5 towns have the lowest per capita income?
select * from town_health_records where per_capita_income_00 > 0 order by per_capita_income_00 asc limit 5;

#Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?
select * from town_health_records where location not in ('Boston', 'Becket', 'Beverly')
 order by teen_birth_perc desc limit 1;

#Omitting Boston, what town has the highest number of infant mortalities?
select * from town_health_records where location not in ('Boston','Massachusetts Total')
 order by infant_deaths_05_to_08 desc limit 1;
