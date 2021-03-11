class PopPulse::Albums3
    attr_accessor :title, :date, :url

    @@all = []

    def initialize(title=nil, date=nil, url=nil)
        @title = title
        @date = date
        @url = url
        self
    end

    def self.all
        @@all
    end
end