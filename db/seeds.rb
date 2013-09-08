# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'


data = []
CSV.foreach('db/data/mass_chip_data.csv', headers: true) do |row|
  data.push(row.to_hash)
end



  data.each do |grouping|
    record = TownHealthRecord.where({
    location: grouping["Geography"]}).first
    grouping["Per Capita Income, year 2000"].to_s.slice!("$") if grouping["Per Capita Income, year 2000"].to_s.include?("$")
    grouping["total pop, year 2005"].to_s.slice!(",") if grouping["total pop, year 2005"].to_s.include?(",")
    grouping["age 0-19, year 2005"].to_s.slice!(",") if grouping["age 0-19, year 2005"].to_s.include?(",")
    grouping["age 65+, year 2005"].to_s.slice!(",") if grouping["age 65+, year 2005"].to_s.include?(",")
    grouping["Per Capita Income, year 2000"].to_s.slice!(",") if grouping["Per Capita Income, year 2000"].to_s.include?(",")
    grouping["Persons Living Below 200% Poverty, year 2000"].to_s.slice!(",") if grouping["Persons Living Below 200% Poverty, year 2000"].to_s.include?(",")
    grouping["Number of infant deaths, 2005-2008"].to_s.slice!(",") if grouping["Number of infant deaths, 2005-2008"].to_s.include?(",")
      if record.nil?
        record = TownHealthRecord.new({
          :location => grouping["Geography"],
          :population_05 => grouping["total pop, year 2005"].to_i,
          :population_05_under_20 => grouping["age 0-19, year 2005"].to_i,
          :population_05_over_64 => grouping["age 65+, year 2005"].to_i,
          :per_capita_income_00 => grouping["Per Capita Income, year 2000"].to_i,
          :total_population_00_below_200_perc_poverty => grouping["Persons Living Below 200% Poverty, year 2000"].to_i,
          :population_00_perc_below_200_perc_poverty => grouping["% all Persons Living Below 200% Poverty Level, year 2000"],
          :adequate_prenatal_care_perc => grouping["% adequacy prenatal care (kotelchuck)"],
          :c_section_perc_05_to_08 => grouping["% C-section deliveries, 2005-2008"],
          :infant_deaths_05_to_08 => grouping["Number of infant deaths, 2005-2008"].to_i,
          :infant_mortality_perc_05_to_08 => grouping["Infant mortality rate (deaths per 1000 live births), 2005-2008"],
          :low_birth_perc_05_to_08 => grouping["% low birthweight 2005-2008"],
          :multiple_birth_perc_05_to_08 => grouping["% multiple births, 2005-2008"],
          :public_prenatal_perc => grouping["% publicly financed prenatal care, 2005-2008"],
          :teen_birth_perc => grouping["% teen births, 2005-2008"]
          })
      else
        record.assign_attributes({
          :location => grouping["Geography"],
          :population_05 => grouping["total pop, year 2005"],
          :population_05_under_20 => grouping["age 0-19, year 2005"],
          :population_05_over_64 => grouping["age 65+, year 2005"],
          :per_capita_income_00 => grouping["Per Capita Income, year 2000"],
          :total_population_00_below_200_perc_poverty => grouping["Persons Living Below 200% Poverty, year 2000"],
          :population_00_perc_below_200_perc_poverty => grouping["% all Persons Living Below 200% Poverty Level, year 2000"],
          :adequate_prenatal_care_perc => grouping["% adequacy prenatal care (kotelchuck)"],
          :c_section_perc_05_to_08 => grouping["% C-section deliveries, 2005-2008"],
          :infant_deaths_05_to_08 => grouping["Number of infant deaths, 2005-2008"],
          :infant_mortality_perc_05_to_08 => grouping["Infant mortality rate (deaths per 1000 live births), 2005-2008"],
          :low_birth_perc_05_to_08 => grouping["% low birthweight 2005-2008"],
          :multiple_birth_perc_05_to_08 => grouping["% multiple births, 2005-2008"],
          :public_prenatal_perc => grouping["% publicly financed prenatal care, 2005-2008"],
          :teen_birth_perc => grouping["% teen births, 2005-2008"]
          })
      end

      record.save!

end









