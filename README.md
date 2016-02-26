# Fight Club
<b>Adding Fighters:</b><br>
	Each fighter has a first and last name, with optional description and obligatory avatar.<br>
	With each created fighter, his statistics create automatically.<br><br>
<b>Adding a skill:</b><br>
	Each skill changes fighters stats.<br>
	Maximum skills amount is 8.<br>
	Skill levels are between 1 and 5.<br>
	Each fighter can only have unique skills.<br><br>
<b>Fighting:</b><br>
	Fighter can fight only when having at least 3 skills.<br>
	Automatic fight: Takes 2 last created Fighters who have at least 3 skills and make them fight.<br>
	Arrange a fight: choose an opponent for a choosen fighter.<br>
	Fighting rules:<br>
		Each fight is devided into turns.<br>
		Each turn consists of choosing attacker and defender, checking special skills(doging for example) and calculating damage done by attacker to deffender.<br>
		Fighter with higher experience has 75% chance to become an attacker, 25% for the one with less.<br>
		After fight you will be able to see full raport of all the turns fought.<br>
		Winner gets experience equal to sum of skills level of his opponent.<br>

<b>Additonal gems that i have used:</b><br>
	For storing avatar pics -> carrierwave<br>
	For view/css -> bootstrap-sass<br>
	For testing -> Faker, Capybara, Rspec, FactoryGirl<br>

<b>Test:</b><br>
	All test are stored in directory /spec<br>
	I had encounter some difficulties for which i have not found any solution, only Fighter test is working.


