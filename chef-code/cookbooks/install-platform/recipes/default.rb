# Run apt-get update first
# include_recipe 'apt::default'
# include_recipe "nodejs::#{node['nodejs']['install_method']}"
include_recipe "sc-mongodb::default"

package 'jq'
package 'build-essential' 
package 'gcc'

remote_file "#{Chef::Config[:file_cache_path]}/node-v#{node["nodejs"]["version"]}-linux-x64.tar.gz" do
# remote_file "https://nodejs.org/dist/v12.19.0/node-v12.19.0-linux-x64.tar.gz" do
  source node["nodejs"]["url"]
  # source "https://nodejs.org/dist/v12.19.0/node-v12.19.0-linux-x64.tar.gz"
  checksum node["nodejs"]["checksum"]
end 

bash "install-node" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    pwd 
    echo "-------------files in the present directory-------------"
    ls
    echo "-------------files in the present directory-end------------"
    
    tar -xzf node-v12.19.0-linux-x64.tar.gz
    rm *.gz 
    mv node* /opt/nodejs
    echo 'export PATH=$PATH:/opt/nodejs/bin' >> /etc/bash.bashrc
    source /etc/bash.bashrc
    
    EOH
    # (cd node-v#{node["nodejs"]["version"]} && ./configure --prefix=#{node["nodejs"]["dir"]} && make && make install)
  action :run
  not_if "#{node["nodejs"]["dir"]}/bin/node --version 2>&1 | grep #{node["nodejs"]["version"]}"
end