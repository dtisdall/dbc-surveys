get '/' do
redirect 'surveys/respondent/:survey_id'
end

get '/surveys/respondent/:survey_id' do
  @survey = Survey.find_by(id: params[:survey_id])
  @questions = @survey.questions
  erb :'respondent/survey'
end

post '/surveys/respondent/:survey_id' do
  # erb params.inspect
  # create a selection for each of the questions from the choices that I have
# use the question to get the choice id

  @survey = Survey.find_by(id: params[:survey_id])
  @completion = Completion.new(user: @user, survey: @survey)
  @questions = @survey.questions
  @questions.each do |question|
    choice_id = params[question.id]
    @choice = Choice.find_by(id: choice_id)
    Selection.new(completion: @completion, choice: @choice)
  end
  erb params.inspect
end
