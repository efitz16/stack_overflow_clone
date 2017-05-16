# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: "Liz123", first_name: "Liz", last_name: "Fitz", email: "elizfitz123@gmail.com", password: "Password1")
user2 = User.create(username: "Jim465", first_name: "Jim", last_name: "Fitz", email: "jimfitz465@gmail.com", password: "Password1")
user3 = User.create(username: "Mary789", first_name: "Mary", last_name: "Fitz", email: "maryfitz789@gmail.com", password: "Password1")


question1 = Question.create(title: "What is 2 + 2?", body: "Pls help", user: user1)
question2 = Question.create(title: "What is a closure?", body: "Closure in JS what are they", user: user2)
answer11 = Answer.create(body: "4 duh", user: user3, question: question1)
answer12 = Answer.create(body: "4", user: user2, question: question1)
answer11 = Answer.create(body: "v good q", user: user1, question: question2)
answer12 = Answer.create(body: "everyone wonders this", user: user3, question: question2)

2345.times do |v|
  vote = Vote.new(value: [1, -1].sample, user: User.all.sample)
  if [1, 2].sample == 1
  	vote.voteable = Question.all.sample
  else
  	vote.voteable = Answer.all.sample
  end

  vote.save
end
