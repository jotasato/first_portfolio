class Measurements < ActiveRecord::Migration[5.2]
  def change
  drop_table :measurements
  end
end
