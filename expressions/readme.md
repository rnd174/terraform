
## using for expression
for variable world, whihc is a list.

in the terraform console

[for w in var.worlds:upper(w)]

prints the list values

[for k,v in var.worlds_map: upper(v)]


{for k,v in var.worlds_map: "${k}" => upper(v)}

output : 
{
  "barsoon" = "EARTH"
  "cusoom" = "JUPITER"
  "jasoom" = "SATURN"
  "sasoom" = "PLUTO"
}


## using the interpolation operator

consider variable hello in main.tf whose value is barsoon in terraform.tfvars

in the terraform console.

"hello %{if var.hello == "barsoon"}Mars%{else}world%{endif}"

## spalt expression

[for m in var.worlds_splat : m.mars_name]

