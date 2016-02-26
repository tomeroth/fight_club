require 'faker'

FactoryGirl.define do
	factory :statistic do 
		win {Faker::Number.positive}
		lost {Faker::Number.positive}
		experience {Faker::Number.positive}
	end
end