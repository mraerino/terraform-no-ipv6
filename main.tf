data "http" "example" {
  url = "http://v6-only.marcusweiner.de/"
}

output "result" {
  value = data.http.example.body
}
