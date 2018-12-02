# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(employee_id: "123456", password: "123456", password_confirmation: "123456", admin: true)

EmployeeVisa.create!(desc: 'Student - 20 hours')
EmployeeVisa.create!(desc: 'Student - 40 hours')
EmployeeVisa.create!(desc: 'No Visa Required')

EmployeeAsset.create!(desc: 'Auditor', rate: 9.95)
EmployeeAsset.create!(desc: 'Specialist', rate: 12.89)
EmployeeAsset.create!(desc: 'Expert', rate: 14.89)
EmployeeAsset.create!(desc: 'Top Gun', rate: 16.89)
EmployeeAsset.create!(desc: 'Supervisor', rate: 18.89)
EmployeeAsset.create!(desc: 'Manager', rate: 20.89)

EmployeeSituation.create!(status: 'Active')
EmployeeSituation.create!(status: 'Inactive')
EmployeeSituation.create!(status: 'Holidays')
EmployeeSituation.create!(status: 'Visa Expired')

EmployeerJobSituation.create!(status: "Pending")
EmployeerJobSituation.create!(status: "Accepted")
EmployeerJobSituation.create!(status: "Rejected")

JobSituation.create!(desc: "Open")
JobSituation.create!(desc: "Closed")
JobSituation.create!(desc: "Canceled")

MeetingPoint.create!(local: "At Store")
MeetingPoint.create!(local: "Office")
MeetingPoint.create!(local: "Red Cow Luas Station")
MeetingPoint.create!(local: "Ldl- Moore Street")