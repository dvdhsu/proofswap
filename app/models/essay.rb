class Essay < ActiveRecord::Base
  belongs_to :swap
  belongs_to :user
end
