# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hector=User.create(first_name:"Hector",last_name:"Feurtado",email:"HectorFeurtado@gmail.com",password:"AidenJ#1")
ashalee=Parent.create(first_name:"Ashalee",last_name:"Ruiz",email:"ARuiz@gmail.com")
aiden= Student.create(first_name:"Aiden",last_name:"Feurtado",teacher_id:hector.id,parent_id:ashalee.id)