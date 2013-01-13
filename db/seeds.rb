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
# Student.delete_all
# Section.delete_all
# 
# Section.create({
#   name: 'Chinese 101 - 2 Students',
#   state_id: 1001,
#   students: [
#     Student.create(first_name: 'Jason', last_name: 'Morrison', state_id: 2001),
#     Student.create(first_name: 'John',  last_name: 'Cumbers',  state_id: 2002)
#   ]
# })
# 
# Section.create({
#   name: 'Chinese 202 - 6 Students',
#   state_id: 1002,
#   students: [
#     Student.create(first_name: 'Laurilee',   last_name: 'L',     state_id: 2003),
#     Student.create(first_name: 'John',       last_name: 'C',    state_id: 2004),
#     Student.create(first_name: 'Jiani',      last_name: 'W',      state_id: 2005),
#     Student.create(first_name: 'Dee',        last_name: 'M',    state_id: 2006),
#     Student.create(first_name: 'Franco',     last_name: 'F',      state_id: 2007),
#     Student.create(first_name: 'Consuelo',   last_name: 'G',    state_id: 2008)
#   ]
# })

# cards ----------------------------
Cardset.delete_all
Card.delete_all

Cardset.create({
  name: 'Chinese Fruits',
  cards: [
    Card.create({ image_url: 'apple.jpg',       hint_text: 'Apple',       answer_text: 'Píngguǒ' }),
    Card.create({ image_url: 'banana.jpg',      hint_text: 'Banana',      answer_text: 'Xiang Jiao' }),
    Card.create({ image_url: 'kiwi.jpg',        hint_text: 'Kiwi',        answer_text: 'Mi Hou Tao' }),
    Card.create({ image_url: 'orange.jpg',      hint_text: 'Orange',      answer_text: 'Cheng Zhi' }),
    Card.create({ image_url: 'pear.jpg',        hint_text: 'Pear',        answer_text: 'Li' }),
    Card.create({ image_url: 'pineapple.jpg',   hint_text: 'Pineapple',   answer_text: 'Bo Luo' }),
    Card.create({ image_url: 'plum.jpg',        hint_text: 'Plum',        answer_text: 'Mei Zi' }),
    Card.create({ image_url: 'pomegranate.jpg', hint_text: 'Pomegranate', answer_text: 'Shi Liu' }),
    Card.create({ image_url: 'strawberry.jpg',  hint_text: 'Strawberry',  answer_text: 'Cao Mei' }),
    Card.create({ image_url: 'tomato.jpg',      hint_text: 'Tomato',      answer_text: 'Fan Qie' })
  ]
})

# games ----------------------------
Game.delete_all
Participation.delete_all
