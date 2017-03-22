require 'test_helper'

class PostulatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postulate = postulates(:one)
  end

  test "should get index" do
    get postulates_url
    assert_response :success
  end

  test "should get new" do
    get new_postulate_url
    assert_response :success
  end

  test "should create postulate" do
    assert_difference('Postulate.count') do
      post postulates_url, params: { postulate: { question_id: @postulate.question_id, user_id: @postulate.user_id } }
    end

    assert_redirected_to postulate_url(Postulate.last)
  end

  test "should show postulate" do
    get postulate_url(@postulate)
    assert_response :success
  end

  test "should get edit" do
    get edit_postulate_url(@postulate)
    assert_response :success
  end

  test "should update postulate" do
    patch postulate_url(@postulate), params: { postulate: { question_id: @postulate.question_id, user_id: @postulate.user_id } }
    assert_redirected_to postulate_url(@postulate)
  end

  test "should destroy postulate" do
    assert_difference('Postulate.count', -1) do
      delete postulate_url(@postulate)
    end

    assert_redirected_to postulates_url
  end
end
