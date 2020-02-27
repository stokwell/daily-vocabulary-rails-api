Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, ENV['VK_CLIENT_ID'],  ENV['VK_CLIENT_SECRET'], scope: 'email,friends,audio,photos'
  provider :facebook, ENV['FACEBOOK_CLIENT_ID'], ENV['FACEBOOK_CLIENT_SECRET']
end
