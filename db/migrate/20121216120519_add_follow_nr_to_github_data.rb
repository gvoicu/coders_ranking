class AddFollowNrToGithubData < ActiveRecord::Migration
  def change
    add_column :github_data, :follow_nr, :integer
  end
end
