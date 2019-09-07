class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.integer :user_id
      t.float   :stature
      t.float   :body_weight
      t.string  :sex
      t.string  :age
      t.float   :momentum
      t.timestamps
    end
  end
end
