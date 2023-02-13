module "alert_policy_composer_environment_web_server" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project = var.project_defaults.project_name
  display_name = "Cloud Composer Environment - Web server Unhealthy or Down : P3" 
  enabled = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/display/PEGO/KB+-+Composer"
  auto_close_secs = "21600s"
  condition_threshold_flag = "true"
  conditions = {
      display_name = "Cloud Composer Environment - Web server Unhealthy or Down : P3"  
      condition_threshold = {
      filter     = "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/web_server/health\""
      comparison = "COMPARISON_LT"
      threshold_value = 0.1 
      duration   = "900s" 
       trigger = {
        count = 1
        percent = 0
       }
       aggregations = {
        alignment_period   = "900s"
        per_series_aligner = "ALIGN_COUNT_TRUE"
       }
      }
  }
  notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,       
  ]
}

module "alert_policy_composer_environment_scheduler" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project = var.project_defaults.project_name
  display_name = "Cloud Composer Environment - Low Scheduler Heartbeats : P3"
  enabled = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/display/PEGO/KB+-+Composer"
  auto_close_secs = "21600s"
  condition_threshold_flag = "true"
  conditions = {
      display_name = "Cloud Composer Environment - Low Scheduler Heartbeats : P3"  
      condition_threshold = {
      filter     =  "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/scheduler_heartbeat_count\""
      comparison = "COMPARISON_LT"
      threshold_value = 4
      duration   = "900s" 
       trigger = {
        count = 1
        percent = 0
       }
       aggregations = {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
       }
      }
  }
  notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,       
  ]
}

module "alert_policy_composer_environment_unhealthy" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project = var.project_defaults.project_name
  display_name = "Cloud Composer Environment -Unhealthy or Down:P3"
  enabled = "true"
  combiner = "OR"
  content  = "Resolution Steps : https://oneconfluence.verizon.com/display/PEGO/KB+-+Composer"
  auto_close_secs = "21600s"
  condition_threshold_flag = "true"
  conditions = {
      display_name = "Cloud Composer Environment -Unhealthy or Down:P3"  
      condition_threshold = {
      filter     =  "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/healthy\""
      comparison = "COMPARISON_LT"
      threshold_value = 1
      duration   = "900s" 
       trigger = {
        count = 1
        percent = 0
       }
       aggregations = {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_COUNT_TRUE"
       }
      }
  }
  notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,       
  ]
}

module "alert_policy_composer_environment_database" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project = var.project_defaults.project_name
  display_name = "Cloud Composer Environment - Database Unhealthy or Down : P3"
  enabled = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/display/PEGO/KB+-+Composer"
  auto_close_secs = "21600s"
  condition_threshold_flag = "true"
  conditions = {
      display_name = "Cloud Composer Environment - Database Unhealthy or Down : P3"
      condition_threshold = {
      filter     =   "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/database_health\""
      comparison = "COMPARISON_LT"
      threshold_value = 1
      duration   = "900s" 
       trigger = {
        count = 1
        percent = 0
       }
       aggregations = {
        alignment_period   = "900s"
        per_series_aligner = "ALIGN_COUNT_TRUE"
       }
      }
  }
  notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,       
  ]
}

