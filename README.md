# VNSNY-Demo-Infra

## To Attach Access keys and secret keys use ENVIRONMENT variables (its kind of best practice)

Download the Access keys from the Management console. 

`export TF_VAR_access=<provide-access-value-here>`

For Providing secret key 

`export TF_VAR_secret=<provide-secret-value-here>`

To Cross Verify use echo command. You need to see the value back again. 

`echo $TF_VAR_access` 

Do Terraform apply. It should run without throwing errors.  

`terraform apply`

We can use sensitive = true in variables file in access key section. 
But it's available in v14.0 


    variable "accesskeys" {
     type = string
    sensitive = true
    }

