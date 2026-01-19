provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 5
  ami                    = "ami-07ff62358b87c7116"
  instance_type          = "c7i-flex.large"
  key_name               = "ubuntu-us-east-1"
  vpc_security_group_ids = ["sg-046cd16cdb7a78595"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "nexus", "app-server1", "app-server2", "Monitoring server"]
}
