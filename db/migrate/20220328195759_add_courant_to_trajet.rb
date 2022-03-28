class AddCourantToTrajet < ActiveRecord::Migration[6.1]
  def change
    add_column :trajets, :courant, :boolean, default: false
  end
end
