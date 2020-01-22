# == Schema Information
#
# Table name: articles
#
#  id               :bigint(8)        not null, primary key
#  description      :text
#  image_url        :string
#  meta_description :text
#  page_title       :string
#  slug             :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

# https://edgeguides.rubyonrails.org/action_text_overview.html

class Article < ApplicationRecord
  include Sluggable

  has_rich_text :content
  has_slug input_fields: [:title]

  validates :title, :description, :content, :image_url, presence: true
  validates :image_url, url: {no_local: true, schemes: %w[https]}
  validates :title, :slug, uniqueness: true

  def to_param
    slug
  end
end
