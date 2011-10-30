# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "weatherboy/version"

Gem::Specification.new do |s|
  s.name        = "weatherboy"
  s.version     = Weatherboy::VERSION
  s.authors     = ["Tony Drake"]
  s.email       = ["t27duck@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Retrieve weather information from Weather Underground}
  s.description = %q{A Ruby Gem that connects to Weather Underground's XML API feed. Provides current conditions, future forecasts, weather alerts, and links to weather camera images and weather radars.}

  s.rubyforge_project = "weatherboy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
