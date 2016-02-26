require 'faker'

FactoryGirl.define do
	factory :skill do 
		skill_type {Faker::Number.between(1..10)}
		level {Faker::Number.between(1..5)}
	end
end