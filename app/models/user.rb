class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
	has_one :github_data
    has_many :posts
    has_many :comments

		def compute_github_mark
			 follow_nr = self.github_data.follow_nr

				key=github_data.find_by_uid(self.id).user_id
				star_nr=repo.where(:uid => key).count
		#	tag=
				rank=5*Integer(follow_nr) +Integer(star_nr)
				tag=repo.where(:uid => key).pluck(:tag)	
				puts rank
		end
end
