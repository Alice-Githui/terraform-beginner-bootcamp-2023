# Terraform Beginner Bootcamp 2023

**helpful links**

## Install the Terraform CLI
The tearraform CLI installation instructions have changed due to the gpg keyring depreciation. We needed to 
refer to the latest CLI install instructions via terraform documentation and change the scripting for install

- [Installing Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Refectoring the bash scripts
This bashscript is located here ([./bin/install_terraform_cli])(./bin/install_terraform_cli)
While fixing the Terraform CLI depreciation issues, we noticed the installation steps were a considerable amount of code. 
We decided to create a bash script to install the Terraform CLI. 
This will keep the gitpod task file tidy ([.gitpod.yml])(.gitpod.yml) and allow us an easier time to debug and install Terrform manually. 
It also allows better portability

### Considerations for linux installations
- [Linux permissions](https://www.freecodecamp.org/news/linux-chmod-chown-change-file-permissions/)

### Gitpod Lifecycles (Before, Init, Command)
We need to be careful when using init because it will not rerun if we start an existing workspace 

- [Gitpod Lifecycles](https://www.gitpod.io/docs/configure/workspaces/tasks)

### ENVIRONMENT VARIABLES
- We can list out all our environment varibales using the `env` command
- We can list out specific environment varibles using grep i.e `env | grep HELLO`
- We can set variables in the terminal using `export HELLO=world`
- We can remove environment variables using the `unset` command i.e `unset HELLO`
- We can list the environment variable using `echo $HELLO`
- We can also set a temporary env variable when running a command using 
```sh
HELLO='world' ./bin/print_message
```

#### Scoping of env vars
When you open a new window on vs code, it will not be aware of env vars you have set in another window
If yuo want env vars to persist across all future bash terminals that are open, you need to set env vars in your bash profiles 

#### Persisiting env vars in gitpod
You can persist env vars in gitpod by storing them on Gitpod Secrets Storage
`
gp env HELLO
`

You can also set env vars in [gitpod.yml](gitpod.yml) but this can only contain non-sensitive environmment variables

#### AWS CLI INSTALLATION
AWS CLI is installed for this project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)
- [Getting Started - Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Configure AWS CLI environmnet variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the following AWS CLI command:
```sh 
aws sts get-caller-credentials
```
- [Debugging: How to fix AWS CLI Error: Unable to Locate Credentials](https://www.learnaws.org/2023/09/09/fix-aws-cli-error-unable-to-locate-credentials/)

If it is successful, you should see a json paylod. 

We'll need to generate AWS CLI credentials from IAM user to use with the AWS CLI

### BASIC ACTIONS IN TERRAFORM

#### Terraform Registry
Terraform sources their modules and registry from the Terraform Registry which is located at 
[registry.terrform.io](https://registry.terraform.io/)

- Providers is an interface to APIs that allows us to create resources in specific cloud providers in terraform
```
We used for this case study [Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs)
```
- Modules are a way to refactor/make large amount of terraform code modular, portable and shareable

### Terraform Console
We can see a list of all the Terraform commands by typing terraform

#### 
- **Terraform init**  initializes a terraform project and downloads the binaries of the terraform providers that we use for this project

`terraform plan`
- **Terraform plan**  generates a changeset about the state of our infrastructure and what will be changed. We can output this changeset i.e. "plan"
to be passed to an apply but this can be ignored

`terraform apply`
- **Terraform apply**  runs the plan and passes the changeset to be executed by terraform. Apply should prompt us yes or no. If we want to automatically approve an apply, we can provide tha auto-approve plan e.g. `terraform apply --auto-approve`

#### Terraform Lock Files







