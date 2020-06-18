class Tag < ApplicationRecord
  belongs_to :review_request
  validates :name, length: { maximum: 16 }

  MAX_TAGS_COUNT = 10
  MAX_TAG_CHARS_COUNT = 16

  def self.all_tag_names_unique?(tags)
    all_tag_names = tags.map(&:name).reject(&:blank?)
    (all_tag_names.size - all_tag_names.uniq.size).zero?
  end

  def self.any_tag_name_length_too_long?(tags)
    tags.all? do |tag|
      tag.name.size <= MAX_TAG_CHARS_COUNT
    end
  end

  def self.create_tag_error_messages(tags)
    error_messages = []

    tags.each_with_index do |tag, index|
      next if tag.name.empty?

      if tag.name.size > MAX_TAG_CHARS_COUNT
        error_messages.push "#{tag.name} is too long. max size is #{MAX_TAG_CHARS_COUNT}"
      end
      next if all_tag_names_unique?(tags)

      tags.each_with_index do |t, i|
        next if i == index

        error_messages.push "#{tag.name} is duplicated" if tag.name == t.name
      end
    end
    error_messages.uniq
  end
end
