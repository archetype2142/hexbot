class CreateImage < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :color
      t.integer :percentage
    end
  end
end
