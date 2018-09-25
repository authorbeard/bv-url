class LinkShorteningService
  def self.perform(url)
    if ShortenedUrl.where(orig_url: url).exists?
      return ShortenedUrl.find_by(orig_url: url)
    end
    url_record = ShortenedUrl.generate(url)
    get_title(url_record)
    url_record.reload
  end

  def self.get_title(url_obj)
    TitleGrabberWorker.perform_async(url_obj.id)
  end
end