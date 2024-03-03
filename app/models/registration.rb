# == Schema Information
#
# Table name: registrations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lecture_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_registrations_on_lecture_id              (lecture_id)
#  index_registrations_on_user_id                 (user_id)
#  index_registrations_on_user_id_and_lecture_id  (user_id,lecture_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (lecture_id => lectures.id)
#  fk_rails_...  (user_id => users.id)
#
class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :lecture
end
