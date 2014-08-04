class AddCpfToSpreeAddress < ActiveRecord::Migration
  def change
    unless column_exists? :spree_addresses, :cpf
      add_column :spree_addresses, :cpf, :string
    end
  end
end
