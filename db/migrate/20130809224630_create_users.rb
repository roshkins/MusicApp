class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :status
      t.string :password
      t.string :email_token
      t.string :session_token
      t.boolean :admin, default:"false"

      t.timestamps
    end
    add_index :users, :email
    add_index :notes, :user_id
  end
end
