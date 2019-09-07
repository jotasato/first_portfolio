class AddMenuIdToMealrecords < ActiveRecord::Migration[5.2]
  def change
    add_column :mealrecords, :menu_id, :integer
  end
end
