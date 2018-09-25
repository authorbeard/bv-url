class LinkShorteningService
  def self.perform(url)
    parsed_url = ShortenedUrl.parse(url)
    new_or_existing(parsed_url)
  end

  def self.get_title(url_obj)
    TitleGrabberWorker.perform_async(url_obj.id)
  end

  def self.new_or_existing(parsed_url)
    u = ShortenedUrl.where(orig_url: parsed_url).first_or_initialize
    u.persisted? ? {is_new: false, record: u.increment(:requests)} : {is_new: true, record: u.shorten_url}
  end
end