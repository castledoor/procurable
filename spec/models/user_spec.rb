require 'spec_helper'

describe User do
  it { should have_many :stores }
  it { should have_many :items }

  it "should be able to tell you whether it is a store owner" do
    user = User.new
    store = user.stores.new
    user.store_owner?.should be_true
  end
end
