require File.expand_path("../../../lib/pixnet_api", __FILE__)
require File.expand_path("../../../lib/generators/pixnet_api/templates/oauth_pixnet", __FILE__)

describe PixnetApi::PixnetOauth do
  
  before do    
    @oauth = PixnetApi::PixnetOauth.new
  end
  
  it "should be initialized" do
    @oauth.should be_a_kind_of(PixnetApi::PixnetOauth)
  end
  
end