def set_cookie
  session[:user_id] = @user.id
end

def remove_cookie
  session[:user_id] =nil
end

def check_authenticated
  @user = User.find_by(id: session[:user_id])
end