### The following is the sketch of the infra that this repo is about
![image](https://github.com/user-attachments/assets/f0f7c90b-a66c-4cf7-a93e-59729d1bb69f)

> In case you want to follow along, make sure to configure a few things
> - You have terraform installed
> - You have AWS CLI installed and configured

### Steps to use this repo
- If you're interested in using S3 for the state file management, go to your console and create a bucket and dynamoDB. Inside the `versions.tf` file, change the `bucket`, `region`, `dynamodb_table` as per your configuration
- If you want to keep the statefile locally, just remove the `backend` block from the `versions.tf`
- `terraform init` to initialise the providers
- `terraform plan` to see the changes to be made
- `terraform apply` to push these changes to the cloud
- While making changes, use `terraform validate` to see if your code is syntactically correct.

Feel free to raise an issue in case you have any queries/doubts
