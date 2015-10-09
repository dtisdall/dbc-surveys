get '/surveys/new' do
  @survey = Survey.new
  if @user
    erb :'/surveys/new'
  else
    redirect '/login'
  end
end

post '/surveys' do
  @survey = Survey.new(params["survey"])
  @survey.user_id = session[:user_id]
  @survey.url = SecureRandom.hex(4)
  if @survey.save
    redirect "surveys/#{@survey.id}/questions/new"
  else
    redirect '/surveys/new'
  end
end

get '/surveys/:id/show' do
  @survey = Survey.find(params[:id])
  if @user.id == @survey.user_id
    erb :"surveys/show"
  else
    @user.username
    '/'
  end
end

