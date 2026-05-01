#!/bin/bash
dnf update -y
dnf install -y nodejs npm

mkdir -p /opt/express-app
cd /opt/express-app

cat > server.js <<EOF
const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello from Express Frontend");
});

app.listen(3000, "0.0.0.0", () => {
  console.log("Express running on port 3000");
});
EOF

npm init -y
npm install express

cat > /etc/systemd/system/express.service <<EOF
[Unit]
Description=Express App
After=network.target

[Service]
WorkingDirectory=/opt/express-app
ExecStart=/usr/bin/node /opt/express-app/server.js
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable express
systemctl start express