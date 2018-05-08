require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "navigation links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", vestments_path
    assert_select "a[href=?]", whats_new_path
    assert_select "a[href=?]", contact_path
  end


end
