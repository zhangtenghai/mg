class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Searchable
  attr_accessor :login
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  quick_search :name, :email, :role

  has_and_belongs_to_many :favorite_articles, :class_name => "Article", :join_table => "articles_user_favorites", :order => "id asc"
  has_many :game_rating

  validates_presence_of :name
  scope :unlocked, -> { where("locked_at is  null")}
  scope :editors, -> {where("role in ('管理员','编辑')")}
  paginates_per 10

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
