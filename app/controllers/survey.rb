get '/surveys/new' do
  @survey = Survey.new
  if logged_in?
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
