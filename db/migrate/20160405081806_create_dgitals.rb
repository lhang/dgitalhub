class CreateDgitals < ActiveRecord::Migration
  def change
    create_table :dgitals do |t|
      t.string :title
      t.text :intro
      t.string :link
      t.string :location
      t.string :quality
      t.string :brand
      t.string :contact
      t.string :price
      t.date :hand_on_date
      t.datetime :publish_time
      t.string :from_site
      t.string :image

      t.timestamps null: false
    end

  end
end
