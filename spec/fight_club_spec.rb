Capybara.default_driver = :selenium

describe "Fight_club App"   do
	describe "visit root" do
		before {visit '/'}
	end

	it "visit fighter" do
		visit '/fighters/new'
		within("#fighter") do
			fill_in('First Name',:with=>"Peter")
			fill_in('Last Name',:with=>"Parker")
			fill_in('Description',:with=>"Spiderman i guess")
			fill_in('Avatar',:with=>"picture.jpg")
		end
		click_link('Submit')
		expect(page).to have_content 'Success'
	end

end