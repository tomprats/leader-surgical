class CreateSpecialtyConnections < ActiveRecord::Migration
  def change
    create_table :specialty_connections do |t|
      t.integer :parent_id, null: false, index: true
      t.integer :child_id,  null: false
    end
  end
end
