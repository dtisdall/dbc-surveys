before do
  check_authenticated
end

# Remove me when home page is built
get'/' do
  erb :home
end

get'/register' do
  erb :register
end

get '/login' do
  erb :'login'
end

get '/logout' do
  remove_cookie
  redirect '/'
end

post '/login' do
  @user = User.authenticate(params)
  if @user
    set_cookie
    redirect '/'
  else
    redirect '/login'
  end
end

post '/users' do
  @user = User.new(params)
  if @user.save
    set_cookie
    redirect '/'
  else
    erb :'users/register'
  end
end


