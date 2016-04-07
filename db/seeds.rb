# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if SuperAdmin.count == 0
  SuperAdmin.create(first_name: "Super", last_name: "Admin", email: "superadmin@example.com", password: "superadmin123")
  puts "SuperAdmin account created\nCredentials: superadmin@example.com/superadmin123"
else
  puts "SuperAdmin account already exists, skipping SuperAdmin creation"
end

SuperAdmin.create(first_name: "Pablo", last_name: "Galeote", email: "pablogaleote@gmail.com", password: "pikicox1")
puts "SuperAdmin account created\nCredentials: pablogaleote@gmail.com/pikicox1"

