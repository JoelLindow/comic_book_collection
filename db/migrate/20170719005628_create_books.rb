class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :issue_number
      t.text :description
      t.string :img_url
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
