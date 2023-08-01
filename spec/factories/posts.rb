FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    upvotes { 1 }
    user { association(:user) }
  end
end
