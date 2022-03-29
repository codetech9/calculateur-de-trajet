class AddTimeNoTrafficAndDistanceToTrajets < ActiveRecord::Migration[6.1]
  def change
    add_column :trajets, :distance, :string
    add_column :trajets, :time_without_traffic, :string
  end
end
