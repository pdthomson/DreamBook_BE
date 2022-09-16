require 'rails_helper'

RSpec.describe 'A blogs comments API' do

  it "can make an api call returning a blogs comments" do
    blog = Blog.create!(title: 'Link Pizards', body: 'They was plink', status: 'shared', user_id: 1, id: 1)
    comment1 = Comment.create!(comment_text: 'Thats weird boy, capped busses', user_id: 2, blog_id: blog.id)
    comment2 = Comment.create!(comment_text: "I like turtles", user_id: 3, blog_id: blog.id)

    get "/api/v1/blogs/#{blog.id}/comments"

    binding.pry
    expect(response).to be_successful
    expect(response.status).to eq(200)

    json_response = JSON.parse(response.body, symbolize_names: true)
    comments = json_response[:data]


  end


end
