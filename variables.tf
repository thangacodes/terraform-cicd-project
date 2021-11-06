## This is the place, where we are setting up variables

variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "sgp" {
  type = list(string)
}
variable "key" {
  type = string
}
variable "name" {
  type = string
}
variable "project" {
  type = string
}
variable "owner" {
  type = string
}
variable "mail" {
  type = string
}
variable "tower" {
  type = string
}
variable "region" {
  type = string
}
