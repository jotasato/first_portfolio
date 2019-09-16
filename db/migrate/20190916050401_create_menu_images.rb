class CreateMenuImages < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_images do |t|
      t.integer :menu_id
      t.text :menu_image_id
      t.timestamps
    end
  end
end
