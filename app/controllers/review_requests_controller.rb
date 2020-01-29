class ReviewRequestsController < ApplicationController
  def show
    @review_request = ReviewRequest.find(params[:id])
  end

  def new
    @review_request = ReviewRequest.new
  end

  def create
    @review_request = ReviewRequest.new(review_request_params)
    # p params
    if @review_request.save
      id = @review_request.id
      redirect_to("/review_requests/#{id}")
    else
      render 'new'
    end
  end

  private

  def review_request_params
    # parmsオブジェクトの中から要求する要素だけ抜き出している（安全のため）
    params.require(:review_request).permit(:title, :text)
  end
end
