class ReviewRequestsController < ApplicationController
  def show
    @review_request = ReviewRequest.find(params[:id])
    @tags = Tag.where(review_request_id: @review_request.id)
  end

  def index
    redirect_to action: :new
  end

  def new
    @tag_name_error_messages ||= []
    @review_request = ReviewRequest.new
    @tags = Tag::MAX_TAGS_COUNT.times.map { Tag.new }
  end

  def create
    @review_request = ReviewRequest.new(review_request_params)
    @tags = Tag::MAX_TAGS_COUNT.times.map do |num|
      Tag.new(tag_params[num.to_s])
    end
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

    @tag_name_error_messages = Tag.create_tag_error_messages(@tags)

    return render action: :new unless @review_request.valid? && Tag.any_tag_name_length_too_long?(@tags) && Tag.all_tag_names_unique?(@tags)

    ActiveRecord::Base.transaction do
      @review_request.save!
      save_tags(@review_request.id)
    end
    redirect_to @review_request
  end

  private

  def save_tags(review_request_id)
    @tags.each do |tag|
      next if tag.name.empty?

      tag.review_request_id = review_request_id
      tag.pinned = true
      tag.save!
    end
  end

  def review_request_params
    # for safety, choose only required parameters
    params.require(:review_request).permit(:title, :text)
  end

  def tag_params
    params[:tag].permit!.to_h
  end
end
