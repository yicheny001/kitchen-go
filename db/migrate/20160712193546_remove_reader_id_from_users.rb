class RemoveReaderIdFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :reader_id
  end
end
