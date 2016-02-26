# Fight Club
Adding Fighters:<br>
	Each fighter has a first and last name, with optional description and obligatory avatar.
	With each created fighter, his statistics craate automatically.
Adding a skill:
	Each skill changes fighters stats.
	Maximum skills amount is 8.
	Skill levels are between 1 and 5.
	Skills are unique for each fighter.
Fighting:
	Fighter can fight only when having at least 3 skills.
	Automatic fight: Takes 2 last created Fighters who have at least 3 skills and make them fight.
	Arrange a fight: choose an opponent for a choosen fighter.
	Fighting rules:
		Each fight is devided into turns.
		Each turn consists of choosing attacker and defender, checking special skills(doging for example) and calculating damage done by attacker to deffender.
		Fighter with higher experience has 75% chance to become an attacker, 25% for the one with less.
		After fight you will be able to see full raport of all the turns fought.
		Winner gets experience equal to sum of skills level of his opponent.
For fighters data i have used info from http://marvel.com/characters/list/994/top_marvel_heroes
Used additonal freamworks:
	For storing avatar -> carrierwave
	For view/css -> bootstrap-sass
	For testing -> Faker and Capybara, Rspec

Test:
	All test are stored in directory /spec
	I had encounter some difficulties for which i have not found any solution, only Fighter test is working. In general writing tests is something new too me.
