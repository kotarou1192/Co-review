class RenameFromIsPinnedToPinnedOnTags < ActiveRecord::Migration[6.0]
  def change
    rename_column :tags, :is_pinned, :pinned
  end
end
