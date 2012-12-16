class CreateStackOverflowData < ActiveRecord::Migration
  def change
    create_table :stack_overflow_data do |t|
      t.string :user_name
      t.integer :user_id

      t.timestamps
    end
  end
end
