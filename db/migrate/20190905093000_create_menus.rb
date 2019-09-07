class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
     t.string  :menu_name
     t.string  :calorie
     t.string  :protein
     t.string  :fat
     t.string  :carbo
     t.boolean :is_deleted
     t.timestamps
    end
  end
end
