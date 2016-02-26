# Fight Club
<b>Adding Fighters:</b><br>
&#09;	Each fighter has a first and last name, with optional description and obligatory avatar.<br>
&#09;	With each created fighter, his statistics craate automatically.<br><br>
<b>Adding a skill:</b><br>
	Each skill changes fighters stats.<br>
	Maximum skills amount is 8.<br>
	Skill levels are between 1 and 5.<br>
	Skills are unique for each fighter.<br><br>
<b>Fighting:</b><br>
	Fighter can fight only when having at least 3 skills.<br>
	Automatic fight: Takes 2 last created Fighters who have at least 3 skills and make them fight.<br>
	Arrange a fight: choose an opponent for a choosen fighter.<br>
	Fighting rules:<br>
		Each fight is devided into turns.<br>
		Each turn consists of choosing attacker and defender, checking special skills(doging for example) and calculating damage done by attacker to deffender.<br>
		Fighter with higher experience has 75% chance to become an attacker, 25% for the one with less.<br>
		After fight you will be able to see full raport of all the turns fought.<br>
		Winner gets experience equal to sum of skills level of his opponent.<br><br>
For fighters data i have used info from http://marvel.com/characters/list/994/top_marvel_heroes<br><br>
<b>Used additonal freamworks:</b><br>
	For storing avatar -> carrierwave<br>
	For view/css -> bootstrap-sass<br>
	For testing -> Faker and Capybara, Rspec<br>

<b>Test:</b><br>
	All test are stored in directory /spec<br>
	I had encounter some difficulties for which i have not found any solution, only Fighter test is working. In general writing tests is something new too me.<br>
