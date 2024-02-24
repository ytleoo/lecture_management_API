# == Schema Information
#
# Table name: lectures
#
#  id          :bigint           not null, primary key
#  description :string(191)      not null
#  name        :string(191)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Lecture < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
end
