# Terraform Beginner Bootcamp 2023 - Week 1

## Terraform commands
- terraform init
- terraform plan
- terraform apply 
- terraform apply --auto-approve ***
- terraform console


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

### Fix using Terraform Refresh
```
terraform apply -refresh-only --auto-approve
```

### Terraform import

## Terraform modules
resource files declared in the modules should also be declared at the root/top-level files so they are detected when performing terraform actions

### Terraform Module Structure
It is recommended to place modules into a `modules` directory when locally developing modules 

### Passing input variables
We can pass input variables to our modules 
The module has to declare these terraform variables in its own variables.tf 
```tf
module "terrahouse_aws" {
  source="./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Module sources

Using the source we can import the module from the various places e.g. 
- locally
- Github
- Terraform Registry

```tf
module "terrahouse_aws" {
  source="./modules/terrahouse_aws"
}
```

- [Modules Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

## Working with files in terraform

### Path variables
In Terraform there is a special variable called `path` that allows us to reference local paths i.e 
- path.module = get to the path of the current module
- path.root = get the path for the root module
[Reference to named variables](https://developer.hashicorp.com/terraform/language/expressions/references)

```tf
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"

  etag = filemd5(var.index_html_filepath)
}
```


### File exists function
This is a built-in terraform function to check the existence of a file
```tf
  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "The provided path for error.html does not exist."
  }
```

### filemd5 function
[filemd5 function in terraform](https://developer.hashicorp.com/terraform/language/functions/filemd5)


### Terraform Data sources
[Hashicorp Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)
[AWS Caller Identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)

#### Terraform locals
- Allows us to use source data from cloud resources. This is useful when we want to reference cloud resources without importing them.
```tf
data "aws_caller_identity" "current" {}
```
[Locals Values](https://developer.hashicorp.com/terraform/language/values/locals)

#### Working with json
use `json encode` when creating inline policies that will be associated with specific resources - if the policy does not exist on aws
```
> jsonencode({"hello"="world"})
{"hello":"world"}

```
[Json encode functions](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

### The lifecycle meta-argument
[Lifecycle Meta-argument](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)



