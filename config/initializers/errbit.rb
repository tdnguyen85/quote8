Airbrake.configure do |config|
  config.api_key = 'ENV[ERRBIT]'
  config.host    = 'oopsy.herokuapp.com'
  config.port    = 80
  config.secure  = config.port == 443
end