# AWS VPC Endpoint
This example codebase will show you how to use [AWS VPC Endpoints](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-endpoints.html) to access some AWS services from instances that do not have external Internet access.

This example code creates the following:
- public instance with public IP address
  - access from public, configured, IP for ssh
  - can access private instance(s)
  - is not assigned to any route table
  - has access to the internet
- private instance
  - access from public instance allowed
  - access to vpc-endpint(s)
  - is not assigned to any route table
  - does not have access to the internet
  
2 VPC endpoints are created for use
- com.amazoneaws.`region`.ec2
- com.amazoneaws.`region`.s3

## assumptions
The AMI you use has 'awscli' installed prior to launching the private instance so that you can test features. This is how you will test that things are working.

_A packer example is included and you'll need to adjust the `instance.tf` file to query the latest AMI you have built in EC2. Instructions on using packer is left to you._

It is only going to set up subnets in AZs a, b, and c (this is example code..)

It is only launching instances in AZ a (this is example code..)

## Get started
### edit `variables.tf`
set `aws_region` to the region you wish to operate in

set `first-2-octets` to the first 2 octets of your RFC1918 address space. Code assumes /16 and example has set a default of `172.30` which will give the VPC the address space of `172.30.0.0/16`.

set `home-ip` to your remote IPv4 address you would like to use SSH from.

set `tag_prefix` to something to create for the _Name_ AWS tag.

set `ami_key` to your SSH key you will be using in AWS.

## use Terraform to build your example infrastructure
```
export AWS_PROFILE=<your-configured-profile>
export AWS_REGION=<your-region>

terraform init
terraform plan
terraform apply
```

Then review the output from the `terraform apply` run and note the public IP address and the private IP address for the _private_ instance as you will need these for the next section.

## Test that things are working
`cat .ssh/your-private-key.pem` - you'll need this to connect from public instance to private instance


`ssh -i .ssh/your-private-key.pem ubuntu@<public_ip_from_output>`

`cat > your-private-key.pem` - now paste in the secret key for your private key

`chmod 600 your-private-key.pem` - so you can use it with ssh

`ssh -i your-private-key.pem ubuntu@<private_ip_from_output>`


If you built your AMI and installed _awscli` then you should have access to the endpoints.

`ping 8.8.8.8` - this should fail

`aws configure` - configure credentials

`aws ec2 describe-instances` - should give you some output

if you got output from the `aws ec2` command then you have **won**.

## use Terraform to destroy what you built
`terraform destroy` - and now you can remove the resources you built for this test
