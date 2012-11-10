class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :picture_id
      t.text :comment
      t.string :user_id

      t.timestamps
    end
  end
end
