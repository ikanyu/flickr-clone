require 'byebug'

get '/albums' do
	if session[:id] != nil
		@user = User.find(session[:id])
	end
	@albums = Album.all
	@album = Album.find_by(user_id: session[:id])
	erb :"album/index"
end