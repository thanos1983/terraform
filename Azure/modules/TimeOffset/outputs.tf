output "day" {
  description = "Number day of offset timestamp."
  value       = time_offset.offset.day
}

output "hour" {
  description = "Number hour of offset timestamp."
  value       = time_offset.offset.hour
}

output "id" {
  description = "RFC3339 format of the offset timestamp, e.g. 2020-02-12T06:36:13Z."
  value       = time_offset.offset.id
}

output "minute" {
  description = "Number minute of offset timestamp."
  value       = time_offset.offset.minute
}

output "month" {
  description = "Number month of offset timestamp."
  value       = time_offset.offset.month
}

output "rfc3339" {
  description = "RFC3339 format of the offset timestamp, e.g. 2020-02-12T06:36:13Z."
  value       = time_offset.offset.rfc3339
}

output "second" {
  description = "Number second of offset timestamp."
  value       = time_offset.offset.second
}

output "unix" {
  description = "Number of seconds since epoch time, e.g. 1581489373."
  value       = time_offset.offset.unix
}

output "year" {
  description = "Number year of offset timestamp."
  value       = time_offset.offset.year
}