FactoryBot.define do
  factory :comment do
    author 'user'
    sequence(:comment) { |n| "comment text #{n}" }
  end
end
