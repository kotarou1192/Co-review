class ReviewRequestsController < ApplicationController
  def show
    @review_request = ReviewRequest.find(params[:id])
  end

  def new
  end
end
