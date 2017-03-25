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

  def initialize(name)
    @name = name
    # @artist_name = artist_name
  end

  def self.create
    new_song = Song.new(name)
    all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new(name)

  end

  def self.create_by_name(name)
    new_song = Song.new(name)
    all << new_song
    new_song
  end

  def self.find_by_name(name)
    all.find do |song|
      name == song.name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
  all.sort_by {|x,y| x.name}
  end

  # def self.drop_mp3(str)
  #   result = ""
  #   (0...str.length - 4).each do |i|
  #     result += str[i]
  #   end
  #   result
  # end

  def self.new_from_filename(file)
  new_filename = Song.new(file)
  newer = new_filename.name.gsub(".", " - ").split(" - ")
  new_filename.name = newer[1]
  new_filename.artist_name = newer[0]
  new_filename

    # new_file = drop_mp3(file.split(" - ")[-1])
    # Song.new(new_file)
    #   self.artist_name = file.split(" - ")[0]
  end

  def self.create_from_filename(file)
    new_filename = Song.new(file)
    newer = new_filename.name.gsub(".", " - ").split(" - ")
    new_filename.name = newer[1]
    new_filename.artist_name = newer[0]
    new_filename
    @@all << new_filename
  end

  def self.destroy_all
    self.all.clear
  end

end
