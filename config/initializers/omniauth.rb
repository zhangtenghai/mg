Rails.application.config.middleware.use OmniAuth::Builder do
  provider :qq_connect, '101207102', '3b5abd2db3ddfcc3d33636b376288bec'
end