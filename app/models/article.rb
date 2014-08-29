class Article < ActiveRecord::Base
  include Disable
  include Searchable

  acts_as_taggable_on :advantage
  acts_as_taggable_on :disadvantage
  belongs_to :user
  belongs_to :game
  has_many :comments
  accepts_nested_attributes_for :comments
  has_and_belongs_to_many :users_favorites, :class_name => "User", :join_table => "articles_user_favorites"
  validates_presence_of :title

  quick_search :title, :quote
  scope :previews, -> {where(category: '前瞻')}
  scope :evaluations,-> {where(category: '评测')}
  scope :voices, -> {where(category: '业界评论')}
  scope :topics, -> {where("topic is not null")}
  default_scope { enabled.order('id desc') }

  mount_uploader :head_img, ImageUploader
  mount_uploader :avatar, ImageUploader
  
  # has_attached_file :head_img, :styles => {  :medium => "1600x648" }
  # validates_attachment_content_type :head_img, :content_type => /\Aimage\/.*\Z/

  # has_attached_file :avatar, :styles => {  :medium => "990x403" }
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  before_create :init
  paginates_per 10
  

  def init
    if self.user.nil?
      self.user = User.current_user
    end
    self.posted_at = Time.now
  end

  def self.get_topic_article(topic)
    Article.where(topic:topic).exists? ? Article.where(topic:topic).first : Article.first
  end
end
