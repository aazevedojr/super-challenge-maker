get '/challenges' do
  @challenges = Challenge.all #define instance variable for view
  erb :'challenges/index' #show all challenges view (index)
end

get '/challenges/new' do
  erb :'challenges/new' #show new challenges view
end

post '/challenges' do
  #below works with properly formatted params in HTML form
  @challenge = Challenge.new(params[:challenge]) #create new challenge
  if @challenge.save #saves new challenge or returns false if unsuccessful
    redirect '/challenges' #redirect back to challenges index page
  else
    erb :'challenges/new' # show new challenges view again(potentially displaying errors)
  end
end