module "alert_policy_cpu_quota" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project = var.project_defaults.project_name
  display_name = "Quota Alerts - CPUs more than 90% of quota"
  enabled = "true"
  combiner = "OR"
  content  = "Take Actions as described in below RunBook\n\nhttps://oneconfluence.verizon.com/pages/viewpage.action?pageId=878842450"
  auto_close_secs = "86400s"
  mql_flag = "true"
  conditions = {
      display_name = "Quota Alerts - CPUs more than 90% of quota"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch consumer_quota\r\n| filter resource.service == 'compute.googleapis.com'\r\n| { metric serviceruntime.googleapis.com/quota/allocation/usage\r\n    | align next_older(1d)\r\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\r\n        max(val())\r\n  ; metric serviceruntime.googleapis.com/quota/limit\r\n    | filter metric.limit_name == 'CPUS-per-project-region'\r\n    | align next_older(1d)\r\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\r\n        min(val())\r\n  }\r\n| ratio\r\n| every 2h\r\n| condition gt(val(), 0.90 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
  notification_channels  =  [
   "${module.email_channel_raghu.notify_email_channel_name}",
  ]
  depends_on = [
       module.email_channel_raghu,
  ]
}


module "alert_policy_cpu_quota_test" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project = var.project_defaults.project_name
  display_name = "Dataproc Alerts - More than 5 jobs fail in an hour in a cluster by project"
  enabled = "true"
  combiner = "OR"
  content  = "Take Actions as described in below RunBook\n\nhttps://oneconfluence.verizon.com/pages/viewpage.action?pageId=878842450"
  auto_close_secs = "86400s"
  condition_threshold_flag = "true"
  conditions = {
      display_name = "Dataproc Alerts - More than 5 jobs fail in an hour in a cluster by project"
      condition_threshold = {
        filter     = "resource.type = \"cloud_dataproc_cluster\" AND metric.type = \"dataproc.googleapis.com/cluster/job/failed_count\"",
        comparison = "COMPARISON_GT"
        threshold_value = 5 
        duration   = "0s" 
        trigger = {
          count = 1
        }
       aggregations = {
        alignment_period   = "3600s"
        per_series_aligner = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields = ["resource.label.project_id", "resource.label.cluster_name"]

        }
       }
  }
  notification_channels  =  [
   "${module.email_channel_raghu.notify_email_channel_name}",
  ]
  depends_on = [
       module.email_channel_raghu,
  ]
}


#Scheduler Alerts
module "alert_policy_composer_Scheduler_Total_schedulers_CPU_usage" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project  = var.project_defaults.project_name
  display_name = "Cloud Composer Scheduler - Total schedulers CPU usage : P3"
  enabled  = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931945"
  auto_close_secs = "21600s"
  mql_flag = "true"
  conditions = {
      display_name = "Cloud Composer Scheduler - Total schedulers CPU usage over 50% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n| filter pod_name =~ 'airflow-scheduler-.*' \r\n  | { kubernetes.io/container/cpu/limit_utilization\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/cpu/limit_cores\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.50 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
  notification_channels  =  [
    "${module.email_channel_l2_support_team.notify_email_channel_name}",
    "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
    "${module.email_channel_l1_support_team.notify_email_channel_name}",
    "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
        module.email_channel_aid_gcp_platform_eng,
        module.email_channel_l1_support_team,   
        module.email_channel_l2_support_team,   
        module.webhook_Opsgenie-vzaid-prod,  
  ]
}

module "alert_policy_composer_Scheduler_Total_schedulers_memory_usage" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project  = var.project_defaults.project_name
  display_name = "Cloud Composer Scheduler - Total schedulers memory usage over 50% : P3"
  enabled  = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931954"
  auto_close_secs = "21600s"
  mql_flag = "true"
  conditions = {
      display_name = "Cloud Composer Scheduler - Total schedulers memory usage over 50% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n| filter pod_name =~ 'airflow-scheduler-.*' \r\n  | { metric kubernetes.io/container/memory/used_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/memory/limit_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.50 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
  notification_channels  =  [
    "${module.email_channel_l2_support_team.notify_email_channel_name}",
    "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
    "${module.email_channel_l1_support_team.notify_email_channel_name}",
    "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
        module.email_channel_aid_gcp_platform_eng,
        module.email_channel_l1_support_team,   
        module.email_channel_l2_support_team,   
        module.webhook_Opsgenie-vzaid-prod,  
  ]
}

module "alert_policy_composer_Scheduler_Total_schedulers_disk_usage" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project  = var.project_defaults.project_name
  display_name = "Cloud Composer Scheduler - Total schedulers disk usage over 50% : P3"
  enabled  = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931958"
  auto_close_secs = "21600s"
  mql_flag = "true"
  conditions = {
      display_name = "Cloud Composer Scheduler - Total schedulers disk usage over 50% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n| filter pod_name =~ 'airflow-scheduler-.*' \r\n  | { metric kubernetes.io/container/ephemeral_storage/used_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/ephemeral_storage/limit_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.50 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
  notification_channels  =  [
    "${module.email_channel_l2_support_team.notify_email_channel_name}",
    "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
    "${module.email_channel_l1_support_team.notify_email_channel_name}",
    "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
        module.email_channel_aid_gcp_platform_eng,
        module.email_channel_l1_support_team,   
        module.email_channel_l2_support_team,   
        module.webhook_Opsgenie-vzaid-prod,  
  ]
}

