class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :slug
      t.string :file_name
      t.string :file_uid
      t.string :mime_type
      t.string :format
      t.string :width
      t.string :height
      t.string :size

      t.timestamps
    end
  end
end
