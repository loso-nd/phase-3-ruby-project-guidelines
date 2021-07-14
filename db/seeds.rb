# This will delete any existing rows from the Movie and Actor tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting movie/actor data..."
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

#Creating Sample data to test models and associations 
puts "Creating Doctor..."
d1 = Doctor.create(name: "Dr. J", speciality: "Radiology")
d2 = Doctor.create(name: "Dr. Nish Nish", speciality: "Gastroenterology")

#run it by rake db:seed
puts "Creating Patient..."
p1 = Patient.create(name: "Marcel", password: "1234")
p2 = Patient.create(name: "Niklaus", password: "1234")
p3 = Patient.create(name: "Elijah", password: "1234")
p4 = Patient.create(name: "Rebbeca", password: "1234")
p5 = Patient.create(name: "Col", password: "1234")
p6 = Patient.create(name: "Freya", password: "1234")

puts "Creating Appointment..."
Appointment.create(doctor_id: d1.id, patients_id: p1.id, date: 2021_07_14)

puts "Seeding done!"
