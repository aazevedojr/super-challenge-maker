get '/login' do
  erb :'/users/login'
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    log_in
    redirect '/'
  else
    @errors = ["Incorrect username or password."]
    erb :'/users/login'
  end
end

get '/logout' do
  log_out
  redirect '/'
end
