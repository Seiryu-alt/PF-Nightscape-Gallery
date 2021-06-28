require 'rails_helper'

RSpec.describe "PostImageモデルのテスト", type: :model do
  context '有効な値の場合' do
    it "保存できる" do
      expect(build(:post_image)).to be_valid
    end
  end

  context '画像がない場合' do
    it "保存できない" do
      expect(build(:post_image, image: nil)).to be_invalid
    end
  end

  context 'ユーザーidがない場合' do
    it "保存できない" do
      expect(build(:post_image, user_id: nil)).to be_invalid
    end
  end
end
