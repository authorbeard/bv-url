class ShortenedUrl < ApplicationRecord
  BASE_TARGET_LENGTH = 3
  BASE_CHARSET = $BASE_CHARSET

  def self.generate(url)
    new(orig_url: parse(url)).tap{|obj| obj.shorten_url}
  end

  def self.parse(url)
    url.chomp!("/")
    strip = url.match(/\Ahttp:\/\//) || url.match(/\Ahttps:\/\//)
    parsed_url = url.gsub(strip.to_s, "")
  end

  def shorten_url
    key = ""

    until key.length == target_length
      key += BASE_CHARSET[rand(BASE_CHARSET.count)].to_s
    end

    if self.class.where(key: key).exists?
      key = nil
      shorten_url
    else
      update(key: key)
    end
  end

  def target_length
    log = Math.log(records_count, BASE_CHARSET.count)
    log < BASE_TARGET_LENGTH ? BASE_TARGET_LENGTH : log.ceil
  end

  def records_count
    self.class.count
  end
end
