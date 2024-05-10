#TASK 1: TF SCRIPT

#Storage Bucket Access Control Public Bucket (PUBLIC ACCESS)
resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.task1-public-bucket.name
  role   = "READER"
  entity = "allUsers"
}

#CREATE BUCKET (actual bucket on GCP)
resource "google_storage_bucket" "task1-public-bucket" {
  name                             = "task1-public-bucket"
  storage_class                    = "STANDARD"
  location                         = "US-CENTRAL1"
}

#OUTPUB PUBLIC LINK (displays the url address of your bucket)
output "public_bucket_url" {
  value = google_storage_bucket.task1-public-bucket.url
}

#BUCKET OBJECT (pics etc)
resource "google_storage_bucket_object" "picture" {
  name   = "axel_foley"
  source = "axelfoley.jpg"
  bucket = google_storage_bucket.task1-public-bucket.name
}

#ADD HTML FILE within BUCKET
resource "google_storage_bucket_object" "index_html" {
  name   = "index.html"
  source = "./index.html"  # Path to your local index.html file
  bucket = google_storage_bucket.task1-public-bucket.name
}

