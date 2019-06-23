class AddImageToUrls < ActiveRecord::Migration[5.2]
  def change
    add_reference :urls, :image, foreign_key: true
  end
end
