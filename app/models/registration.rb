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

  validate :validate_user_registration_limit, on: :create

  private

  MAX_REGISTRATIONS_PER_TERM = 4
  def validate_user_registration_limit
    lecture = Lecture.find_by(id: lecture_id)
    return unless lecture

    registration_term = lecture.term

    user_registrations = user.registrations.includes(:lecture)
    registrations_for_term = user_registrations.select { |registration| registration.lecture.term == registration_term }

    return unless registrations_for_term.count >= MAX_REGISTRATIONS_PER_TERM

    errors.add(:base, :invalid, message: "期毎に登録できる講座は#{MAX_REGISTRATIONS_PER_TERM}件までです")
  end
end
