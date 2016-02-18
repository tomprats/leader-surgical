class CreateVisions < ActiveRecord::Migration[5.0]
  def change
    create_table :visions do |t|
      t.boolean :active, default: false, null: false, index: true
      t.integer :rank,   default: 10000, null: false, index: true
      t.string :title,                   null: false
      t.text :text,                      null: false

      t.timestamps                       null: false
    end

    add_column :doctors, :rank, :integer, default: 10000, null: false, index: true
    rename_column :doctors, :accolades, :associations
    change_column :faqs, :answer, :text
    change_column :specialties, :description, :text
    change_column :procedures, :description, :text
    add_column :procedures, :doctor_id, :integer, index: true
  end
end
