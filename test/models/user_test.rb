require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example-name')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be presence' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'name length should be no more than 15' do
    @user.name = 'a' * 16
    assert_not @user.valid?
  end
end
