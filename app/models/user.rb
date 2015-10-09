class User < ActiveRecord::Base

  include BCrypt

  has_many :completions
  has_many :surveys
  validates :display_name, :username, :password_hash, :email, presence: true


  def self.authenticate(params)
    @user = User.find_by(username: params[:username])
    if @user 
      return @user if @user.password == params[:password]
    end
    return nil
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def gravatar
    hash = Digest::MD5.hexdigest(self.email)
    "http://www.gravatar.com/avatar/#{hash}?s=200&d=identicon"
  end


end
