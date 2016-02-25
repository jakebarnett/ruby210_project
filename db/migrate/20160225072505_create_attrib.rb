class CreateAttrib < ActiveRecord::Migration
  def change
    create_table :attribs do |t|
      t.integer :project_id
      t.string :name
      t.string :description
    end
  end
end
