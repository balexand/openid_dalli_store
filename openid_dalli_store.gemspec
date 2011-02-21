# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "openid_dalli_store/version"

Gem::Specification.new do |s|
  s.name        = "openid_dalli_store"
  s.version     = OpenidDalliStore::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brian Alexander"]
  s.email       = ["balexand@gmail.com"]
  s.homepage    = "https://github.com/balexand/openid_dalli_store"
  s.summary     = %q{Monkey patch that allows Dalli to be used as an OpenID store}
  s.description = %q{Monkey patch that allows the Dalli memcache client to be used as an OpenID store}

  s.rubyforge_project = "openid_dalli_store"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
