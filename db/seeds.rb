require 'faker'
require 'pry'

puts "🌱 Seeding data..."

titles = ["The standard Lorem Ipsum passage, used since the 1500s", "1914 translation by H. Rackham", "let's get this chat app working", "ngl, this looks like a lot 😬", "1914 translation by H. Rackham💪"]


5.times do
  Author.create(name: Faker::Name.name, email: Faker::Internet.email)
end

5.times do
  Post.create(title: titles.sample, body: Faker::Lorem.paragraph, author_id: Author.all.sample.id)
end


puts "🌱 Done seeding!"

binding.pry
