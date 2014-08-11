class Comment < ActiveRecord::Base
  include Disable
  
  belongs_to :user
  belongs_to :game
  belongs_to :news
  belongs_to :article

  before_create :save_user
  default_scope { enabled.order('id desc') }
  
  def save_user
    self.user = User.current_user
  end
end
