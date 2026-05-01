#!/bin/bash
dnf update -y

# Install Python + Node
dnf install -y python3 python3-pip git nodejs npm

mkdir -p /opt/apps
cd /opt/apps

# Flask App
mkdir flask-app
cat > flask-app/app.py <<EOF
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return {"message": "Hello from Flask Backend"}

app.run(host="0.0.0.0", port=5000)
EOF

pip3 install flask

# Express App
mkdir express-app
cat > express-app/server.js <<EOF
const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello from Express Frontend");
});

app.listen(3000, "0.0.0.0", () => {
  console.log("Express running on port 3000");
});
EOF

cd /opt/apps/express-app
npm init -y
npm install express

# systemd for Flask
cat > /etc/systemd/system/flask.service <<EOF
[Unit]
Description=Flask App
After=network.target

[Service]
WorkingDirectory=/opt/apps/flask-app
ExecStart=/usr/bin/python3 /opt/apps/flask-app/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# systemd for Express
cat > /etc/systemd/system/express.service <<EOF
[Unit]
Description=Express App
After=network.target

[Service]
WorkingDirectory=/opt/apps/express-app
ExecStart=/usr/bin/node /opt/apps/express-app/server.js
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable flask express
systemctl start flask express