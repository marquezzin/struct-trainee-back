FactoryBot.define do
  factory :post_category do
    post { association(:post) }
    category { association(:category) }
  end
end
