class CreatePictures < ActiveRecord::Migration
  def down
    create_table :pictures do |t|
      t.string :url
      t.text :note
      t.boolean :favorite

      t.timestamps
    end

    def up
    end
  end
end
