class AddUserInfoToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :nickname
      t.string :header
    end
  end
end
