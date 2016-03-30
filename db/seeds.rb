# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all

Restaurant.create([
  {
    :name => "台大第一腿",     
    :email => "bestleg@gmail.com",
    :password => "P@ssw0rd"                 
  },
  {
    :name => "天下第一味",     
    :email => "besttaste@gmail.com",
    :password => "P@ssw0rd"                 
  },
  {
    :name => "紙牛",     
    :email => "paperox@gmail.com",
    :password => "P@ssw0rd"                 
  },
])

foods = ["雞腿便當", "鮮蝦燒賣", "沙朗牛排", "滷肉飯", "餛飩麵"]
Restaurant.all.each do |r|
  for i in 1..3 do
    r.foods.create(name: foods[rand(0..foods.size-1)])
  end
end