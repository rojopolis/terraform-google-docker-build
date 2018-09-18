output "gcr_image_info" {
    description = "Published image."
    value = "${data.external.gcr_image_info.result}"
}