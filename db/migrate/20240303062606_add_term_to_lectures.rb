class AddTermToLectures < ActiveRecord::Migration[7.0]
  def change
    add_column :lectures, :term, :integer, null: false, default: 0
  end
end
