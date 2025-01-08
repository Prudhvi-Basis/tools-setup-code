terraform {
  backend "s3" {
    bucket = "terraform11"
    key    = "vault-secrets/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "vault" {
  address = "http://vault-internal.devops11.online:8200"
  token = var.vault_token
  skip_tls_verify = true
}
variable "vault_token" {}

 resource "vault_mount" "roboshop-dev" {
   path = "roboshop-dev"
   type = "kv"
   options = { version = "2" }
   description = "Roboshop Dev Secrets"
}


resource "vault_generic_secret" "roboshop-dev" {

  path                 =  "${vault_mount.roboshop-dev.path}/frontend"


  data_json = <<EOT
{
  "catalogue_url": "http://catalogue-dev.devops11.online:8080",
  "cart_url": "http://cart-dev.devops11.online:8080",
  "user_url": "http://user-dev.devops11.online:8080",
  "shipping_url": "http://shipping-dev.devops11.online:8080",
  "payment_url": "http://payment-dev.devops11.online:8080"

}
EOT
}

resource "vault_generic_secret" "catalogue-dev" {

  path                 =  "${vault_mount.roboshop-dev.path}/catalogue"


  data_json = <<EOT
  {
   "MONGO" : "true"
   "MONGO_URL" : "mongodb://mongodb-dev.devops11.online:27017/catalogue"
   "CATALOGUE_PORT" : "8080"


}
EOT
}
resource "vault_generic_secret" "user-dev" {

path                 =  "${vault_mount.roboshop-dev.path}/user"


data_json = <<EOT
  {
   "MONGO" : "true"
   "MONGO_URL" : "mongodb://mongodb-dev.devops11.online:27017/user",
   "REDIS_URL" : "redis://redis-dev.devops11.online:6379"


}
EOT
}


resource "vault_generic_secret" "cart-dev" {

  path                 =  "${vault_mount.roboshop-dev.path}/cart"


  data_json = <<EOT
  {

   "REDIS_HOST" : "redis-dev.devops11.online",
   "CATALOGUE_HOST" : "catalogue-dev.devops11.online"


}
EOT
}

resource "vault_generic_secret" "shipping-dev" {

  path                 =  "${vault_mount.roboshop-dev.path}/shipping"


  data_json = <<EOT
  {
   "mysql_root_password" : "Roboshop@1"
   "CART_ENDPOINT" : "cart-dev.devops11.online:8080",
   "DB_HOST" : "mysql-dev.devops11.online",



}
EOT
}

resource "vault_generic_secret" "payment-dev" {

  path                 =  "${vault_mount.roboshop-dev.path}/payment"


  data_json = <<EOT
  {
   "CART_HOST" : "cart-dev.devops11.online"
   "USER_HOST" : "user-dev.devops11.online",
   "AMQP_HOST" : "rabbitmq-dev.devops11.online",
   "CART_PORT" : "8080",
   "USER_PORT" : "8080",
   "AMQP_USER" : "roboshop"
   "AMQP_PASS" : "roboshop123"



}
EOT
}
resource "vault_generic_secret" "mysql-dev" {

  path                 =  "${vault_mount.roboshop-dev.path}/mysql"


  data_json = <<EOT
  {
   "mysql_root_password" : "Roboshop@1"



}
EOT
}
resource "vault_generic_secret" "rabbitmq-dev" {

  path                 =  "${vault_mount.roboshop-dev.path}/rabbitmq"


  data_json = <<EOT
  {
   "user" : "roboshop"
   "password" : "Roboshop@123",


}
EOT
}