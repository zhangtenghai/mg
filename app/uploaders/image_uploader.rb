class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage :qiniu
  self.qiniu_bucket = "mgramersources"
  self.qiniu_bucket_domain = "mgramersources.qiniudn.com"
  self.qiniu_protocal = 'http'
  self.qiniu_can_overwrite = true
  self.qiniu_bucket_private= false #default is false

  def store_dir
    "uploads/resource/#{model.class.name.demodulize.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    Ckeditor.image_file_types
  end
end