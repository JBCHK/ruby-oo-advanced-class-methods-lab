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
    song = self.new
    song.save
    song
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
   self.all.find {|song| song.name == name}
  end


  def self.find_or_create_by_name(name)
    if self.all.include?(self.find_by_name(name))
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end


  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(string)
     song = self.new
     parser = string.chomp(".mp3").split(" - ")
     song.artist_name = parser[0]
     song.name = parser[1]
     song
  end


  def self.create_from_filename(string)
    song = self.new
    parser = string.chomp(".mp3").split(" - ")
    song.artist_name = parser[0]
    song.name = parser[1]
    song
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end







