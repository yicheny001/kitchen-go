class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :author_id
      t.integer :reader_id
      t.string :fav_cuisine
      t.text :bio
      t.string :image
      t.string :allergies
      t.string :hometown
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
