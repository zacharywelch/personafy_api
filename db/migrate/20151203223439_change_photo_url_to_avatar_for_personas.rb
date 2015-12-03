class ChangePhotoUrlToAvatarForPersonas < ActiveRecord::Migration
  def change
    rename_column :personas, :photo_url, :avatar
  end
end
