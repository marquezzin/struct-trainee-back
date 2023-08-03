FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { association(:user) }
    post { association(:post) }
  end
end
