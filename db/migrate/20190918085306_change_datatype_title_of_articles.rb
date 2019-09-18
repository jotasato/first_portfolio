class ChangeDatatypeTitleOfArticles < ActiveRecord::Migration[5.2]
 
  def change
    change_column :menus, :calorie, :integer
    change_column :menus, :fat, :integer
    change_column :menus, :carbo, :integer
    change_column :menus, :protein, :integer


  end
end
