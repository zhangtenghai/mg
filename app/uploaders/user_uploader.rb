class UserUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage :qiniu
  self.qiniu_bucket = "mrgamersources"
  self.qiniu_bucket_domain = "mrgamersources.qiniudn.com"
  self.qiniu_protocal = 'http'
  self.qiniu_can_overwrite = true
  self.qiniu_bucket_private= false #default is false

  def store_dir
    "uploads/resource/#{model.class.name.demodulize.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    Ckeditor.image_file_types
  end

  def default_url
    "/images/fallback/" + [version_name, "user_head.jpg"].compact.join('_')
  end

  process resize_to_fit: [160, 160]

  version :thumb do
    process resize_to_fill: [45,45]
  end

end