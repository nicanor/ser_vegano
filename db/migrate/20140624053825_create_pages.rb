class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug , null: false
      t.string :old_slug
      t.string :page_type
      t.text :description, default: '', null: false
      t.text :content    , default: '', null: false
      t.boolean :public   , default: false, null: false
      t.boolean :protected, default: false, null: false
      t.date :publication_date
      t.string :facebook_url
      t.string :photo_uid
      t.string :photo_name

      t.timestamps
    end
  end
end
