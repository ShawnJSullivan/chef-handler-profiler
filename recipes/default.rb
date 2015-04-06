#
# Cookbook Name:: chef-handler-profiler
# Recipe:: default
#
# Copyright 2015, Gannett
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'chef_handler'

# Install `chef-handler-profiler` gem during the compile phase
chef_gem 'chef-handler-profiler' do
  action :install
end

# load the gem here so it gets added to the $LOAD_PATH, otherwise chef_handler
# will fail.
require 'chef/handler/chef_profiler'

# Activate the handler immediately during compile phase
chef_handler 'Chef::Handler::Profiler' do
  source 'chef/handler/chef_profiler'
  action :nothing
end.run_action(:enable)
