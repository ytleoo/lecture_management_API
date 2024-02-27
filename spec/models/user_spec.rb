# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(191)
#  confirmed_at           :datetime
#  email                  :string(191)
#  encrypted_password     :string(191)      default(""), not null
#  image                  :string(191)
#  name                   :string(191)
#  nickname               :string(191)
#  provider               :string(191)      default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(191)
#  tokens                 :text(65535)
#  uid                    :string(191)      default(""), not null
#  unconfirmed_email      :string(191)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    context 'emailとパスワードがある場合' do
      it '保存できる' do
        expect(build(:user)).to be_valid
      end
    end
    context 'パスワードが6文字以下の場合' do
      it '保存できない' do
        expect(build(:user, password: 'xxxxx')).to be_invalid
      end
    end
    context 'パスワードが半角英数ではない場合' do
      it '保存できない' do
        expect(build(:user, password: 'ああああああ')).to be_invalid
      end
    end
  end
end
