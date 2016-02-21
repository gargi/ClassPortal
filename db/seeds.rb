# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'super', email: 'super@gmail.com', password: 'super', type: 'superadmin')
User.create(name: 'admin', email: 'admin@gmail.com', password: 'admin', type: 'admin')
User.create(name: 'instructor', email: 'instructor@gmail.com', password: 'instructor', type: 'instructor')
User.create(name: 'student', email: 'student@gmail.com', password: 'student', type: 'student')