module "alert_policy_composer_Scheduler_pod_evictions" {
 source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
 project  = var.project_defaults.project_name
 display_name = "Cloud Composer Scheduler - pod evictions greater than 2 : P3"
 enabled  = "true"
 combiner = "OR"
 content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/display/PEGO/Composer+Alerts+-+Scheduler+-+Scheduler+pod+evictions+greater+than+2+for+15+mins"
 auto_close_secs = "21600s"
 condition_threshold_flag = "true"
 conditions = {
     display_name = "Cloud Composer Scheduler - pod evictions greater than 2 : P3"
     condition_threshold = {
     filter     = "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/scheduler/pod_eviction_count\""
     comparison = "COMPARISON_GT"
     threshold_value = 2
     duration   = "900s" 
      trigger = {
       count = 1
       percent = 0
      }
      aggregations = {
       alignment_period   = "900s"
       per_series_aligner = "ALIGN_DELTA"
      }
     }
    }
 notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
 ]
 depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,  
 ]
}

#Worker Alerts
module "alert_policy_composer_worker_active_workers" {
 source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
 project  = var.project_defaults.project_name
 display_name = "Cloud Composer Worker - Low active workers : P3"
 enabled  = "true"
 combiner = "OR"
 content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/display/PEGO/Composer+Alerts+-+Workers+-+Active+workers+equal+to+0+for+15+mins"
 auto_close_secs = "21600s"
 condition_threshold_flag = "true"
 conditions = {
     display_name = "Cloud Composer Worker - Low active workers : P3"
     condition_threshold = {
     filter     = "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/num_celery_workers\""
     comparison = "COMPARISON_LT"
     threshold_value = 1
     duration   = "900s" 
      trigger = {
       count = 1
       percent = 0
      }
      aggregations = {
       alignment_period   = "900s"
       per_series_aligner = "ALIGN_MIN"
      }
     }
    }
 notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
 ]
 depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,  
 ]
}

module "alert_policy_composer_worker_airflow_tasks" {
 source  = "../../../../platform/terraform/modules/monitoring/alert_policies"
 project = var.project_defaults.project_name
 display_name = "Cloud Composer Worker - Queued airflow task : P3"
 enabled = "true"
 combiner = "OR"
 content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/display/PEGO/Composer+Alerts+-+Workers+-+Airflow+queued+task+greater+than+50+for+15+mins"
 auto_close_secs = "21600s"
 condition_threshold_flag = "true"
 conditions = {
     display_name = "Cloud Composer Worker - Queued airflow task : P3"
     condition_threshold = {
     filter     = "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/task_queue_length\""
     comparison = "COMPARISON_GT"
     threshold_value = 50
     duration   = "900s" 
      trigger = {
       count = 1
       percent = 0
      }
      aggregations = {
       alignment_period   = "900s"
       per_series_aligner = "ALIGN_MAX"
      }
     }
    }
 notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
 ]
 depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,  
 ]
}

module "alert_policy_composer_total_workers_CPU_usage" {
  source = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project = var.project_defaults.project_name
  display_name = "Cloud Composer Worker - Total workers CPU usage : P3"
  enabled = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931968"
  auto_close_secs = "31600s"
  mql_flag = "true"
  conditions = {
      display_name = "Cloud Composer Scheduler - Total schedulers disk usage over 50% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n | filter pod_name =~ 'airflow-worker-.*' \r\n | filter pod_name != 'airflow-worker-set-.*' \r\n  | { metric kubernetes.io/container/ephemeral_storage/used_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/ephemeral_storage/limit_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.50 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
  notification_channels  =  [
    "${module.email_channel_l2_support_team.notify_email_channel_name}",
    "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
    "${module.email_channel_l1_support_team.notify_email_channel_name}",
    "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
        module.email_channel_aid_gcp_platform_eng,
        module.email_channel_l1_support_team,   
        module.email_channel_l2_support_team,   
        module.webhook_Opsgenie-vzaid-prod,  
  ]
}


module "alert_policy_composer_total_workers_disk_usage" {
 source = "../../../../platform/terraform/modules/monitoring/alert_policies"
 project = var.project_defaults.project_name
 display_name = "Cloud Composer Worker - Total workers disk usage over 80% : P3"
 enabled = "true"
 combiner = "OR"
 content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931977"
 auto_close_secs = "21600s"
 mql_flag = "true"
 conditions = {
      display_name = "Cloud Composer Scheduler - Total schedulers disk usage over 80% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n| filter pod_name =~ 'airflow-worker-.*' | filter pod_name != 'airflow-worker-set-.*' \r\n  | { metric kubernetes.io/container/ephemeral_storage/used_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/ephemeral_storage/limit_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.80 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
 notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
 ]
 depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,  
 ]
}

