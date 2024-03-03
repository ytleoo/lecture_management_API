# == Schema Information
#
# Table name: lectures
#
#  id          :bigint           not null, primary key
#  description :string(191)      not null
#  name        :string(191)      not null
#  term        :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Lecture < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :term, presence: true

  enum :term, { first_term: 0, second_term: 1 }
end
