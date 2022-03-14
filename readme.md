## default autoloaded variables file

| terraform.tfvars|  When you create a named terraform.tfvars file it will be automatically loaded when running terraform apply


## Additional varables files (not autoloaded)

|my_variables.tfvars| You can create additional variables files eg . dev.fvars, prod.tfvars. They will not be autoloaded( you will need to specify them in via command line)

## Additional Variables files(autoloaded)

|my_variables.auto.tfvars| if you name your file with auto.tfvars it will always be loaded.

## Specify a variables file via Command line

|-var-file dev.tfvars| You can specifiv variables inline via the command line for individual overrides.

## Inline variables via command line

|-var ec2_type="t2.micro"| You can speific variables inline via the command line for individual overrides

## Environment variables

|TF_VAR_my_variable_name| Terraform will watch for environment variables that begin with TF_VAR_ and apply those as variables.