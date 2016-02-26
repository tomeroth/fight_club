require 'faker'

FactoryGirl.define do
	factory :fighter do 
		first_name {Faker::Beer.style}
		last_name {Faker::Superhero.name}
		description {Faker::Lorem.sentence}
		avatar {Faker::Placeholdit.image("50x50", 'jpg') }
	end
end