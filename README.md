# terraform-homework

This repository contains the solution for **Terraform Homework-1**.

## Tasks Completed

- Created users: `jenny`, `rose`, `lisa`, `jisoo`
- Created users: `jihyo`, `sana`, `momo`, `dahyun`
- Created IAM groups: `blackpink`, `twice`
- Assigned users to respective groups
- Created two IAM users manually in AWS Console: `miyeon`, `mina`
- Imported `miyeon` and `mina` into Terraform state
- Added `miyeon` to `blackpink` group and `mina` to `twice` group using Terraform
- Destroyed all Terraform-managed resources after testing

## Terraform Commands Used

```bash
terraform init      # Initialize the project
terraform plan      # Review changes
terraform apply     # Create users and groups
terraform import    # Import existing users (miyeon, mina)
terraform destroy   # Destroy all resources
