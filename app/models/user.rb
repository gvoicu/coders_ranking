class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :skills
  # attr_accessible :title, :body
	has_one :github_data
    has_many :posts
    has_many :comments

		def compute_github_mark
		   sum = (5 * Integer(follow_nr) + Integer(repos_count))
			 return (sum == 0 || sum.blank? ? 42 : sum)
		end

   def calc_tag
	   Repo.where(:uid => self.github_data.uid).map { |repo| repo.tag } 
	 end

	 def most_used_tags
		 calc_tag.inject(Hash.new(0)){ |h, el| h[el] += 1; h}.sort_by{ |k, v| v}.reverse rescue "N/A"
	 end

		def repos_count
	    Repo.where(:uid => self.github_data.uid).count rescue 0 
		end

		def star_count
	    Repo.where(:uid => self.github_data.uid).inject(0){ |sum, repo| repo.stars } rescue 0 
		end

		def follow_nr
			self.github_data.follow_nr rescue 0
		end
end
