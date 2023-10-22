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





