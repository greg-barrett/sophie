require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title="| In Saecula Saeculorum"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home #{@base_title}"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About #{@base_title}"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "Contact #{@base_title}"
  end

  test "should get vestments" do
    get vestments_url
    assert_response :success
    assert_select "title", "Vestments #{@base_title}"
  end

  test "should get whats_new" do
    get whats_new_url
    assert_response :success
    assert_select "title", "What's New #{@base_title}"
  end

end
