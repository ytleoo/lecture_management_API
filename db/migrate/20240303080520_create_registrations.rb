class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.references :user, foreign_key: true
      t.references :lecture, foreign_key: true

      t.timestamps
    end
    add_index :registrations, [:user_id, :lecture_id], unique: true
  end
end
