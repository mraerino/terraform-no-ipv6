# Test Case for IPv6 on Terraform Cloud

## Locally

```
% terraform plan

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:

Terraform will perform the following actions:

Plan: 0 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + result = <<-EOT
        Hello World!
    EOT
```

## On Terraform Cloud

Add this in the `main.tf`

```hcl
terraform {
  backend "remote" {
    organization = "your-org"

    workspaces {
      name = "your-workspace"
    }
  }
}
```

```
% terraform init
...

% terraform plan
Running plan in the remote backend. Output will stream here. Pressing Ctrl-C
will stop streaming the logs, but will not stop the plan running remotely.

Preparing the remote plan...

To view this run in a browser, visit:
https://app.terraform.io/app/ffddorf/terraform-v6-test/runs/run-ztV4Wm1AmiiYvvbU

Waiting for the plan to start...

Terraform v0.14.9
Configuring remote state backend...
Initializing Terraform configuration...

Error: Error making request: Get "http://v6-only.marcusweiner.de/": dial tcp [2a03:b0c0:3:d0::d25:d001]:80: connect: network is unreachable

  on main.tf line 11, in data "http" "example":
  11: data "http" "example" {
```