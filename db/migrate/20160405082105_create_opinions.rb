class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.text :content
      t.string :name
      t.string :contact
      t.references :parent_opinion
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
