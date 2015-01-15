class Organizer
  @@organizer = []
  attr_reader(:artist, :album)

  define_method(:initialize) do |artist, album|
    @artist = artist.downcase().split.map(&:capitalize).join(' ')
    @album = album.downcase().split.map(&:capitalize).join(' ')

  end

  define_method(:save) do
    @@organizer.push(self)
  end

  define_singleton_method(:all) do
    @@organizer
  end

  define_singleton_method(:clear) do
    @@organizer = []
  end

  define_singleton_method(:search) do |searchword|
    results = nil
    @@organizer.each() do |cd|
      if searchword.downcase().split.map(&:capitalize).join(' ') == cd.artist()
        results = cd

      elsif searchword.downcase.split.map(&:capitalize).join(' ') == cd.album()
        results = cd

      end
    end
    results
  end

  define_singleton_method(:all_cds_artist) do |artist|
    return_array = []
    @@organizer.each() do |cd|
      if artist.downcase().split.map(&:capitalize).join(' ') == cd.artist()
        return_array.push(cd.album())
      end
    end
    return_array
  end
end
