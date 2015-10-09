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
  @completion = Completion.new(user: @user, survey: @survey)
  Choice.all.each do |selection|
    Selection.new(completion: @completion, choice: selection)
  end

end
