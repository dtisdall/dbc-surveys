get '/questions/:id/choices/new' do
  if @user
    erb :"choices/new"
  else
    redirect '/login'
  end
end

post '/questions/:id/choices' do
  questions = params["choice"].select{|choice_text| choice_text != nil}.map{|choice_text| Choice.new(text:choice_text, question_id: params[:id])}
  if questions.all?{|choice| choice.save}
    if params["done"]
      redirect "survey/#{Question.find(params[:id]).survey_id}/show"
    else
      erb :"survey/#{Question.find(params[:id]).survey_id}/new"
    end
  else
    redirect '/'
  end
end
