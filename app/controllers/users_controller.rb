get '/register' do
  erb :'users/new'
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    log_in
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end
