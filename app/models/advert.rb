class Advert < ActiveRecord::Base
  include Disable
  mount_uploader :list_img, ImageUploader
  # has_attached_file :list_img, :styles => { :medium => "266x286>" }
  # validates_attachment_content_type :list_img, :content_type => /\Aimage\/.*\Z/
  default_scope { enabled.order('id desc') }
  paginates_per 10
end