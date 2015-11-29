class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.boolean :active, default: false, null: false, index: true
      t.integer :specialty_id,           null: false, index: true
      t.string :name,                    null: false, index: true
      t.string :link
      t.string :description

      t.timestamps                       null: false
    end
  end
end
