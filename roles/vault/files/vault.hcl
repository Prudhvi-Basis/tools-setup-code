ui = true

storage "file" {
  path = "/opt/vault/data"
}


storage =
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}