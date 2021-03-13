require 'nokogiri'
require 'httparty'

class PopPulse::Scraper
    
    def self.scrape_albums
        url = "https://pitchfork.com/artists/4639-kanye-west/albumreviews/"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page)
        albums = Array.new
        albums = parsed_page.css('div.review')
        albums.each do |album|
            album = {
                title: album.css('h2.review__title-album').text.strip,
                date: album.css('time.pub-date').text,
                url: "https://pitchfork.com/artists/4639-kanye-west/albumreviews/" + album.css('a')[0].attributes["href"].value
            }
            puts ""
            puts "#{album[:title]}"
            puts ""
        end
    end
end