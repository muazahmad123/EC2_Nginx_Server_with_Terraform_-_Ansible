# main.tf
provider "aws" {
  region = var.aws_region
}

# Create EC2 Key Pair
resource "aws_key_pair" "web_key" {
  key_name   = "web-server-key"
  public_key = file(var.public_key_path)
}

# Create EC2 Instance
resource "aws_instance" "web_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.web_key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.web_subnet.id 



 provisioner "local-exec" {
  command = "echo '[webservers]' > inventory.txt && echo \"${aws_instance.web_server.public_ip} ansible_user=${var.ansible_user} ansible_ssh_private_key_file=~/.ssh/id_rsa\" >> inventory.txt"
}

  provisioner "local-exec" {
    command = "sleep 30 && ansible-playbook -i inventory.txt playbook.yaml"
  }
}

# Output the public IP address
output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
}

