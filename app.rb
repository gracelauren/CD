require('sinatra')
require('sinatra/reloader')
require('./lib/organizer')
also_reload('lib/**/*.rb')

get('/') do
  @all_cds = Organizer.all()

  erb(:index)
end

post('/results') do
  artist = params.fetch("artist")
  album = params.fetch("album")
  @cds = Organizer.new(artist, album)
  @cds.save()
  redirect '/'
end

post('/clear') do
  Organizer.clear()
  redirect '/'
end

post('/search_results') do
  search = params.fetch("search")
  @results = Organizer.search(search)
  erb(:search_results)
end

post('/search_artist') do
  @search_artist = params.fetch("search_artist")
  @results2 = Organizer.all_cds_artist(@search_artist)
  erb(:search_artist)
end
