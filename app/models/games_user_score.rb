class GamesUserScore < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  after_save :avg_score

  def avg_score
    score = GamesUserScore.where("game_id = #{self.game_id}").average("score")
    self.game.avg_score = score
    self.game.save
  end
end