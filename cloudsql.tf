##CloudSql
#module "cloudSql-1" {
#source = "../../../../platform/terraform/modules/cloudsql/mysql"
#project_id                      = var.project_defaults.project_name
#random_instance_name            = var.random_instance_name
#database_version                = "MySQL 8.0"
#encryption_key_name             = var.project_defaults.kms_key_name  
#region                          = var.project_defaults.region
#tier                            = "db-custom-1-3840"
#activation_policy               = "ALWAYS"
#availability_type               = "REGIONAL"    
#name                            = "cloud-sql_test"
#ip_configuration                = var.ip_configuration     
#additional_databases            = var.additional_databases    
#additional_users                = var.additional_users      
#backup_configuration            = var.backup_configuration    
#disk_autoresize                 = var.disk_autoresize      
#disk_size                       = var.disk_size  
#disk_type                       = var.disk_type  
#user_labels                     = var.vsad_defaults   
#database_flags                  = var.database_flags        
#maintenance_window_day          = var.maintenance_window_day   
#maintenance_window_hour         = var.maintenance_window_hour   
#maintenance_window_update_track = var.maintenance_window_update_track
#create_timeout                  = var.create_timeout   
#update_timeout                  = var.update_timeout   
#delete_timeout                  = var.delete_timeout
#enable_default_db               = var.enable_default_db
#db_name                         = "sample_database"      
#db_charset                      = var.db_charset    
#db_collation                    = var.db_collation    
#enable_default_user             = var.enable_default_user   
#user_name                       = "sample"   
#user_host                       = var.user_host   
#user_password                   = var.user_password  
#}
#

#CloudSql
module "slackbot-db-instance" {
source = "../../../../platform/terraform/modules/cloudsql/mysql"
project_id                      = var.project_defaults.project_name
random_instance_name            = false
database_version                = "MYSQL_8_0_26"
deletion_protection             = true
encryption_key_name             = var.project_defaults.kms_key_name  
region                          = var.project_defaults.region
tier                            = "db-custom-2-8192"
activation_policy               = "ALWAYS"
availability_type               = "ZONAL"    
name                            = "slackbot-db-instance"

ip_configuration                = {
    authorized_networks = []
    ipv4_enabled        = false
    private_network     = "projects/vz-it-np-exhv-sharedvpc-228116/global/networks/shared-np-east"
    require_ssl         = false
  }
  
backup_configuration            = {
    binary_log_enabled             = true
    enabled                        = true
    start_time                     = "09:00"
    point_in_time_recovery_enabled = true
    location                       = "us-east4"
    transaction_log_retention_days = 7
    retained_backups               = 7
    retention_unit                 = "COUNT"
  }    
disk_autoresize                 = true      
disk_size                       = 100  
disk_type                       = "PD_SSD"
user_labels                     = var.vsad_defaults   
database_flags                  = []        
maintenance_window_day          = 1   
maintenance_window_hour         = 23   
maintenance_window_update_track = "stable"
#create_timeout                  = "30m"   
#update_timeout                  = "30m"   
#delete_timeout                  = "30m"
enable_default_db               = false
#db_name                         = "sample_database"      
#db_charset                      = ""    
#db_collation                    = ""
additional_databases            = []    
#additional_users                = []     
enable_default_user             = false   
#user_name                       = "sample"   
#user_host                       = "%"  
#user_password                   = ""  
}
