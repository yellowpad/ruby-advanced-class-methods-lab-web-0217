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
  
  # def initialize(name)
  # 	@name = name
  # # 	@@all << self
  # end
  # def name(name)
  # 	@name = name
  # end

  def self.create
  	song = Song.new
  	song.save
  	song
  end

  def self.new_by_name(song_name)
    #self.all.detect{|song| song.name == name}
	song = self.new
	song.name = song_name
	song
  end


  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.create_by_name(song_name)
	song = self.create
	song.name = song_name
	song
  end

  def self.new_from_filename(filename)
  	#new class isntance
  	song = self.new

   	#split and get the artist from position 0
  	artist = filename.split('-')[0].strip 	
	#set the artist
	song.artist_name = artist
	#split and get the title
	song_title = filename.split('-')[1].strip 
	#new song name
	song.name = song_title.gsub(".mp3","")
	song
  end

  def self.create_from_filename(filename)
  	#new class isntance
  	song = self.new

   	#split and get the artist from position 0
  	artist = filename.split('-')[0].strip 	
	#set the artist
	song.artist_name = artist
	#split and get the title
	song_title = filename.split('-')[1].strip 
	#new song name
	song.name = song_title.gsub(".mp3","")
	song.save
  end 

  def  self.destroy_all
  	self.all.clear
  end

  def self.find_or_create_by_name(song_name)
  	find_song = self.all.detect{|songs| songs.name == song_name}
  	if find_song == nil
  		song = Song.new
  		song.name = song_name
  		song.save
  		song
  	else 
  		find_song
  	end 
  end

  def self.alphabetical
  	songs = self.all.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  	# order = []
  	# songs.each do |track|
  	# 	order << track.name
  	# end
  	# order.sort!
  end

end

binding.pry
