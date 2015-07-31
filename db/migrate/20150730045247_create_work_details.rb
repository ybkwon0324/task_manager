class CreateWorkDetails < ActiveRecord::Migration
  def change
    create_table :work_details do |t|
      t.integer :user_id
      t.integer :work_id
      t.string :content_detail
      t.boolean :completion

      t.timestamps null: false
    end
  end
end
