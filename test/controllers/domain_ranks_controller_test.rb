require 'test_helper'

class DomainRanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @domain_rank = domain_ranks(:one)
  end

  test "should get index" do
    get domain_ranks_url
    assert_response :success
  end

  test "should get new" do
    get new_domain_rank_url
    assert_response :success
  end

  test "should create domain_rank" do
    assert_difference('DomainRank.count') do
      post domain_ranks_url, params: { domain_rank: { level: @domain_rank.level, topic_id: @domain_rank.topic_id, user_id: @domain_rank.user_id } }
    end

    assert_redirected_to domain_rank_url(DomainRank.last)
  end

  test "should show domain_rank" do
    get domain_rank_url(@domain_rank)
    assert_response :success
  end

  test "should get edit" do
    get edit_domain_rank_url(@domain_rank)
    assert_response :success
  end

  test "should update domain_rank" do
    patch domain_rank_url(@domain_rank), params: { domain_rank: { level: @domain_rank.level, topic_id: @domain_rank.topic_id, user_id: @domain_rank.user_id } }
    assert_redirected_to domain_rank_url(@domain_rank)
  end

  test "should destroy domain_rank" do
    assert_difference('DomainRank.count', -1) do
      delete domain_rank_url(@domain_rank)
    end

    assert_redirected_to domain_ranks_url
  end
end
