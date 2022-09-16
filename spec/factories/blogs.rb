FactoryBot.define do
  factory :blog do
    title { Faker::Games::Zelda.item }
    body { Faker::Movies::VForVendetta.quote }
    status { Faker::Number.within(range: 0..1)}
    user_id { Faker::Number.within(range: 0..100)}
    # after(:create) do |blog|
    #   create_list :comment, 2, blog_id: blog
    # end
  end
end
