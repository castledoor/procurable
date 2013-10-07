require 'cancan/matchers'
require 'spec_helper'

describe "permissions" do
  it "lets a user delete only their own store" do
    user = User.create!(:email => "email@email.com", :password => "password")
    user2 = User.create!(:email => "email2@email.com", :password => "password")
    store = user.stores.create!
    ability = Ability.new(user)
    ability2 = Ability.new(user2)
    ability.should be_able_to(:destroy, store)
    ability2.should_not be_able_to(:destroy, store)
  end
end

# describe 'permissions for users and stores' do
#   subject { Ability.new(user) }
#   let(:user) { User.create!(:email => "email@email.com", :password => "password") }
#   let(:store) { user.stores.create! }
#   it { should be_able_to(:destroy, store) }
# end
