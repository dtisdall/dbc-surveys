get '/surveys/respondent/:survey_id' do
  @survey = Survey.find_by(id: params[:survey_id])
  @questions = @survey.questions
  erb :'respondent/survey'
end

post '/surveys/respondent/:survey_id' do
  @survey = Survey.find_by(id: params[:survey_id])
  @completion = Completion.create(user: @user, survey: @survey)
  @questions = @survey.questions
  @questions.each do |question|
    choice_id = params[question.id.to_s]
    @choice = Choice.find_by(id: choice_id)
    Selection.create(completion: @completion, choice: @choice)
  end
  redirect '/'
end
