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
  default     = 1
  type        = number
  description = "The number of the machine what we need"
}

variable "machine_image" {
  default     = "ubuntu-2204-lts"
  type        = string
  description = "The boot image for the machine"
}

variable "public_keys" {
  default = <<-EOF
  root:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDL0pfUbDNAWqKTGIXcQeOW5nmp5uF9ccbsbPY1SP14S49c4sb8RKySoC9QqHg3D+QemhyGqvhCgWvYwLRHHyu+X3mCLVJRIubvvYrOmPva+ipEM36z73cxS5LK0BROuSnUQptVSB+V+KU7HGdSm/k7XVdBehZmNST4wvuveD7h8a4MxCs8TvmmPOTVSbIZKB8TsqNia+zLzswnUdLjSX/wWjxtVToPME5OJfYf5iqD+VEFMOvHAaqsu3bZCJqlPSnFYIW3UaCTe/wBW6tMbuKgomrYMcqcTCJD6kF1/vy0pXLqb7X0WSJ1XCzyO5bu1Ju9jVRdnsJmcrNi0+NnVQbsrrdBj4ib/KCUIIfVaTZqbBeMwgxyZKKoOSfxen8eeHkQ4R4k+RIr7XkCqRgCmEr/OyN/iOzvgo2WSKSGqKA/zpUAvhEVeiyFWMNdfOaxKn+dhsnFaylrAVjRGzpyJwQ7gLtY4WErEESh/GhhTrzJ8Rxv6HjMFpBgVO8vd3/2d5E= root
  # The next public_key which you can paste here
  EOF
  type    = string
}

variable "open_ports" {
  default = ["22", "80"]
  type    = list(any)
}
