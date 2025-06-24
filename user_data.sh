
#!/bin/bash
# Log everything from this script
exec > /var/log/user-data.log 2>&1
set -xe

# --- Update and install dependencies ---
yum update -y

# Install Python3, pip, Flask, and Git
yum install -y python3 python3-pip git
pip3 install --upgrade pip
pip3 install flask

# Install Node.js (v18 preferred over v16 for stability)
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# --- Setup application directories ---
mkdir -p /home/ec2-user/apps
cd /home/ec2-user/apps

# --- Clone the GitHub repository ---
git clone https://github.com/NileshDamodare/flask-express-apps23.git .

# --- Set proper permissions (for EC2 default user) ---
chown -R ec2-user:ec2-user /home/ec2-user/apps

# --- Run Flask backend ---
cd /home/ec2-user/apps/flask_app
nohup python3 app.py > /home/ec2-user/flask.log 2>&1 &

# --- Run Express frontend ---
cd /home/ec2-user/apps/express_app
npm install
nohup npm start > /home/ec2-user/express.log 2>&1 &
