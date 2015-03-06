class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, index: true
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :commentable_parent

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
  end
end
