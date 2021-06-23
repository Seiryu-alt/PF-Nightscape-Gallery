require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "GET /users/sign_up" do
    it "ユーザー登録画面の表示" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /users/edit" do
    it "ユーザー情報編集画面の表示" do
      user = create(:user)
      sign_in user
      get edit_user_registration_path
      expect(response).to have_http_status(200)
    end
  end
end
