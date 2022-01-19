class PopPulse::Album
    attr_accessor :title, :date, :url, :rating, :review

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def sort_by
       @albums.sort_by {|rating| rating.n}
    end



    .sort_by{|i| i.scan(/\d+/))}

    