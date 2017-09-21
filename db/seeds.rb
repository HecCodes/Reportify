# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hector=User.create(first_name:"Hector",last_name:"Feurtado",email:"HectorFeurtado@gmail.com",password:"AidenJ#1")
ashalee=Parent.create(first_name:"Ashalee",last_name:"Ruiz",email:"ARuiz@gmail.com",teacher_id:hector.id)
aiden= Student.create(first_name:"Aiden",last_name:"Feurtado",teacher_id:hector.id,parent_id:ashalee.id)

Report.create(
test_quizes:0,
homework:2,
classwork:5,
punctuality_attendance:11,
contributions:3,
collab_coop:3,
openness_to_feedback:3,
consistently_good_effort:14,
takes_responsibility:9,
teacher_id:User.first.id,
student_id:Student.first.id,
feedback:"Aiden could use more work",
assignment:"A assignment",
date:"2017-09-19"
)

Report.create(
test_quizes:8,
homework:8,
classwork:9,
punctuality_attendance:11,
contributions:11,
collab_coop:11,
openness_to_feedback:3,
consistently_good_effort:14,
takes_responsibility:9,
teacher_id:User.first.id,
student_id:Student.first.id,
feedback:"Aiden is doing great",
assignment:"B assignment",
date:"2017-09-15"
)

Report.create(
test_quizes:11,
homework:11,
classwork:11,
punctuality_attendance:11,
contributions:11,
collab_coop:11,
openness_to_feedback:10,
consistently_good_effort:14,
takes_responsibility:10,
teacher_id:User.first.id,
student_id:Student.first.id,
feedback:"Aiden was perfect this week!",
assignment:"C assignment",
date:"2017-09-12"
)