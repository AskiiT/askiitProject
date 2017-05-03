require 'test_helper'

class SubscribedToTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscribed_to_tag = subscribed_to_tags(:one)
  end

  test "should get index" do
    get subscribed_to_tags_url, as: :json
    assert_response :success
  end

  test "should create subscribed_to_tag" do
    assert_difference('SubscribedToTag.count') do
      post subscribed_to_tags_url, params: { subscribed_to_tag: { tag_id: @subscribed_to_tag.tag_id, user_id: @subscribed_to_tag.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show subscribed_to_tag" do
    get subscribed_to_tag_url(@subscribed_to_tag), as: :json
    assert_response :success
  end

  test "should update subscribed_to_tag" do
    patch subscribed_to_tag_url(@subscribed_to_tag), params: { subscribed_to_tag: { tag_id: @subscribed_to_tag.tag_id, user_id: @subscribed_to_tag.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy subscribed_to_tag" do
    assert_difference('SubscribedToTag.count', -1) do
      delete subscribed_to_tag_url(@subscribed_to_tag), as: :json
    end

    assert_response 204
  end
end
