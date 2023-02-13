module "email_channel_aid_gcp_platform_eng" {
  source  = "../../../../platform/terraform/modules/monitoring/notification_channels/email_channel"
  project = var.project_defaults.project_name
  display_name= "aid.gcp.platform.eng@verizon.com"
  email_address= "aid.gcp.platform.eng@verizon.com"
  enabled = true
}

module "email_channel_l1_support_team" {
  source  = "../../../../platform/terraform/modules/monitoring/notification_channels/email_channel"
  project = var.project_defaults.project_name
  display_name= "L1 Support team"
  email_address= "aid.gcp.platform.l1support@verizon.com"
  enabled = true
}

module "email_channel_l2_support_team" {
  source  = "../../../../platform/terraform/modules/monitoring/notification_channels/email_channel"
  project = var.project_defaults.project_name
  display_name= "L2 Support team"
  email_address= "gcp-l2-support@verizon.com"
  enabled = true
}

module "webhook_Opsgenie-vzaid-prod" {
  source= "../../../../platform/terraform/modules/monitoring/notification_channels/webhook"
  project = var.project_defaults.project_name
  display_name= "Opsgenie-vzaid-prod"
  description = "Opsgenie vzaid prod"
  url_link    =  "https://api.opsgenie.com/v1/json/googlestackdriver?apiKey=dc8301f9-415f-4677-bc44-b7bf5b9a726c"
  enabled = true
}
module "email_channel_raghu" {
  source  = "../../../../platform/terraform/modules/monitoring/notification_channels/email_channel"
  project = var.project_defaults.project_name
  display_name= "raghavendra.kamarthi.eranna@verizon.com"
  email_address= "raghavendra.kamarthi.eranna@verizon.com"
  enabled = true
}
