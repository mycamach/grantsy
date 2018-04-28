# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FundTag.destroy_all
Fund.destroy_all
Tag.destroy_all
Organization.destroy_all
Order.destroy_all
Billing.destroy_all
User.destroy_all
Subscription.destroy_all
AdminUser.destroy_all

5.times do
  start_at = Random.rand(180).days.ago + 5.days
  end_at = start_at + Random.rand(180).days
  Fund.create!(institution: Faker::Company.name, name: Faker::Commerce.department, description: 'Proyectos innovadores con resultados medibles y durables alargo plazo, replicables, y de metodología eficiente. Este programa busca mejorar las habilidades de comunicación de los ingenieros implementando modelos educativos en el currículo. Proyectos colaborativos entre escuelas de ingeniería y escuelas de comunicaciones o ciencias de la información son especialmente bienvenidos. ', amount: Faker::Number.between(100000, 200000), start: start_at, end: end_at, url: Faker::Internet.url)
end

5.times do
  start_at = Random.rand(180).days.ago + 5.days
  end_at = start_at + Random.rand(180).days
  Fund.create!(institution: Faker::Company.name, name: Faker::Commerce.department, description: 'Pueden aplicar organizaciones establecidas que se enfoquen en investigación. Se alienta la colaboración con estudios comparativos e inter-regionales que generen buenas prácticas a nivel local, regional, e internacional. El proyecto se enfoca en tres temas: resiliencia climática y de desastres, seguridad energética, y migración.', amount: Faker::Number.between(100000, 200000), start: start_at, end: end_at, url: Faker::Internet.url)
end

5.times do
  start_at = Random.rand(180).days.ago + 5.days
  end_at = start_at + Random.rand(180).days
  Fund.create!(institution: Faker::Company.name, name: Faker::Commerce.department, description: 'Fortalecimiento de comunidades: vida sostenible, salud comunitaria, deber cívico. Educación STEM: entrenamiento de profesores, desrrollo de estudiantes, labs de innovación. Salud: áreas del cuidado de la salud para personas en desventaja. Investigación: apoyar estudios relacionados al uso de biológicos, farmacéuticos, productos de biotecnología e instrumentos médicos.', amount: Faker::Number.between(100000, 200000), start: start_at, end: end_at, url: Faker::Internet.url)
end

User.create(email: 'dntapia.bio@gmail.com', password: 'holahola', password_confirmation: 'holahola', admin: false, premium: true)
User.create(email: 'manoli.camacho.a@gmail.com', password: 'holahola', password_confirmation: 'holahola', admin: true, premium: true)
User.create(email: 'marisol.mtz.m@gmail.com', password: 'holahola', password_confirmation: 'holahola', admin: true, premium: true)

20.times do
  user = User.create!(email: Faker::Internet.email, password: 'holahola', password_confirmation: 'holahola')
  Organization.create!(name: Faker::Educator.university, address: Faker::Address.street_address, phone: Faker::PhoneNumber.phone_number, website:Faker::Internet.url, country: Faker::LordOfTheRings.location, dni: Faker::Code.imei, user_id: user.id)
end

Subscription.create([
    { plan_name: '3 meses', price: 200 },
    { plan_name: '6 meses', price: 400 },
    { plan_name: '1 año', price: 1000 },
    ])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
AdminUser.create!(email: 'marisol.mtz.m@gmail.com', password: 'password', password_confirmation: 'password')
