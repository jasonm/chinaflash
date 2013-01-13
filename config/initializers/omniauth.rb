Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slc, ENV['SLC_KEY'], ENV['SLC_SECRET'], :model => Teacher, :setup => lambda{|env| 
    env['omniauth.strategy'].options[:client_options].site = 'https://api.sandbox.slcedu.org'
  }
end
