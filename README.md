# Terraform

![Alt text](Images/terraform-architecture.jpg)

Terraform is an infrastructure provisioning and management tool that allows you to define, deploy, and manage infrastructure resources across different cloud providers. 

It enables you to describe your desired infrastructure state using a  configuration language, which Terraform then translates into API calls to create and modify resources. With Terraform, you can easily automate the provisioning and configuration of virtual machines, storage, networks, and more. It provides a unified workflow, version control, and the ability to track and manage infrastructure changes. 

**Terraform helps achieve infrastructure as code, making infrastructure deployments reliable, scalable, and repeatable across multiple environments**.



## Downlaoding Terraform

1. You can go online and download terraform for your machine
2. You then need to make an environment variable. Use this guide: https://spacelift.io/blog/how-to-install-terraform

**Note**: You may need to restart you machine after this

3. To check that terraform has downloaded in  git bash terminal (with admin access) type the following commands:

```
terraform
terraform --version
```

## Using Terraform

Here are some commands that are used:

**terraform init** - To initialise terraform

**terraform plan** - This checks your code. If something is wrong, it will inform you

**terraform apply** - This will execute your codes. You will be prompted to enter 'yes' to make sure that you do want to go ahead an execute 

**terraform destroy** - if you have made and instance, it will kill the instance


