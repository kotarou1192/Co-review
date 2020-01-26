require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get top' do
    get root_path
    assert_response :success
  end

  test 'should get post_request' do
    get post_request_path
    assert_response :success
  end

  test 'should get request_page' do
    get request_page_path
    assert_response :success
  end

  test 'should get user_page' do
    get user_page_path
    assert_response :success
  end

  test 'should get search_result' do
    get search_result_path
    assert_response :success
  end
end
