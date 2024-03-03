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
require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
