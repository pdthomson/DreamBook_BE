class Blog < ApplicationRecord
    has_many :comments, :dependent => :destroy
    validates_presence_of :title, :body, :user_id
    validates_presence_of :keyword, allow_blank: true
    enum status:[:shared, :hidden]
end
