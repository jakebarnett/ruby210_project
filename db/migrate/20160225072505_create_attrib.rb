class CreateAttrib < ActiveRecord::Migration
  def change
    create_table :attribs do |t|
      t.string :name
      t.string :description
      t.integer :project_id
      t.references :projects, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
