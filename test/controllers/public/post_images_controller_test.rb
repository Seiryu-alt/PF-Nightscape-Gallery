require 'test_helper'

class Public::PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_post_images_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_images_edit_url
    assert_response :success
  end

  test "should get new" do
    get public_post_images_new_url
    assert_response :success
  end

  test "should get search" do
    get public_post_images_search_url
    assert_response :success
  end

end
