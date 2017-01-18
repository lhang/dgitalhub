class CreateUserActions < ActiveRecord::Migration
  def change
    create_table :user_actions do |t|
      t.string :type
      t.string :content

      t.timestamps null: false
    end
  end
end
