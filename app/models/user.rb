class User < ActiveRecord::Base
  has_many :completions
  has_many :surveys
end
