FactoryBot.define do
  factory :book do
    title { "MyString" }
    description { "MyText" }
    author { "MyString" }
    user { nil }
  end
end
