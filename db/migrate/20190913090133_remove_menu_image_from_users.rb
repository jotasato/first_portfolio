class RemoveMenuImageFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :menu_image, :string
  end
end
