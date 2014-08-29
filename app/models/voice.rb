class Voice < ActiveRecord::Base
  include Disable
  include Searchable

  quick_search :user_name
  mount_uploader :avatar, ImageUploader
  # has_attached_file :avatar, :styles => {  :thumb => "45x45>" }
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  paginates_per 10
  default_scope { enabled.order('id desc') }
end
