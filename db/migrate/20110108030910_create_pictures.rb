class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.integer  :desired_h
      t.integer  :desired_w
      t.integer  :crop_x
      t.integer  :crop_y
      t.integer  :crop_w
      t.integer  :crop_h
      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
