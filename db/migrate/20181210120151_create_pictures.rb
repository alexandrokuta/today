class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
    t.text       :image, null: false
    t.string     :text
    t.references :user,null: false
    t.timestamps  null: false
    end
  end
end
