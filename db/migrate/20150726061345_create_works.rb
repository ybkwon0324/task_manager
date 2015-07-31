class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.datetime :begin_time
      t.datetime :end_time
      t.integer :entire_percent

      t.timestamps null: false
    end
  end
end
