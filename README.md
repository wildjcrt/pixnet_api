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


  [1]: http://apps.pixnet.tw/
