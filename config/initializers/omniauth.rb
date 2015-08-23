Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, ENV['GUNRUN_FB_KEY'], ENV['GUNRUN_FB_SECRET']
end
