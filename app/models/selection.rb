class Selection < ActiveRecord::Base
  belongs_to :choice
  belongs_to :completion
end
