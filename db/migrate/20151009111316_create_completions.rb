class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.belongs_to :user, null: false
      t.belongs_to :survey, null: false 
    
      t.timestamps null: false
    end    
  end
end
