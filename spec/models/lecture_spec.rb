# == Schema Information
#
# Table name: lectures
#
#  id          :bigint           not null, primary key
#  description :string(191)      not null
#  name        :string(191)      not null
#  term        :integer          default("first_term"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Lecture, type: :model do
  describe 'バリデーション' do
    context '全ての項目がある場合' do
      it '保存できる' do
        expect(build(:lecture)).to be_valid
      end
    end
    context '授業名が設定されていない場合' do
      it '保存できない' do
        expect(build(:lecture, name: '')).to be_invalid
      end
    end
    context '授業説明が設定されていない場合' do
      it '保存できない' do
        expect(build(:lecture, description: '')).to be_invalid
      end
    end
  end
end
