require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  let!(:user) { create(:user) }

  describe "GET /users/:user_id/relationship/following" do
    it "フォロー中ユーザー一覧の表示" do
      get following_user_relationship_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /users/:user_id/relationship/follower" do
    it "フォロワーユーザー一覧の表示" do
      get follower_user_relationship_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
