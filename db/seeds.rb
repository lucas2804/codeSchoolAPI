# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Crawler.create!(url: "http://google.com.vn", h1_content: "H1 Content")
Crawler.create!(url: "http://fptshop.com.vn", h1_content: "H1 Content")
Crawler.create!(url: "http://thegioididong.com", h1_content: "H1 Content")