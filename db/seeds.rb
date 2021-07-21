# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(:name =>"a", :email =>"aaa@aaa.com", :password =>"aaaaaa", :password_confirmation =>"aaaaaa")
User.create!(:name =>"管理人",:email =>"adminadmin@aaa.com", :password =>"dayodayodayo", :password_confirmation =>"dayodayodayo", :admin =>true)
10.times do |n|
  User.create!(
  name: "guest#{n+1}",
  email: "guest#{n+1}@guest.com",
  password: "guest#{n+1}0000",
 )
end
Label.create([
  { name: '不合格' },
  { name: '仕事' },
  { name: '宿題'},
  { name: '合格'},
  { name: '追試'},
  { name: '残念'},
  { name: '落第'},
  { name: 'もう少し'},
  { name: '課題'},
  { name: '持ち帰り'},
  ])
10.times do |n|
  name = "タスク#{n}"
  detail = "内容#{n}"
  limit = DateTime.new(2021,8, rand(1..30))
  status = rand(0..2)
  priority = rand(0..2)
  user_id = rand(1..9)
  Task.create!(
  name: name,
  detail: detail,
  limit: limit,
  status: status ,
  priority: priority,
  user_id: user_id
 )
end
10.times do |n|
  Task_label.create(
    task_id: rand(1..11),
    label_id: rand(1..11)
  )
end
