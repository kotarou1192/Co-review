require 'test_helper'

class ReviewRequestTest < ActiveSupport::TestCase
  def setup
    @review_request = ReviewRequest.new(title: 'case1', text: 'texttest')
  end

  test 'should be valid' do
    assert @review_request.valid?
  end

  test 'title should be present' do
    @review_request.title = ''
    assert_not @review_request.valid?
  end

  test 'text should be present' do
    @review_request.text = ''
    assert_not @review_request.valid?
  end

  test 'size of title should be less than 120' do
    @review_request.title = 'z' * 200
    assert_not @review_request.valid?
  end

  test 'size of text should be lsee than 2000' do
    @review_request.text = 'z' * 2300
    assert_not @review_request.valid?
  end

  test 'same title should be rejected' do
    duplicate_review_request = @review_request.dup
    @review_request.save
    duplicate_review_request.text = 'different'
    assert_not duplicate_review_request.valid?
  end

  test 'same text should be rejected' do
    duplicate_review_request = @review_request.dup
    @review_request.save
    duplicate_review_request.title = 'different'
    assert_not duplicate_review_request.valid?
  end
end
