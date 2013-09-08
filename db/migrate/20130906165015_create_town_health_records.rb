class CreateTownHealthRecords < ActiveRecord::Migration
  def change
    create_table :town_health_records do |t|
      t.string   :location
      t.integer  :population_05
      t.integer  :population_05_under_20
      t.integer  :population_05_over_64
      t.integer  :per_capita_income_00
      t.integer  :total_population_00_below_200_perc_poverty
      t.float    :population_00_perc_below_200_perc_poverty
      t.float    :adequate_prenatal_care_perc
      t.float    :c_section_perc_05_to_08
      t.integer  :infant_deaths_05_to_08
      t.float    :infant_mortality_perc_05_to_08
      t.float    :low_birth_perc_05_to_08
      t.float    :multiple_birth_perc_05_to_08
      t.float    :public_prenatal_perc
      t.float    :teen_birth_perc

      t.timestamps
    end
  end
end
