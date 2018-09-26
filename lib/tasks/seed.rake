task seed: :environment do 
  target = "https://moz.com/top500/pages"
  page = Nokogiri::HTML(open(target))
  urls = page.css("td.url").map(&:inner_text).map(&:strip)
  requests = 500
  urls.each do |u|
    url = "https://".concat(u)
    req = requests -= 1
    u = LinkShorteningService.perform(url)
    u.url_record.update(requests: req)
  end
end