get '/surveys/new' do
  redirect '/' unless @user
  @survey = Survey.new
  erb :'surveys/new'
end

post '/surveys' do
  redirect '/' unless @user
  @survey = Survey.new(params["survey"])
  @survey.user = @user
  if @survey.save
    if request.xhr?
      erb :'questions/new', locals: {survey_id: @survey.id, question: Question.new}, layout: false
    else
      redirect "surveys/#{@survey.id}/questions/new"
    end
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
  erb :"questions/new", locals: {survey_id: params[:id], question: @question}
end

post '/surveys/:id/questions' do
  redirect '/' unless @user
  @question = Question.new(params["question"])
  if @question.save
    choices = params["choice"].values.select{|v| v != ""}.map{|v| Choice.new(text: v, question_id: @question.id)}
    if choices.all?{|choice| choice.save}
      if request.xhr?
        if params["done"]
          # redirect "surveys/#{params[:id]}/show"
        else
          erb :'questions/new', locals: {survey_id: params[:id]}, layout: false
        end
      end
    end
  end
  erb :'questions/new', locals: {survey_id: params[:id]}
  # redirect "surveys/#{params[:id]}/questions/new"
end


