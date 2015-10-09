class AddSurveyRandUrlCol < ActiveRecord::Migration
  def change
    add_column :surveys, :url, :string, null: false,
  end
end
