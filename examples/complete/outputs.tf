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
##  ./examples/complete/outputs.tf
##  This file contains code modified by SevenPico, Inc.
## ----------------------------------------------------------------------------

output "organizations_policy_id" {
  value       = module.service_control_policies.organizations_policy_id
  description = "The unique identifier of the policy"
}

output "organizations_policy_arn" {
  value       = module.service_control_policies.organizations_policy_arn
  description = "Amazon Resource Name (ARN) of the policy"
}
