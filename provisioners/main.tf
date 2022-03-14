terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.5.0"
      configuration_aliases = [aws.alternate]
    }
  }

  # backend "remote" {
  #   organization = "rnd174"
  #   workspaces {
  #     name = "provisioners"
  #   }
  # }

}


data "template_file" "user_data" {
  template = file("./userdata.yaml")
}
provider "aws" {
  # Configuration options
  profile = "default"
  region  = "us-east-1"
  shared_config_files      = ["~/.aws/per/config"]
  shared_credentials_files = ["~/.aws/per/credentials"]
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZF29oBRtCgH0SeeopfGrHtybJVUNTKmskh3agHwAW/wt21O8hkzZY3QfLdhd0rky52bcZZ9PA/4DuS/N2w58iiIz3cxO+xTATmGyMCULbw+FKDi+MS0yodyttuM5eb1XZhAMm/Jx8xn5USbKYlxltTa0Qs4/nnwb4gxIhyoglZC/q0+pRcogyeKEUOUMUA4Xtoj7J7sQE/kFm7Zm1ktabq+aFtUfZ/y9odqKrit+dXrAeBdMH0d8Aykz9WjWgOhzX1JTPhfsl7dJwSXaUyICdNl1fHf5VRlWTqnhSlBzZSOm3nA9WvKXS/EO3RZcqX5AiplvAGHES7ROMETfklwOV24NZW56cVwl2MT2eIGoDgCRdLEB7oCMvJevp/MHSEJYZ7hIXZ7Q02dM4mICXc3MllmRlIWls9pl7f1GZEUS3i8Byju25VeamBf7CIrrUJL2ZEZ62PUXd6keVXTUqt8TAhZR/o8OvZ49rdYUCHlfl5gXkS6LhgWVK88aJPdaQ2aM= i350766@C02Y73G0JGH5"
}

resource "aws_instance" "MyServer" {
  ami                    = "ami-0c293f3f676ec4f90"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.my_sg_server.id]
  user_data              = data.template_file.user_data.rendered

  # connection {
  #   type     = "ssh"
  #   user     = "root"
  #   private_key = "${file()}"
  #   host     = "${self.public_ip}"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "echo ${self.private_ip} >> /home/ec2-user/private_ips.txt",
  #   ]
  # }
  tags = {
    Name = "MyServer"
  }
}

data "aws_vpc" "main" {
  id = "vpc-0895721ac75763dd2"
}

resource "aws_security_group" "my_sg_server" {
  name        = "sg_my_server"
  description = "MyServer Security Group"
  vpc_id      = data.aws_vpc.main.id

  ingress = [
    {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["49.37.170.73/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      from_port        = 0
      description      = "outgoing traffic"
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      ipv6_cidr_blocks = []
      security_groups  = []
      prefix_list_ids  = []
      self             = false
    }
  ]
}

output "public_ip" {
  value = aws_instance.MyServer.public_ip
}