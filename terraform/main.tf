provider "aws" {
  region = "us-east-1"
}




resource "aws_instance" "fabric1" {
    ami = "ami-04169656fea786776"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public_subnet_a.id}"
    key_name= "test"
    tags {
    Name = "hyperledger-fabric1"
  }
}

resource "aws_security_group" "instance" {
  name = "fabric-sg"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
