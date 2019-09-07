class RemoveMealIdFromMealrecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :mealrecords, :Meal_id, :integer
  end
end
