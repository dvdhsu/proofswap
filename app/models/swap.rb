class Swap < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  has_and_belongs_to_many :users
  has_many :papers

  validates :expires, :users_count, presence: true

  def time_left
    self.expires.past? ? "Expired" : time_ago_in_words(self.expires, include_seconds: true)
  end

  def other_papers(self_id)
    self.papers.select { |paper| paper.user.id != self_id }
  end

  def own_papers(self_id)
    self.papers.select { |paper| paper.user.id == self_id }
  end

  def other_user(self_id)
    for user in self.users
      if user.id != self_id
        return user
      end
    end
    nil
  end

end
