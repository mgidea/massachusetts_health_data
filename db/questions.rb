#What 3 towns have the highest population of citizens that are 65 years and older?
TownHealthRecord.order("population_05_over_64 DESC").limit(3)

#What 3 towns have the highest population of citizens that are 19 years and younger?
TownHealthRecord.order("population_05_under_20 DESC").limit(3)

#What 5 towns have the lowest per capita income?
TownHealthRecord.order("per_capita_income_00").limit(5).offset(2)

#Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?
TownHealthRecord.order("teen_birth_perc DESC").where.not("location = ? OR location = ? OR location = ?",'Boston','Becket','Beverly').limit(1)

#Omitting Boston, what town has the highest number of infant mortalities?
TownHealthRecord.order("infant_mortality_perc_05_to_08 DESC").where.not("location = ?",'Boston').limit(1)
