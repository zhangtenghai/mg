class Game < ActiveRecord::Base
  include Disable
  include Searchable

  acts_as_ordered_taggable
  
  quick_search :name, :origin_name, :developer, :publisher, :website
  has_many :game_rating
  has_many :news
  has_many :comments
  has_and_belongs_to_many :users_favorites, :class_name => "User", :join_table => "games_user_favorites"
  
  validates_presence_of :name
  validates_uniqueness_of :name

  has_attached_file :head_img, :styles => { :medium => "1600x873>" }
  validates_attachment_content_type :head_img, :content_type => /\Aimage\/.*\Z/

  has_attached_file :avatar, :styles => { :medium => "160x160>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :list_img, :styles => { :medium => "314x202>" }
  validates_attachment_content_type :list_img, :content_type => /\Aimage\/.*\Z/

  
  scope :hot_games, -> { where("")}
  paginates_per 10

  def self.get_today_hot_game
    comment = Comment.select("game_id").where("date(created_at)=date(now())").group("game_id").order("count(game_id) desc").first
    if comment
      return Game.find_by_id(comment.game_id)
    end
    return Game.last
  end

  def self.get_month_hot_games
    games_ary = Game.where("id in (select game_id from mg_dev.games_user_favorites where date_format(created_at,'%Y-%m')=date_format(now(),'%Y-%m')
                  group by game_id order by count(game_id) desc ) and sale_date>now()").limit(6)
    if games_ary.length < 6
      games_ary= games_ary + Game.last(6 - games_ary.length)
    end
  end

  def self.get_month_expect_games
    games_ary = Game.where("id in (select game_id from mg_dev.games_user_favorites where date_format(created_at,'%Y-%m')=date_format(now(),'%Y-%m')
                  group by game_id order by count(game_id) desc ) and sale_date<now()").limit(6)
    if games_ary.length < 6
      games_ary= games_ary + Game.last(6 - games_ary.length)
    end
  end
end
