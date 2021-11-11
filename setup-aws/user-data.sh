#!/usr/bin/env bash

cat > index.html <<EOF
<h1>Hello, World</h1>
EOF

nohup busybox httpd -f -p 8080 &

apt install -y nginx
systemctl enable nginx
