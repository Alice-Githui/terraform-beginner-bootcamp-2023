# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure
  ```
    PROJECT_ROOT
  |
  |___ variables.tf       - stores the structure of input variables
  |___ main.tf            - everything else
  |___ providers.tf       - defines required providers and their configuration
  |___ outputs.tf         - stores our outputs
  |___ terraform.tfvars   - the data of variables we want to load into our terraform project
  |___ README.md          - required for root modules
```
 
  
[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input varibales 
### Terraform cloud envars variables
- In terraform, we can set two types of variables (environment variables and terraform variables)
  - environment variables are those you would set on your bash terminal i.e. AWS credentials
  - terraform variables are those you would set in your tfvars file

We can set terraform variables to be sensitive so they are not visible/available outside our environment

### Loading terraform envars

### var flag
- We can use the `-var` file to set an input variable or override a variable in the ftvars file e.g. `terraform -var user_uuid = 'my_user_id'`

### var-file flag
(To do)

### terraform tfvars
This is the default file to load terraform variables in blunk. 

### auto.tfvars
 (To do)


### order of terraform variables
 document which terraform variable settings take precedence

## Dealing with configuration drift

### What happens if we lose our state file
If we lose our statefile, we most likely have to tear down all cloud infrastructure manually. We can use terraform import but it wouldn't work for all cloud resources. Check the terraform provider documentation to figure out which resources are supported by terraform import

### Fix missing resources with tf import
`terraform import aws_s3_bucket.example`
- [Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
- [AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix manual configuration

If someone modifies/deletes aws/other cloud resources manually, if we run terraform plan again, it will attempt to put our infrastructure back into expected state thus fixing our manual configuration issues

### Terraform import




