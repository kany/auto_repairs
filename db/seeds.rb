# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create two tenants
tenant           = Tenant.find_or_initialize_by(domain: 'audiservice')
tenant.name      = 'Audi International'
tenant.image_url = 'http://www.autocarpro.in/IMG/314/10314/madurai-audi.jpg'
tenant.save!

tenant           = Tenant.find_or_initialize_by(domain: 'teslaservice')
tenant.name      = 'Tesla Motors'
tenant.image_url = 'https://upload.wikimedia.org/wikipedia/commons/0/09/Tesla_Munich_store.jpg'
tenant.save!


# Add specific data for each Tenant
Tenant.find_by(domain:"audiservice").switch!
models = %w(A3 A4 A5 R8 Q5 A6 Q7 Q3 A8 TT A5 RS7 A7 S8 S5 S3 SQ5 S4 RS5 S7 S6 Allroad TTS Q5Hybrid A3e-tron)
models.each do |n|
  model = Model.find_or_initialize_by(name: n)
  model.save!
end

shop         = Shop.find_or_initialize_by(:name => "Bob's Audi Repair Shop")
shop.address = "123 E Main Street, Mesa, AZ"
shop.save!
shop         = Shop.find_or_initialize_by(:name => "Dingaling Dent Doctor")
shop.address = "42 E Lafayette Avenue, Anytown, USA"
shop.save!

Tenant.find_by(domain:"teslaservice").switch!
models = %w(S X)
models.each do |n|
  model = Model.find_or_initialize_by(name: n)
  model.save!
end

shop         = Shop.find_or_initialize_by(:name => "Sam's Tesla Recovery Studio")
shop.address = "789 N Pole Street, Sitka, AK"
shop.save!
shop         = Shop.find_or_initialize_by(:name => "Tesla by Tom")
shop.address = "23141 Rt. 7, Anytown, USA"
shop.save!

