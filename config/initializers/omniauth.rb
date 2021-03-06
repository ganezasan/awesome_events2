
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 
    Rails.application.secrets.twitter_api_key,
    Rails.application.secrets.twitter_api_secret
end

OmniAuth.config.full_host = "http://192.168.33.199/" # フロントのURL
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

OmniAuth.config.logger = Rails.logger
