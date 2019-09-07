class RemoveMenuIdFromMealrecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :mealrecords, :Menu_id, :integer
  end
end
