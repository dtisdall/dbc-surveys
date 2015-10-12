class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :completions
  has_many :questions
  has_many :respondents, through: :completions, class_name: 'User'
  validates :title, presence: true

  before_save do
    self.key = SecureRandom.hex(12)
  end
end
