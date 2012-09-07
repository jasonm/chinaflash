Rails.application.config.middleware.use OmniAuth::Builder do
  
  if Rails.env.production?
    provider :slc, ENV[:SLC_KEY], ENV['SLC_SECRET']
  else
    provider :slc, ENV['SLC_SANDBOX_KEY'], ENV['SLC_SANDBOX_SECRET'], :setup => lambda{|env| 
       env['omniauth.strategy'].options[:client_options].site = 'https://api.sandbox.slcedu.org'
    }
  end

end