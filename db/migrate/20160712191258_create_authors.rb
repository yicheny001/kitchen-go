class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
