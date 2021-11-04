class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false, index: { unique: true }
      t.text :description
      t.string :author
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
