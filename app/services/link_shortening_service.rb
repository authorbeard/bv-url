class LinkShorteningService
  def self.perform(url)
    new(url).tap do |svc| 
      svc.update_url_record
      svc
    end
  end

  attr_accessor :is_new, :url_record

  def initialize(orig_url)
    @parsed_url = ShortenedUrl.parse(orig_url)
    @url_record = ShortenedUrl.where(orig_url: @parsed_url).first_or_initialize
    @is_new     = @url_record.new_record?
  end

  def update_url_record
    if is_new
      @url_record.shorten_url
      get_title
    else
      @url_record.increment(:requests)
    end
  end

  def get_title
    TitleGrabberWorker.perform_async(@url_record.id)
  end
end