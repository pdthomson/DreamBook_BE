require 'rails_helper'

RSpec.describe Blog, type: :model do 
    # it {should validate_presence_of :title }
    # it {should validate_presence_of :body }
    # it {should validate_presence_of :user_id }
    it { should have_many :comments }
    it { should belong_to :user}
end