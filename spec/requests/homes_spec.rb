require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /" do
    it "トップページの表示" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /search" do
    it "検索結果ページの表示" do
      get search_path params: { keyword: "keyword" }
      expect(response).to have_http_status(200)
    end
  end
end
