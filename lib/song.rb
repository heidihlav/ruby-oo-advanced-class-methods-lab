require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song_name = self.new
    song_name.save
    song_name
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end


  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end


  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort do |a, b| 
      a.name <=> b.name
    end
  end

  def self.new_from_filename(name)
    split_names = name.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_names[1]
    song.artist_name = split_names[0]
    song
  end
  
  def self.create_from_filename(name)
    split_names = name.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_names[1]
    song.artist_name = split_names[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
