#GCE platform cicd
module "aidplt-cicd-05" {
  source            = "../../../../platform/terraform/modules/gce/compute_instance_ansible"
  project_name      = var.project_defaults.project_name
  region            = var.project_defaults.region
  zone              = var.project_defaults.zone
  email             = var.project_defaults.sa_comp
  kms_key_name      = var.project_defaults.kms_key_name
  subnetwork        = var.project_defaults.subnetwork_1
  gce_instance_name = "vz-it-np-jabv-aidplt-cicd-05"
  machine_type      = "n2d-standard-16"
  image             = "projects/vz-it-pr-czwv-vzimage-0/global/images/vz-rhel8-xb-2022-10-1-gold"
  boot_disk_size_gb = 100
                                                                           
  labels = {
    environment = "${var.vsad_defaults.project_environment}"
    vsad        = "${var.vsad_defaults.vsad}"
    bu          = "${var.vsad_defaults.bu}"
    owner       = "krishna-chunduri_verizon-com"
    userid      = "chundkr"
    role        = "app"
  }
  http_proxy         = var.project_defaults.http_proxy
  email_smtp_host    = var.project_defaults.email_smtp_host
  email_from_address = var.project_defaults.email_from_address
  #startup_script_url = "gs://wdwg-dev-aidcom-0-usmr-initializationaction/initialization-actions/gce/mout-script.sh"
deletion_protection_flag = "false"

ansible_flag = "enable"
ansible_user     = "svc-jabv-np-cicd-app"
ansible_ssh_pass = var.svc-jabv-np-cicd-app-secret
ansible_pbk_path = "../ansible/main.yaml"

##snapshot disk details
snapshot_config_flag = "enable"
snapshot_disk_name    = "vz-it-dev-jabv-aidplt-cicd-datadisk-04-01042023"
source_disk_id   = "vz-it-dev-jabv-aidplt-cicd-datadisk-04"
storage_locations = var.project_defaults.region

#Additional disk
additional_disk_name = "vz-it-dev-jabv-aidplt-cicd-datadisk-05"
additional_disk_type =  "pd-ssd"
additional_disk_size_gb = 500

}


# GCE instance
module "aidplt-chatbot-jabv" {
  source            = "../../../../platform/terraform/modules/gce/compute_instance"
  project_name      = var.project_defaults.project_name
  region            = var.project_defaults.region
  zone              = var.project_defaults.zone
  email             = var.project_defaults.sa_comp
  kms_key_name      = var.project_defaults.kms_key_name
  subnetwork        = var.project_defaults.subnetwork_1
  gce_instance_name = "vz-it-np-jabv-aidplt-chatbot"
  machine_type      = "n2-standard-16"
  image             = "projects/vz-it-pr-czwv-vzimage-0/global/images/vz-rhel8-xb-2022-11-1-gold"
  boot_disk_size_gb = 100

  labels = {
    environment = "${var.vsad_defaults.project_environment}"
    vsad        = "${var.vsad_defaults.vsad}"
    bu          = "${var.vsad_defaults.bu}"
    owner       = "paramesh-potha_verizon-com"
    userid      = "pothapa"
    role        = "app"
  }
  http_proxy         = var.project_defaults.http_proxy
  email_smtp_host    = var.project_defaults.email_smtp_host
  email_from_address = var.project_defaults.email_from_address
  startup_script_url = "gs://wdwg-dev-aidcom-0-usmr-initializationaction/initialization-actions/gce/mout-script.sh"
}


module "vz-it-np-jabv-aidplt-chatbot-datadisk-add" {
source = "../../../../platform/terraform/modules/gce/compute_disk"
project_name = var.project_defaults.project_name
zone = var.project_defaults.zone
kms_key_name = var.project_defaults.kms_key_name
disk_name = "vz-it-np-jabv-aidplt-chatbot-datadisk"
disk_type =  "pd-ssd"
labels = {
    environment = "${var.vsad_defaults.project_environment}"
    vsad = "${var.vsad_defaults.vsad}"
    bu = "${var.vsad_defaults.bu}"
    role = "app"
}
disk_size_gb = 200
}

module "vz-it-np-jabv-aidplt-chatbot-datadisk-attach" {
source = "../../../../platform/terraform/modules/gce/compute_attached_disk"
project_name = var.project_defaults.project_name
zone = var.project_defaults.zone
gce_instance_name = "vz-it-np-jabv-aidplt-chatbot"
disk_name = "vz-it-np-jabv-aidplt-chatbot-datadisk"
depends_on = [module.vz-it-np-jabv-aidplt-chatbot-datadisk-add] 
}

#GCE platform cicd
module "aidplt_cicd_test" {
  source            = "../../../../platform/terraform/modules/gce/compute_instance_ansible"
  project_name      = var.project_defaults.project_name
  region            = var.project_defaults.region
  zone              = var.project_defaults.zone
  email             = var.project_defaults.sa_comp
  kms_key_name      = var.project_defaults.kms_key_name
  subnetwork        = var.project_defaults.subnetwork_1
  gce_instance_name = "vz-it-np-jabv-aidplt-cicd-test"
  machine_type      = "n2d-standard-16"
  image             = "projects/vz-it-pr-czwv-vzimage-0/global/images/vz-rhel8-xb-2022-10-1-gold"
  boot_disk_size_gb = 100
                                                                           
  labels = {
    environment = "${var.vsad_defaults.project_environment}"
    vsad        = "${var.vsad_defaults.vsad}"
    bu          = "${var.vsad_defaults.bu}"
    owner       = "krishna-chunduri_verizon-com"
    userid      = "chundkr"
    role        = "app"
  }
  http_proxy         = var.project_defaults.http_proxy
  email_smtp_host    = var.project_defaults.email_smtp_host
  email_from_address = var.project_defaults.email_from_address
  #startup_script_url = "gs://wdwg-dev-aidcom-0-usmr-initializationaction/initialization-actions/gce/mout-script.sh"
deletion_protection_flag = "false"

ansible_flag = "disable"
ansible_user     = "svc-jabv-np-cicd-app"
ansible_ssh_pass = var.svc-jabv-np-cicd-app-secret
ansible_pbk_path = "../ansible/main.yaml"

##snapshot disk details
snapshot_config_flag = "enable"
snapshot_disk_name    = "vz-it-dev-jabv-aidplt-cicd-datadisk-test-01302023"
source_disk_id   = "vz-it-dev-jabv-aidplt-cicd-datadisk-05"
storage_locations = var.project_defaults.region
#Additional disk
additional_disk_name = "vz-it-dev-jabv-aidplt-cicd-datadisk-test"
additional_disk_type =  "pd-ssd"
additional_disk_size_gb = 500

}
