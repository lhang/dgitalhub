class CreateDgitalAttachments < ActiveRecord::Migration
  def change
    create_table :dgital_attachments do |t|
      t.string :image
      
      t.timestamps null: false
    end
  end
end
