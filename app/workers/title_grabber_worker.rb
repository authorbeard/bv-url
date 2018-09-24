class TitleGrabberWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(url_id)
    link = ShortenedUrl.find(url_id)
    title_node = Nokogiri::HTML(open(link.orig_url)).at_xpath("//title")
    title = title_node.children.first.inner_text
    link.update(title: title)
  end
end