require 'pry'
class Song

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
    end 

    def self.all
        @@all
    end 

    def self.new_by_filename(filename)
        new_name = filename.split(" - ")
        song = self.new(new_name[1])
        artist = Artist.find_or_create_by_name(new_name[0])
        song.artist = artist
        artist.add_song(song)
        song

    end 

    def artist_name=(name)
       self.artist = Artist.find_or_create_by_name(name)
       artist.add_song(self)
    end
    
end 