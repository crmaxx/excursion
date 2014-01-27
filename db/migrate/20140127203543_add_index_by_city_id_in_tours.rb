class AddIndexByCityIdInTours < ActiveRecord::Migration
  def change
    add_index :tours, [:city_id]
  end
end
