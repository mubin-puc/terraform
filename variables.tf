#Project variables
variable "project_defaults" {
  type = map(string)
  default = {
      "project_name" = "vz-it-np-jabv-dev-aidplt-0"
      "region" = "us-east4"
      "multiregion" = "US"
      "sa_app" = "sa-dev-jabv-app-aidplt-0@vz-it-np-jabv-dev-aidplt-0.iam.gserviceaccount.com"
      "kms_key_name" = "projects/vz-it-np-d0sv-vsadkms-0/locations/us-east4/keyRings/vz-it-np-kr-aid/cryptoKeys/vz-it-np-kms-jabv"
      "kms_usmr_key_name" = "projects/vz-it-np-d0sv-vsadkms-0/locations/us/keyRings/vz-it-np-kr-aid/cryptoKeys/vz-it-np-kms-jabv"
      "subnetwork" = "projects/vz-it-np-exhv-sharedvpc-228116/regions/us-east4/subnetworks/shared-np-east-green-subnet-2"     
      "subnetwork_1" = "projects/vz-it-np-exhv-sharedvpc-228116/regions/us-east4/subnetworks/shared-np-east-green-subnet-1"
      "dataproc_metastore_service" = "projects/vz-it-np-wdwg-dev-aidcom-0/locations/us-east4/services/vz-dev-wdwg-aidcom-dpms"
      "http_proxy"="http://proxy.ebiz.verizon.com:9290" 
      "email_smtp_host"="vzsmtp.verizon.com"
      "email_from_address"="donotreply@verizon.com"
      "init-action-bucket"="jabv-np-dev-usre-tf-state"
      "zone" = "us-east4-c"
      "sa_comp" = "sa-dev-jabv-compute-aidplt-0@vz-it-np-jabv-dev-aidplt-0.iam.gserviceaccount.com"
      "hive_metastore_uris" = "thrift://localhost:9083"
      "hive_metastore_warehouse_dir" = "gs://vz-it-np-jabv-dev-aidplt-0-warehouse/db"
      "bucket_logs" = "gs://jabv-dev-aidplt-0-usre-logs"
  }
}

#vsad variables
variable "vsad_defaults" {
  type = map(string)
  default = {
      "project_environment" = "np"
      "environment" = "dev"
      "vsad" = "jabv"
      "bu" = "aid"
  }
}

variable "svc-jabv-np-cicd-app-secret" { 
 type = string
 default = ""
}


