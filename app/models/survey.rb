class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :completions
  has_many :questions
  has_many :respondents, through: :completions, class_name: 'User'

  validates_uniqueness_of :url
end
