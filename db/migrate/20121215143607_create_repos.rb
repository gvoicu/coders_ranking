class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.integer :id
      t.string :repos
      t.string :tag
      t.integer :stars

      t.timestamps
    end
  end
end
