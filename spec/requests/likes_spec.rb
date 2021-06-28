require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let!(:user) { create(:user) }

  describe "GET /users/:user_id/likes" do
    it "いいね一覧の表示" do
      get user_likes_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
