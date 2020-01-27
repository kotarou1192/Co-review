class RequestReviewsController < ApplicationController
  def post_request_review
  end

  def show
    @review_request = ReviewRequest.find(params[:id])
  end
end
