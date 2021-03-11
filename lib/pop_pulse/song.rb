class PopPulse::Song
    attr_accessor :name, :artist, :tempo, :danceability, :energy, :url

    def self.month
        song_1 = self.new
        song_1.name = "7 RINGS"
        song_1.artist = "Ariana Grande"
        song_1.tempo = "70 BPM"
        song_1.danceability = "73 out of 100"
        song_1.energy = "33 out of 100"
        song_1.url = "https://getsongbpm.com/song/7-rings/VvXjLM"

        song_1 = self.new
        song_1.name = "THE BOX"
        song_1.artist = "Roddy Ricch"
        song_1.tempo = "116 BPM"
        song_1.danceability = "90 out of 100"
        song_1.energy = "59 out of 100"
        song_1.url = "https://getsongbpm.com/song/the-box/99qkZ4"

        [song_1, song_2]
    end
end