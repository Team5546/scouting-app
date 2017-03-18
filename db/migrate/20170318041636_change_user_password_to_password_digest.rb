class ChangeUserPasswordToPasswordDigest < ActiveRecord::Migration[5.0]
  def change
    add_column :scouts, :password_digest, :string
  end
end
