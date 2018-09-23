class LinkShorteningService
  def self.perform(url)
    url_record = ShortenedUrl.generate(url)
    get_title(url_record)
    url_record.reload
  end

  def self.get_title(url_obj)
    TitleGrabberWorker.perform_async(url_obj.id)
  end
end