HERE FACING ISSUE RELATED TO CONFIGURE BACKEND-STATE TO USER USING S3 BUCKET 
PS C:\Terraform\Practice-for-terraform\07-backend-state\users> terraform init -reconfigure

Initializing the backend...
╷
│ Error: Error loading state:
│     AccessDenied: Access Denied
│       status code: 403, request id: 3P9S4WBN7K4F0AA6, host id: tnJigrZ+wJu0hFOM496RJN8L7AMOVVAJUhsQHGR5KimTUanyF4fMqb4lreRUl5UhSgFJAhHYggU=
│
│ Terraform failed to load the default state from the "s3" backend.
│ State migration cannot occur unless the state can be loaded. Backend
│ modification and state migration has been aborted. The state in both the
│ source and the destination remain unmodified. Please resolve the
│ above error and try again.
│
│
╵

PS C:\Terraform\Practice-for-terraform\07-backend-state\users> aws configure
AWS Access Key ID [****************2DJS]: AKIA4MAGJRFCSWYMXINZ
AWS Secret Access Key [****************pmf/]: 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
Default region name [us-east-1]: us-east-1
Default output format [None]:
PS C:\Terraform\Practice-for-terraform\07-backend-state\users> terraform init -reconfigure

Initializing the backend...
Acquiring state lock. This may take a few moments...
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" backend to the
  newly configured "s3" backend. No existing state was found in the newly
  configured "s3" backend. Do you want to copy this state to the new "s3"
  backend? Enter "yes" to copy and "no" to start with an empty state.

  Enter a value: yes

Releasing state lock. This may take a few moments...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.59.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
PS C:\Terraform\Practice-for-terraform\07-backend-state\users> terraform init

Initializing the backend...
╷
│ Error: Backend configuration changed
│
│ A change in the backend configuration has been detected, which may require migrating existing state.
│
│ If you wish to attempt automatic migration of the state, use "terraform init -migrate-state".
│ If you wish to store the current configuration with no changes to the state, use "terraform init -reconfigure".
╵

PS C:\Terraform\Practice-for-terraform\07-backend-state\users> terraform init -reconfigure

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.59.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
========================================================================================

PS C:\Terraform\Practice-for-terraform\07-backend-state\users> terraform workspace list
* default

PS C:\Terraform\Practice-for-terraform\07-backend-state\users> terraform workspace new prod-env
Created and switched to workspace "prod-env"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.
PS C:\Terraform\Practice-for-terraform\07-backend-state\users> terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.59.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
PS C:\Terraform\Practice-for-terraform\07-backend-state\users> terraform plan
Acquiring state lock. This may take a few moments...

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.my_iam_user will be created
  + resource "aws_iam_user" "my_iam_user" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "prod-env_my_iam_user_abc"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + aws_iam_user_output = {
      + arn                  = (known after apply)
      + force_destroy        = false
      + id                   = (known after apply)
      + name                 = "prod-env_my_iam_user_abc"
      + path                 = "/"
      + permissions_boundary = null
      + tags                 = null
      + tags_all             = (known after apply)
      + unique_id            = (known after apply)
    }

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
Releasing state lock. This may take a few moments...