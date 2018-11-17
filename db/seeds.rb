# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!([
  {ctg: "交通（空港、その他）"},
  {ctg: "レストラン"},
  {ctg: "観光"},
  {ctg: "トラブル"},
  {ctg: "ことわざ"},
  {ctg: "日常会話"},
  {ctg: "恋愛"},
  {ctg: "ビジネス"}
 ])