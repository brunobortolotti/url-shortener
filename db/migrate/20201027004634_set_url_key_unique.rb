class SetUrlKeyUnique < ActiveRecord::Migration[6.0]
  def change
    add_index :urls, :key, unique: true
  end
end
