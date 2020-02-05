class ReviewRequestsController < ApplicationController
  MAX_TAG_AMOUNT = 10
  MAX_TAG_SIZE = 16

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
    @tags = params[:tags]
    # p params
    begin
      create_tag_record
    rescue ArgumentError => e
      @review_request.errors.add 'tag_error:', e.message
      render action: :new
      return
    end
    if @review_request.save
      id = @review_request.id
      tags = create_tag_record(id)
      tags.each(&:save)
      redirect_to "/review_requests/#{id}"
    else
      render action: :new
    end
  end

  private

  def review_request_params
    # for safety, choose only required parameters
    params.require(:review_request).permit(:title, :text)
  end

  def create_tag_record(id = nil)
    all_tags = params[:tags].split(/[ |　]/)
    raise ArgumentError, 'too many tags' if all_tags.size > MAX_TAG_AMOUNT

    raise ArgumentError, 'duplicate tag name' if same_name?(all_tags)

    all_tags.map do |tag|
      raise ArgumentError, 'tag size is too long' if tag.size > MAX_TAG_SIZE

      Tag.new(tag_name: tag, request_id: id, is_pinned: true)
    end
  end

  def same_name?(all_tags)
    !(all_tags.size - all_tags.uniq.size).zero?
  end
end
