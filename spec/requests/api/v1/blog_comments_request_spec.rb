require 'rails_helper'

RSpec.describe 'A blogs comments API' do

  it "can make an api call returning a blogs comments" do
    blog = Blog.create!(title: 'Link Pizards', body: 'They was plink', status: 'shared', user_id: 1, id: 1)
    comment1 = Comment.create!(comment_text: 'Thats weird boy, capped bussins', user_id: 2, blog_id: blog.id)
    comment2 = Comment.create!(comment_text: "I like turtles", user_id: 3, blog_id: blog.id)

    get "/api/v1/blogs/#{blog.id}/comments"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json_response = JSON.parse(response.body, symbolize_names: true)
    comments = json_response[:data]

    expect(comments.count).to eq(2)

    comments.each do |comment|
      expect(comment[:attributes]).to have_key(:user_id)
      expect(comment[:attributes][:user_id]).to be_an(Integer)

      expect(comment[:attributes]).to have_key(:blog_id)
      expect(comment[:attributes][:blog_id]).to be_an(Integer)

      expect(comment[:attributes]).to have_key(:comment_text)
      expect(comment[:attributes][:comment_text]).to be_an(String)
    end
  end

  it 'creates a comment' do
    blog = create(:blog)
    comment_params = ({
                comment_text: 'bts butter',
                blog_id: blog.id,
                user_id: 1
                })

    headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/blogs/#{blog.id}/comments", headers: headers, params: JSON.generate(comment_params)

    expect(response).to be_successful 
    expect(response.status).to eq(201)

    created_comment = Comment.last

    expect(created_comment.comment_text).to eq(comment_params[:comment_text])
    expect(created_comment.comment_text).to eq('bts butter')
    
    expect(created_comment.user_id).to eq(comment_params[:user_id])
    expect(created_comment.user_id).to eq(1)
    
    expect(created_comment.blog_id).to eq(comment_params[:blog_id])
  end

  it 'does not create comment' do
    blog = create(:blog)
    comment_params = ({
                comment_text: 'bts butter',
                blog_id: blog.id,
                })
    headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/blogs/#{blog.id}/comments", headers: headers, params: JSON.generate(comment_params)

    expect(response).to_not be_successful 
    expect(response.status).to eq(400) 
  end

  it 'updates a comment' do
    blog = create(:blog)
    comment = Comment.create!(comment_text: 'Thats weird boy, capped bussins', user_id: 2, blog_id: blog.id)
    previous_comment_text = comment.comment_text
    previous_user_id = comment.user_id

    comment_params = ({
                comment_text: 'sunshines and rainbows',
                blog_id: blog.id,
                user_id: comment.user_id
                })

    headers = {"CONTENT_TYPE" => "application/json"}
    patch "/api/v1/blogs/#{blog.id}/comments/#{comment.id}", headers: headers, params: JSON.generate(comment_params)
    
    updated_comment = Comment.find_by(id: comment.id)
    expect(response).to be_successful
    expect(updated_comment.comment_text).to_not eq(previous_comment_text)
    expect(updated_comment.user_id).to eq(previous_user_id)
  end

  it 'deletes a comment' do
    blog = create(:blog)
    comment = Comment.create!(comment_text: 'Thats weird boy, capped bussins', user_id: 2, blog_id: blog.id)
    expect{ delete "/api/v1/blogs/#{blog.id}/comments/#{comment.id}"}.to change(Comment, :count).by(-1)
    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect{Comment.find(comment.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
