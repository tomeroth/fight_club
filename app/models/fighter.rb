class Fighter < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	has_many :skills, dependent: :destroy
	has_one :statistic
	after_create :build_default_statistic
	validates :first_name, :last_name, :avatar, presence: true
	# each time fighter is created, his statistic is automatically created too
	def build_default_statistic
      Statistic.create(:fighter_id => self.id,:win=>0,:lost=>0,:experience=>0)
      true
    end
end
