require 'cancan/matchers'
require 'spec_helper'

describe "permissions" do
  it "lets a user delete only their own store" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    store = FactoryGirl.create(:store, :user => user)
    ability = Ability.new(user)
    ability2 = Ability.new(user2)
    ability.should be_able_to(:destroy, store)
    ability2.should_not be_able_to(:destroy, store)
  end

  it "lets a user create an item in their own store" do
    user = FactoryGirl.create(:user)
    store = FactoryGirl.create(:store, :user => user)
    item = store.items.new
    ability = Ability.new(user)
    ability.should be_able_to(:create, item)
  end

  it "doesn't let a user create an item in someone else's store" do
    store_owner = FactoryGirl.create(:user)
    store = store_owner.stores.create!
    other_user = FactoryGirl.create(:user)
    item = store.items.new
    ability = Ability.new(other_user)
    ability.should_not be_able_to(:create, item)
  end

  it "does not allow a user to create a store if they are not logged in" do
    unauthorized_user = User.new
    ability = Ability.new(unauthorized_user)
    store = FactoryGirl.create(:store, :user => unauthorized_user)
    ability.should_not be_able_to(:create, store)
  end
end

# describe 'permissions for users and stores' do
#   subject { Ability.new(user) }
#   let(:user) { User.create!(:email => "email@email.com", :password => "password") }
#   let(:store) { user.stores.create! }
#   it { should be_able_to(:destroy, store) }
# end
