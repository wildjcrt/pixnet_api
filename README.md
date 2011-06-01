Pixnet API
==

This is a Ruby version library for Pixnet API, which use OAuth 1.0a.

You can go to [PIXNET API developers / MURMUR API developers][1] to look for more documents.

Install
--
Put this line in your Gemfile:

> gem "pixnet_api"

Then bundle:

> % bundle

General configuration options
--

 1. Run the following generator command, then edit the generated file.

> % rails g pixnet_api:insta

 2. Go to [PIXNET API developers][1] to register your app.

 3. Fill-up config/initializers/oauth_pixnet.rb your key and token from step 2.

Usage
--
First, You need to create a variable for any method you want to call.

> @pixnet_oauth = PixnetApi::PixnetOauth.new

Then you can call method like:

> @pixnet_oauth.get_album_sets

OR

> @pixnet_oauth.get_album_element your_element_id

Enjoy!

  [1]: http://apps.pixnet.tw/
