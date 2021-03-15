class PopPulse::Album
    attr_accessor :title, :date, :url, :rating, :review

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end