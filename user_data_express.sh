#!/bin/bash
exec > /var/log/user-data-express.log 2>&1
set -x
yum update -y
curl -sL https://rpm.nodesource.com/setup_16.x | bash -
yum install -y nodejs git
git clone https://github.com/NileshDamodare/flask-express-apps23.git /home/ec2-user/apps
cd /home/ec2-user/apps/express_app
npm install
nohup npm start > /home/ec2-user/express.log 2>&1 &
