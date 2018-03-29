5.times do
  Article.create(
    title: Faker::Book.title,
    text: Faker::Lorem.sentence
    )
end
