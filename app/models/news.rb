class News < ActiveRecord::Base
  include Disable
  include Searchable

  quick_search :title
  belongs_to :game
  belongs_to :user
  
  validates_presence_of :title, :content

  paginates_per 10
  before_create :init

  def init
    if self.user.nil?
      self.user = User.current_user
    end
    self.posted_at = Time.now
  end
end
