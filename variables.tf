variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0b09627181c8d5778"
}

variable "key_name" {
  description = "AWS EC2 Key Pair Name"
  type        = string
  default     = "MyNewKeyPair"
}

variable "allowed_ip" {
  description = "The IP address allowed to SSH into EC2 instances"
  type        = string
  default     = "103.184.87.224/32"
}
variable "subnet_id" {
  description = "Subnet ID to launch instances"
  type        = string
  default     = "subnet-095bc8490d2c419ca"   # Changed to ap-south-1a subnet
}
