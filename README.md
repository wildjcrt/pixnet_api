Pixnet API
==

This is a Ruby version library for Pixnet API, which use OAuth 1.0a.

You can go to [PIXNET API developers / MURMUR API developers][1] to look for more documents.

Install
--
Put this line in your Gemfile:

    gem "pixnet_api"

Then bundle:

    % bundle

OR if you want to install plugin, your project need some gems:

    gem "oauth"
    gem "json"
    gem "multipart-post"
    
To install plugin, you can

    $ rails plugin install git@github.com:wildjcrt/pixnet_api.git

General configuration options
--

 First, Run the following generator command, then edit the generated file.

    % rails g pixnet_api:install

 Go to [PIXNET API developers][1] to register your app.

 Finally, open config/initializers/oauth_pixnet.rb, and fill-up CONSUMER_KEY and ACCESS_TOKEN.

Usage
--
First, You need to create a variable for any method you want to call.

    @pixnet_oauth = PixnetApi::PixnetOauth.new

Then you can call method like:

    @pixnet_oauth.get_album_sets

OR

    @pixnet_oauth.get_album_element your_element_id

Enjoy!

  [1]: http://apps.pixnet.tw/
