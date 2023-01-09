# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-triumph-sdk-plugin/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-triumph-sdk-plugin'
  spec.version       = CocoapodsTriumphSdkPlugin::VERSION
  spec.authors       = ['Alex Oakley']
  spec.email         = ['alex@triumpharcade.com']
  spec.description   = %q{Helper plugin for installation of TriumphSDK as CocoaPod}
  spec.summary       = %q{Helper plugin for installation of TriumphSDK as CocoaPod}
  spec.homepage      = 'https://github.com/triumpharcade/cocoapods-triumph-sdk-plugin'
  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
