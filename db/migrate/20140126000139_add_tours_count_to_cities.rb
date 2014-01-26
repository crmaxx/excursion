class AddToursCountToCities < ActiveRecord::Migration
  def change
    add_column :cities, :tours_count, :integer, default: 0, null: false
  end
end
