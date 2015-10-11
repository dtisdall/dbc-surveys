get '/surveys/new' do
  redirect '/' unless @user
  @survey = Survey.new
  erb :'/surveys/new'
end

post '/surveys' do
  redirect '/' unless @user
  @survey = Survey.new(params["survey"])
  @survey.user = @user
  if @survey.save
    redirect "surveys/#{@survey.id}/questions/new"
  else
    redirect '/dashboard'
  end
end

get '/surveys/:id/show' do
  redirect '/' unless @user
  @survey = Survey.find(params[:id])
  redirect '/' unless @user.id == @survey.user_id
  erb :"surveys/show"
end

get '/surveys/:id/questions/new' do
  redirect '/' unless @user
  @question = Question.new
  erb :"questions/new", locals: {survey_id: params[:id]}
end

#Survey ID should be in the form as a hidden field, not as a method
post '/surveys/:id/questions' do
  redirect '/' unless @user
  @question = Question.new(params["question"])
  @question.survey_id = params[:id]
  # Security vunerability here
  if @question.save
    choices = params["choice"].values.select{|v| v != ""}.map{|v| Choice.new(text: v, question_id: @question.id)}
    if choices.all?{|choice| choice.save}
      if params["done"]
        redirect "surveys/#{params[:id]}/show"
      end
    end
  end
  erb :'questions/new', locals: {survey_id: params[:id]}
  # redirect "surveys/#{params[:id]}/questions/new"
end


