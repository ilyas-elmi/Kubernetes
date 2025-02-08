provider "aws" {
  region  = "eu-west-2"
  profile = "Terraform-Cert"
}

resource "aws_instance" "kubernetes" {
  instance_type = "t2.medium"
  ami           = "ami-091f18e98bc129c4e"
  security_groups = [aws_security_group.SSH_TCP.name]

  tags = {
    Name: "Kubernetes-EC2"

  }
}

resource "aws_security_group" "SSH_TCP" {
  name        = "Kubernetes-v1"
  description = "Allow SSH and TCP inbound traffic"

  tags = {
    Name = "TCP_SSH"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.SSH_TCP.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "TCP" {
  security_group_id = aws_security_group.SSH_TCP.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3000
  ip_protocol       = "tcp"
  to_port           = 3000
}
