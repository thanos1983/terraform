output "day" {
  description = "Number day of timestamp."
  value       = time_rotating.rotating.day
}

output "hour" {
  description = "Number hour of timestamp."
  value = time_rotating.rotating.hour
}

output "id" {
  description = "RFC3339 format of the timestamp, e.g. 2020-02-12T06:36:13Z."
  value       = time_rotating.rotating.id
}

output "minute" {
  description = "Number minute of timestamp."
  value = time_rotating.rotating.minute
}

output "month" {
  description = "Number month of timestamp."
  value = time_rotating.rotating.month
}

output "second" {
  description = "Number second of timestamp."
  value = time_rotating.rotating.second
}

output "unix" {
  description = "Number of seconds since epoch time, e.g. 1581489373."
  value = time_rotating.rotating.unix
}

output "year" {
  description = "Number year of timestamp."
  value = time_rotating.rotating.year
}