class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :survey, null: false
      t.text :text, null: false
    
      t.timestamps null: false
    end    
  end
end
