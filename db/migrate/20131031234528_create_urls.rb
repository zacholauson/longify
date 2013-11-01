class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original_url
      t.text :longified_url
      t.string :slug
      t.integer :visits, default: 0

      t.index :slug, unique: true

      t.timestamps
    end
  end
end
