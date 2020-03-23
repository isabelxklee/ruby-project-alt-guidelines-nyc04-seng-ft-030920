require_relative '../config/environment'

fido = Dog.create(name: "Fido", breed: "Scottish Terrier", age: 5)
lassie = Dog.create(name: "Lassie", breed: "Border Collie", age: 2)

bob = Walker.create(name: "Bob")
isabel = Walker.create(name: "Isabel")

app1 = Appointment.create(dog_id: fido.id, walker_id: bob.id, date: "09/04/2020", time: "3:30pm")
app2 = Appointment.create(dog_id: lassie.id, walker_id: bob.id, date: "09/04/2020", time: "3:30pm")
app3 = Appointment.create(dog_id: fido.id, walker_id: isabel.id, date: "13/04/2020", time: "5:45pm")

p fido
p bob
p app1
p app1.date