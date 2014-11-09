class Paper < ActiveRecord::Base
  belongs_to :swap
  belongs_to :user

  validates :filepicker_url, :swap_id, :user_id, :title, presence: true
end
