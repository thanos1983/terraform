output "day" {
  description = "Number day of timestamp."
  value       = time_static.static.day
}

output "hour" {
  description = "Number hour of timestamp."
  value       = time_static.static.hour
}

output "id" {
  description = "RFC3339 format of the offset timestamp, e.g. 2020-02-12T06:36:13Z."
  value       = time_static.static.id
}

output "minute" {
  description = "Number minute of timestamp."
  value       = time_static.static.minute
}

output "month" {
  description = "Number month of timestamp."
  value       = time_static.static.month
}

output "second" {
  description = "Number second of timestamp."
  value       = time_static.static.second
}

output "unix" {
  description = "Number of seconds since epoch time, e.g. 1581489373."
  value       = time_static.static.unix
}

output "year" {
  description = "Number year of timestamp."
  value       = time_static.static.year
}
