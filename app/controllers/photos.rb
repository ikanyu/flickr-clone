get '/albums/:id/photos/new' do
	# @photo = Photo.new
	@album = Album.find(params[:id])
	erb :"photo/create"
end

post '/albums/:id/photos/create' do
	@album = Album.find params[:id]
	@photo = @album.photos.create(params[:photo])
	redirect to "/albums"
end