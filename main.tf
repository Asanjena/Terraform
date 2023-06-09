# To create a service on AWS cloud 
# launch an ec2 in Ireland 
# terraform to download the required packages/ dependencies
# terraform init (command to run)

provider "aws" {
# which region of AWS
	region = "eu-west-1"

}
# gitbash mush have admin access
# Launch an ec2

# which resource (let terraform know) - 
resource "aws_instance" "app_instance"{

# which AMI - ubuntu 18.04
	ami = "ami-00e8ddf087865b27f"

# type of instance t2.micro
	instance_type = "t2.micro"	

# do you need public ip = yes
	associate_public_ip_address = true

# what would you like to call it 
	tags = {
             Name = "alema-tech230-terraform-app"
	}	
}

# vpc
resource "aws_vpc" "alema_tf_vpc" {
    cidr_block     = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {

      Name = "tech230_alema_vpc_tf"
    }

}

resource "aws_internet_gateway" "tech230_alema_tf_igw" {
  vpc_id = aws_vpc.alema_tf_vpc.id

  tags = {
    Name = "tech230_alema_tf_igw"
  }
}


resource "aws_subnet" "tech230_alema_tf_vpc_public_sn" {
  vpc_id     = aws_vpc.alema_tf_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "tech230_alema_tf_vpc_public_sn"
    }
}

resource "aws_security_group" "tech230_alema_sg_app" {
  name        = "tech230_alema_tf_sg_app"
  description = "Allow inbound traffic"
  vpc_id = aws_vpc.alema_tf_vpc.id
  
  ingress {
    description      = "access to the app"
    from_port        = "80"
    to_port          = "80"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  # ssh access
  ingress {
    description      = "ssh access"
    from_port        = "22"
    to_port          = "22"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }
 # Allow port 3000 from anywhere
  ingress {
    from_port        = "3000"
    to_port          = "3000"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

    }

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"]
  }

      tags = {
        Name = "tech230_alema_tf_sg_app"
    }
}

resource "aws_route_table" "tech230_alema_tf_rt" {
vpc_id = aws_vpc.alema_tf_vpc.id

route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tech230_alema_tf_igw.id
    }

 tags = {
     Name = "tech230_alema_tf_rt"
  }
}

resource "aws_route_table_association" "tech230_alema_tf_subnet_association" {
  route_table_id = aws_route_table.tech230_alema_tf_rt.id
  subnet_id = aws_subnet.tech230_alema_tf_vpc_public_sn.id
}


















resource "aws_subnet" "tech230_alema_tf_vpc_private_sn" {
  vpc_id     = aws_vpc.alema_tf_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "tech230_alema_tf_vpc_private_sn"
    }
}
