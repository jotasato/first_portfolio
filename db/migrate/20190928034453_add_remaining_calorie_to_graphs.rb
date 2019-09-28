class AddRemainingCalorieToGraphs < ActiveRecord::Migration[5.2]
  def change
    add_column :graphs, :remaining_calorie, :integer
  end
end
