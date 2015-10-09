get '/surveys/:id/questions/new' do
  @question = Question.new
  if @user
    erb :"/questions/new", locals: {survey_id: params[:id]}
  else
    redirect '/login'
  end
end

post '/surveys/:id/questions' do
  @question = Question.new(params["question"])
  if @question.save
    redirect "/questions/#{@question.id}/choices/new"
  else
    redirect "surveys/#{params[:id]}/questions/new"
  end
end
