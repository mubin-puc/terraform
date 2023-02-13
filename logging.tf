module "logsink-pltf-monitoring-dataproc-events" {
source = "../../../../platform/terraform/modules/logging/project_sink"
log_name = "logsink-pltf-monitoring-dataproc-events"
description = "platform team to collect dataproc events"
project_name = var.project_defaults.project_name
log_destination = "pubsub.googleapis.com/projects/vz-it-np-wdwg-dev-aidcom-0/topics/wdwg-pubsub-pltf-monitoring-dataprocEventTopic"
log_filter = <<-EOT
protoPayload.methodName="google.cloud.dataproc.v1.ClusterController.CreateCluster" OR "google.cloud.dataproc.v1.ClusterController.UpdateCluster" OR "google.cloud.dataproc.v1.ClusterController.DeleteCluster"
severity=NOTICE
operation.last="true"
EOT
log_unique_writer_identity = true
}
