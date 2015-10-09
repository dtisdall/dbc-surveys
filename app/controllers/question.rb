get '/surveys/:id/questions/new' do
  @question = Question.new
  if @user
    erb :"questions/new", locals: {survey_id: params[:id]}
  else
    redirect '/login'
  end
end

post '/surveys/:id/questions' do
  @question = Question.new(params["question"])
  @question.survey_id = params[:id]
  if @question.save
    choices = params["choice"].values.select{|v| v != ""}.map{|v| Choice.new(text: v, question_id: @question.id)}
    if choices.all?{|choice| choice.save}
      if params["done"]
        redirect "surveys/#{Question.find(params[:id]).survey_id}/show"
      end
    end
  end
  erb :'questions/new', locals: {survey_id: params[:id]}
  # redirect "surveys/#{params[:id]}/questions/new"
end


