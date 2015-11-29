class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.boolean :active, default: false, null: false, index: true
      t.integer :specialty_id,           null: false, index: true
      t.string :image,                   null: false
      t.string :first_name,              null: false
      t.string :last_name,               null: false
      t.string :kind
      t.string :description
      t.string :bio
      t.string :accolades

      t.timestamps                       null: false
    end

    add_index :doctors, [:last_name, :first_name]
  end
end
