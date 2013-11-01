

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# gets rid of old data, so we can build on it as we go
Question.destroy_all

Question.create([{title: 'sample question: what is 2 + 2?', body: 'this is the body'},
	{title: 'sample question: what is 10 + 10?', body: 'this is the body'}
	])

q = Question.all[0]
q.votes.create(value: 1208)
q = Question.all[1]
q.votes.create(value: 244)