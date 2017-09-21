# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hector=User.create(first_name:"Hector",last_name:"Feurtado",email:"HectorFeurtado@gmail.com",password:"123456")
ashalee=Parent.create(first_name:"Ashalee",last_name:"Ruiz",email:"ARuiz@gmail.com",teacher_id:hector.id)
aiden= Student.create(first_name:"Aiden",last_name:"Feurtado",teacher_id:hector.id,parent_id:ashalee.id)

10.times do
  Report.create(
  test_quizes:rand(0..11),
  homework:rand(0..11),
  classwork:rand(0..11),
  punctuality_attendance:rand(0..11),
  contributions:rand(0..11),
  collab_coop:rand(0..11),
  openness_to_feedback:rand(0..10),
  consistently_good_effort:rand(0..14),
  takes_responsibility:rand(0..10),
  teacher_id:User.first.id,
  student_id:Student.first.id,
  feedback:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  assignment:"A assignment"
  )
end