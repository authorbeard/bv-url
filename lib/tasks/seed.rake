task seed: :environment do 
  target = "https://moz.com/top500/pages"
  page = Nokogiri::HTML(open(target))
  urls = page.css("td.url").map(&:inner_text).map(&:strip)
  urls.each do |url|
    LinkShorteningService.perform(url)
  end
end