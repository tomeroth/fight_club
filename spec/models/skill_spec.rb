 require 'spec_helper'
 require 'rails_helper'
 require 'shoulda/matchers'

 describe Skill do
  	it "has a Skill Type" do
  		FactoryGirl.build(:skill,skill_type: nil).should_not be_valid
  	end
  	it "has a level" do
      # skill=Skill.new
      # should expect(skill).not_to allow_value(0).for(:level)
  		# FactoryGirl.build(:skill,level: nil).should_not be_valid
  	end
  	describe "validations",type: :model do
    	subject { FactoryGirl.build(:skill) }
    	it {should validate_uniqueness_of(:skill_type).scoped_to(:fighter_id).with_message(" Validated uniqueness of skill_tpye and fighter_id") } # gives undefined method, dunno why
  	end
  	
 end