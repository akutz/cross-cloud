data "template_file" "cloud_conf" {
  template = "${file("${path.module}/cloud.conf")}"

  vars {
    host = "${var.cloud_host}"
    user = "${var.cloud_user}"
    pass = "${var.cloud_pass}"
  }
}
