FactoryBot.define do 
  factory :comment do 
    comment_text { Faker::Movies::VForVendetta.quote }
    user_id { Faker::Number.within(range: 0..100)}
    blog_id { Faker::Number.within(range: 0..100)}
  end 
end 