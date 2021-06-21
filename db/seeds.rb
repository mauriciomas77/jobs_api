# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'test',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save!
  puts "El usuario #{user[:email]} ha sido creado"
end

3.times do
  company = Company.new(
    company_name: Faker::Company.name,
    user: User.all.sample
  )
  company.save!
end

10.times do
  advice = Advice.new(
    title: Faker::Job.title,
    description: Faker::Lorem.paragraph,
    company: Company.all.sample
  )
  advice.save!
end

Status.create!(description: 'Interesa')
Status.create!(description: 'Rechazado')
Status.create!(description: 'Contratado')
