class InitSchema < ActiveRecord::Migration
  def up
    create_table "admins" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.string "name"
      t.string "postal_code"
      t.string "address"
      t.string "tel"
      t.boolean "is_deleted", default: false
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_admins_on_email", unique: true
      t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    end
    create_table "favorites" do |t|
      t.integer "menu_id"
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "foodmenus" do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "food_id"
      t.integer "menu_id"
    end
    create_table "foods" do |t|
      t.string "food_name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "graphs" do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "user_id"
      t.integer "remaining_calorie"
    end
    create_table "mealrecords" do |t|
      t.integer "user_id"
      t.integer "menu_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "menu_images" do |t|
      t.integer "menu_id"
      t.text "menu_image_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "menus" do |t|
      t.string "menu_name"
      t.integer "calorie"
      t.integer "protein"
      t.integer "fat"
      t.integer "carbo"
      t.boolean "is_deleted"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "menu_image_id"
    end
    create_table "users" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "nickname"
      t.string "postal_code"
      t.string "address"
      t.string "tel"
      t.string "objective"
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.datetime "deleted_at"
      t.float "height"
      t.float "weight"
      t.integer "age"
      t.string "sex"
      t.float "momentum"
      t.float "result"
      t.string "gender"
      t.boolean "admin", default: false
      t.index ["deleted_at"], name: "index_users_on_deleted_at"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
