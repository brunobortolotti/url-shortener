class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :key
      t.string :source

      t.timestamps
    end
  end
end
