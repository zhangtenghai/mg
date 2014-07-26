class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :news
  belongs_to :article
end
