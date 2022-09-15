class Blog < ApplicationRecord
    validates_presence_of :title, :body, :user_id
end
