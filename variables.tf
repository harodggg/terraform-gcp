variable "project" {
  default = "gcp-fleek"
  type    = string
}

variable "credentials_file" {
  default = "./gcp-fleek-server.json"
  type    = string
}

variable "region" {
  default = "us-central1"
  type    = string

}

variable "zone" {
  default = "us-central1-c"
  type    = string
}

variable "machine_num" {
  default     = 10
  type        = number
  description = "The number of the machine what we need"
}
