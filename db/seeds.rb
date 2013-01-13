# encoding: utf-8
# 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

# slc data ----------------------------
Student.delete_all
Section.delete_all

Section.create({
  name: 'Chinese 101',
  state_id: 1001,
  students: [
    Student.create(first_name: 'Jason', last_name: 'Morrison', state_id: 2001),
    Student.create(first_name: 'John',  last_name: 'Cumbers',  state_id: 2002)
  ]
})

Section.create({
  name: 'Chinese 202',
  state_id: 1002,
  students: [
    Student.create(first_name: 'Amy',   last_name: 'Appleton',  state_id: 2003),
    Student.create(first_name: 'Billy', last_name: 'Bobberton', state_id: 2004)
  ]
})

# cards ----------------------------
Cardset.delete_all
Card.delete_all

Cardset.create({
  name: 'First and only cardset',
  cards: [
    Card.create({ image_url: 'apple.png',  hint_text: 'Apple',  answer_text: 'Píngguǒ' }),
    Card.create({ image_url: 'sun.png',    hint_text: 'Sun',    answer_text: 'Tàiyáng' }),
    Card.create({ image_url: 'cloud.png',  hint_text: 'Cloud',  answer_text: 'Yún' }),
    Card.create({ image_url: 'rice.png',   hint_text: 'Rice',   answer_text: 'Mǐ' }),
  ]
})

# games ----------------------------
Game.delete_all
Participation.delete_all
