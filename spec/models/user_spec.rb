require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do
  context '有効な値の場合' do
    it "登録できる" do
      expect(build(:user)).to be_valid
    end
  end

  context 'ユーザー名がない場合' do
    it '登録できない' do
      expect(build(:user, name: nil)).to be_invalid
    end
  end

  context 'メールアドレスがない場合' do
    it '登録できない' do
      expect(build(:user, email: nil)).to be_invalid
    end
  end

  context 'メールアドレスが重複する場合' do
    it '登録できない' do
      create(:user, email: 'test@example.com')
      expect(build(:user, email: 'test@example.com')).to be_invalid
    end
  end
end
