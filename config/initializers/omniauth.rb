Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :slc, ENV['SLC_KEY'], ENV['SLC_SECRET'], :model => Teacher
  else
    provider :slc, ENV['SLC_KEY'], ENV['SLC_SECRET'], :model => Teacher, :setup => lambda{|env| 
       env['omniauth.strategy'].options[:client_options].site = 'https://api.sandbox.slcedu.org'
    }
  end
end
