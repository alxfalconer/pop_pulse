class PopPulse::Album
    attr_accessor :album, :title, :date, :url

    @@all = []

    def initialize (title, date, url)
        @title = title
        @date = date
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end
end