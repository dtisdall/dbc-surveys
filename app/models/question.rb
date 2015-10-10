class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  # validates :text, allow_blank: false
  validates :text, presence: true
end
