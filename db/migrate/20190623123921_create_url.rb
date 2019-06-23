class CreateUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :link
    end
  end
end
