require("rspec")
require("organizer")
require("pry")

describe(Organizer) do
  before() do
    Organizer.clear()
  end


  describe("#artist") do
    it("returns the name of the artist") do
      test_organizer = Organizer.new("Nicolas Jaar", "Space Is Only Noise")
      expect(test_organizer.artist()).to(eq("Nicolas Jaar"))
    end
  end

  describe('#album') do
    it("returns the album of the CD") do
      test_organizer = Organizer.new("Nicolas Jaar", "Space Is Only Noise")
      expect(test_organizer.album()).to(eq("Space Is Only Noise"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Organizer.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a cd to the cd organizer") do
    test_organizer = Organizer.new("Nicolas Jaar", "Space Is Only Noise")
    test_organizer.save()
      expect(Organizer.all()).to(eq([test_organizer]))
    end
  end

  describe(".clear") do
    it("will clear out the 'all_terms' array") do
      test_organizer = Organizer.new("Nicolas Jaar", "Space Is Only Noise").save()
      Organizer.clear()
      expect(Organizer.all()).to(eq([]))
    end
  end



  describe(".search") do
    it("Searches cds by artist or album") do
    test_organizer = Organizer.new("Nicolas Jaar", "Space Is Only Noise")
    test_organizer.save()
      expect(Organizer.search("Nicolas Jaar")).to(eq(test_organizer))
    end
  end

  describe(".all_cds_artist") do
    it("Searches cds by artist and returns all the cds present with that artist name") do
    test_organizer = Organizer.new("Nicolas Jaar", "Space Is Only Noise")
    test_organizer.save()
    test_organizer2 = Organizer.new("Nicolas Jaar", "Essential Mix")
    test_organizer2.save()
      expect(Organizer.all_cds_artist("Nicolas Jaar")).to(eq("Space Is Only Noise, Essential Mix"))
    end
  end
end
