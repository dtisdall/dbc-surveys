get '/' do
redirect 'surveys/respondent/:survey_id'
end

get '/surveys/respondent/:survey_id' do
  @survey = Survey.find_by(id: params[:survey_id])
  @questions = Question.all.where(survey_id: :survey_id)
  erb :'respondent/survey'
end

post '/surveys/respondent/:survey_id' do
  @completion = Completion.new(user: ,survey_id: params[:survey_id])
end
