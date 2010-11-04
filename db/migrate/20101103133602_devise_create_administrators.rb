class DeviseCreateAdministrators < ActiveRecord::Migration
  def self.up
    create_table(:administrators) do |t|
      t.database_authenticatable :null => false
      t.rememberable
      # t.confirmable
      # t.recoverable
      # t.trackable
      # t.lockable

      t.timestamps
    end

    add_index :administrators, :email,                :unique => true
    # add_index :administrators, :confirmation_token,   :unique => true
    # add_index :administrators, :reset_password_token, :unique => true
    # add_index :administrators, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :administrators
  end
end
