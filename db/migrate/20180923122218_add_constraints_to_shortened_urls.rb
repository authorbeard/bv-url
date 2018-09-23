class AddConstraintsToShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    change_column_default :shortened_urls, :requests, from: nil, to: 1

    add_index :shortened_urls, :key, unique: true
  end
end
