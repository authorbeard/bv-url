class ShortenedUrl < ApplicationRecord
  attr_accessor :key, :orig_url, :title, :count
  BASE_TARGET_LENGTH = 3

  def self.increment_target_length?
    count == (BASE_CHARSET.count ** BASE_TARGET_LENGTH)
  end

  def initialize

  end

  def shorten

  end



end
