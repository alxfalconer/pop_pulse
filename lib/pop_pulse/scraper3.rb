
class PopPulse::Scraper3
    attr_accessor :doc

    def scraper
        doc = Nokogiri::HTML(URI.open("https://pitchfork.com/artists/4639-kanye-west/albumreviews/"))
        end

    def scrape_albums(how_many = 11)
        albums = @doc.css("li.result-item")
        albums[0..how_many -1].map do |album|
                new_album = {
                    :title => album.css("h2.review__title-album").text.upcase, 
                    :date => album.css('time.pub-date').text.upcase,
                    :url => album.css("https://pitchfork.com/artists/4639-kanye-west/albumreviews/" + album.css('li.result-item'))[0][:href]
                }
                PopPulse::Albums.album(new_albums)
        end
    end
end