#BQ Dataset variables
locals {
gcp_bq_datasets_declarations = {
platform_tgt = {
dataset_id = "platform_tgt"
description = "Platform team target tables dataset"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  "roles/bigquery.dataViewer" = [
  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
    ]
   }
  }
platform_stg = {
dataset_id = "platform_stg"
description = "Platform team stage tables dataset"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  "roles/bigquery.dataViewer" = [
  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
    ]
   }
  }
platform_v = {
dataset_id = "platform_v"
description = "Platform team views dataset"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
#  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }
 

ActivityLogData = {
dataset_id = "ActivityLogData"
description = "ActivityLogData"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }
 

cdlaccesstest = {
dataset_id = "cdlaccesstest"
description = "cdlaccesstest"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }

finops = {
dataset_id = "finops"
description = "finops"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }

finopsProd = {
dataset_id = "finopsProd"
description = "finopsProd"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }

#gcp_support_metrics = {
#dataset_id = "gcp_support_metrics"
#description = "gcp_support_metrics"
#kms_key_name = var.project_defaults.kms_usmr_key_name
#location = "US"
#iam_role_bindings = {
#  #  "roles/bigquery.dataViewer" = [
##  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
# #   ]
#   }
#  }
  
metric_export = {
dataset_id = "metric_export"
description = "metric_export"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }

monitoring = {
dataset_id = "monitoring"
description = "monitoring"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }

monitoring_matrics = {
dataset_id = "monitoring_matrics"
description = "monitoring_matrics"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }

pubsub_test_data = {
dataset_id = "pubsub_test_data"
description = "pubsub_test_data"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }

QG_TD_TO_BQ_POC = {
dataset_id = "QG_TD_TO_BQ_POC"
description = "QG_TD_TO_BQ_POC"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }

SANDBOX_PLATFORM = {
dataset_id = "SANDBOX_PLATFORM"
description = "SANDBOX_PLATFORM"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }

starbust_poc = {
dataset_id = "starbust_poc"
description = "starbust_poc"
kms_key_name = var.project_defaults.kms_usmr_key_name
location = "US"
iam_role_bindings = {
  #  "roles/bigquery.dataViewer" = [
#  "serviceAccount:sa-dev-wdwg-app-aidcom-0@vz-it-np-wdwg-dev-aidcom-0.iam.gserviceaccount.com",
 #   ]
   }
  }

 }
 

 



gcp_bq_datasets_iam = {
bq_dataset_iams = flatten([
 for bq_dataset_nm in local.gcp_bq_datasets_declarations : [
   for role, accounts in bq_dataset_nm.iam_role_bindings : {
          dataset_id = bq_dataset_nm.dataset_id
          iam_role = role
          iam_members = accounts
   }
 ]
])
}

}

module "bq_dataset" {
source = "../../../../platform/terraform/modules/bigquery"
project_defaults = var.project_defaults
gcp_bq_datasets_config = local.gcp_bq_datasets_declarations
gcp_bq_datasets_iam_config = local.gcp_bq_datasets_iam
}

