
provider "google" {}

data "google_client_config" "current" {}

module "docker_build" {
    source        = "../"
    gcp_project   = "${data.google_client_config.current.project}"
    gcp_token     = "${data.google_client_config.current.access_token}"
    context       = "${path.module}"
    name          = "test"
    tag           = "12"
}

output "image_info" {
    value = "${module.docker_build.gcr_image_info}"
}