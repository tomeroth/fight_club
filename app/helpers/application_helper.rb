module ApplicationHelper
	$skills_description=ActiveSupport::HashWithIndifferentAccess.new(

		:endurance => "Raises your health by 10 per each level.",
		:fortitude => "Raises your health by 5 per each level.",
		:regeneration => "Regenerates 1 health per level each round.",

		:strength => "Raises your damage by 2 for each level.",
		:might => "Raises your damage by 3 for each level.",

		:dodging => "+5% chance to dodge an attack per level.",
		:agility => "Raises your defence ability by 2 per each level.",
		:toughness => "Raises your defence ability by 3 per each level.",

		:tactics => "Raises your defence penetration ability by 1 per each level.",
		:piercing_attack => "Raises your defence penetration ability by 2 per each level.",
		:claws => "Raises your defence penetration ability by 2 per each level.",
		:critical_strike => "Gives you 5% chance per level to deal twice as much damage"
	)
end
