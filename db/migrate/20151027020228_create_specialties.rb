class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.boolean :active, default: false, null: false, index: true
      t.integer :parent_id,                           index: true
      t.integer :doctor_id,                           index: true
      t.string :name,                    null: false, index: true
      t.string :link
      t.string :description

      t.timestamps                       null: false
    end
  end
end
