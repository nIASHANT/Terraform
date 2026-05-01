variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}

variable "my_ip" {
  description = "Your public IP in CIDR format for SSH"
  type        = string
}