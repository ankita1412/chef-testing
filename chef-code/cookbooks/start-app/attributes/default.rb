default['nodejs']['src_url'] = 'http://nodejs.org/dist'
default['nodejs']['version'] = '12.19.0'
default['nodejs']['npm'] = '1.2.14'
default["nodejs"]["dir"]              = "/usr/local"
default["nodejs"]["url"]              = "http://nodejs.org/dist/v#{node["nodejs"]["version"]}/node-v#{node["nodejs"]["version"]}-linux-x64.tar.gz"
default["nodejs"]["checksum"]         = "f37a5bf0965e8ab7b1b078392638778286ceee8fdb895c050889a61772944bda"
default["application"]["dir"]         = "/tmp/deploy_webapp/app"