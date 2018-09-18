locals {
    build_command = <<EOF
        ${path.module}/scripts/gcr-docker-build.sh \
        ${var.gcp_token} ${var.name}:${var.tag} ${var.gcp_project} ${var.context}
    EOF
}

resource "null_resource" "gcr_docker_image" {
  provisioner "local-exec" {
    command = "${local.build_command}"
  }
}

data "external" "gcr_image_info" {
    program = [
        "${path.module}/scripts/gcr-get-image.sh",
        "${var.name}",
        "${var.tag}",
        "${var.gcp_project}",
    ]
}