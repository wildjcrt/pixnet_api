PIXNET_CONSUMER_CREDENTIALS = {
  :key=>"CONSUMER_KEY",
  :secret=>"CONSUMER_SECRET",
  :options => {
    :site => "http://emma.pixnet.cc",
    :request_token_path => "/oauth/request_token",
    :access_token_path => "/oauth/access_token",
    :authorize_path => "/oauth/authorize"
  }
}

PIXNET_ACCESSTOKEN = {
  :oauth_token => "YOUR_ACCESS_TOKEN",
  :oauth_token_secret => "YOUR_ACCESS_TOKEN_SECRET"
}
