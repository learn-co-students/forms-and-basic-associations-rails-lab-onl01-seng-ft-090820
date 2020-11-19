class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
    notes.each do |content|
      self.notes.new.content = content
    end
  end

  def note_contents
    self.notes.map do |note| 
      note.content  
    end
  end



end
