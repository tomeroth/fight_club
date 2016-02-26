class Statistic < ActiveRecord::Base
  belongs_to :fighter, dependent: :destroy
  validates :fighter, uniqueness: true
  validate :check_min_amount, on: :update
  # additional condition for checking min skills size
  def check_min_amount 
  	if Fighter.find_by("id=#{self.fighter_id}").skills.size<3
  		errors.add :fighter,"has not enough skills to start a fight, please add more"
  	end
  end
end
