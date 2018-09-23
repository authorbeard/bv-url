class CreateShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.string :key
      t.string :orig_url
      t.string :title
      t.integer :requests

      t.timestamps
    end
  end
end
