# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.new(:email => "admin@mg.com", :password => '12345678', :password_confirmation => '12345678',:name=>"admin",:role =>"管理员")
u.save

Category.find_or_create_by(:name => "前瞻")
Category.find_or_create_by(:name => "评测")
Category.find_or_create_by(:name => "业界评论")