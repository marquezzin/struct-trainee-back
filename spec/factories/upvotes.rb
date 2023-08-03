FactoryBot.define do
  factory :upvote do
    status { false }
    user { association(:user) }
    post { association(:post) }
  end
end
