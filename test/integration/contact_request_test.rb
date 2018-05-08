require 'test_helper'

class ContactRequestTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid contact request information" do
    get contact_path
    assert_no_difference 'Prospect.count' do
      post contact_path, params: { prospect: { first_name:  "",
                                            second_name:  "",
                                            title:  "",
                                            email: "user@invalid",
                                            phone_number: "",
                                            message: "bar" } }
    end
    assert_template 'prospects/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid contact information" do
    get contact_path
    assert_difference 'Prospect.count', 1 do
      post contact_path, params: { prospect: { first_name: "John",
                                            second_name: "Smith",
                                            title: "Mr",
                                            email: "user@valid.com",
                                            phone_number: "87896589458",
                                            message: "Hello I would like more information please" } }
      assert_redirected_to root_url
      end
    end
end
