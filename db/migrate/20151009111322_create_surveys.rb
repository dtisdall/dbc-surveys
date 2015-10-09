class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.string :key
      t.text :description
    
      t.timestamps null: false
    end

  end
end
