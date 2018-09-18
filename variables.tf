variable "gcp_project" {
    description = "GCP Project to target."
    type        = "string"
}

variable "gcp_token" {
    description = "GCP Authentication token."
    type        = "string"
}


variable "name" {
    description = "Name of the image."
    type        = "string"
}

variable "tag" {
    description = "Image tag."
    type        = "string"
    default     = "latest"
}

variable "context" {
    description = <<EOF
        A build’s context is the set of files located in the specified PATH or
        URL. The build process can refer to any of the files in the context.
        For example, your build can use a COPY instruction to reference a file
        in the context.
    EOF
    type        = "string"
}