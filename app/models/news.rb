class News < ActiveRecord::Base
  include Disable
  include Searchable

  quick_search :title
  belongs_to :game
  belongs_to :user
  has_many :comments
  accepts_nested_attributes_for :comments
  has_and_belongs_to_many :users_favorites, :class_name => "User", :join_table => "news_user_favorites"

  validates_presence_of :title, :content

  mount_uploader :head_img, ImageUploader
  mount_uploader :list_img, ImageUploader
  # has_attached_file :head_img, :styles => {  :thumb => "1600x648>" }
  # validates_attachment_content_type :head_img, :content_type => /\Aimage\/.*\Z/

  # has_attached_file :list_img, :styles => {  :thumb => "311x200>" }
  # validates_attachment_content_type :list_img, :content_type => /\Aimage\/.*\Z/
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

  def self.get_date_news(date = Time.now)
    News.where("date(created_at)=date('?')",date)
  end
end
