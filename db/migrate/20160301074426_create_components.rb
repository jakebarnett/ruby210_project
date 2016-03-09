class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.integer :project_id
      t.references :projects, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
