class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name, limit: 20
      t.string :code, limit: 10
    end
  end
end
