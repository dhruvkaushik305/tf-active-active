### The following is the sketch of the infra that this repo is about
![image](https://github.com/user-attachments/assets/9f7e769b-9f9b-4206-b4a5-08964cfb4536)

> In case you want to follow along, make sure to configure a few things
> - You have terraform installed
> - You have AWS CLI installed and configured

### Steps to use this repo
- If you're interested in using S3 for the state file management, go to your console and create a bucket and dynamoDB. Inside the `versions.tf` file, change the `bucket`, `region`, `dynamodb_table` as per your configuration
- If you want to keep the statefile locally, just remove the `backend` block from the `versions.tf`
- `terraform init` to initialise the providers
- Refer to the `terraform.tfvars.example` to see the structure of the values. Change them according to your need and create a new file in the root of the directory called `terraform.tfvars`
- `terraform plan` to see the changes to be made. This will use the values that you provided in the previous step
- `terraform apply` to push these changes to the cloud
- While making changes, use `terraform validate` to see if your code is syntactically correct.

Feel free to raise an issue in case you have any queries/doubts
