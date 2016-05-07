class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.integer :specialty_id
      t.boolean :active, default: false
      t.integer :rank,   default: 100,   null: false
      t.string  :path,                   null: false, index: true
      t.string  :name,                   null: false
      t.text    :text,                   null: false

      t.timestamps                       null: false
    end

    add_index :pages, [:active, :rank, :specialty_id]
  end
end
