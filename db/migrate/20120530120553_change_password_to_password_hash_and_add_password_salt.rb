class ChangePasswordToPasswordHashAndAddPasswordSalt < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.rename :password, :password_hash
      t.rename :name, :email
      t.string :password_salt
    end
  end

  def down
    change_table :users do |t|
      t.rename :password_hash, :password
      t.rename :email, :name
      t.remove :password_salt
    end
  end
end
