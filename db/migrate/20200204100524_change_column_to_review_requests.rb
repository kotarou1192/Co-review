class ChangeColumnToReviewRequests < ActiveRecord::Migration[6.0]
  def change
    change_column :review_requests, :user_id, :integer
    add_column :review_requests, :request_status, :string
    add_column :review_requests, :additional_remark, :string
    add_column :review_requests, :is_frozen, :boolean, default: false
  end
end
