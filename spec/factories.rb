FactoryBot.define do
  factory :article do
    sequence(:id)
    sequence(:title) { |n| "Book #{n}" }
    sequence(:text) { |n| "Text #{n}" }

    factory :article_with_comments do
      after :create do |article, evaluator|
        create_list :comment, 3, article: article
      end
      sequence(:id)
      sequence(:article_id)
      sequence(:title) { |n| "title #{n}" }
      sequence(:comment) { |n| "comment #{n}" }
    end
  end
end

FactoryBot.define do
  factory :comment do
    sequence(:id)
    sequence(:article_id)
    sequence(:author) { |n| "author #{n}" }
    sequence(:comment) { |n| "comment text #{n}" }
  end
end

FactoryBot.define do
  factory :user do
    sequence(:id)
    sequence(:email) { |n| "user#{n}@mail.com" }
    sequence(:password){ |n| "password #{n}" }
  end
end
