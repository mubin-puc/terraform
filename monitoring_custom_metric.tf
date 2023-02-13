#module "custom_metric" {
#  source= "../../../../platform/terraform/modules/monitoring/custom_metric/counter"
#  project = var.project_defaults.project_name
#  custommetric_name   = "dataops/failedjobs"
#  custommetric_filter    =  "jsonPayload.logger=org.apache.beam.sdk.io.gcp.bigquery.BigQueryServicesImpl and jsonPayload.message=\"Retrying 1 failed inserts to BigQuery\" and jsonPayload.stage=S0"
#  custommetric_description = "data failed jobs"
#  custommetric_metric_descriptor = {
#    metric_kind = "DELTA"
#    value_type        = "INT64"
#    display_name     = "failedjobs"
#  }
#}
#
#
#
