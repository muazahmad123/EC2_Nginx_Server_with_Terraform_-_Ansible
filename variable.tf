# variables.tf
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1" # Replce your region
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  default     = "ami-084568db4383264d4" # Replace the AMI ID
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"  # Replace your instance type
}

variable "public_key_path" {
  description = "Path to the public key for SSH access"
  default     = "~/.ssh/id_rsa.pub" # Replace with your Public key
}

variable "private_key_path" {
  description = "Path to the private key for SSH access"
  default     = "~/.ssh/id_rsa" # Replace with your private key
}

variable "ansible_user" {
  description = "SSH user for Ansible connection"
  default     = "ubuntu" 
}