module "alert_policy_composer_total_workers_disk_usage-1" {
 source = "../../../../platform/terraform/modules/monitoring/alert_policies"
 project = var.project_defaults.project_name
 display_name = "Cloud Composer Worker - Total workers disk usage over 90% : P3"
 enabled = "true"
 combiner = "OR"
 content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931979"
 auto_close_secs = "21600s"
 mql_flag = "true"
 conditions = {
      display_name = "Cloud Composer Scheduler - Total schedulers disk usage over 90% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n| filter pod_name =~ 'airflow-worker-.*' | filter pod_name != 'airflow-worker-set-.*' \r\n  | { metric kubernetes.io/container/ephemeral_storage/used_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/ephemeral_storage/limit_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.90 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
 notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
 ]
 depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,  
 ]
}

module "alert_policy_composer_total_workers_memory_usage" {
 source = "../../../../platform/terraform/modules/monitoring/alert_policies"
 project = var.project_defaults.project_name
 display_name = "Cloud Composer Worker - Total workers memory usage over 80% : P3"
 enabled = "true"
 combiner = "OR"
 content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931980"
 auto_close_secs = "21600s"
 mql_flag = "true"
 conditions = {
      display_name = "Cloud Composer Scheduler - Total schedulers memory usage over 80% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n| filter pod_name =~ 'airflow-worker-.*' | filter pod_name != 'airflow-worker-set-.*' \r\n  | { metric kubernetes.io/container/memory/used_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/memory/limit_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.80 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
 notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
 ]
 depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,  
 ]
}



module "alert_policy_composer_total_workers_memory_usage-1" {
 source = "../../../../platform/terraform/modules/monitoring/alert_policies"
 project = var.project_defaults.project_name
 display_name = "Cloud Composer Worker - Total workers memory usage over 90% : P3"
 enabled = "true"
 combiner = "OR"
 content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931981"
 auto_close_secs = "21600s"
 mql_flag = "true"
 conditions = {
      display_name = "Cloud Composer Scheduler - Total schedulers memory usage over 90% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n| filter pod_name =~ 'airflow-worker-.*' | filter pod_name != 'airflow-worker-set-.*' \r\n  | { metric kubernetes.io/container/memory/used_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/memory/limit_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.90 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
 notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
 ]
 depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,  
 ]
}

module "alert_policy_composer_total_workers_container_restarts" {
 source = "../../../../platform/terraform/modules/monitoring/alert_policies"
 project = var.project_defaults.project_name
 display_name = "Cloud Composer Worker - Total workers container restarts : P3"
 enabled = "true"
 combiner = "OR"
 content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/display/PEGO/Composer+Alerts+-+Workers+-+Worker+container+restarts+greater+than+2+in+15+mins"
 auto_close_secs = "21600s"
 condition_threshold_flag = "true"
 conditions = {
     display_name = "Cloud Composer Worker - Total workers container restarts : P3"
     condition_threshold = {
     filter     = "resource.type = \"k8s_container\" AND resource.labels.pod_name = monitoring.regex.full_match(\"airflow-worker-.*|airflow-k8s-worker-.*\") AND metric.type = \"kubernetes.io/container/restart_count\"",
     comparison = "COMPARISON_GT"
     threshold_value = 2
     duration   = "900s" 
      trigger = {
       count = 1
       percent = 0
      }
      aggregations = {
       alignment_period   = "900s" 
       per_series_aligner = "ALIGN_DELTA"
      }
     }
    }
 notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
 ]
 depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,  
 ]
}

