# This route to be deprecated 
get '/completions/:survey_id' do
  @survey = Survey.find_by(id: params[:survey_id])
  # redirect "/take/#{@survey.key}"
  erb :'respondent/surveywiz'
end

#This route to be used instead
get '/take/:survey_key' do
  @survey = Survey.find_by(key: params[:survey_key])
  @questions = @survey.questions
  erb :'respondent/survey'
end

post '/completions/:survey_id' do
  @survey = Survey.find_by(id: params[:survey_id])
  @completion = Completion.create(user: @user, survey: @survey)
  @questions = @survey.questions
  @questions.each do |question|
    choice_id = params[question.id.to_s]
    @choice = Choice.find_by(id: choice_id)
    Selection.create(completion: @completion, choice: @choice)
  end
  redirect '/success'
end

get '/success' do
  erb :success
end