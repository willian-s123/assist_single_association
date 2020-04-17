require 'test_helper'

class AssistSingleAssociation::Test < ActiveSupport::TestCase

  setup do
    @user = User.create!
  end

  teardown do
    User.delete_all
    Payment.delete_all
  end

  test "define automatically `build_[enum_key]_payment`" do
    assert_equal({"id" => nil, "user_id" => 1, "pay_type" => "card"},
                 @user.build_card_payment.attributes)
    assert_equal({"id" => nil, "user_id" => 1, "pay_type" => "cash"},
                 @user.build_cash_payment.attributes)
  end

  test "define automatically `create_[enum_key]_payment`" do
    assert_equal({"id" => 1, "user_id" => 1, "pay_type" => "card"},
                 @user.create_card_payment.attributes)
    assert_equal({"id" => 2, "user_id" => 1, "pay_type" => "cash"},
                 @user.create_cash_payment.attributes)
  end
end
