 require 'spec_helper'
 require 'rails_helper'

 describe Fighter do
  	it "has a first name" do
  		FactoryGirl.build(:fighter,first_name: :nil).should_not be_valid
  	end
  	it "has a last name" do
  		FactoryGirl.build(:fighter,last_name: :nil).should_not be_valid
  	end
  	it "has an avatar" do
  		FactoryGirl.build(:fighter,avatar: "").should_not be_valid
  	end
 end