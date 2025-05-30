# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[8.0]
  def self.up
    change_table :users, bulk: true do |t|
      # NO AGREGAMOS :email porque ya existe
      t.string :encrypted_password, null: false, default: ""

      # Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      # Rememberable
      t.datetime :remember_created_at

      # Puedes agregar más campos si los necesitas más adelante
    end

    add_index :users, :email, unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
