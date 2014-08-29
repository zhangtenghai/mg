CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "tg_zdndey_13phNaOJbuLBFV_aMvDgsO5d7MvfNS"
  config.qiniu_secret_key    = 'UcZtALg4_GPE-oTS4hK10IIXfTNfesYMYMhLhTSK'
  config.qiniu_bucket        = "mgramersources"
  config.qiniu_bucket_domain = "mgramersources.qiniudn.com"
  config.qiniu_bucket_private= false #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
end