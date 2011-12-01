class AddAlbumsToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :albums_id, :integer
  end
end
