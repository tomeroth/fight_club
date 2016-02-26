# class for fighters statistics while fighting, calculating health, damage etc.
class FighterDatum < ActiveRecord::Base
	attr_accessor:id
	attr_reader:skills_arr
	attr_reader:max_health
	attr_accessor:health
	attr_accessor:damage
	attr_accessor:defence
	attr_accessor:defence_penetration
	attr_reader:name

	def initialize(id)
		@id=id
		@skills_arr=Fighter.find_by("id=#{@id}").skills
		@health=100
		@max_health=100
		@damage=10
		@defence=5
		@defence_penetration=0
		@name="#{Fighter.find_by("id=#{@id}").first_name} #{Fighter.find_by("id=#{@id}").last_name}"
		calculate_stats
	end
	def calculate_stats
		@skills_arr.each do |skill|
			case skill.skill_type
				when "endurance"
					@health=@health+skill.level.to_i*10
				when "fortitude"
					@health=@health+skill.level.to_i*5
				when "strength"
					@damage=@damage+skill.level.to_i*2
				when "might"
					@damage=@damage+skill.level.to_i*3
				when "agility"
					@defence=@defence+skill.level.to_i
				when "toughness"
					@defence=@defence+skill.level.to_i*2
				when "tactics"
					@defence_penetration=@defence_penetration+skill.level.to_i
				when "piercing_attack"
					@defence_penetration=@defence_penetration+skill.level.to_i*2
				when "claws"
					@defence_penetration=@defence_penetration+skill.level.to_i*2
			end
		end
		@max_health=@health
	end
	def get_dodging_level_if_has_one
		@skills_arr.each do |skill|
			if skill.skill_type=="dodging" then
				return skill.level
			end
		end
		return 0
	end
	def get_regeneration_level_if_has_one
		@skills_arr.each do |skill|
			if skill.skill_type=="regeneration" then
				return skill.level
			end
		end
		return 0
	end
	def get_critical_strikes_level_if_has_one
		@skills_arr.each do |skill|
			if skill.skill_type=="regeneration" then
				return skill.level
			end
		end
		return 0
	end
end
