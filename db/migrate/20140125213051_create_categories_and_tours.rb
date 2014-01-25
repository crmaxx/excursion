class CreateCategoriesAndTours < ActiveRecord::Migration
  def change
    create_table :categories_tours, id: false do |t|
      t.belongs_to :category, null: false
      t.belongs_to :tour, null: false
    end

    add_index :categories_tours, [:category_id, :tour_id], unique: true
  end
end
