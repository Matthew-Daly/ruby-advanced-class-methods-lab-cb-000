class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
  	song = self.new
  	@@all << song
  	song
  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = self.new
  	song.name = name
  	@@all << song
  	song
  end

  def self.find_by_name(name)
  	self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if(self.all.include?(name))
  		return name
  	else
  		self.create_by_name(name)
  	end
  end

  def self.alphabetical
  		alp_array = self.all.sort {|a,b| a.name<=>b.name}
  end

  def self.new_from_filename(mp3)
  	data = mp3.split(" - ")
  	artist_name = data[0]
  	name = data[1].chomp(".mp3")

  	song = self.new

  	song.name = name
  	song.artist_name = artist_name
  	song
  end

  def self.create_from_filename(mp3)
  	data = mp3.split(" - ")
  	artist_name = data[0]
  	name = data[1].chomp(".mp3")

  	song = self.new

  	song.name = name
  	song.artist_name = artist_name
  	@@all << song
  	song
  end

  def self.destroy_all
  	self.all.clear
  end
  

  def save
    self.class.all << self
  end

end
