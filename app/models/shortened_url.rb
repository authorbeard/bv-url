class ShortenedUrl < ApplicationRecord
  BASE_TARGET_LENGTH = 3
  BASE_CHARSET = $BASE_CHARSET

  def self.generate(url)
    new(orig_url: parse(url)).tap{|obj| obj.shorten_url}
  end

  def self.parse(url)
    uri = URI.parse(url)
    uri.scheme = ("https")
    uri
  end

  def shorten_url
    key = ""
    target_length.times do
      key += BASE_CHARSET[rand(BASE_CHARSET.count)].to_s
    end
    update(key: key)
  end

  def target_length
    log = Math.log(records_count, BASE_CHARSET.count)
    log < BASE_TARGET_LENGTH ? BASE_TARGET_LENGTH : log.ceil
  end

  def records_count
    self.class.count
  end
end
