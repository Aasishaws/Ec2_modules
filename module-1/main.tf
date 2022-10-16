locals  {
    environment = "master"
}

resource "aws_security_group" "allow_all" {

ingress {
      description      = var.ingressdescription_a
      from_port        = var.ingressfromport_a
      to_port          = var.ingresstoport_a
      protocol         = var.ingressprotocol_a
      cidr_blocks      = ["0.0.0.0/0"]
  }
ingress {
      description      = var.ingressdescription_b
      from_port        = var.ingressfromport_b
      to_port          = var.ingresstoport_b
      protocol         = var.ingressprotocol_b
      cidr_blocks      = ["0.0.0.0/0"]
  }
egress {
      description      = var.egressdescription
      from_port        = var.egressfromport
      to_port          = var.egresstoport
      protocol         = var.egressprotocol
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "${local.environment}-sg"
  }
}

resource "aws_instance" "master-ec2" {
  ami                    = data.aws_ami.master_ami.id
  user_data             = <<-EOF
      #!/bin/bash
      yum update –y
      wget -O /etc/yum.repos.d/jenkins.repo \https://pkg.jenkins.io/redhat-stable/jenkins.repo
      rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
      yum upgrade -y
      amazon-linux-extras install java-openjdk11 -y
      yum install jenkins -y
      systemctl enable jenkins
      systemctl start jenkins
      EOF

  key_name               = var.masterkey_name
  instance_type          = var.masterec2_instance_type
  vpc_security_group_ids      =  [aws_security_group.allow_all.id]

tags = {
    Name = var.master_name
  }
}
  data "aws_ami" "master_ami" {
    most_recent = true
    owners  = ["amazon"]

    filter {
        name    = "name"
        values  = ["amzn2-ami-hvm*"]
    }
  }
