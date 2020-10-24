
Word.create!(
  word: "電車",
  phonetic: "でんしゃ",
  mean: "tàu điện",
  note: "",
  level: "N5",
  )

user = User.create!(
  email: "test@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)

3.times do |n|
  Course.create!(
    name: Faker::Name.name,
    desc: Faker::Lorem.characters(number: 10),
    user_id: user.id
  )
end

courses = Course.order(:created_at).take(3)
2.times do |n|
  name = Faker::Name.name
  desc = Faker::Lorem.characters(number: 10)
  courses.each { |courses| courses.lessons.create!(name: name, desc: desc)}
end
