class AddMenuImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :menu_image_id, :string
  end
end
