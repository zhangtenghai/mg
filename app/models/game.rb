class Game < ActiveRecord::Base
  include Disable
  include Searchable

  acts_as_ordered_taggable
  
  quick_search :name, :origin_name, :developer, :publisher, :website
  has_many :game_rating
  has_many :news
  has_many :comments
  
  validates_presence_of :name
  validates_uniqueness_of :name

  has_attached_file :head_img, :styles => { :medium => "1600x873>" }
  validates_attachment_content_type :head_img, :content_type => /\Aimage\/.*\Z/

  has_attached_file :avatar, :styles => { :medium => "160x160>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  paginates_per 10

  def self.get_today_hot_game
    comment = Comment.select("game_id").where("date(created_at)=date(now())").group("game_id").order("count(game_id) desc").first
    if comment
      return Game.find_by_id(comment.game_id)
    end
    return Game.last
  end
end
