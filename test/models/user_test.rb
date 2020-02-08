require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example-name')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name shoud be presence' do
    @user.name = ' '
    assert_not @user.valid?
  end
end
