require 'open-uri'

class PopPulse::Scraper

	def self.scrape_album
        doc = Nokogiri::HTML(URI.open("https://pitchfork.com/artists/4639-kanye-west/albumreviews/"))
		albums = doc.css("div.review")
		albums.each do |div|
			album = PopPulse::Album.new
			album.title = div.css('h2.review__title-album').text
			album.date = div.css("time.pub-date").text
			album.url = "https://www.pitchfork.com" + div.css("a").attribute("href").value
		end
	end

	def self.scrape_album_page(album)
		album_page = Nokogiri::HTML(URI.open(album.url))
		album.date = album_page.css("time.pub-date").text
		album.rating = album_page.css("span.score").text
		album.review = album_page.css("div.review-detail__text.clearfix").text
	end
end