class Comment < ApplicationRecord
    belongs_to :blog
    validates_presence_of :comment_text, :user_id, :blog_id
end
