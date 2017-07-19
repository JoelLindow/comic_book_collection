class CreateUsersBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :users_books do |t|
      t.references :users, foreign_key: true
      t.references :books, foreign_key: true

      t.timestamps
    end
  end
end
