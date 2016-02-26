 require 'spec_helper'
 require 'rails_helper'

 describe Statistic do
  	it "has a win number" do
  		FactoryGirl.build(:statistic,win: Faker::Number.negative).should_not be_valid
  	end
  	it "has a lost number" do
  		FactoryGirl.build(:statistic,lost: Faker::Number.negative).should_not be_valid
  	end
  	it "has a experience number" do
  		FactoryGirl.build(:statistic,experience: Faker::Number.negative).should_not be_valid
  	end
 end