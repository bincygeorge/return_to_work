require "test_helper"

class RoadmapGoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get roadmap_goals_index_url
    assert_response :success
  end

  test "should get new" do
    get roadmap_goals_new_url
    assert_response :success
  end

  test "should get create" do
    get roadmap_goals_create_url
    assert_response :success
  end

  test "should get edit" do
    get roadmap_goals_edit_url
    assert_response :success
  end

  test "should get update" do
    get roadmap_goals_update_url
    assert_response :success
  end
end
