# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pixnet_api/version"

Gem::Specification.new do |s|
  s.name        = "pixnet_api"
  s.version     = PixnetApi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jcrt"]
  s.email       = ["jcrt@pixnet.tw"]
  s.homepage    = "http://apps.pixnet.tw/"
  s.summary     = %q{A Ruby Library for process Pixnet data.}
  s.description = %q{Ruby version library for Pixnet API, which use OAuth 1.0a.}

  s.rubyforge_project = "pixnet_api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency  "oauth"
  s.add_dependency  "multipart-post"
  s.add_dependency  "json"
  
  s.add_development_dependency  "rspec", "~> 2.5"
  s.add_development_dependency  "fakeweb"
end
