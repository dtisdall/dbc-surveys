class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.belongs_to :completion, null: false
      t.belongs_to :choice, null: false
    
      t.timestamps null: false
    end    
  end
end
