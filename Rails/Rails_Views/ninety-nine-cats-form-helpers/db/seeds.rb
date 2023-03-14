# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'

puts "Loading Cats..."
Cat.destroy_all 
cat1 = Cat.create(birth_date: '2020/01/10', color: 'white', name: 'Missy', sex: 'F', description: 'Missy cat description.')
cat2 = Cat.create(birth_date: '2021/01/05', color: 'mix', name: 'Whiskers', sex: 'M', description: 'Whiskers cat description.')
cat3 = Cat.create(birth_date: '2023/02/19', color: 'mix', name: 'Speedy', sex: 'F', description: 'Speedy cat description.')
cat4 = Cat.create(birth_date: '2017/10/12', color: 'orange', name: 'Jumper', sex: 'F', description: 'Jumper cat description.')
cat5 = Cat.create(birth_date: '2018/02/22', color: 'mix', name: 'Paws', sex: 'F', description: 'Paws cat description.')
#Load Cat Photos
missy = File.open('app/assets/images/Missy.jpg', 'rb')
cat1.image.attach(io: missy, filename: 'missy.jpg')
whiskers = File.open('app/assets/images/Whiskers.jpg', 'rb')
cat2.image.attach(io: whiskers, filename: 'whiskers.jpg')
speedy = File.open('app/assets/images/Speedy.jpg', 'rb')
cat3.image.attach(io: speedy, filename: 'speedy.jpg')
jumper = File.open('app/assets/images/Jumper.jpg', 'rb')
cat4.image.attach(io: jumper, filename: 'jumper.jpg')
paws = File.open('app/assets/images/Paws.jpg', 'rb')
cat5.image.attach(io: paws, filename: 'paws.jpg')

puts "Loading Cat Rental Requests..."
CatRentalRequest.destroy_all 
#cat1 requests
request1 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2023/05/03', end_date: '2023/05/10', status: 'PENDING')
request2 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2023/06/01', end_date: '2023/06/10', status: 'PENDING')
request3 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2023/07/01', end_date: '2023/07/10', status: 'PENDING')
request4 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2023/05/01', end_date: '2023/05/05', status: 'PENDING')
request5 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2023/05/02', end_date: '2023/05/09', status: 'PENDING')
request6 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2023/07/05', end_date: '2023/07/12', status: 'PENDING')
#cat2 requests 
request7 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2023/05/03', end_date: '2023/05/10', status: 'PENDING')
request8 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2023/06/01', end_date: '2023/06/10', status: 'PENDING')
request9 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2023/07/01', end_date: '2023/07/10', status: 'PENDING')
request10 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2023/05/01', end_date: '2023/05/05', status: 'PENDING')
request11 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2023/05/02', end_date: '2023/05/09', status: 'PENDING')
request12 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2023/07/05', end_date: '2023/07/12', status: 'PENDING')
#cat3 requests 
request13 = CatRentalRequest.create(cat_id: cat3.id, start_date: '2023/05/03', end_date: '2023/05/10', status: 'PENDING')
request14 = CatRentalRequest.create(cat_id: cat3.id, start_date: '2023/06/01', end_date: '2023/06/10', status: 'PENDING')
request15 = CatRentalRequest.create(cat_id: cat3.id, start_date: '2023/07/01', end_date: '2023/07/10', status: 'PENDING')
request16 = CatRentalRequest.create(cat_id: cat3.id, start_date: '2023/05/01', end_date: '2023/05/05', status: 'PENDING')
request17 = CatRentalRequest.create(cat_id: cat3.id, start_date: '2023/05/02', end_date: '2023/05/09', status: 'PENDING')
request18 = CatRentalRequest.create(cat_id: cat3.id, start_date: '2023/07/05', end_date: '2023/07/12', status: 'PENDING')
#cat4 requests 
request19 = CatRentalRequest.create(cat_id: cat4.id, start_date: '2023/05/03', end_date: '2023/05/10', status: 'PENDING')
request20 = CatRentalRequest.create(cat_id: cat4.id, start_date: '2023/06/01', end_date: '2023/06/10', status: 'PENDING')
request21 = CatRentalRequest.create(cat_id: cat4.id, start_date: '2023/07/01', end_date: '2023/07/10', status: 'PENDING')
request22 = CatRentalRequest.create(cat_id: cat4.id, start_date: '2023/05/01', end_date: '2023/05/05', status: 'PENDING')
request23 = CatRentalRequest.create(cat_id: cat4.id, start_date: '2023/05/02', end_date: '2023/05/09', status: 'PENDING')
request24 = CatRentalRequest.create(cat_id: cat4.id, start_date: '2023/07/05', end_date: '2023/07/12', status: 'PENDING')
#cat5 requests 
# request25 = CatRentalRequest.create(cat_id: cat5.id, start_date: '2023/05/03', end_date: '2023/05/10', status: 'APPROVED')
# request26 = CatRentalRequest.create(cat_id: cat5.id, start_date: '2023/06/01', end_date: '2023/06/10', status: 'PENDING')
# request27 = CatRentalRequest.create(cat_id: cat5.id, start_date: '2023/07/01', end_date: '2023/07/10', status: 'DENIED')
# request28 = CatRentalRequest.create(cat_id: cat5.id, start_date: '2023/05/01', end_date: '2023/05/05', status: 'PENDING')
# request29 = CatRentalRequest.create(cat_id: cat5.id, start_date: '2023/05/02', end_date: '2023/05/15', status: 'PENDING')
# request30 = CatRentalRequest.create(cat_id: cat5.id, start_date: '2023/07/05', end_date: '2023/07/12', status: 'PENDING')