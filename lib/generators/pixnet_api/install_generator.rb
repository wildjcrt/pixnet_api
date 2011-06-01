module PixnetApi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy Pixnet API oauth config file"
      source_root File.expand_path('../templates', __FILE__)
      
      def copy_initializers
        copy_file 'oauth_pixnet.rb', 'config/initializers/oauth_pixnet.rb'
      end
    end
  end
end
