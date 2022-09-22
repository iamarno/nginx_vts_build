#!/bin/bash

###versions

nginx_version="1.23.1"
module_version="0.2.0"

# build nginx module
echo "build with nginx version $nginx_version"

# download nginx binary from nginx.org
wget http://nginx.org/download/nginx-$nginx_version.tar.gz

# extract
tar xfv nginx-$nginx_version.tar.gz

# download module source
wget https://github.com/vozlt/nginx-module-vts/archive/refs/tags/v$module_version.tar.gz

# extract
tar xfv v$module_version.tar.gz

# cd
cd nginx-$nginx_version

# ./configure
./configure --with-compat --add-dynamic-module=../nginx-module-vts-$module_version/ --with-cc-opt=-Wno-stringop-overread

# make
make

# make install
make install

# copy module to module directory
cp objs/ngx_http_vhost_traffic_status_module.so /module/.

exit 0
