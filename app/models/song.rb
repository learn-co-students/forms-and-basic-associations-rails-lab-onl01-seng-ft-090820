class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name = self.artist
  end

  def genre_id=(id)
    self.genre = Genre.find_or_create_by(name:name)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def song_notes=(notes)
    notes.each do |note|
      if note != ""
        note = Note.find_or_create_by(content: content)
        self.notes << note 
      end 
    end 
  end
end
