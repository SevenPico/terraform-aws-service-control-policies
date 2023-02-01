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
##  ./main.tf
##  This file contains code modified by SevenPico, Inc.
## ----------------------------------------------------------------------------

locals {
  service_control_policy_statements_map = { for i in var.service_control_policy_statements : i.sid => i }

  statements = flatten([for i in data.aws_iam_policy_document.this : jsondecode(i.json).Statement])
  version    = try(jsondecode(values(data.aws_iam_policy_document.this)[0].json).Version, null)

  service_control_policy_json = jsonencode(
    {
      Version   = local.version
      Statement = local.statements
    }
  )
}

data "aws_iam_policy_document" "this" {
  for_each = local.service_control_policy_statements_map

  statement {
    sid         = each.value.sid
    effect      = each.value.effect
    actions     = try(each.value.actions, null)
    not_actions = try(each.value.not_actions, null)
    resources   = each.value.resources

    dynamic "condition" {
      for_each = try(each.value.condition, null) != null ? each.value.condition : []

      content {
        test     = condition.value.test
        variable = condition.value.variable
        values   = condition.value.values
      }
    }
  }
}

resource "aws_organizations_policy" "this" {
  count       = module.context.enabled && length(var.service_control_policy_statements) > 0 ? 1 : 0
  name        = module.context.id
  description = var.service_control_policy_description
  content     = local.service_control_policy_json
  tags        = module.context.tags
}

resource "aws_organizations_policy_attachment" "this" {
  count     = module.context.enabled && length(var.service_control_policy_statements) > 0 ? 1 : 0
  policy_id = join("", aws_organizations_policy.this.*.id)
  target_id = var.target_id
}
