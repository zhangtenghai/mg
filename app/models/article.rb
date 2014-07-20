class Article < ActiveRecord::Base
  include Disable
  include Searchable

  belongs_to :category
  belongs_to :user
  belongs_to :game
  has_and_belongs_to_many :users_favorites, :class_name => "User", :join_table => "articles_user_favorites"
  validates_presence_of :title

  quick_search :title, :quote

  paginates_per 10
  before_create :init

  def init
    if self.user.nil?
      self.user = User.current_user
    end
    self.posted_at = Time.now
  end
end
