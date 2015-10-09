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
  unique_url = SecureRandom.hex(4)
  until Survey.find_by(url:unique_url) == nil
    unique_url = SecureRandom.hex(4)
  end
  puts
  puts
  puts
  puts
  p unique_url
  puts
  puts
  puts
  puts
  @survey.url = unique_url
  puts
  puts
  puts
  p @survey
  p @survey.url
  puts
  puts
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

