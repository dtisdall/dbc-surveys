#First time through

u = User.create(username: 'dtisdall', password: 'password', display_name: 'David Tisdall', email: "david.tisdall@thursday5th.com.au")
u = User.find(1)
s = Survey.create(title: "Amazing Survey", description: "This is the best survey in the world", user: User.find(1))
q1 = Question.create(text: "How cool is this survey", survey: s)
c1 = Choice.create(text: "Very", question: q1)
c2 = Choice.create(text: "Not Very", question: q1)
compl = Completion.create(user: u, survey: s)
r = Selection.create(completion: compl, choice: c1)

#Second time through

s = Survey.create(title: Faker::Lorem.words(2), description: Faker::Lorem.words(7), user: User.find(1))
q1 = Question.create(text: "How cool is this survey", survey: s)
q1c1 = Choice.create(text: "Very", question: q1)
q1c2 = Choice.create(text: "Not Very", question: q1)
q2 = Question.create(text: "Is this a great survey", survey: s)
q2c1 = Choice.create(text: "Very", question: q2)
q2c2 = Choice.create(text: "Not Very", question: q2)
q2c3 = Choice.create(text: "Totally", question: q2)
q3 = Question.create(text: "Is this a less great survey", survey: s)
q3c1 = Choice.create(text: "No", question: q3)
q3c2 = Choice.create(text: "Yes", question: q3)
q3c3 = Choice.create(text: "Totally", question: q3)

12.times do 
name = Faker::Name.name
u = User.create(username: name.split.first, password: Faker::Internet.password(8), display_name: name, email: Faker::Internet.safe_email(name.split.first))
compl = Completion.create(user: u, survey: s)
r = Selection.create(completion: compl, choice: s.questions[0].choices.sample)
r = Selection.create(completion: compl, choice: s.questions[1].choices.sample)
r = Selection.create(completion: compl, choice: s.questions[2].choices.sample)
end
