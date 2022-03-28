class AddTimeToTrajets < ActiveRecord::Migration[6.1]
  def change
    add_column :trajets, :time, :string, default: 'now'
  end
end
