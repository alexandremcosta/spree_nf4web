require 'csv'

class PopulateBrazilianCities < ActiveRecord::Migration
  def up
    options = {:encoding => 'UTF-8', :skip_blanks => true}
    CSV.read("../csv/brazilian_cities.csv", options).each_with_index do |row, i|
      state = Spree::State.find_by_abbr(row[3])
      if state
        BrazilianCity.create(name: row[1], ibge_code: row[2], state: state)
      end
    end
  end

  def down
    BrazilianCity.destroy_all
  end
end
