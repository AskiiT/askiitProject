require 'test_helper'

class QuestionHasTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_has_tag = question_has_tags(:one)
  end

  test "should get index" do
    get question_has_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_question_has_tag_url
    assert_response :success
  end

  test "should create question_has_tag" do
    assert_difference('QuestionHasTag.count') do
      post question_has_tags_url, params: { question_has_tag: { question_id: @question_has_tag.question_id, tag_id: @question_has_tag.tag_id } }
    end

    assert_redirected_to question_has_tag_url(QuestionHasTag.last)
  end

  test "should show question_has_tag" do
    get question_has_tag_url(@question_has_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_has_tag_url(@question_has_tag)
    assert_response :success
  end

  test "should update question_has_tag" do
    patch question_has_tag_url(@question_has_tag), params: { question_has_tag: { question_id: @question_has_tag.question_id, tag_id: @question_has_tag.tag_id } }
    assert_redirected_to question_has_tag_url(@question_has_tag)
  end

  test "should destroy question_has_tag" do
    assert_difference('QuestionHasTag.count', -1) do
      delete question_has_tag_url(@question_has_tag)
    end

    assert_redirected_to question_has_tags_url
  end
end
