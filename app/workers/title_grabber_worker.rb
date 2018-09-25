class TitleGrabberWorker
  include Sidekiq::Worker

  sidekiq_options retry: 5

  def perform(url_id)
    link = ShortenedUrl.find(url_id)
    title_node = Nokogiri::HTML(open(URI.parse(link.orig_url))).at_xpath("//title")
    title = title_node.children.first.inner_text
    link.update(title: title)
  end
end