# == Schema Information
#
# Table name: lectures
#
#  id          :bigint           not null, primary key
#  description :string(255)      not null
#  name        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
