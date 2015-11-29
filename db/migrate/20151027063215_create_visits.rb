class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.boolean :active, default: false, null: false, index: true
      t.integer :rank,   default: 10000, null: false, index: true
      t.integer :parent_id
      t.string :name,                    null: false
      t.string :file
      t.string :description

      t.timestamps                       null: false
    end
  end
end
