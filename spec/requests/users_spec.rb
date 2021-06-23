require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { create(:user) }

  describe "GET /users/:id" do
    it "ユーザープロフィールの表示" do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /mypage" do
    it "マイページの表示" do
      sign_in user
      get mypage_path
      expect(response).to have_http_status(200)
    end
  end
end
