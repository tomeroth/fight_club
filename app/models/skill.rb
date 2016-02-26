class Skill < ActiveRecord::Base
  enum skill_type: [:endurance, :fortitude, :regeneration, :strength, :might, :dodging, :agility,:toughness, :tactics,:piercing_attack,:claws,:critical_strike]
  belongs_to :fighter
  validates_inclusion_of :level, in: 1..5,:message=>"Must be between 1 and 5"
  validates_uniqueness_of :fighter, :scope => :skill_type,:message=>"Can only have unique skills"
  validate :check_max_amount
  
  # each fighter can have 8 skills at most
  # valdiation for 3 at min is statistic controller and view
  def check_max_amount
  		if Fighter.find_by("id=#{self.fighter_id}").skills.size==8 
  			errors.add :fighter,"Has reached the maximum amount of skills"
  		end
  end

end
