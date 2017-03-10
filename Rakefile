# -* coding: utf-8 -*-
require 'rake/testtask'
require 'rake/extensiontask'
require 'rake/packagetask'
begin
  require 'bundler/gem_helper'  # instead of 'bundler/gem_tasks' -> need manual
                                # calls of install_tasks (see below)
rescue LoadError
  puts 'If you want to create gem, You must install Bundler'
end

# manual calls of install_tasks to support multiple gemspec files
Bundler::GemHelper.install_tasks(name: "ruby-netcdf")
#Bundler::GemHelper.install_tasks(name: "ruby-netcdf-bigmem")

require './lib/numru/netcdf/version'
def version
  NumRu::NetCDF::VERSION
end

task :default => :test
task :test => :compile
Rake::TestTask.new do |t|
  t.libs << 'lib' << 'test'
  t.test_files = FileList['test/*.rb']
end

Rake::ExtensionTask.new do |ext|
  ext.name = 'netcdfraw'
  ext.ext_dir = 'ext/numru'
  ext.lib_dir = 'lib/numru'
end

Rake::PackageTask.new('ruby-netcdf', "#{version}") do |t|
  t.need_tar_gz = true
  t.package_files.include `git ls-files`.split("\n")
end
