class CreateGithubData < ActiveRecord::Migration
  def change
    create_table :github_data do |t|
      t.integer :user_id
      t.string :github_username

      t.timestamps
    end
  end
end
