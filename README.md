# This repository is a POC to demonstrate how the CI tool Codefresh can be triggered on specific activites from within a Github repository and perform certain activities in an existing AWS environment.

Specific Github actions will trigger a Codefresh project to perform defined actions using Terraform scripts.  The Terraform scripts will create, modify and remove resources from the AWS working environment.  The Codefresh functionality is separated into multiple "pipelines" wherein each "pipeline" will respond to a Github trigger and perfrom a specific desired action.


## Github Triggers
- A Github pull request "**open**" action will trigger the Codefresh pr_open pipeline job
- A Github pull request "**synchronize**" action will trigger the Codefresh pr_synchronize pipeline job
- A Github pull request "**close**" action will trigger the Codefresh pr_close pipeline job

## Codefresh pipelines 
- The **pr_open** pipeline will create a new Terraform workspace with a supporting Terraform state file in an AWS S3 bucket and will create all the AWS resources associated with the pull request.
- The **pr_synchronize** pipeline will use the workspace and state file created in the pr_open step above and modify AWS resources asccording to the updated Github resources.
- The **pr_close** pipeline will remove all AWS resources created by the pr_open pipeline, remove the Terraform statefile created by the pr_open pipeline and remove the Terraform workspace created by the pr_open pipeline.

## Terraform reources
The Terraform resources used in the POC are "cloned" from another repository in order to be used in this POC.  The final implementation will be cloning and using the Terraform resources from the ca-mmis/infrastructure-private/services repo.

## Sample Dockerfiles used in this POC
The sample dockerfile used in this POC is a copy from the CA-MMIS/infrastructure/private reposityory.  The CA-MMIS/infrastructure-private dockerfile will be used in the "real" implementation of this code when it is included in the ca-mmis/infrastructure-private repository after additional enhancements are completed.
