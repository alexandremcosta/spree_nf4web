class AddNeighborhoodToSpreeAddresses < ActiveRecord::Migration
  def change
    unless column_exists? :spree_addresses, :neighborhood
      add_column :spree_addresses, :neighborhood, :string, default: ''
    end
  end
end
