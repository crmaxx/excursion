class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name, null: false
      t.text :description
      t.integer :city_id, null: false
      t.boolean :public

      t.timestamps
    end

    add_index :tours, [:name], unique: true
  end
end
