module "jabv-dev-aidplt-0-usre-logs" {
  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
  bucket_name                 = "jabv-dev-aidplt-0-usre-logs"
  project_name                = var.project_defaults.project_name
  bucket_location             = var.project_defaults.region
  bucket_storage_class        = "STANDARD"
  kms_key_name                = var.project_defaults.kms_key_name
  uniform_bucket_level_access = "true"
  enable_logging              = "true"
  #force_destroy_flag = "true"

  lifecycle_rules = [
    {
      action = {
        type = "Delete"
      }
      condition = {
        age                        = 15
        days_since_custom_time     = 0
        days_since_noncurrent_time = 0
        matches_storage_class      = []
        num_newer_versions         = 0
        with_state                 = "ANY"
      }
  }]
}

#module "aid_pltfm_src" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "aid_pltfm_src"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.multiregion
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_usmr_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}

#module "aid_pltfm_tgt" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "aid_pltfm_tgt"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.region
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}


#module "ds_test_feed_bucket" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "ds_test_feed_bucket"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.multiregion
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_usmr_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}

#module "jabv_dp_backup" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "jabv_dp_backup"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.multiregion
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_usmr_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}

#module "jabv-dev-adidplt-0-usmr-clouderapoc" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "jabv-dev-adidplt-0-usmr-clouderapoc"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.multiregion
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_usmr_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}

#module "jabv-dev-aidplt-0-usmr-terraform" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "jabv-dev-aidplt-0-usmr-terraform"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.region
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}
#
#module "jabv-dev-aidplt-0-usmr-warehouse" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "jabv-dev-aidplt-0-usmr-terraform"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.multiregion
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_usmr_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}

#module "jabv-dev-aidplt-0-usre-composer" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "jabv-dev-aidplt-0-usre-composer"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.region
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}

#module "pubsub_bq_test_bucket_333" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "pubsub_bq_test_bucket_333"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.multiregion
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_usmr_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}

#module "jabv-test-aidplt-0-usmr-terraform" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "jabv-test-aidplt-0-usmr-terraform"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.region
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}

#module "jabv-test-aidplt-0-usmr-warehouse" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "jabv-test-aidplt-0-usmr-warehouse"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.region
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}

#module "jabv-test-aidplt-0-usre-logs" {
#  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
#  bucket_name                 = "jabv-test-aidplt-0-usre-logs"
#  project_name                = var.project_defaults.project_name
#  bucket_location             = var.project_defaults.region
#  bucket_storage_class        = "STANDARD"
#  kms_key_name                = var.project_defaults.kms_key_name
#  uniform_bucket_level_access = "true"
#  enable_logging              = "true"
#  #force_destroy_flag = "true"
#}



module "jabv-dev-aidplt-0-usre-chatbot" {
  source                      = "../../../../platform/terraform/modules/gcs/storage_bucket"
  bucket_name                 = "jabv-dev-aidplt-0-usre-chatbot"
  project_name                = var.project_defaults.project_name
  bucket_location             = var.project_defaults.region
  bucket_storage_class        = "STANDARD"
  kms_key_name                = var.project_defaults.kms_key_name
  uniform_bucket_level_access = "true"
  enable_logging              = "true"
  #force_destroy_flag = "true"
}