#SQL Database Alerts
module "alert_policy_composer_SQL_database_CPU_usage" {
 source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
 project  = var.project_defaults.project_name
 display_name = "Cloud Composer SQL database - database CPU usage : P3"
 enabled  = "true"
 combiner = "OR"
 content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931989"
 auto_close_secs = "21600s"
 condition_threshold_flag = "true"
 conditions = {
      display_name = "Cloud Composer SQL database - database CPU usage over 50% : P3"
      condition_threshold = {
      filter     = "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/database/cpu/utilization\""
      comparison = "COMPARISON_GT"
      threshold_value = 0.5
      duration   = "900s"   
       trigger = {
        count = 1
        percent = 0
       }
       aggregations = {
        alignment_period   = "900s"
        per_series_aligner = "ALIGN_MEAN"
       }
      }
     }
 notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
 ]
 depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,  
 ]
}

module "alert_policy_composer_SQL_database_memory_usage" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project  = var.project_defaults.project_name
  display_name = "Cloud Composer SQL database - database memory usage over 50% : P3"
  enabled  = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931990"
  auto_close_secs = "21600s"
  condition_threshold_flag = "true"
  conditions = {
      display_name = "Cloud Composer SQL database - database memory usage over 50% : P3"
      condition_threshold = {
      filter     = "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/database/memory/utilization\""
      comparison = "COMPARISON_GT"
      threshold_value = 0.5
      duration   = "900s"   
       trigger = {
        count = 1
        percent = 0
       }
       aggregations = {
        alignment_period   = "900s"
        per_series_aligner = "ALIGN_MEAN"
       }
      }
     }
  notification_channels  =  [
    "${module.email_channel_l2_support_team.notify_email_channel_name}",
    "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
    "${module.email_channel_l1_support_team.notify_email_channel_name}",
    "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
        module.email_channel_aid_gcp_platform_eng,
        module.email_channel_l1_support_team,   
        module.email_channel_l2_support_team,   
        module.webhook_Opsgenie-vzaid-prod,  
  ]
}

module "alert_policy_composer_SQL_database_connections" {
 source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
 project  = var.project_defaults.project_name
 display_name = "Cloud Composer SQL database - database connections : P2"
 enabled  = "true"
 combiner = "OR"
 content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/display/PEGO/Composer+Alerts+-+SQL+Database+-+Database+connections+greater+than+1000"
 auto_close_secs = "21600s"
 condition_threshold_flag = "true"
 conditions = {
     display_name = "Cloud Composer SQL database - database connections : P2"
     condition_threshold = {
     filter     = "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/database/network/connections\""
     comparison = "COMPARISON_GT"
     threshold_value = 1000
     duration   = "900s" 
      trigger = {
       count = 1
       percent = 0
      }
      aggregations = {
       alignment_period   = "900s"
       per_series_aligner = "ALIGN_MAX"
      }
     }
    }
 notification_channels  =  [
   "${module.email_channel_l2_support_team.notify_email_channel_name}",
   "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
   "${module.email_channel_l1_support_team.notify_email_channel_name}",
   "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
 ]
 depends_on = [
       module.email_channel_aid_gcp_platform_eng,
       module.email_channel_l1_support_team,   
       module.email_channel_l2_support_team,   
       module.webhook_Opsgenie-vzaid-prod,  
 ]
}

module "alert_policy_composer_Airflow_metadata_database_size" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project  = var.project_defaults.project_name
  display_name = "Cloud Composer SQL database - Airflow metadata database size : P3"
  enabled  = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931993"
  auto_close_secs = "21600s"
  condition_threshold_flag = "true"
  conditions = {
      display_name = "Cloud Composer SQL database - Airflow metadata database size : P3"
      condition_threshold = {
      filter     = "resource.type = \"cloud_composer_environment\" AND metric.type = \"composer.googleapis.com/environment/database/airflow/size\""
      comparison = "COMPARISON_GT"
      threshold_value = 10737418240
      duration   = "900s"   
       trigger = {
        count = 1
        percent = 0
       }
       aggregations = {
        alignment_period   = "900s"
        per_series_aligner = "ALIGN_MAX"
       }
      }
     }
  notification_channels  =  [
    "${module.email_channel_l2_support_team.notify_email_channel_name}",
    "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
    "${module.email_channel_l1_support_team.notify_email_channel_name}",
    "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
        module.email_channel_aid_gcp_platform_eng,
        module.email_channel_l1_support_team,   
        module.email_channel_l2_support_team,   
        module.webhook_Opsgenie-vzaid-prod,  
  ]
}

