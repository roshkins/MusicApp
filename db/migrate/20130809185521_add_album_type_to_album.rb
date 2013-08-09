class AddAlbumTypeToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :album_type, :string, null: false, default: "studio"
  end
end
