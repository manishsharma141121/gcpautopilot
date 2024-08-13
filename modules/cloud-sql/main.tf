resource "google_sql_database_instance" "mysql_instance" {
    name    =""
    database_version = "mysql_8_0"
    region = ""
    project = ""

    settings {
      tier = "db-f1-micro"
    }
  
}