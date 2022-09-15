require 'rails_helper'

RSpec.describe Comment, type: :model do 
    it {should validate_presence_of :commment_text }
    it {should validate_presence_of :user_id }
    it {should validate_presence_of :blog_id }
end