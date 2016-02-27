# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'super', email: 'super@ncsu.edu', password: 'super123', type: 'superadmin')
User.create(name: 'admin', email: 'admin@ncsu.edu', password: 'admin123', type: 'admin')
User.create(name: 'instructor', email: 'instructor@ncsu.edu', password: 'instructor123', type: 'instructor')
User.create(name: 'student', email: 'student@ncsu.edu', password: 'student123', type: 'student')

