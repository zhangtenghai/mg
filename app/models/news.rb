class News < ActiveRecord::Base
  include Disable
  include Searchable

  quick_search :title
  belongs_to :game
  belongs_to :user
  has_many :comments
  
  validates_presence_of :title, :content

  has_attached_file :head_img, :styles => {  :thumb => "314x202>" }
  validates_attachment_content_type :head_img, :content_type => /\Aimage\/.*\Z/
  default_scope { enabled.order('id desc') }
  
  paginates_per 10
  before_create :init

  def init
    if self.user.nil?
      self.user = User.current_user
    end
    self.posted_at = Time.now
  end

  def self.get_head_news
    News.where(is_head:true).exists? ? News.where(is_head:true).first : News.last
  end
end
