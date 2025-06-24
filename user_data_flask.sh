#!/bin/bash
exec > /var/log/user-data-flask.log 2>&1
set -x
yum update -y
yum install -y python3 git
pip3 install flask
git clone https://github.com/NileshDamodare/flask-express-apps23.git /home/ec2-user/apps
nohup python3 /home/ec2-user/apps/flask_app/app.py > /home/ec2-user/flask.log 2>&1 &
