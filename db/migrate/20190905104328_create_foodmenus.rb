class CreateFoodmenus < ActiveRecord::Migration[5.2]
  def change
    create_table :foodmenus do |t|

      t.timestamps
      t.integer :food_id
      t.integer :menu_id

    end
  end
end
