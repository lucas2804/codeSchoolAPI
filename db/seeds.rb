# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless Crawler.exists?(url: "http://google.com.vn")
  Crawler.create!(url: "http://google.com.vn", h1_content: "H1 Content")
  Crawler.create!(url: "http://fptshop.com.vn", h1_content: "H1 Content")
  Crawler.create!(url: "http://thegioididong.com", h1_content: "H1 Content")
end

unless User.exists?(email: "super_teacher@gmail.com")
  User.create!(admin: true, email: "super_teacher@gmail.com", username: "super_teacher", password: "1234qwer", password_confirmation: "1234qwer",)
  User.create!(email: "student@gmail.com", username: "normal_teacher", password: "1234qwer", password_confirmation: "1234qwer",)
end

unless ::Test.exists?(name: "Ruby")
  ::Test.create!(name: "Ruby", description: "Foundation in Ruby")
  ::Test.create!(name: "Javascript", description: "OOP in Javascript")
end

unless ::Question.exists?(name: "Ruby's greate?")
  ruby = ::Test.where(name: "Ruby").first
  js = ::Test.where(name: "Javascript").first
  ::Question.create!(name: "Ruby's greate?", test_id: ruby.id)
  ::Question.create!(name: "Ruby's dynamic?", test_id: ruby.id)
  ::Question.create!(name: "Closure?", test_id: js.id)
  ::Question.create!(name: "ES6?", test_id: js.id)
end

unless ::Answer.exists?(name: "Ruby's greate?")
  ruby_greate = ::Question.where(name: "Ruby's greate?").first
  ruby_dynamic = ::Question.where(name: "Ruby's dynamic?").first
  ::Answer.create!(name: "Yes, Ruby's greate", question_id: ruby_greate.id)
  ::Answer.create!(name: "Yes, Ruby's dynamic", question_id: ruby_dynamic.id)

end

