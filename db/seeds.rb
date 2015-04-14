# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# u = User.new(:email => "admin@mg.com", :password => '12345678', :password_confirmation => '12345678',:name=>"admin",:role =>"管理员")
# u.save
# Description.create!(title:'编辑团队',content:'')
# Description.create!(title:'建议和BUG汇报',content:'')
# Description.create!(title:'投稿须知',content:'')
# Description.create!(title:'法律条款',content:'')
# Description.create!(title:'免责声明',content:'')
# Description.create!(title:'合作洽谈',content:'')
Description.where("id > 6").each do |d|
  d.destroy
  d.save
end

User.where("pet_name is null or pet_name = '昵称'").each do |u|
 u.pet_name = u.name
 u.save
end