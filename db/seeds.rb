# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.create(asb_vote: false, class_vote: false, grade: "8", name: "Charles Xue", student_id: "12345677", password: "041195")
Student.create(asb_vote: false, class_vote: false, grade: "9", name: "Charles Xue", student_id: "12345678", password: "041195")
Student.create(asb_vote: false, class_vote: false, grade: "10", name: "Charles Xue", student_id: "12345679", password: "041195")
a=Position.create(name: "President", position_type: "class")
b=Position.create(name: "Secretary", position_type: "class")
c=Position.create(name: "President", position_type: "asb")
d=Position.create(name: "Treasurer", position_type: "asb")
Candidate.create(grade: "9", name: "Bill Cosby", position_id: a.id, candidate_id: "12312311")
Candidate.create(grade: "9", name: "Jim Reynor", position_id: b.id, candidate_id: "12312312")
Candidate.create(grade: "9", name: "Epic Winner", position_id: a.id, candidate_id: "12312313")
Candidate.create(grade: "10", name: "Sigh Duck", position_id: c.id, candidate_id: "12312314")
Candidate.create(grade: "10", name: "Hello World", position_id: d.id, candidate_id: "12312315")
Admin.create(birthdate: "041195", name: "Charles Xue", password: "123456", student_id: "12345678", password_confirmation: "123456")