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
			 return  5*Integer(follow_nr) +Integer(repos_count)
		end

   def calc_tag
	   repo=Repo.where(:uid => self.github_data.uid).map { |repo| repo.tag } 
		 return repo
	 end

		def repos_count
	    Repo.where(:uid => self.github_data.uid).count 
		end

		def star_count
	    Repo.where(:uid => self.github_data.uid).inject(0){ |sum, repo| repo.stars } 
		end

		def follow_nr
			self.github_data.follow_nr
		end
end
