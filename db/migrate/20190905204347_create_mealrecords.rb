class CreateMealrecords < ActiveRecord::Migration[5.2]
  def change
    create_table :mealrecords do |t|
      t.integer  :user_id
      t.integer  :menu_id
      t.timestamps
    end
  end
end
