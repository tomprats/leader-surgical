class CreateBodyParts < ActiveRecord::Migration[5.0]
  def change
    create_table :body_parts do |t|
      t.boolean :active, default: false,     null: false, index: true
      t.integer :doctor_id,                  null: false
      t.string :name,                        null: false
      t.string :color,                       null: false
      t.string :coords,                      null: false
      t.string :description

      t.timestamps                       null: false
    end

    add_column :procedures, :body_part_id, :integer, index: true
  end
end
