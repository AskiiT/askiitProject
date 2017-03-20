require 'test_helper'

class QuestionAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_attachment = question_attachments(:one)
  end

  test "should get index" do
    get question_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_question_attachment_url
    assert_response :success
  end

  test "should create question_attachment" do
    assert_difference('QuestionAttachment.count') do
      post question_attachments_url, params: { question_attachment: { archive_type: @question_attachment.archive_type, question_attachment: @question_attachment.question_attachment, question_id: @question_attachment.question_id } }
    end

    assert_redirected_to question_attachment_url(QuestionAttachment.last)
  end

  test "should show question_attachment" do
    get question_attachment_url(@question_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_attachment_url(@question_attachment)
    assert_response :success
  end

  test "should update question_attachment" do
    patch question_attachment_url(@question_attachment), params: { question_attachment: { archive_type: @question_attachment.archive_type, question_attachment: @question_attachment.question_attachment, question_id: @question_attachment.question_id } }
    assert_redirected_to question_attachment_url(@question_attachment)
  end

  test "should destroy question_attachment" do
    assert_difference('QuestionAttachment.count', -1) do
      delete question_attachment_url(@question_attachment)
    end

    assert_redirected_to question_attachments_url
  end
end
