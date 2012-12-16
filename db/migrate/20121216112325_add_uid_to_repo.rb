class AddUidToRepo < ActiveRecord::Migration
  def change
    add_column :repos, :uid, :integer
  end
end
