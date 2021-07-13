# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(:name =>"a", :email =>"aaa@aaa.com", :password =>"aaaaaa", :password_confirmation =>"aaaaaa")
User.create!(:name =>"管理人",:email =>"adminadmin@aaa.com", :password =>"dayodayodayo", :password_confirmation =>"dayodayodayo", :admin =>true)
