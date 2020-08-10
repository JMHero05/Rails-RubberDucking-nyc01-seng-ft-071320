Student.destroy_all
Duck.destroy_all

20.times do
  Student.create(name: Faker::Name.name, mod: rand(1..5))
end

15.times do
  Duck.create(name: Faker::Creature::Dog.meme_phrase, description: Faker::Creature::Dog.breed, student_id: Student.all.sample.id)
end
