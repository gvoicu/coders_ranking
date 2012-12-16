class AddUidToGithubData < ActiveRecord::Migration
  def change
    add_column :github_data, :uid, :integer
  end
end
