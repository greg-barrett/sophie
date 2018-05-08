require 'test_helper'

class ProspectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @prospect= Prospect.new(title:"Mr", first_name:"John", second_name:"Smith", email:"jsmith@msn.com", phone_number:"01923 564378", message:"Hi I would like a quote for some products")
  end

  test "should be valid" do
    assert @prospect.valid?
  end

  test "title cannot not be blank" do
    @prospect.title=" "
    assert_not @prospect.valid?
  end
  test "first_name cannot not be blank" do
    @prospect.first_name=" "
    assert_not @prospect.valid?
  end

  test "first name can't be too long" do
    @prospect.first_name="a"*51
    assert_not @prospect.valid?
  end

  test "second_name cannot not be blank" do
    @prospect.second_name=" "
    assert_not @prospect.valid?
  end
  test "second name can't be too long" do
    @prospect.second_name="a"*51
    assert_not @prospect.valid?
  end

  test "email cannot not be blank" do
    @prospect.email=" "
    assert_not @prospect.valid?
  end

  test "email can't be too long" do
    @prospect.email="a"*260
    assert_not @prospect.valid?
  end

  test "message cannot not be blank" do
    @prospect.message=" "
    assert_not @prospect.valid?
  end

  test "message can't be too short" do
    @prospect.message="a"*9
    assert_not @prospect.valid?
  end

  test "good email addresses should be valid" do
    valid_addresses= %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid|
      @prospect.email= valid
      assert @prospect.valid?, "#{valid.inspect} should be valid"
    end
  end

  test "bad email addresses should be invalid" do
    invalid_addresses= %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid|
      @prospect.email= invalid
      assert_not @prospect.valid?, "#{invalid.inspect} should not be valid"
    end
  end
end
