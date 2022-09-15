class User < ApplicationRecord
    validates_presence_of :name, :email
    validates_uniqueness_of :email

    has_many :blogs
    has_many :comments
end