#Web Servers Alerts
module "alert_policy_composer_web_servers_CPU_usage" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project  = var.project_defaults.project_name
  display_name = "Cloud Composer web servers - servers CPU usage : P3"
  enabled  = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931998"
  auto_close_secs = "21600s"
  mql_flag = "true"
  conditions = {
      display_name = "Cloud Composer web servers - servers CPU usage over 50% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n| filter pod_name =~ 'airflow-webserver-.*' \r\n  | { kubernetes.io/container/cpu/limit_utilization\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/cpu/limit_cores\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.50 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
  notification_channels  =  [
    "${module.email_channel_l2_support_team.notify_email_channel_name}",
    "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
    "${module.email_channel_l1_support_team.notify_email_channel_name}",
    "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
        module.email_channel_aid_gcp_platform_eng,
        module.email_channel_l1_support_team,   
        module.email_channel_l2_support_team,   
        module.webhook_Opsgenie-vzaid-prod,  
  ]
}

module "alert_policy_composer_web_servers_memory_usage" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project  = var.project_defaults.project_name
  display_name = "Cloud Composer web servers - servers memory usage : P3"
  enabled  = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058931999"
  auto_close_secs = "21600s"
  mql_flag = "true"
  conditions = {
      display_name = "Cloud Composer Scheduler - Total schedulers memory usage over 50% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n| filter pod_name =~ 'airflow-webserver-.*' \r\n  | { metric kubernetes.io/container/memory/used_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/memory/limit_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.50 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
  notification_channels  =  [
    "${module.email_channel_l2_support_team.notify_email_channel_name}",
    "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
    "${module.email_channel_l1_support_team.notify_email_channel_name}",
    "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
        module.email_channel_aid_gcp_platform_eng,
        module.email_channel_l1_support_team,   
        module.email_channel_l2_support_team,   
        module.webhook_Opsgenie-vzaid-prod,  
  ]
}

module "alert_policy_composer_web_servers_disk_usage" {
  source   = "../../../../platform/terraform/modules/monitoring/alert_policies"
  project  = var.project_defaults.project_name
  display_name = "Cloud Composer web servers - servers disk usage : P3"
  enabled  = "true"
  combiner = "OR"
  content  = "Take Actions as described in the RunBook https://oneconfluence.verizon.com/pages/viewpage.action?pageId=1058932000"
  auto_close_secs = "21600s"
  mql_flag = "true"
  conditions = {
      display_name = "Cloud Composer Scheduler - Total schedulers disk usage over 50% : P3"
      condition_threshold = {

      }  
        condition_monitoring_query_language = {
        query    = "fetch k8s_container\r\n| filter pod_name =~ 'airflow-webserver-.*' \r\n  | { metric kubernetes.io/container/ephemeral_storage/used_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n          max(val())\r\n    ; metric kubernetes.io/container/ephemeral_storage/limit_bytes\r\n      | align mean_aligner(15m)\r\n       | group_by [resource.project_id, resource.location],\r\n         max(val())\r\n  }\r\n| ratio\r\n| every 15m\r\n| condition gt(val(), 0.50 '1')"
        duration = "0s"
        trigger = {
          count = 1
        }
      }
  }
  notification_channels  =  [
    "${module.email_channel_l2_support_team.notify_email_channel_name}",
    "${module.email_channel_aid_gcp_platform_eng.notify_email_channel_name}",
    "${module.email_channel_l1_support_team.notify_email_channel_name}",
    "${module.webhook_Opsgenie-vzaid-prod.notification_channel_webhook_name}", 
  ]
  depends_on = [
        module.email_channel_aid_gcp_platform_eng,
        module.email_channel_l1_support_team,   
        module.email_channel_l2_support_team,   
        module.webhook_Opsgenie-vzaid-prod,  
  ]
}
