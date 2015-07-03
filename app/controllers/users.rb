get '/users/new' do
	@user = User.new
	erb :"user/create"
end

post '/users/create' do
	@user = User.new(params[:user])
	if @user.save
		@album = Album.new(name: "#{@user.username}'s Album" , user_id: "#{@user.id}")
		@album.save
		@error = "Welcome!"
		session[:id] = @user.id
		erb :"album/index"
	else
		@error = "Username is taken"
		redirect to "/users/new"
	end
end

get '/users/login' do
	erb :"user/login"
end	

post '/users/login' do
	@user = User.find_by_username(params["username"])
	@password = params["password"]

	if @user.nil?
		@error = "Invalid email and password combination"
		erb :"user/login"
	elsif @user.check_password(@password) == true
		session[:id] = @user.id
		redirect to "/albums"
	else
		erb :"album/index"
	end
end	

get '/users/logout' do
	session.clear
	@error = "Logout successful"
	@albums = Album.all
	erb :"album/index"
end