# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'numru/netcdf/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-netcdf-bigmem"
  spec.version       = NumRu::NetCDF::VERSION
  spec.authors           = ["Takeshi Horinouchi", "Tsuyoshi Koshiro",\
    "Shigenori Otsuka", "Seiya Nishizawa", "T Sakakima"]
  spec.email            = ['eriko@gfd-dennou.org']

  spec.summary          = %q{Ruby interface to NetCDF}
  spec.description      = %q{RubyNetCDF is the Ruby interface to the NetCDF library built on the NArray library, which is an efficient multi-dimensional numeric array class for Ruby. This version works with Ruby2.0.}

  spec.homepage         = 'http://www.gfd-dennou.org/arch/ruby/products/ruby-netcdf/'
  spec.licenses         = ["BSD-2-Clause"]

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|demo)/})
  spec.require_paths = ["ext","lib"]
  spec.extensions << "ext/numru/extconf.rb"

  spec.required_ruby_version = Gem::Requirement.new(">= 1.8")
  spec.add_runtime_dependency(%q<narray-bigmem>, [">= 0"])
  spec.add_runtime_dependency(%q<narray_miss-bigmem>, [">= 0"])

end
