class CreateTrajets < ActiveRecord::Migration[6.1]
  def change
    create_table :trajets do |t|
      t.string :origin_addresse
      t.string :destination_addresse

      t.timestamps
    end
  end
end
