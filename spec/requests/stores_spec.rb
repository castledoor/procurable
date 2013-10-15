require 'spec_helper'

describe "Stores" do
  describe "GET /stores" do
    it "displays the stores" do
    	Store.create!(:name => "Pancake Store")
      get stores_path
      response.body.should include("Pancake Store")
    end
  end

 describe "POST /stores" do
 		it "creates store" do
 			user = User.create!(:email => 'email@email.com', :password => 'password')
 			post_via_redirect new_store_path, Store.new(:user_id => user.id, :name => 'the pony shop')
 			response.body.should include("the pony shop")
 		end
  end
end
