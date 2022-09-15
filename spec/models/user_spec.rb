require 'rails_helper'

RSpec.describe User, type: :model do 
    # it {should validate_presence_of :user_name }
    # it {should validate_presence_of :email }
    # it {should validate_uniqueness_of :email }
    it { should have_many :blogs }
    it { should have_many :comments }

end