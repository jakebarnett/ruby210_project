class CreateCapabilities < ActiveRecord::Migration
  def change
    create_table :capabilities do |t|
      t.string :name
      t.string :description
      t.boolean :passing
      
      t.integer :attrib_id
      t.integer :component_id
    end
    add_index :capabilities, [:attrib_id, :component_id]
  end
end
