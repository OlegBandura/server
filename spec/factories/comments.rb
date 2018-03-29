FactoryBot.define do
  factory :comment do
    author 'user'
    sequence(:comment) { |n| "comment body #{n}" }
  end
end
