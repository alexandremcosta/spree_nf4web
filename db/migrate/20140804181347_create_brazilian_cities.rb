class CreateBrazilianCities < ActiveRecord::Migration
  def change
    create_table :brazilian_cities do |t|
      t.string :name
      t.integer :ibge_code
      t.references :spree_state, index: true

      t.timestamps
    end
  end
end
