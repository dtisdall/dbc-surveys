get '/surveys/new' do
  @survey = Survey.new
  if @user
    erb :'/survey/new_survey_form'
  else
    redirect '/login'
  end
end

post '/surveys' do
  @survey = Survey.new(params["survey"])
  @survey.user_id = session[:user_id]
  if @survey.save
    redirect "surveys/#{@survey.id}/questions/new"
  else
    redirect '/surveys/new'
  end
end

get '/surveys/:id/show' do
  @survey = Survey.find(params[:id])
  if @user == @survey.user_id
    erb :"surveys/show"
  else
    # Redirect to some kind of home page
    '/'
  end
end

