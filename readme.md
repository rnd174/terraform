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


## The Override order
Environment variables
terraform.tfvars
terraform.tfvars.json
*.auto.tfvars or *.auto.tfvars.json
-var and -var-file


## Resource Meta Arguments

Terraform language defines several meta-arguments, which can be used with any resource type to change the behavior of resources.
 1. depends_on : for specifying explict dependencies
 2. count: for creating multiple resource instances according to a count.
 3. for_each: to create multiple instances according to a map, or set of strings.
 4. provider: for selecting a non-default provider configuration.
 5. lifecycle: for lifecycle customizations.
 6. provisioner and connection: for taking extra actions after resource creation.


 ## Lifecycle

Lifecycle block allows you to change what happens to resource eg. create, update, destroy. Lifecycle blocks are nested within resources

 1. crete_before_destroy(bool)
    When replacing a resource first create the new resource before deleting it(the default is destroyed old first)
 2. prevent_destroy(bool)
    Ensures a resource is not destroyed
 3. ignore_changes(list of attributes)
    Don't change the resource( create,update,destroy) the resource if a change occurs for the listed attributes.

    