class RemoveMenuImageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :menu_image_id, :string
  end
end
