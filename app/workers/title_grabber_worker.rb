class TitleGrabberWorker
  include Sidekiq::Worker

  sidekiq_options retry: 1

  def perform(url_id)
    url_record = ShortenedUrl.find(url_id)
    link = "https://".concat(url_record.orig_url)
    title_node = Nokogiri::HTML(open(link)).at_xpath("//title")
    title = title_node.children.first.inner_text
    url_record.update(title: title)
  end
end