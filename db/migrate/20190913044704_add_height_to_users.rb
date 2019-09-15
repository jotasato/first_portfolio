class AddHeightToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :height, :float
    add_column :users, :weight, :float
    add_column :users, :age, :integer
    add_column :users, :sex, :string
    add_column :users, :momentum, :float
    add_column :users, :result, :float


  end
end
