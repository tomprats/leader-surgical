class CreateFAQs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.boolean :active, default: false, null: false, index: true
      t.integer :rank,   default: 10000, null: false, index: true
      t.string :question,                null: false
      t.string :answer,                  null: false

      t.timestamps                       null: false
    end
  end
end
