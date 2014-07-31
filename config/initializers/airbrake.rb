Airbrake.configure do |config|
  config.api_key = 'ce0773ec713b3644b0cea4e681c73030'
  config.host    = 'errors.endheo.fr'
  config.port    = 80
  config.secure  = config.port == 443
end