## ----------------------------------------------------------------------------
##  Copyright 2023 SevenPico, Inc.
##  Copyright 2020-2022 Cloud Posse, LLC
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.
## ----------------------------------------------------------------------------

## ----------------------------------------------------------------------------
##  ./examples/complete/fixtures.us-east-2.tfvars
##  This file contains code modified by SevenPico, Inc.
## ----------------------------------------------------------------------------

enabled = true

region = "us-east-2"

namespace = "eg"

stage = "test"

name = "scp"

service_control_policy_description = "Test Service Control Policy"

list_config_paths = [
  "../../catalog/account-policies.yaml",
  "../../catalog/cloudtrail-policies.yaml",
  "../../catalog/cloudwatch-logs-policies.yaml",
  "../../catalog/config-policies.yaml",
  "../../catalog/deny-all-policies.yaml",
  "../../catalog/ec2-policies.yaml",
  "../../catalog/guardduty-policies.yaml",
  "../../catalog/iam-policies.yaml",
  "../../catalog/kms-policies.yaml",
  "../../catalog/lambda-policies.yaml",
  "../../catalog/organization-policies.yaml",
  "../../catalog/rds-policies.yaml",
  "../../catalog/route53-policies.yaml",
  "../../catalog/s3-policies.yaml",
  "../../catalog/sagemaker-policies.yaml",
  "../../catalog/shield-policies.yaml",
  "../../catalog/vpc-policies.yaml",
  "../../catalog/ec2-templates/DenyEC2AMINotCreatedBy.yaml",
  "../../catalog/ec2-templates/DenyEC2AMIWIthNoResourceTag.yaml",
  "../../catalog/region-restriction-templates/DenyRegions.yaml",
  "../../catalog/region-restriction-templates/RestrictToSpecifiedRegions.yaml",
  "../../catalog/s3-templates/DenyS3InNonSelectedRegion.yaml",

]

parameters = {
  ami_creator_account = "account_creator"
  ami_tag_key         = "ami_tag_key"
  ami_tag_value       = "ami_tag_value"
  allowed_regions     = "eu-central-1, eu-west-1"
  denied_regions      = "sa-east-1"
  s3_regions_lockdown = "eu-central-1, eu-west-1"
}
