class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
rename_table :users, :old_users_authlogic
    create_table(:users) do |t|
#say_with_time 'Migrating users from Authlogic to Devise...' do
#  execute "INSERT INTO users (id, email) SELECT id, email FROM old_users_authlogic"
#end    
  t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
    
      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration   
  end
end
