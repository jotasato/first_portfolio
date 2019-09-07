class RemoveUserIdFromMealrecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :mealrecords, :User_id, :integer
  end
end
