#
# Cookbook:: start-app
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
bash "start-app" do
    cwd Chef::Config[:file_cache_path]
    code <<-EOH
      cd #{node["application"]["dir"]} 
      npm i
      npm start
      EOH
    action :run
  end