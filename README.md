File structure of project:

terraform/
├── part1-single-instance/
│ ├── main.tf
│ ├── variables.tf
│ ├─ outputs.tf
│ └── user_data.sh
└── part2-two-instances/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── flask_user_data.sh
    └── express_user_data.sh

part3-ecs-ecr/
├── main.tf
├── variables.tf
├── outputs.tf
├── flask/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
└── express/
    ├── server.js
    ├── package.json
    └── Dockerfile
