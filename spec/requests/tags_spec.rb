require 'rails_helper'

TAG_NAME = "test_tag".freeze

RSpec.describe "Tags", type: :request do
  before do
    @post_image = create(:post_image)
    @post_image.add_tag(TAG_NAME)
    @tag = Tag.find_by(name: TAG_NAME)
  end

  describe "GET /tags/:id" do
    it "タグ詳細の表示" do
      get tag_path(@tag)
      expect(response).to have_http_status(200)
    end
  end
end
