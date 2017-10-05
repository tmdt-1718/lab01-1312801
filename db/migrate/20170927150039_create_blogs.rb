class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
    add_foreign_key :blogs , column: :user_id
  end
end
