class ReviewRequestsController < ApplicationController
  MAX_TAGS_COUNT = 10
  MAX_TAG_CHARS_COUNT = 16

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
    @tag_names_text = params[:tags]
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
    unless all_tags_valid?
      render action: :new
      return
    end
    if @review_request.save
      finish_creating_review_request
    else
      render action: :new
    end
  end

  private

  def finish_creating_review_request
    tags = create_tag_record(@review_request.id)
    tags.each(&:save)
    redirect_to @review_request
  end

  def all_tags_valid?
    begin
      create_tag_record
    rescue ArgumentError => e
      @review_request.errors.add 'tag_error:', e.message
      return false
    end
    true
  end

  def review_request_params
    # for safety, choose only required parameters
    params.require(:review_request).permit(:title, :text)
  end

  def create_tag_record(id = nil)
    all_tags = params[:tags].split(/[[:blank:]]/)
    raise ArgumentError, "タグの量が多すぎます。#{MAX_TAGS_COUNT}個までにしてください。" if all_tags.size > MAX_TAGS_COUNT

    raise ArgumentError, 'タグ名が重複しています。' if tag_duplicate?(all_tags)

    all_tags.map do |tag|
      raise ArgumentError, "タグ名が長すぎます。#{MAX_TAG_CHARS_COUNT}文字までにして下さい。" if tag.size > MAX_TAG_CHARS_COUNT

      Tag.new(tag_name: tag, request_id: id, pinned: true)
    end
  end

  def tag_duplicate?(all_tags)
    !(all_tags.size - all_tags.uniq.size).zero?
  end
end
