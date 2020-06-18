class ReviewRequestsController < ApplicationController
  def show
    @review_request = ReviewRequest.find(params[:id])
  end

  def index
    redirect_to action: :new
  end

  def new
    @review_request = ReviewRequest.new
  end

  def create
    @review_request = ReviewRequest.new(review_request_params)
    # p '------'
    # p params
    # p '------'

    # "------"
    # <ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>token,
    # "review_request"=><ActionController::Parameters {"title"=>"test",
    # "text"=>"testtext"}permitted: false>, "commit"=>"リクエスト",
    # "tags"=>"testtags", "controller"=>"review_requests", "action"=>"create"}
    # permitted: false>
    # "------"

    return render action: :new unless @review_request.valid?

    ActiveRecord::Base.transaction do
      @review_request.save!
    end
    redirect_to @review_request
  end

  private

  def review_request_params
    # for safety, choose only required parameters
    params.require(:review_request).permit(:title, :text)
  end
end
