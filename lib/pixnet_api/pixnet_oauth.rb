module PixnetApi
  class PixnetOauth
    attr_accessor :consumer, :access_token
    include PixnetApi::Album

    def initialize
      @consumer = OAuth::Consumer.new(
        PIXNET_CONSUMER_CREDENTIALS[:key],
        PIXNET_CONSUMER_CREDENTIALS[:secret],
        PIXNET_CONSUMER_CREDENTIALS[:options]
      )
      @access_token = OAuth::AccessToken.new(
        @consumer,
        PIXNET_ACCESSTOKEN[:oauth_token],
        PIXNET_ACCESSTOKEN[:oauth_token_secret]
      )
      @data_sets = {}
      @check_sets = {}
    end
  end
end