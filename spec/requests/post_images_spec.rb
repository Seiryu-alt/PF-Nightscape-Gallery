require 'rails_helper'

RSpec.describe "PostImages", type: :request do
  let!(:user) { create(:user) }
  let!(:post_user) { create(:user) }
  let!(:post_image) { create(:post_image, user_id: post_user.id) }

  describe "GET /post_images/:id" do
    it "投稿詳細画面の表示" do
      get post_image_path(post_image.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /post_images/new" do
    it "新規投稿画面の表示" do
      sign_in user
      get new_post_image_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /post_images/:id/edit" do
    it "投稿編集画面の表示" do
      sign_in post_user
      get edit_post_image_path(post_image)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /post_images/maps" do
    it "夜景マップの表示" do
      get maps_post_images_path
      expect(response).to have_http_status(200)
    end
  end
end
