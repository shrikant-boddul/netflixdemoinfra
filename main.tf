provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 5
  ami                    = "ami-07ff62358b87c7116"
  instance_type          = "t2.medium"
  key_name               = "ubuntu-us-east-1"
  vpc_security_group_ids = ["sg-0b5d13646d3af01ce"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "nexus", "app-server1", "app-server2", "Monitoring server"]
}
