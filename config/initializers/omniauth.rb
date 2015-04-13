Rails.application.config.middleware.use OmniAuth::Builder do
  provider :qq_connect, ENV['QQ_CONNECT_KEY'], ENV['QQ_CONNECT_SECRET']
  provider :weibo, ENV['WEIBO_KEY'], ENV['WEIBO_SECRET']
end