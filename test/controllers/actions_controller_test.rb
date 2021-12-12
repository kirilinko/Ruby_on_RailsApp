require "test_helper"

class ActionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actions_index_url
    assert_response :success
  end

  test "should get ajouter" do
    get actions_ajouter_url
    assert_response :success
  end

  test "should get modifier" do
    get actions_modifier_url
    assert_response :success
  end
end
