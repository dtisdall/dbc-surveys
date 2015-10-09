get '/questions/:id/choices/new' do
  @question = Question.find(params[:id])
  if @user
    erb :"choices/new"
  else
    redirect '/login'
  end
end

post '/questions/:id/choices' do
  questions = params["choice"].select{|_, v| v != ""}.map{| _, v| Choice.new(text: v, question_id: params[:id])}
  if questions.all?{|choice| choice.save}
    if params["done"]
      redirect "surveys/#{Question.find(params[:id]).survey_id}/show"
    else
      redirect "/surveys/#{Question.find(params[:id]).survey_id}/questions/new"
    end
  else
    redirect '/'
  end
end
