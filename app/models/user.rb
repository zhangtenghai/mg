class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Searchable
  attr_accessor :login
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  quick_search :name, :email, :role

  has_and_belongs_to_many :favorite_articles, :class_name => "Article", :join_table => "articles_user_favorites", :order => "id asc"
  has_and_belongs_to_many :favorite_news, :class_name => "News", :join_table => "news_user_favorites", :order => "id asc"
  has_and_belongs_to_many :favorite_games, :class_name => "Game", :join_table => "games_user_favorites", :order => "id asc"
  has_and_belongs_to_many :game_scores, :class_name => "Game", :join_table => "games_user_scores", :order => "id asc"
  has_many :games_user_scores
  has_many :game_rating
  has_many :game_comments, -> { where('game_id is not null').enabled }, class_name: 'Comment'
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :unlocked, -> { where("locked_at is  null")}
  scope :editors, -> {where("role in ('管理员','编辑')")}
  paginates_per 10
  before_create :set_role
  has_attached_file :avatar, :styles => { :medium => "160x160>", :thumb => "45x45>" }, :default_url => "/front/img/default/user_avatar_default.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def set_role
    if self.role.blank?
      self.role = '普通用户'
    end
  end
  
  def set_favorite_news(news)
    if self.favorite_news.exists?(news)
      self.favorite_news.delete(news)
    else
      self.favorite_news << news
    end
  end

  def set_favorite_article(article)
    if self.favorite_articles.exists?(article)
      self.favorite_articles.delete(article)
    else
      self.favorite_articles << article
    end
  end

  def set_favorite_game(game)
    if self.favorite_games.exists?(game)
      self.favorite_games.delete(game)
    else
      self.favorite_games << game
    end
  end



  def login=(login)
    @login = login
  end

  def login
    unless @login
      if self.name
        self.name
      else
        self.email
      end
    else
      @login
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["(lower(name) = :value OR lower(email) = :value)", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def is_admin
    self.role == '管理员'
  end

  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end
end
