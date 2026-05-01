#!/bin/bash
dnf update -y
dnf install -y python3 python3-pip

mkdir -p /opt/flask-app

cat > /opt/flask-app/app.py <<EOF
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return {"message": "Hello from Flask Backend"}

app.run(host="0.0.0.0", port=5000)
EOF

pip3 install flask

cat > /etc/systemd/system/flask.service <<EOF
[Unit]
Description=Flask App
After=network.target

[Service]
WorkingDirectory=/opt/flask-app
ExecStart=/usr/bin/python3 /opt/flask-app/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable flask
systemctl start flask