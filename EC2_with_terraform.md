## Using terraform to make an EC2 instance on AWS:
```
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

