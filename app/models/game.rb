class Game < ActiveRecord::Base
  include Disable
  include Searchable

  acts_as_ordered_taggable
  
  quick_search :name, :origin_name, :developer, :publisher, :website
  has_many :game_rating
  has_many :news
  validates_presence_of :name
  validates_uniqueness_of :name
  paginates_per 10
end
