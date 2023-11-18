resource "google_compute_instance" "example_instance" {
  name         = "myintance"
  machine_type = "e2-medium"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }

   }

  network_interface {
    network = "default"  # Change this to the name of your existing network

    access_config {
      // Optional: Specify an external IP address
    }
  }

  tags = ["web", "app"]  # Add your desired network tags here

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y software-properties-common
    apt-add-repository --yes --update ppa:ansible/ansible
    apt-get install -y ansible
  EOF
  
}
