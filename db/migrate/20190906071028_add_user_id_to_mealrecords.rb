class AddUserIdToMealrecords < ActiveRecord::Migration[5.2]
  def change
   add_column :mealrecords, :user_id, :integer
  end
end
