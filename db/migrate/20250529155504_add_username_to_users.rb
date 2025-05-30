class AddUsernameToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :string
  end
end
